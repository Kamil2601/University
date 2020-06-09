#include "server.h"

#define ERROR(str)                                         \
    {                                                      \
        fprintf(stderr, "%s: %s\n", str, strerror(errno)); \
        exit(EXIT_FAILURE);                                \
    }

Server::Server(int port, char *dir)
{
    reply_buf = new char[RESPONSE_SIZE+1];
    root.assign(dir);
    if (root[root.length() - 1] != '/')
        root += "/";

    sockfd = socket(AF_INET, SOCK_STREAM, 0);

    if (sockfd < 0)
        ERROR("socket() error");

    struct sockaddr_in server_address;
    bzero(&server_address, sizeof(server_address));
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(port);
    server_address.sin_addr.s_addr = htonl(INADDR_ANY);

    if (bind(
            sockfd,
            (struct sockaddr *)&server_address,
            sizeof(server_address)) < 0)
        ERROR("bind() error");
}

Server::~Server()
{
    delete [] reply_buf;
}

void Server::Connection(int connected_sockfd)
{
    struct timeval tv; tv.tv_sec = 1; tv.tv_usec = 0;

    for (;;)
    {
        fd_set descriptors;
		FD_ZERO(&descriptors);
		FD_SET(connected_sockfd, &descriptors);
		int ready = select(connected_sockfd + 1, &descriptors, NULL, NULL, &tv);
		if (ready < 0)
			ERROR("select() error");
		if (ready == 0)
			break;

        ssize_t bytes_read = recv(connected_sockfd, request_buf, REQUEST_SIZE, 0);
        if (bytes_read < 0)
            ERROR("recv() error");

        request_buf[bytes_read] = 0;

        size_t reply_msg_len = CreateReply();

        ssize_t bytes_sent = send(connected_sockfd, reply_buf, reply_msg_len, 0);
        if (bytes_sent < 0)
            ERROR("send error");
    }

    if (close(connected_sockfd) < 0)
        ERROR("close error");
}

void Server::Run()
{
    if (listen(sockfd, 64) < 0)
        ERROR("listen error");

    for (;;)
    {
        int connected_sockfd = accept(sockfd, NULL, NULL);
        if (connected_sockfd < 0)
            ERROR("accept error")

        Connection(connected_sockfd);
    }
    close(sockfd);
}

std::string Server::GetHostName(const std::string request)
{
    int lineStart = request.find("Host: ");
    if (lineStart == -1)
    {
        return "";
    }
    int nameStart = lineStart + 6;
    int nameEnd = request.find(':', nameStart);
    std::string hostName = request.substr(nameStart, nameEnd - nameStart);

    return hostName;
}

bool Server::NotImplementedRequest(std::string request)
{
    size_t eol = request.find("\n");
    if (eol == std::string::npos)
        return true;
    std::string firstLine = request.substr(0, eol);
    return firstLine.find("GET /") == std::string::npos ||
            firstLine.find("HTTP/1.") == std::string::npos;
}

bool Server::IsDirectory(const std::string path)
{
    return path.find('.') == std::string::npos;
}

bool Server::IsTypeOf(const std::string path, const std::string extension)
{
    return path.find(extension) != std::string::npos;
}


bool Server::IsHtml(const std::string path)
{
    return IsTypeOf(path, ".html");
}

bool Server::IsCss(const std::string path)
{
    return IsTypeOf(path, ".css");
}

bool Server::IsTxt(const std::string path)
{
    return IsTypeOf(path, ".txt");
}

bool Server::IsPdf(const std::string path)
{
    return IsTypeOf(path, ".pdf");
}

bool Server::IsPng(const std::string path)
{
    return IsTypeOf(path, ".png");
}

bool Server::IsJpg(const std::string path)
{
    return IsTypeOf(path, ".jpg");
}

bool Server::IsJpeg(const std::string path)
{
    return IsTypeOf(path, ".jpeg");
}

std::string Server::GetPath(const std::string request)
{
    size_t pathStart = request.find("GET ");
    if (pathStart == std::string::npos)
    {
        return "";
    }
    pathStart += 4;
    int pathEnd = request.find(' ', pathStart);
    std::string path = request.substr(pathStart, pathEnd - pathStart);

    return path;
}

bool Server::PathExists(std::string path)
{
    struct stat statbuf;
    if (stat(path.c_str(), &statbuf) != -1)
    {
        return true;
    }
    else
    {
        return false;
    }
}

bool Server::HostExists(std::string hostName)
{
    return PathExists(root + hostName);
}

bool Server::PathInHost(std::string path)
{
    size_t pos = path.find("/");
    int level = 0;
    std::string piece;
    while (pos != std::string::npos)
    {
        piece = path.substr(pos, 3);
        if (pos >= path.length() - 1)
            return true;
        else if (piece == "/..")
            level--;
        else if (piece != "/./")
            level++;

        if (level < 0)
            return false;

        pos = path.find("/", pos+1);
    }

    return true;
}

size_t Server::MovedPermanentlyReply()
{
    std::string header = "HTTP/1.1 301 Moved Permanently\r\n";
    std::string location = "Location: index.html\r\n";
    std::string reply = header + location;
    strcpy(reply_buf, reply.c_str());
    return reply.length();
}

size_t Server::FileReply(std::string path, std::string contentType)
{
    std::string filePath = root + path;

    if (!PathExists(filePath))
    {
        return NotFoundReply();
    }
    else
    {
        int fd = open(filePath.c_str(), O_RDONLY);
        if (fd < 0)
            ERROR("open() error");

        int length = lseek(fd, 0, SEEK_END);
        std::string header =
            "HTTP/1.1 200 OK\r\n" +
            contentType +
            "Content-Length: " +
            std::to_string(length) +
            "\r\n\r\n";
        int headerSize = header.length();
        lseek(fd, 0, SEEK_SET);
        strcpy(reply_buf, header.c_str());
        read(fd, reply_buf + headerSize, length);
        return headerSize + length;
    }
}

size_t Server::HtmlReply(std::string path)
{
    return FileReply(path, "Content-Type: text/html; charset=UTF-8\r\n");
}

size_t Server::CssReply(std::string path)
{
    return FileReply(path, "Content-Type: text/css; charset=UTF-8\r\n");
}

size_t Server::TxtReply(std::string path)
{
    return FileReply(path, "Content-Type: text/txt; charset=UTF-8\r\n");
}

size_t Server::PdfReply(std::string path)
{
    return FileReply(path, "Content-Type: application/pdf\r\n");
}

size_t Server::PngReply(std::string path)
{
    return FileReply(path, "Content-Type: image/png\r\n");
}

size_t Server::JpgReply(std::string path)
{
    return FileReply(path, "Content-Type: image/jpg\r\n");
}

size_t Server::JpegReply(std::string path)
{
    return FileReply(path, "Content-Type: image/jpeg\r\n");
}

size_t Server::DefaultReply(std::string path)
{
    return FileReply(path, "Content-Type: application/octet-stream\r\n");
}

size_t Server::ForbiddenReply()
{
    std::string reply = "HTTP/1.1 403 Forbidden\r\n";
    strcpy(reply_buf, reply.c_str());
    return reply.length();
}

size_t Server::NotFoundReply()
{
    std::string reply = "HTTP/1.1 404 Not Found\r\n\r\nPage not found\r\n";
    strcpy(reply_buf, reply.c_str());
    return reply.length();
}

size_t Server::NotImplementedReply()
{
    std::string reply = "HTTP/1.1 501 Not Implemented\r\n";
    strcpy(reply_buf, reply.c_str());
    return reply.length();
}

size_t Server::CreateReply()
{
    std::string request(request_buf);

    closeConnection = !(request.find("Connection: close") != std::string::npos);

    if (NotImplementedRequest(request))
    {
        return NotImplementedReply();
    }

    std::string hostName = GetHostName(request);


    if (!HostExists(hostName))
    {
        return ForbiddenReply();
    }

    std::string path = GetPath(request);

    if (!PathInHost(path))
    {
        return ForbiddenReply();
    }
    
    if (IsDirectory(path))
    {
        return MovedPermanentlyReply();
    }

    path = hostName + path;

    if (IsHtml(path))
    {
        return HtmlReply(path);
    }
    else if (IsCss(path))
    {
        return CssReply(path);
    }
    else if (IsTxt(path))
    {
        return TxtReply(path);
    }
    else if (IsPdf(path))
    {
        return PdfReply(path);
    }
    else if (IsPng(path))
    {
        return PngReply(path);
    }
    else
    {
        return DefaultReply(path);
    }
}