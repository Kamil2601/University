using System;
using Engine;

namespace Simulations
{
    public class RandomRegion : Simulation
    {
        Random random = new Random();

        protected override void Move()
        {
            var legals = GameState.Legals();

            var action = legals[random.Next(legals.Count)];

            GameState.Apply(action);
        }
    }
}
