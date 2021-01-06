using System;
using System.Collections.Generic;
using System.Linq;
using Engine;

namespace MCTS
{
    public class Node
    {
        public GameAction LastMove { get; set; }
        public GameState GameState { get; set; }
        public List<GameAction> LegalMoves { get; set; }
        public Node Parent { get; set; }
        public List<Node> Children { get; set; }
        public int Games { get; set; }
        public int Score { get; set; }
        public int SquareSum { get; set; }
        public double AvgScore => (double)Score/(double)Games;
        public bool FullyExpanded => Children.Count == LegalMoves.Count;
        public bool IsLeaf => Children.Count == 0;

        public Node(GameState gameState)
        {
            Random random = new Random();

            GameState = gameState.Copy();
            LastMove = null;
            LegalMoves = gameState.Legals().OrderBy(_ => random.Next()).ToList();
            Children = new List<Node>();
            Games = 0; 
            Score = 0;
        }

        public Node(GameState previousState, GameAction move, Node parent)
        {
            Random random = new Random();

            Parent = parent;
            GameState = previousState.Copy();
            GameState.Apply(move);
            LastMove = move;
            LegalMoves = GameState.Legals().OrderBy(_ => random.Next()).ToList();
            Children = new List<Node>();
            Games = 0; 
            Score = 0;
        }

        public void Update(int result)
        {
            Games++;
            Score+=result;
            SquareSum = SquareSum + result*result;
        }

        public Node Expand()
        {
            var nextAction = LegalMoves[Children.Count];

            Node child = new Node(GameState, nextAction, this);

            Children.Add(child);

            return child;
        }

        public Node BestChild(double c, double d)
        {
            List<Node> bestChildren = new List<Node>();

            bestChildren.Add(Children[0]);

            var bestUCT = Children[0].UCTValue(Games, c, d);

            foreach (var child in Children.Skip(1))
            {
                var uct = child.UCTValue(Games, c, d);

                if (uct > bestUCT)
                    bestChildren = new List<Node>() {child};
                else if (uct == bestUCT)
                    bestChildren.Add(child);
            }

            Random random = new Random();

            return bestChildren[random.Next(bestChildren.Count)];
        }

        public Node ChildWithBestScore()
        {
            List<Node> bestChildren = new List<Node>();

            bestChildren.Add(Children[0]);

            var bestScore = Children[0].AvgScore;

            foreach (var child in Children.Skip(1))
            {
                var score = child.AvgScore;

                if (score > bestScore)
                    bestChildren = new List<Node>() {child};
                else if (score == bestScore)
                    bestChildren.Add(child);
            }

            Random random = new Random();

            return bestChildren[random.Next(bestChildren.Count)];
        }

        private double UCTValue(int parentGames, double c, double d)
        {
            return AvgScore + c * Math.Sqrt(Math.Log(parentGames)/Games)
                + Math.Sqrt((SquareSum - Games * AvgScore * AvgScore + d) / Games);
        }
    }
}
