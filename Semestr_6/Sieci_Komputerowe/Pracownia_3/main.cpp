// Kamil Michalak 299089
#include <iostream>
#include "manager.h"

using namespace std;

int main(int argc, char* argv[])
{
    if (argc != 5)
    {
        perror("./transport <ip_address> <port> <file> <size (bites)>\n");
        return 0;
    }
    char *ip_string = argv[1];
    char *file_name = argv[3];

    int size = stoi(argv[4]);
    int port = stoi(argv[2]);

    // printf("%s\n%s\n%d\n%d\n", ip_string, file_name, size, port);

    Manager m(file_name, size, port, ip_string);

    // printf("%lx\n",m.udp.server_address.sin_addr.s_addr);

    m.Run();
    return 0;
}