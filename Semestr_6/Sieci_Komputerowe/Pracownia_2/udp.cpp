// Kamil Michalak 299089
#include "udp.h"

int create_socket()
{
    int sockfd = socket(AF_INET, SOCK_DGRAM, 0);

    struct sockaddr_in server_address;
    bzero(&server_address, sizeof(server_address));
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(54321);
    server_address.sin_addr.s_addr = htonl(INADDR_ANY);

    if (sockfd < 0)
    {
        fprintf(stderr, "socket error: %s\n", strerror(errno));
        exit(1);
    }

    bind(
        sockfd,
        (struct sockaddr *)&server_address,
        sizeof(server_address));

    return sockfd;
}

void receive_udp(int &sockfd, RoutingTable &table)
{
    time_t start_time = time(nullptr);

    while (time(nullptr) - start_time < round_time)
    {
        struct sockaddr_in sender;
        socklen_t sender_len = sizeof(sender);
        u_int8_t buffer[IP_MAXPACKET + 1];

        fd_set descriptors;
        FD_ZERO(&descriptors);
        FD_SET(sockfd, &descriptors);
        struct timeval tv;
        tv.tv_sec = round_time - (time(nullptr) - start_time);
        tv.tv_usec = 0;
        int ready = select(sockfd + 1, &descriptors, NULL, NULL, &tv);
        if (ready == 0)
        {
            break;
        }

        ssize_t packet_len = recvfrom(
            sockfd,
            buffer,
            IP_MAXPACKET,
            0,
            (struct sockaddr *)&sender,
            &sender_len);

        if (packet_len < 0)
        {
            fprintf(stderr, "recvfrom error: %s\n", strerror(errno));
            exit(1);
        }

        u_int32_t sender_ip = sender.sin_addr.s_addr;

        if (packet_len == 9)
        {
            u_int32_t ip_address = *((u_int32_t *)buffer);
            u_int8_t mask_length = buffer[4];
            u_int32_t dist = ntohl(*(u_int32_t *)(buffer + 5));

            table.Update(ip_address, mask_length, dist, sender_ip);
        }
    }
}

void send_udp(int &sockfd, RoutingTable &table)
{
    for (Network &dest : table.directNetworks)
    {
        for (Network net : table.networks)
        {

            struct sockaddr_in recipient;
            recipient.sin_addr.s_addr = dest.broadcast;
            uint8_t pack[9];
            *((u_int32_t *)pack) = net.ip_address;
            pack[4] = net.mask_length;
            *((u_int32_t *)(pack + 5)) = net.dist;
            ssize_t bytes_sent = sendto(
                sockfd,
                pack,
                9,
                0,
                (struct sockaddr *)&recipient,
                sizeof(recipient));

            if (bytes_sent < 0)
            {
                dest.dist = inf;
            }
        }
    }
}