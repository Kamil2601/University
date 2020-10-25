using System;
using System.Collections.Generic;
using System.Linq;

class Node
{
    public (int, int) lastMove;
    public int gamesTotal;
    public double points;
    public int currentPlayer;
    List<Node> children;
    List<(int, int)> legalMoves;

    public Node(Game game)
    {
        legalMoves = game.LegalMoves();
    }

    public bool IsFullyExpanded()
    {
        return children.Count == legalMoves.Count;
    }

    public Node BestChild(double c)
    {
        return children.Aggregate((node1, node2) => 
            node1.Value(c, gamesTotal) > node2.Value(c, gamesTotal) ? node1 : node2);
    }

    double Value(double c, int parentGames)
    {
        return points/(double)gamesTotal + 
            c * Math.Sqrt(Math.Log(parentGames)/gamesTotal);
    }

    internal Node Expand()
    {
        throw new NotImplementedException();
    }
}
