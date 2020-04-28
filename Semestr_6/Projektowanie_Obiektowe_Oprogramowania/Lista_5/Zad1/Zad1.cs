using System;
using System.IO;
using System.Net.Mail;

namespace Zad1
{
    class SmtpFacade
    {
        public void Send(string from, string to, string subject, string body, 
            Stream streamAttachment, string attachmentMimeType)
        {
            MailMessage message = new MailMessage(from, to, subject, body);
            Attachment attachment = new Attachment(streamAttachment, attachmentMimeType);
            message.Attachments.Add(attachment);
            SmtpClient client = new SmtpClient();
            client.Send(message);
        }
    }

    class Program
    {
        public static void Main()
        {
            Console.WriteLine("Hello World!");
        }
    }
}