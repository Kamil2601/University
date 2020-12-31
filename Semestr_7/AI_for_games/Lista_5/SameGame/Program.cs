using Engine;
using Simulations;

namespace SameGame
{
    class Program
    {
        static void Main(string[] args)
        {
            GameState game = new GameState();

            game.RandomInit();

            Simulation simulation = new RandomRegion();

            simulation.GameState = game;

            simulation.Simulate();   
        }
    }
}
