using System;
using System.IO;

namespace Zad1
{
    public interface ILogger
    {
        void Log(string message);
    }

    public class NoneLogger : ILogger
    {
        public void Log(string message) {}
    }

    public class ConsoleLogger : ILogger
    {
        public void Log(string message)
        {
            Console.WriteLine(message);
        }
    }

    public class FileLogger : ILogger
    {
        StreamWriter streamWriter;

        public FileLogger(string path)
        {
            streamWriter = new StreamWriter(path);
        }

        public void Log(string message)
        {
            streamWriter.WriteLine(message);
            streamWriter.Flush();
        }
    }
    public enum LogType { None, Console, File }
    public class LoggerFactory
    {
        public static ILogger GetLogger(LogType logType, string parameters = null)
        {
            if (logType == LogType.Console)
                return new ConsoleLogger();
            else if (logType == LogType.File)
                return new FileLogger(parameters);
            else
                return new NoneLogger();
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            ILogger logger = LoggerFactory.GetLogger(LogType.File, "test");
            logger.Log("Ala");
            logger.Log("ma");
            logger.Log("kota");
        }
    }
}
