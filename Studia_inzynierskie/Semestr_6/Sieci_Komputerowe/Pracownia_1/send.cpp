// Kamil Michalak 299089
#include "send.h"

uint16_t sequence_number(uint16_t ttl, uint16_t iter)
{
    return ttl * TTL_PACKS + iter;
}

u_int16_t compute_icmp_checksum(const void *buff, int length)
{
    u_int32_t sum;
    const u_int16_t *ptr = (u_int16_t *)buff;
    assert(length % 2 == 0);
    for (sum = 0; length > 0; length -= 2)
        sum += *ptr++;
    sum = (sum >> 16) + (sum & 0xffff);
    return (u_int16_t)(~(sum + (sum >> 16)));
}

struct icmp create_header(uint16_t seq_num)
{
    struct icmp header;
    header.icmp_type = ICMP_ECHO;
    header.icmp_code = 0;
    header.icmp_hun.ih_idseq.icd_id = getpid();
    header.icmp_hun.ih_idseq.icd_seq = seq_num;
    header.icmp_cksum = 0;
    header.icmp_cksum = compute_icmp_checksum((u_int16_t *)&header, sizeof(header));
    return header;
};

void send_icmp(int& sockfd, char ip_string[], uint16_t ttl, uint16_t package)
{
    struct icmp header = create_header(sequence_number(ttl, package));
    struct sockaddr_in recipient;
    bzero(&recipient, sizeof(recipient));
    recipient.sin_family = AF_INET;
    inet_pton(AF_INET, ip_string, &recipient.sin_addr);

    setsockopt(sockfd, IPPROTO_IP, IP_TTL, &ttl, sizeof(int));

    ssize_t bytes_sent = sendto(
        sockfd,
        &header,
        sizeof(header),
        0,
        (struct sockaddr *)&recipient,
        sizeof(recipient));

    if (bytes_sent < 0)
    {
        fprintf(stderr, "recvfrom error: %s\n", strerror(errno));
        exit(1);
    }
}