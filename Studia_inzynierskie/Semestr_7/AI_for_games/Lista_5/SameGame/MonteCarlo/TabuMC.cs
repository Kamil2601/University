using System;
using System.Linq;
using Engine;
using Simulations;

namespace MonteCarlo
{
    public class TabuMC : FlatMC
    {
        public TabuMC(Simulation simulation, GameState gameState): base(simulation, gameState)
        {
        }

        public override GameAction FindBestMove(TimeSpan time)
        {
            var color = 0;

            for (int i=0; i<5; i++)
            {
                if (GameState.ColorQuantity[i] > GameState.ColorQuantity[color])
                {
                    color = i;
                }
            }

            var legals = GameState.Legals();

            var tabuLegals = legals.Where(action => action.Color != color).ToList();

            if (tabuLegals.Count > 0)
                legals = tabuLegals;


            stats = legals.Select(action => new ActionStats(action)).ToList();

            DateTime start = DateTime.Now;

            while (DateTime.Now - start < time)
            {
                Simulate();
            }

            return BestMove();
        }
    }
}
