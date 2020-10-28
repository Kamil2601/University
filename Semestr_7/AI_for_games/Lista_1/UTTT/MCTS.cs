using System;
using System.Collections.Generic;
using System.Linq;

class MCTS
{
    private readonly MCTSParams mCTSParams;
    protected Random random = new Random();
    protected RandomGame game;
    protected Game currentState;
    protected Node root;

    
    // Used only if MAST is used
    Dictionary<Action, Stats> actionStats;

    public MCTS(Game game, MCTSParams mCTSParams)
    {
        root = new Node(game);
        this.currentState = game;
        this.mCTSParams = mCTSParams;
        this.game = new RandomGame();

        if (mCTSParams.UseMAST)
        {
            actionStats = new Dictionary<Action, Stats>();
        }
    }

    public (int, int) Search(TimeSpan time)
    {
        DateTime start = DateTime.Now;

        while ((DateTime.Now - start) < time)
        {
            Iteration();
        }

        return BestMove();
    }

    public void Move(int row, int col)
    {
        root = root.NodeWithMove(row, col);
        currentState.Move(row, col);

        if (root == null)
            root = new Node(currentState);

        if (currentState.moves.Count % 2 == 0)
        {
            DecayAll();
        }
    }

    public (int, int) BestMove()
    {
        return root.ChildWithBestRate().lastMove.Move;
    }

    public virtual void Iteration()
    {
        var earlierMoves = game.moves.Count;
        game.Set(currentState);
        TreePolicy(root);

        if (mCTSParams.UseMAST)
        {
            UpdateActionStats(earlierMoves);
        }
    }

    public int TreePolicy(Node v)
    {
        if (game.Winner != 0)
        {
            Update(v, game.Winner);
            return game.Winner;
        }
        if (v.gamesTotal > 0 || v.lastMove.Move == (-1,-1))
        {
            Node next = NextNode(v);
            var result = TreePolicy(next);
            Update(v, result);
            return result;
        }
        else
        {
            var result = Simulation(v);
            Update(v, result);
            return result;
        }
    }

    protected int Simulation(Node v)
    {
        if (!mCTSParams.UseMAST)
        {
            return game.Play();
        }
        else
        {
            return MASTSimulation();
        }
    }

    protected Node NextNode(Node v)
    {
        if (!v.IsFullyExpanded())
            return Expand(v);
        else
            return BestChild(v);
    }

    protected private Node BestChild(Node v)
    {
        var res = v.BestChild(mCTSParams.TreePolicyCoefficient);
        var (row, col) = res.lastMove.Move;
        game.Move(row, col);
        return res;
    }

    protected private Node Expand(Node v)
    {
        var (row, col) = v.NextUntriedMove();
        game.Move(row, col);
        return v.AddChild(game);
    }

    protected void Update(Node v, int result)
    {
        v.gamesTotal++;

        if (result == v.lastMove.Player)
            v.points+=1;
        else if (result == 3)
            v.points+=0.5;
    }

    public void DecayAll()
    {
        DecayStats();

        if (mCTSParams.UseMAST)
            DecayMAST();
    }

    public void DecayStats()
    {
        root.Decay(mCTSParams.TreeDecayCoefficient);
    }


    // ------------------------ MAST ----------------------------------

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
            stats.Value.Games *= mCTSParams.MASTDecayCoefficient;
            stats.Value.Points *= mCTSParams.MASTDecayCoefficient;
        }
    }

    private int MASTSimulation()
    {
        int result = game.Winner;

        while (result == 0)
        {
            result = RandomOrBestMove();
        }

        return result;
    }

    private int RandomOrBestMove()
    {
        var decision = random.NextDouble();

        if (decision > mCTSParams.MASTRandomMoveChance)
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

    // ----------------------------------------------------------------
}
