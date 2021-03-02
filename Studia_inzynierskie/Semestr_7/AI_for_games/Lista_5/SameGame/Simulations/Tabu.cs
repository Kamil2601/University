using System.Linq;
using Engine;

namespace Simulations
{
    public class Tabu : Simulation
    {
        protected override GameAction Move()
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

            var action = legals[random.Next(legals.Count)];

            return action;
        }
    }
}
