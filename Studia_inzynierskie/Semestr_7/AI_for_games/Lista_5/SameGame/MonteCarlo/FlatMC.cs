using System;
using System.Collections.Generic;
using System.Linq;
using Engine;
using Simulations;

namespace MonteCarlo
{
    public class FlatMC
    {
        public Simulation Simulation { get; set; }
        public GameState GameState { get; set; }
        protected List<ActionStats> stats;
        Random random = new Random();

        public FlatMC(Simulation simulation, GameState gameState)
        {
            Simulation = simulation;
            GameState = gameState;
        }

        public virtual GameAction FindBestMove(TimeSpan time)
        {
            stats = GameState.Legals().Select(action => new ActionStats(action)).ToList();
            DateTime start = DateTime.Now;

            while (DateTime.Now - start < time)
            {
                Simulate();
            }
            
            return BestMove();
        }

        public int PlayGame(TimeSpan time)
        {
            Console.WriteLine(GameState);

            while (!GameState.Terminal)
            {
                var move = FindBestMove(time);

                GameState.Apply(move);
                Console.WriteLine(move);
                Console.WriteLine(GameState);
            }

            return GameState.Score;
        }

        protected GameAction BestMove()
        {
            if (stats == null || stats.Count == 0)
                return null;

            ActionStats result = stats[0];

            foreach (var s in stats)
            {
                if (result.Ratio < s.Ratio)
                {
                    result = s;
                }
            }

            GameState.Apply(result.Action);

            return result.Action;
        }

        protected virtual void Simulate()
        {
            Simulation.GameState = GameState.Copy();

            var actionIndex = random.Next(stats.Count);

            var actionStats = stats[actionIndex];

            Simulation.GameState.Apply(actionStats.Action);

            var result = Simulation.Simulate();

            actionStats.Games++;
            actionStats.SumScore += result;
        }
    }
}
