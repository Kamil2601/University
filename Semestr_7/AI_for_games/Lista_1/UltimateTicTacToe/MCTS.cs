using System;

class MCTS
{
    protected readonly double c;
    protected Random random = new Random();
    protected RandomGame game;
    protected Game currentState;
    protected Node root;
    protected double coefficient;

    public MCTS(Game game, double c = 1.41, double coefficient = 1)
    {
        root = new Node(game);
        this.currentState = game;
        this.c = c;
        this.game = new RandomGame();
        this.coefficient = coefficient;
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
    }

    public (int, int) BestMove()
    {
        return root.ChildWithBestRate().lastMove.Move;
    }

    public virtual void Iteration()
    {
        game.Set(currentState);
        TreePolicy(root);
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

    protected virtual int Simulation(Node v)
    {
        var res = game.Play();
        return res;
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
        var res = v.BestChild(c);
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

    public void DecayStats()
    {
        root.Decay(coefficient);
    }
}
