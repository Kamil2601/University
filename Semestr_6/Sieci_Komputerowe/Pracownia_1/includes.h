// Kamil Michalak 299089
#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <netinet/ip_icmp.h>
#include <cassert>
#include <sys/types.h>
#include <unistd.h>
#include <strings.h>
#include <string.h>
#include <errno.h>

#define MAX_TTL 30
#define TTL_PACKS 3