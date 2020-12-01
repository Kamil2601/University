using System;
using Greedy;
using Models;

namespace FallChallenge2020
{
    class Program
    {
        static void Main(string[] args)
        {
            // CodinGame();
        }

        public static void CodinGame()
        {
            string data;

            Player player = new Player();
            Player opponent = new Player(true);

            // game loop
            while (true)
            {
                player.Reset();
                opponent.Reset();

                int actionCount = int.Parse(Console.ReadLine()); // the number of spells and recipes in play
                for (int i = 0; i < actionCount; i++)
                {
                    data = Console.ReadLine();
                    player.ReadAction(data);
                    opponent.ReadAction(data);
                    
                    // Console.Error.WriteLine($"{actionId} {actionType} {castable}");
                }
                
                player.ReadInventory();
                opponent.ReadInventory();

                // Write an action using Console.WriteLine()
                // To debug: Console.Error.WriteLine("Debug messages...");


                // in the first league: BREW <id> | WAIT; later: BREW <id> | CAST <id> [<times>] | LEARN <id> | REST | WAIT
                Console.WriteLine(player.BestMove());
            }
        }
    }
}
