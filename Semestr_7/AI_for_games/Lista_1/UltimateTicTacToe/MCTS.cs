using System;

class MCTS
{
    readonly double c;
    Random random = new Random();
    RandomGame game;
    Game copy;
    Node root;

    public MCTS(Game game)
    {
        this.copy = game;
        c = Math.Sqrt(2);
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

    public (int, int) BestMove()
    {
        return root.BestChild(c).lastMove;
    }

    public void Iteration()
    {
        game.Set(copy);
        TreePolicy(root);
    }

    public GameResult TreePolicy(Node v)
    {
        if (v.gamesTotal > 0)
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

    private GameResult Simulation(Node v)
    {
        throw new NotImplementedException();
    }

    Node NextNode(Node v)
    {
        if (v.IsFullyExpanded())
            return v.Expand();
        else
            return v.BestChild(c);
    }

    void Update(Node v, GameResult result)
    {
        throw new NotImplementedException();
    }
}
