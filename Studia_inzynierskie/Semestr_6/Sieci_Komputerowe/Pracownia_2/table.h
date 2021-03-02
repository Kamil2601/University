// Kamil Michalak 299089
#pragma once
#include <stdio.h>
#include <stdlib.h>
#include <list>
#include <string>
#include <limits.h>
#include <arpa/inet.h>
#include "ip.h"

const u_int32_t inf = UINT32_MAX;
const int round_time = 1;
const int time_to_remove = 3 * round_time;
const u_int32_t inf_lim = 30;

struct Network
{
    u_int32_t ip_address;
    u_int8_t mask_length;
    u_int32_t dist;
    u_int32_t via;
    u_int32_t broadcast;
    time_t last_update;

    Network(u_int32_t ip_addr, u_int8_t m_len, u_int32_t d, u_int32_t v)
    {
        ip_address = ip_addr;
        mask_length = m_len;
        dist = d;
        via = v;
        last_update = time(nullptr);
    }

    Network(u_int32_t ip_addr, u_int8_t m_len, u_int32_t d, u_int32_t v, u_int32_t bcast)
    {
        ip_address = ip_addr;
        mask_length = m_len;
        dist = d;
        via = v;
        broadcast = bcast;
        last_update = time(nullptr);
    }
};


class RoutingTable
{
    public:

    std::list<Network> networks;
    std::list<Network> directNetworks;
    std::list<u_int32_t> broadcast;

    u_int32_t DirectNetworkDist(u_int32_t ip_address);

    void Update(u_int32_t ip_address, u_int8_t mask_length, u_int32_t dist, u_int32_t sender_ip);
    void AddDirectNetwork(u_int32_t ip_address, u_int8_t mask_length, u_int32_t dist, u_int32_t bcast);
    void AddBroadcast(u_int32_t bcast);
    void EraseUnreachable();
    void Print();
};