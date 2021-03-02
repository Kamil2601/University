using System;
using Engine;

namespace Simulations
{
    public abstract class Simulation
    {
        public GameState GameState { get; set; }
        protected Random random = new Random();

        public int Simulate()
        {
            // Console.WriteLine(GameState);
            while (!GameState.Terminal)
            {
                var move = Move();

                GameState.Apply(move);

                // Console.WriteLine("--------------");
                // Console.WriteLine(move);
                // Console.WriteLine(GameState);
            }

            return GameState.Score;
        }

        protected abstract GameAction Move();
    }
}
