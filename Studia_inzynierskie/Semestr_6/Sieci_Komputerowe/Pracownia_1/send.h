// Kamil Michalak 299089
#include "includes.h"

uint16_t sequence_number(uint16_t ttl, uint16_t iter);

u_int16_t compute_icmp_checksum(const void *buff, int length);

struct icmp create_header(uint16_t seq_num);

void send_icmp(int& sockfd,char ip_string[], uint16_t ttl, uint16_t package);
