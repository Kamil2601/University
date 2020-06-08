#include <string>
#include <strings.h>
#include <string.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <algorithm>


#define REQUEST_SIZE 1000
#define RESPONSE_SIZE 1000000

class Server
{
    int port;
    int sockfd;
    std::string root;
    char request_buf[REQUEST_SIZE + 1];
    char* reply_buf;
    bool closeConnection;

    size_t CreateReply();

    std::string GetHostName(std::string);
    std::string GetPath(std::string);
    bool NotImplementedRequest(std::string);
    bool PathExists(std::string);
    bool IsDirectory(std::string);
    bool IsTypeOf(std::string, std::string);
    bool IsHtml(std::string);
    bool IsCss(std::string);
    bool IsTxt(std::string);
    bool IsPdf(std::string);
    bool IsPng(std::string);
    bool IsJpg(std::string);
    bool IsJpeg(std::string);
    bool HostExists(std::string);
    bool PathInHost(std::string);
    size_t MovedPermanentlyReply();
    size_t FileReply(std::string, std::string);
    size_t HtmlReply(std::string);
    size_t CssReply(std::string);
    size_t TxtReply(std::string);
    size_t PdfReply(std::string);
    size_t PngReply(std::string);
    size_t JpgReply(std::string);
    size_t JpegReply(std::string);
    size_t DefaultReply(std::string);
    size_t ForbiddenReply();
    size_t NotFoundReply();
    size_t NotImplementedReply();
    
    void Connection(int);

public:
    Server(int port, char *dir);
    ~Server();

    void Run();

    
};