// Kamil Michalak 299089
#include "manager.h"

Manager::Manager(char *pathname, int length, int port, char ip_string[])
{
    data = new u_int8_t[BUFFER_SIZE];
    bzero(data, BUFFER_SIZE);
    udp = Udp(port, ip_string);
    file = open(pathname, O_WRONLY | O_CREAT);
    if (file == -1)
    {
        fprintf(stderr,"open() error: %s\n", strerror(errno));
        exit(1);
    } 
    dataLength = length;
    fullPacketsToWrite = length/PACKET_SIZE;
    lastPacketSize = length%PACKET_SIZE;
    packetsToWrite = fullPacketsToWrite + (lastPacketSize > 0);

    for (int i=0; i<PACKETS; i++)
    {
        sendTime[i] = 0;
        received[i] = false;
    }
}

void Manager::ProcessPacket()
{
    std::string pack((const char*)packet);
    int newLine = pack.find("\n");
    std::string info = pack.substr(0, newLine + 1);
    int leftSpace = info.find(" ");
    int rightSpace = info.find(" ", leftSpace + 1);
    int start = std::stoi(info.substr(leftSpace + 1, rightSpace-leftSpace-1));
    int length = std::stoi(info.substr(rightSpace + 1, newLine-rightSpace-1));
    int destStart = (start - (writtenPackets * PACKET_SIZE) + bufferHead * PACKET_SIZE) % BUFFER_SIZE;
    int p = destStart/PACKET_SIZE;
    printf("%s",info.c_str());

    if (!received[p])
    {
        memcpy(&data[destStart],packet + newLine + 1, length);
        received[p] = true;
    }
}

void Manager::Run()
{
    for (;;)
    {
        SendRequests();
        ReceiveRequests();
        MoveWindow();
        printf("writtenPackets = %d\n",writtenPackets);
        if (writtenPackets == packetsToWrite)
            break;
    }

    delete[] data;
}

void Manager::ReceiveRequests()
{
    for (;;)
    {
        if (!udp.receive_udp(packet))
        {
            break;
        }
        ProcessPacket();
    }
}

int Manager::PacketNumber(int i)
{
    if (i >= bufferHead)
    {
        return writtenPackets + (i - bufferHead);
    }
    else
    {
        return writtenPackets + PACKETS - (bufferHead - i);
    }
}

void Manager::SendRequests()
{
    for (int i=bufferHead;;i = (i+1)%PACKETS)
    {
        int packNum = PacketNumber(i);
        if (!received[i] && (time(nullptr) - sendTime[i] >= DELAY))
        {
            if (packNum < fullPacketsToWrite)
            {
                int start = packNum * PACKET_SIZE;
                udp.send_udp(start, PACKET_SIZE);
            }
            else if (packNum == fullPacketsToWrite)
            {
                if (lastPacketSize > 0)
                {
                    int start = packNum * PACKET_SIZE;
                    udp.send_udp(start, lastPacketSize);
                }
                return;
            }
            else
            {
                return;
            }
        }
        if (packNum == fullPacketsToWrite + 1 || i == (bufferHead + PACKETS -1)%PACKETS)
        {
            return;
        }
    }
}

void Manager::WriteToFile(int firstPacket, int packets)
{
    if (packets > 0)
    {
        int start = firstPacket * PACKET_SIZE;
        int length = packets * PACKET_SIZE;
        if (write(file, &data[start], length) == -1)
        {
            fprintf(stderr,"write() error: %s\n", strerror(errno));
            exit(1);
        }
    }
}

void Manager::WriteLastPacket(int pos)
{
    if (lastPacketSize == 0)
    {
        return;
    }

    if (received[pos])
    {
        int start = pos * PACKET_SIZE;
        if (write(file, &data[start], lastPacketSize) == -1)
        {
            fprintf(stderr,"write() error: %s\n", strerror(errno));
            exit(1);
        }
    }

    return;
}

void Manager::MoveWindow()
{
    int toWrite = 0;
    for (int i=bufferHead; i<PACKETS; i++)
    {
        if (writtenPackets + toWrite > fullPacketsToWrite)
        {
            WriteToFile(bufferHead, toWrite);
            writtenPackets += toWrite;
            WriteLastPacket(i);
            return;
        }
        if (received[i])
        {
            received[i] = false;
            toWrite++;
        }
        else
        {
            WriteToFile(bufferHead, toWrite);
            bufferHead += toWrite;
            writtenPackets += toWrite;
            return;
        }
    }

    printf("test\n");
    WriteToFile(bufferHead, toWrite);
    writtenPackets += toWrite;
    toWrite = 0;
    int size = bufferHead;
    bufferHead = 0;

    for (int i=0; i<size; i++)
    {
        if (writtenPackets + toWrite > fullPacketsToWrite)
        {
            WriteToFile(bufferHead, toWrite);
            writtenPackets += toWrite;
            WriteLastPacket(i);
            return;
        }
        if (received[i])
        {
            received[i] = false;
            toWrite++;
        }
        else
        {
            WriteToFile(bufferHead, toWrite);
            bufferHead += toWrite;
            writtenPackets += toWrite;
            return;
        }
    }
    WriteToFile(bufferHead, toWrite);
    writtenPackets += toWrite;
    bufferHead += toWrite;
    return;
}