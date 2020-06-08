// Kamil Michalak 299089
#include "server.h"

int main(int argc, char* argv[])
{
    if (argc != 3)
    {
        perror("./webserver <port> <directory>\n");
        exit(EXIT_FAILURE);
    }

    int port = std::stoi(argv[1]);
    char *dir = argv[2];

    Server server(port, dir);
    server.Run();
    
    return 0;
}