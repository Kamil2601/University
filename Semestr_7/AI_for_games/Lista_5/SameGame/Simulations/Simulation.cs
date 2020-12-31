using System;
using Engine;

namespace Simulations
{
    public abstract class Simulation
    {
        public GameState GameState { get; set; }

        public int Simulate()
        {
            Console.WriteLine(GameState);
            while (!GameState.Terminal)
            {
                Move();

                Console.WriteLine("--------------");
                Console.WriteLine(GameState);
            }

            return GameState.Score;
        }

        protected abstract void Move();
    }
}
