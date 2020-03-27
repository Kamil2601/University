// Kamil Michalak 299089
#include "send.h"
#include "receive.h"


int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        perror("./traceroute <ip_address>\n");
        return 0;
    }

    int sockfd = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP);

    char *ip = argv[1];

    if (sockfd < 0)
    {
        fprintf(stderr, "socket error: %s\n", strerror(errno));
        exit(1);
    }

    for (int i = 1; i <= MAX_TTL; i++)
    {
        for (int j = 0; j < TTL_PACKS; j++)
        {
            send_icmp(sockfd, ip, i, j);
        }
        if (receive_icmp(sockfd, i))
        {
            break;
        }
    }

    return 0;
}