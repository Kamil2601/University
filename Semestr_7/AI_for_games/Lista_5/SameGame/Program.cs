using System;
using Engine;
using MonteCarlo;
using Simulations;

namespace SameGame
{
    class Program
    {
        static void Main(string[] args)
        {
            
            CodinGame();
            // Console.WriteLine(game);

            // GameAction move = flatMC.FindBestMove(new TimeSpan(0,0,1));

            // Console.WriteLine(move);
        }

        static void Test()
        {
            GameState game = new GameState();

            game.RandomInit();

            Simulation simulation = new RandomRegion();

            simulation.GameState = game;

            FlatMC flatMC = new FlatMC(simulation, game);

            TimeSpan time = new TimeSpan(0,0,0,0,200);

            Console.WriteLine(flatMC.PlayGame(time));
        }

        static void CodinGame()
        {
            GameState game = new GameState();
            Simulation simulation = new Tabu();
            simulation.GameState = game;
            FlatMC flatMC = new TabuMC(simulation, game);

            var time = new TimeSpan(0,0,19);

            game.ReadInput();

            var move = flatMC.FindBestMove(time);

            Console.WriteLine($"{move.X} {move.Y}");

            time = new TimeSpan(0,0,0,0,45);

            while (true)
            {
                game.ReadInput();

                move = flatMC.FindBestMove(time);

                Console.WriteLine($"{move.X} {move.Y}");
            }
        }
    }
}
