// Kamil Michalak 299089
#pragma once
#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <strings.h>
#include <string.h>
#include <string>
#include <errno.h>
#include <netinet/ip.h>
#include <time.h>



class Udp
{
    public:

    int sockfd;

    struct sockaddr_in server_address;

    Udp();

    Udp(int port, char ip_string[]);

    int create_socket();

    bool receive_udp(u_int8_t buffer[]);

    std::string create_request(int start, int length);

    void send_udp(int start, int lenght);

};