#include "ip.h"

using namespace std;

int endian(int x)
{
    return (((x >> 24) & 0x000000ff) | ((x >> 8) & 0x0000ff00) |
            ((x << 8) & 0x00ff0000) | ((x << 24) & 0xff000000));
}

u_int32_t network_broadcast(string network_str)
{
    int slash_pos = network_str.find("/");
    string ip_str = network_str.substr(0, slash_pos);
    u_int8_t mask_len = stoi(network_str.substr(slash_pos + 1, 2));
    u_int32_t mask = -(1 << (32 - mask_len));

    u_int32_t addr;
    inet_pton(AF_INET, ip_str.c_str(), &addr);
    addr = endian(addr);

    u_int32_t broadcast = addr | (~mask);
    broadcast = endian(broadcast);
    
    return broadcast;
}

u_int32_t network_addr(string network_str)
{
    int slash_pos = network_str.find("/");
    string ip_str = network_str.substr(0, slash_pos);
    u_int8_t mask_len = stoi(network_str.substr(slash_pos + 1, 2));
    u_int32_t mask = -(1 << (32 - mask_len));

    u_int32_t addr;
    inet_pton(AF_INET, ip_str.c_str(), &addr);
    addr = endian(addr);

    u_int32_t network = addr & mask;
    network = endian(network);

    return network;
}

u_int8_t mask_length(string network_str)
{
    int slash_pos = network_str.find("/");
    u_int8_t mask_len = stoi(network_str.substr(slash_pos + 1, 2));
    return mask_len;
}