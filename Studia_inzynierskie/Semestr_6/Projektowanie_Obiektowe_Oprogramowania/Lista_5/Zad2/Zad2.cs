using System;
using System.IO;
using System.Text;

namespace Zad2
{
    class CaesarStream : Stream
    {
        private const int byteConst = 255;
        private Stream stream;
        private int offset;

        public CaesarStream(Stream stream, int offset)
        {
            this.stream = stream;
            this.offset = offset;
        }

        public override bool CanRead
        {
            get { return stream.CanRead;}
        }

        public override bool CanSeek
        {
            get { return stream.CanSeek;}
        }

        public override bool CanWrite
        {
            get { return stream.CanWrite;}
        }

        public override long Length
        {
            get { return stream.Length;}
        }

        public override long Position
        {
            get { return stream.Position;}
            set { stream.Position = value;}
        }

        public override void Flush()
        {
            stream.Flush();
        }

        public override long Seek(long offset, SeekOrigin origin)
        {
            return stream.Seek(offset, origin);
        }

        public override void SetLength(long value)
        {
            stream.SetLength(value);
        }

        public override void Close()
        {
            stream.Close();
        }

        private byte EncryptByte(int b)
        {
            return (byte)((b + byteConst + offset) % byteConst);
        }

        private byte EncryptByte(byte b)
        {
            return (byte)((b + byteConst + offset) % byteConst);
        }

        public override void Write(byte[] buffer, int offset, int count)
        {
            for (int i=offset; i<count; i++)
            {
                byte b = EncryptByte(buffer[i]);
                stream.WriteByte(b);
            }
        }

        public override int Read(byte[] buffer, int offset, int count)
        {
            int readBytes = Math.Min(count, buffer.Length - offset);
            int b;
            for (int i=0; i<readBytes; i++)
            {
                b = stream.ReadByte();
                if (b == -1)
                {
                    return i;
                }
                buffer[offset + i] = EncryptByte(b);
            }

            return readBytes;
        }

        
    }

    class Program
    {
        public static void Main()
        {
            
            byte[] bytes_ = Encoding.ASCII.GetBytes("Ala ma kota");
            FileStream fileToWrite = File.Create("file.txt");
            CaesarStream caeToWrite = new CaesarStream(fileToWrite, 5);
            caeToWrite.Write(bytes_);
            caeToWrite.Close();
            FileStream fileToRead = File.Open("file.txt", FileMode.Open);
            CaesarStream caeToRead = new CaesarStream(fileToRead, -5);
            caeToRead.Read(bytes_,0,bytes_.Length);
            Console.WriteLine(Encoding.Default.GetString(bytes_));
        }
    }
}