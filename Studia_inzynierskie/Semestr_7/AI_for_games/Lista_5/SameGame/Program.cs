using System;
using System.Collections.Generic;
using Engine;
using Hashing;
using MCTS;
using MonteCarlo;
using Simulations;

namespace SameGame
{
    class Program
    {
        static void Main(string[] args)
        {
            // Test();
            // Test2();

            CodinGame();
        }

        static void Test2()
        {
            GameState game = new GameState();

            game.RandomInit();

            Simulation simulation = new RandomRegion();

            FlatMC mc = new FlatMC(simulation, game.Copy());

            var time = new TimeSpan(0,0,1);

            var move = mc.FindBestMove(time);
            mc.GameState.Apply(move);

            SPMCTS mcts = new SPMCTS(game.Copy(), simulation, 0.5, 10000);

            mcts.FindBestMove(time);

            mc.FindBestMove(time);
            mcts.FindBestMove(time);
        }

        static void Test()
        {
            GameState game = new GameState();

            game.RandomInit();

            Simulation simulation = new RandomRegion();

            FlatMC mc = new FlatMC(simulation, game);

            var time = new TimeSpan(0,0,1);

            mc.FindBestMove(time);
            // SPMCTS sPMCTS = new SPMCTS(game.Copy(), simulation, 1, 0);

            // var time = new TimeSpan(0,0,1);

            // var root = sPMCTS.Root;

            // sPMCTS.FindBestMove(time);

            // Console.WriteLine(root.Games);


            // while (!game.Terminal)
            // {
            //     var move = sPMCTS.FindBestMove(time);
            //     game.Apply(move);
            // }
        }

        static void CodinGame()
        {
            GameState game = new GameState();
            Simulation simulation = new Tabu();
            simulation.GameState = game;
            game.ReadInput();
            var ai = new SPMCTS(game.Copy(), simulation, 0.5, 100);

            // var ai = new FlatMC(simulation, game);

            var time = new TimeSpan(0,0,0,19,0);
            

            var move = ai.FindBestMove(time);

            Console.WriteLine($"{move.X} {move.Y}");

            time = new TimeSpan(0,0,0,0,45);

            while (!ai.Root.GameState.Terminal)
            // while (true)
            {
                // game.ReadInput();

                move = ai.FindBestMove(time);

                Console.WriteLine($"{move.X} {move.Y}");
            }
        }
    }
}
