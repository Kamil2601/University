// Kamil Michalak 299089
#include "udp.h"
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <string>

const int PACKET_SIZE = 1000;
const int PACKETS = 1000;
const int BUFFER_SIZE = PACKETS * PACKET_SIZE;
const int DELAY = 3;

class Manager
{
    public:

    Udp udp;
    int file;
    int dataLength;
    int writtenPackets = 0;
    int fullPacketsToWrite;
    int packetsToWrite;
    int lastPacketSize;
    int bufferHead = 0;
    time_t sendTime[PACKETS];
    bool received[PACKETS];
    u_int8_t *data;
    u_int8_t packet[IP_MAXPACKET + 1];

    Manager(char pathname[], int length, int port, char ip_string[]);

    void Run();

    void MoveWindow();

    void SendRequests();
    void ReceiveRequests();

    int PacketNumber(int i);
    void ProcessPacket();

    void WriteToFile(int firstPacket, int packets);
    void WriteLastPacket(int pos);
};