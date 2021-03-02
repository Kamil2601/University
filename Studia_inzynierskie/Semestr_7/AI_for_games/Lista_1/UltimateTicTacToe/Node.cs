using System;
using System.Collections.Generic;
using System.Linq;

class Node
{
    public Action lastMove;
    public double gamesTotal;
    public double points;
    protected List<Node> children;
    protected List<(int, int)> legalMoves;

    public Node(Game game)
    {
        Random random = new Random();
        legalMoves = game.LegalMoves().OrderBy(_ => random.Next()).ToList();
        if (game.moves.Any())
            lastMove = new Action(3-game.Player, game.moves.Last().Move);
        else
            lastMove = new Action(3-game.Player, -1, -1);
        gamesTotal = 0;
        points = 0;
        children = new List<Node>();
    }

    public bool IsFullyExpanded()
    {
        return children.Count == legalMoves.Count();
    }

    public Node BestChild(double c)
    {
        return children.Aggregate((node1, node2) => 
            node1.UCTValue(c, gamesTotal) > node2.UCTValue(c, gamesTotal) ? node1 : node2);
    }

    public Node ChildWithBestRate()
    {
        return children.Aggregate((node1, node2) => 
            node1.Rate() > node2.Rate() ? node1 : node2);
    }

    public (int, int) NextUntriedMove()
    {
        return legalMoves[children.Count];
    }

    public Node AddChild(Game game)
    {
        Node child = new Node(game);
        children.Add(child);
        return child;
    }

    public Node NodeWithMove(int row, int col)
    {
        return children.FirstOrDefault(node => node.lastMove.Move == (row, col));
    }

    double UCTValue(double c, double parentGames)
    {
        return points/gamesTotal + 
            c * Math.Sqrt(Math.Log(parentGames)/gamesTotal);
    }

    double Rate()
    {
        return points/gamesTotal;
    }

    public void PrintTree(int spaces = 0)
    {
        Console.WriteLine(String.Concat(Enumerable.Repeat(" ",spaces)) + $"{lastMove}: {gamesTotal}, {points}");
        foreach (Node child in children)
            child.PrintTree(spaces+2);
    }

    public void Decay(double coefficient)
    {
        gamesTotal *= coefficient;
        points *= coefficient;

        foreach (Node child in children)
        {
            child.Decay(coefficient);
        }
    }
}
