using System;
using System.Collections.Generic;
using System.Linq;

class MCTSWithMAST : MCTS
{
    Dictionary<Action, Stats> actionStats =
        new Dictionary<Action, Stats>();

    public double MASTCoefficient { get; }
    const double randomMoveChance = 0.4;

    public MCTSWithMAST(Game game, double c = 1, double mASTCoefficient = 0.4) : base(game, c)
    {
        MASTCoefficient = mASTCoefficient;
    }

    public override void Iteration()
    {
        game.Set(currentState);
        var earlierMoves = game.moves.Count;
        TreePolicy(root);
        UpdateActionStats(earlierMoves);
    }

    private void UpdateActionStats(int earlierMoves)
    {
        var winner = game.Winner;

        for (int i=earlierMoves; i<game.moves.Count; i++)
        {
            var action = game.moves[i];

            var points = PointsForPlayer(action.Player, winner);
            
            if (actionStats.ContainsKey(action))
            {
                actionStats[action].Games++;
                actionStats[action].Points += points;
            }
            else
            {
                actionStats[action] = new Stats(1, points);
            }
        }
    }

    private double PointsForPlayer(int player, int winner)
    {
        if (player == winner)
            return 1;
        else if (winner == 3-player)
            return 0;
        else
            return 0.5;
    }

    private void DecayMAST()
    {
        foreach (var stats in actionStats)
        {
            stats.Value.Games *= coefficient;
            stats.Value.Points *= coefficient;
        }
    }

    protected override int Simulation(Node v)
    {
        int result = game.Winner;

        while (result == 0)
        {
            result = RandomOrGreedyMove();
        }

        return result;
    }

    private int RandomOrGreedyMove()
    {
        var decision = random.NextDouble();

        if (decision > randomMoveChance)
        {
            var actions = TestedLegalMoves();

            if (actions.Any())
            {
                var bestAction = actions.Aggregate((a1, a2) => 
                    actionStats[a1].Ratio > actionStats[a2].Ratio ? a1 : a2);

                return game.Move(bestAction.Row, bestAction.Col);
            }
        }

        return game.RandomMove();
    }

    private List<Action> TestedLegalMoves()
    {
        var actions = game.LegalMoves().Select(move => new Action(game.Player, move));

        return actionStats.Where(stat => actions.Contains(stat.Key))
            .Select(pair => pair.Key).ToList();
    }

    public void PrintActionStats()
    {
        Console.WriteLine("Action stats");
        foreach (var stats in actionStats)
        {
            var action = stats.Key;
            var s = stats.Value;

            Console.WriteLine($"[{action.Player}, {action.Move}]: {s.Points}/{s.Games} = {s.Ratio}");
        }
    }
}
