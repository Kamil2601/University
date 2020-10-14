using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Zad1
{
    static class Program
    {
        /// <summary>
        /// Główny punkt wejścia dla aplikacji.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Data data = new Data();
            data.AddGroup(new Group("Grupa 1"));
            data.AddUser(0, new User("Jan Kowalski", "Opis Jana Kowalskiego"));
            data.AddUser(0, new User("Adam Małysz", "Opis Adama Małysza"));
            data.AddGroup(new Group("Grupa 2"));
            data.AddUser(1, new User("Przykładowy użytkownik", "Przykładowy opis"));
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Register());
        }
    }
}
