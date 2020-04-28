// Kamil Michalak 299089
#include "table.h"
#include "udp.h"
#include "ip.h"
#include <iostream>

using namespace std;

int main()
{
    int n;
    string ip_string;
    string d;
    int distance;

    cin >> n;

    int sockfd = create_socket();

    RoutingTable table;

    for (int i = 0; i < n; i++)
    {
        cin >> ip_string >> d >> distance;
        u_int32_t broadcast = network_broadcast(ip_string);
        u_int32_t net = network_addr(ip_string);
        u_int8_t mask_len = mask_length(ip_string);
        table.AddDirectNetwork(net,mask_len,distance, broadcast);
    }

    for (;;)
    {
        receive_udp(sockfd, table);
        send_udp(sockfd, table);
        table.Print();
        table.EraseUnreachable();
    }

    return 0;
}