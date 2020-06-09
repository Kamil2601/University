using System;
using System.IO;
using System.Data.SqlClient;
using System.Xml;

namespace Zad2
{
    public abstract class DataAccessHandler
    {
        public abstract void Connect();
        public abstract void Download();
        public abstract void Process();
        public abstract void Close();

        public void Execute()
        {
            Connect();
            Download();
            Process();
            Close();
        }
    }

    public class DatabaseAccesHandler : DataAccessHandler
    {
        SqlConnection connection;
        SqlCommand command;
        string tableName;
        string columnName;
        string query;

        public DatabaseAccesHandler(string connectionString, string tableName, string columnName)
        {
            connection = new SqlConnection(connectionString);
            this.columnName = columnName;
            this.tableName = tableName;
        }

        public override void Connect()
        {
            connection.Open();
        }
        public override void Download()
        {
            query = string.Format("SELECT SUM({0}) FROM {1}", columnName, tableName);
            command = new SqlCommand(query, connection);
        }
        public override void Process()
        {
            using (SqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    Console.WriteLine(String.Format("{0}, {1}",
                        reader[0], reader[1]));
                }
            }
        }
        public override void Close()
        {
            connection.Close();
        }
    }

    public class XmlAccesHandler : DataAccessHandler
    {
        string file;
        XmlTextReader reader;

        public XmlAccesHandler(string file)
        {
            this.file = file;
        }
        public override void Connect()
        {
            reader = new XmlTextReader(file);
        }
        public override void Download()
        {

        }
        public override void Process()
        {
            string longestName = "";
            while (reader.Read())
            {
                if (reader.Name.Length > longestName.Length)
                {
                    longestName = reader.Name;
                }
            }
            Console.WriteLine("Node with longest name: {0}", longestName);
        }
        public override void Close()
        {
            reader.Close();
        }
    }

    class Program
    {
        public static void Main()
        {

        }
    }
}