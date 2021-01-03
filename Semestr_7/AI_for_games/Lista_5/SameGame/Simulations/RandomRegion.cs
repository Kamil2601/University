using System;
using Engine;

namespace Simulations
{
    public class RandomRegion : Simulation
    {
        

        protected override GameAction Move()
        {
            var legals = GameState.Legals();

            var action = legals[random.Next(legals.Count)];

            return action;
        }
    }
}
