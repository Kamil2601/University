using System;
using System.Linq;
using ForwardModel.Actions;

namespace ForwardModel.Games
{
    public class RandomGame: Game
    {
        Random random = new Random();

        public RandomGame(): base()
        {
            Player.Name = "Player";
            Opponent.Name = "Opponent";
        }

        public void SetAction(Player player)
        {
            var actions = LegalActions(player);

            var brews = actions.Where(action => action.IsBrew()).ToList();

            if (brews.Count > 0)
            {
                Console.WriteLine($"{player.Name} can brew");
                actions = brews.ToList();
            }

            int index = random.Next(actions.Count);

            player.Action = actions[index];

            if (player.Action.IsBrew())
            {
                Console.WriteLine("IsBrew()");
            }
        }

        public void Iteration()
        {
            SetAction(Player);
            SetAction(Opponent);

            if (Player.Action.IsBrew() || Opponent.Action.IsBrew())
            {
                Console.WriteLine("BREW");
            }

            PerformGameUpdate();
        }

        public int Play()
        {
            while (!GameOver())
            {
                Iteration();
            }

            return Result();
        }
    }
}
