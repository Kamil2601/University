#include <iostream>
#include <memory>
#include <fstream>

class LineWriter
{
    std::ofstream _stream;

    public:
    LineWriter(std::string file)
    {
        _stream = std::ofstream(file, std::ofstream::out);
    }

    ~LineWriter()
    {
        std::cerr << "Destruktor LineWriter\n";
        _stream.close();
    }

    void write(std::string line)
    {
        _stream.write((line + "\n").c_str(), line.length() + 1);
    }
};

int main()
{
    std::shared_ptr<LineWriter> a = std::make_shared<LineWriter>("file.txt");
    std::shared_ptr<LineWriter> b = a;
    std::shared_ptr<LineWriter> c = a;


    std::cerr << "a->write()\n";
    a->write("Ala ma kota");

    std::cerr << "b->write()\n";
    b->write("Blablabla");

    std::cerr << "c->write()\n";
    c->write("2+2=4");
}