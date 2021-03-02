#pragma once
#include <cstdio>
#include <string>
#include <bitset>
#include <arpa/inet.h>

using namespace std;

int endian(int x);

u_int32_t network_broadcast(string network_str);

u_int32_t network_addr(string network_str);

u_int8_t mask_length(string network_str);