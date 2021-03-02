// Kamil Michalak 299089
#include "table.h"

using namespace std;

u_int32_t RoutingTable::DirectNetworkDist(u_int32_t ip_address)
{
    for (Network& net : directNetworks)
    {
        u_int32_t ip_network = endian(ip_address);
        u_int32_t mask = -(1 << (32 - net.mask_length));
        ip_network = endian(ip_network & mask);

        if (ip_network == net.ip_address && net.dist < inf)
        {
            net.last_update = time(nullptr);
            return net.dist;
        }
    }

    return inf;
}


void RoutingTable::Update(u_int32_t ip_address, u_int8_t mask_length,
    u_int32_t dist, u_int32_t sender_ip)
{
    bool new_network = true;
    for (Network& network : networks)
    {
        
        if (network.ip_address == ip_address && network.mask_length == mask_length)
        {
            new_network = false;
            u_int32_t d = DirectNetworkDist(sender_ip);
            if (d < inf)
            {
                network.last_update = time(nullptr);
                d += dist;
                if (network.dist > d)
                {
                    network.dist = d;
                }
            }
        }
        if (network.dist > inf_lim)
        {
            network.dist = inf;
        }
    }

    if (new_network)
    {
        u_int32_t d = dist + DirectNetworkDist(sender_ip);
        networks.push_back(Network(ip_address, mask_length, d, sender_ip));
    }
}

void RoutingTable::AddDirectNetwork(u_int32_t ip_address, u_int8_t mask_length,
    u_int32_t dist, u_int32_t bcast)
{
    directNetworks.push_back(Network(ip_address, mask_length, dist, 0, bcast));
}

void RoutingTable::AddBroadcast(u_int32_t bcast)
{
    broadcast.push_back(bcast);
}

void RoutingTable::Print()
{
    for (Network network : directNetworks)
    {
        if (network.dist < inf || time(nullptr) - network.last_update <= time_to_remove)
        {
            char buf[20];
            inet_ntop(AF_INET, &(network.ip_address), buf, 20);
            printf("%s/%d ",buf, network.mask_length);
            if (network.dist == inf)
                printf("unreachable ");
            else
                printf("distance %d ", network.dist);

            printf("connected directly\n");
        }
    }

    for (Network network : networks)
    {
        char buf[20];
        inet_ntop(AF_INET, &(network.ip_address), buf, 20);
        printf("%s/%d ",buf, network.mask_length);
        if (network.dist == inf)
            printf("unreachable ");
        else
            printf("distance %d ", network.dist);

        inet_ntop(AF_INET, &(network.via), buf, 20);
        printf("via %s\n", buf);
    }
}

void RoutingTable::EraseUnreachable()
{
    for (Network network : directNetworks)
    {
        if (time(nullptr)-network.last_update > time_to_remove)
        {
            network.dist = inf;
        }
    }

    for (auto network = networks.begin(); network != networks.end();)
    {
        if (network->dist == inf && time(nullptr) - network->last_update > time_to_remove)
        {
            network = networks.erase(network);
        }
        else if (time(nullptr) - network->last_update > time_to_remove)
        {
            network->dist = inf;
            network->last_update = time(nullptr);
        }
        else
        {
            network++;
        }
    }
}