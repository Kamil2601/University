using System;

class MCTS
{
    readonly double c;
    Random random = new Random();
    RandomGame game;
    Game currentState;
    public Node root;

    public MCTS(Game game)
    {
        root = new Node(game);
        this.currentState = game;
        this.game = new RandomGame();
        c = Math.Sqrt(2);
    }

    public (int, int) Search(TimeSpan time)
    {
        DateTime start = DateTime.Now;

        while ((DateTime.Now - start) < time)
        {
            Iteration();
        }

        var (row, col) = BestMove();

        // Move(row, col);

        return (row, col);
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
        return root.ChildWithBestRate().lastMove;
    }

    public void Iteration()
    {
        game.Set(currentState);
        TreePolicy(root);
    }

    public int TreePolicy(Node v)
    {
        if (game.winner != 0)
        {
            Update(v, game.winner);
            return game.winner;
        }
        if (v.gamesTotal > 0 || v.lastMove == (-1,-1))
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

    private int Simulation(Node v)
    {
        var res = game.Play();
        return res;
    }

    Node NextNode(Node v)
    {
        if (!v.IsFullyExpanded())
            return Expand(v);
        else
            return BestChild(v);
    }

    private Node BestChild(Node v)
    {
        var res = v.BestChild(c);
        var (row, col) = res.lastMove;
        game.Move(row, col);
        return res;
    }

    private Node Expand(Node v)
    {
        var (row, col) = v.NextUntriedMove();
        game.Move(row, col);
        return v.AddChild(game);
    }

    void Update(Node v, int result)
    {
        v.gamesTotal++;

        if (result == v.lastPlayer)
            v.points+=1;
        else if (result == 3)
            v.points+=0.5;
    }
}
