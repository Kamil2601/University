// Kamil Michalak 299089
#include "receive.h"

bool receive_icmp(int& sockfd, int ttl)
{
    int packets_received = 0;
    std::set<unsigned long> ip_set;
    bool destination_reached = false;
    int time_sum = 0;

    for (;;)
    {
        struct sockaddr_in sender;
        socklen_t sender_len = sizeof(sender);
        u_int8_t buffer[IP_MAXPACKET];

        fd_set descriptors;
        FD_ZERO(&descriptors);
        FD_SET(sockfd, &descriptors);
        struct timeval tv;
        tv.tv_sec = 1;
        tv.tv_usec = 0;

        int ready = select(sockfd + 1, &descriptors, NULL, NULL, &tv);
        if (ready == 0)
        {
            break;
        }
        
        ssize_t packet_len = recvfrom(sockfd, buffer, IP_MAXPACKET, 0, (struct sockaddr *)&sender, &sender_len);
        if (packet_len < 0)
        {
            fprintf(stderr, "recvfrom error: %s\n", strerror(errno));
            exit(1);
        }

        struct ip *ip_header = (struct ip *)buffer;
        ssize_t ip_header_len = 4 * ip_header->ip_hl;
        u_int8_t *icmp_packet = buffer + ip_header_len;
        struct icmp *icmp_header = (struct icmp *)icmp_packet;
        bool echo_reply = false;

        if (icmp_header->icmp_type == ICMP_ECHOREPLY)
        {
            echo_reply = true;
        }
        else if (icmp_header->icmp_type == ICMP_TIME_EXCEEDED)
        {
            struct ip *packet = (struct ip *)(&(icmp_header->icmp_dun.id_data));
            icmp_header = (struct icmp *)((u_int8_t *)packet + ip_header_len);
        }

        if (icmp_header->icmp_hun.ih_idseq.icd_id == getpid()
            && icmp_header->icmp_hun.ih_idseq.icd_seq >= TTL_PACKS * ttl
            && icmp_header->icmp_hun.ih_idseq.icd_seq < TTL_PACKS * (ttl + 1))
        {
            packets_received++;
            ip_set.insert(sender.sin_addr.s_addr);
            time_sum += (1000000 - tv.tv_usec);

            if (echo_reply)
            {
                destination_reached = true;
            }
        }

        if (packets_received == TTL_PACKS)
        {
            break;
        }
    }

    printf("%d. ", ttl);
    struct in_addr wrapper;

    if (ip_set.empty())
    {
        printf(" *\n");
    }
    else
    {
        for (unsigned long ip : ip_set)
        {
            char sender_ip_str[20];
            wrapper.s_addr = ip;
            inet_ntop(AF_INET, &(wrapper), sender_ip_str, sizeof(sender_ip_str));
            printf("%s ", sender_ip_str);
        }
        if (packets_received < TTL_PACKS)
        {
            printf("???");
        }
        else
        {
            printf("%dms", time_sum / (TTL_PACKS * 1000));
        }
        printf("\n");
    }

    return destination_reached;
}