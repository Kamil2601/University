// Kamil Michalak 299089
#include "udp.h"

using namespace std;

Udp::Udp()
{
}

Udp::Udp(int port, char ip_string[])
{
    this->sockfd = create_socket();

    bzero(&server_address, sizeof(server_address));
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(port);
    
    server_address.sin_family = AF_INET;
    
    inet_pton(AF_INET, ip_string, &(server_address.sin_addr));

}

int Udp::create_socket()
{
    int sockfd = socket(AF_INET, SOCK_DGRAM, 0);

    if (sockfd < 0)
    {
        fprintf(stderr, "socket error: %s\n", strerror(errno));
        exit(1);
    }    

    return sockfd;
}

bool Udp::receive_udp(u_int8_t buffer[])
{
    struct sockaddr_in sender;
    socklen_t sender_len = sizeof(sender);
    fd_set descriptors;
    FD_ZERO(&descriptors);
    FD_SET(sockfd, &descriptors);
    struct timeval tv;
    tv.tv_sec = 3;
    tv.tv_usec = 0;

    int ready = select(sockfd + 1, &descriptors, NULL, NULL, &tv);
    if (ready == 0)
    {
        return false;
    }

    ssize_t packet_len = recvfrom(
        sockfd,
        buffer,
        IP_MAXPACKET,
        0,
        (struct sockaddr *)&sender,
        &sender_len);

    bool result = packet_len > 0;
    result = result && sender.sin_addr.s_addr == server_address.sin_addr.s_addr &&
            sender.sin_port == server_address.sin_port;

    return result;
}

string Udp::create_request(int start, int length)
{
    string request = "GET " + to_string(start) + " " + to_string(length) + "\n";
    printf("%s\n",request.c_str());
    return request;
}

void Udp::send_udp(int start, int length)
{
    string request = create_request(start, length);
    ssize_t request_len = request.length();
    ssize_t bytes_sent = sendto(
        sockfd,
        request.c_str(),
        request_len,
        MSG_DONTWAIT,
        (struct sockaddr *)&server_address,
        sizeof(server_address));
}