// Kamil Michalak 299089
#pragma once
#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <strings.h>
#include <string.h>
#include <errno.h>
#include <netinet/ip.h>
#include <time.h>
#include "table.h"


int create_socket();

void receive_udp(int& sockfd, RoutingTable& table);

void send_udp(int& sockfd, RoutingTable& table);