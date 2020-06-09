using System;
using System.IO;
using System.Net;
using System.Text;
using System.Linq;
using System.Collections;
using System.Threading;
using System.Collections.Concurrent;

namespace Zad1
{
    public interface ICommand
    {
        void Execute();
    }

    public class FTPDownloadCommand : ICommand
    {
        string downloadFrom;
        string saveTo;
        FTPDownloader downloader;

        public FTPDownloadCommand(string downloadFrom, string saveTo)
        {
            this.downloadFrom = downloadFrom;
            this.saveTo = saveTo;
            downloader = new FTPDownloader();
        }

        public void Execute()
        {
            downloader.Download(downloadFrom, saveTo);
        }
    }

    public class FTPDownloader
    {
        public void Download(string downloadFrom, string saveTo)
        {
            WebClient myWebClient = new WebClient();
            myWebClient.DownloadFile(downloadFrom, saveTo);
        }
    }

    public class HTTPDownloadCommand : ICommand
    {
        string downloadFrom;
        string saveTo;
        HTTPDownloader downloader;
        public HTTPDownloadCommand(string downloadFrom, string saveTo)
        {
            this.downloadFrom = downloadFrom;
            this.saveTo = saveTo;
            downloader = new HTTPDownloader();
        }

        public void Execute()
        {
            downloader.Download(downloadFrom, saveTo);
        }
    }

    public class HTTPDownloader
    {

        public void Download(string downloadFrom, string saveTo)
        {
            WebClient myWebClient = new WebClient();
            myWebClient.DownloadFile(downloadFrom, saveTo);
        }
    }

    public class CreateFileCommand : ICommand
    {
        FileCreator fileCreator;
        string path;
        public CreateFileCommand(string path)
        {
            this.path = path;
            fileCreator = new FileCreator();
        }

        public void Execute()
        {
            fileCreator.CreateFile(path);
        }
    }

    public class FileCreator
    {
        public void CreateFile(string path)
        {
            FileStream fileStream = File.Create(path);
            byte[] bytes = new UTF8Encoding(true).GetBytes(RandomString());
            fileStream.Write(bytes, 0, bytes.Length);
        }

        private string RandomString()
        {
            int length = new Random().Next(5, 100);
            Random random = new Random();

            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }

    public class CopyFileCommand : ICommand
    {
        string from;
        string to;
        FileCopier fileCopier;
        public CopyFileCommand(string from, string to)
        {
            fileCopier = new FileCopier();
            this.from = from;
            this.to = to;
        }

        public void Execute()
        {
            fileCopier.Copy(from, to);
        }   
    }

    public class FileCopier
    {
        public void Copy(string from, string to)
        {
            File.Copy(from, to);
        }
    }

    public class Invoker
    {
        ConcurrentQueue<ICommand> commands;
        Thread creator;
        Thread executor1, executor2;
        bool creating;
        int n;

        public Invoker()
        {
            creating = false;
            commands = new ConcurrentQueue<ICommand>();
        }

        void Start(int n)
        {
            this.n = n;
            creator = new Thread(new ThreadStart(this.Create));
            executor1 = new Thread(new ThreadStart(this.Execute));
            executor2 = new Thread(new ThreadStart(this.Execute));

            creator.Start();
            executor1.Start();
            executor2.Start();
        }

        void Create()
        {
            Random random = new Random();
            ICommand command;

            int commandNumber;
            creating = true;

            for (int i=0; i<n; i++)
            {
                commandNumber = random.Next(1,4);
                switch (commandNumber)
                {
                    case 1:
                        // FTP - brak przykładu
                    case 2:
                        command = new HTTPDownloadCommand(
                            "http://www.ii.uni.wroc.pl/~wzychla/ra2J2K/ra2J2K.html",
                            "file.html");
                        break;
                    case 3:
                        command = new CreateFileCommand("file.txt");
                        break;
                    default:
                        command = new CopyFileCommand("from.txt", "to.txt");
                        break;
                }

                commands.Enqueue(command);
            }

            creating = false;
        }
        
        void Execute()
        {
            ICommand command;
            bool end = false;
            for (;;)
            {
                for (;;)
                {
                    if (commands.TryDequeue(out command))
                    {
                        command.Execute();
                    }
                    else
                    {
                        break;
                    }
                }

                if (!creating)
                {
                    if (!end)
                    {
                        end = true;
                    }
                    else
                    {
                        break;
                    }
                }
            }
        }
    }

    public class Program
    {
        public static void Main()
        {
            
        }
    }
}