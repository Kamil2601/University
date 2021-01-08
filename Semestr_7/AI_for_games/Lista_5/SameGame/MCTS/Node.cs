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
        public ulong Games { get; set; }
        public ulong Score { get; set; }
        public ulong SquareSum { get; set; }
        public double AvgScore => (double)Score / (double)Games;
        public bool FullyExpanded => Children.Count == LegalMoves.Count;
        public bool IsLeaf => Children.Count == 0;

        public Node(GameState gameState)
        {
            GameState = gameState.Copy();
            LastMove = null;

            Init();
        }

        public Node(GameState previousState, GameAction move, Node parent = null)
        {
            Parent = parent;
            GameState = previousState.Copy();
            GameState.Apply(move);
            LastMove = move;
            Init();
        }

        private void Init()
        {
            Random random = new Random();
            LegalMoves = GameState.Legals().OrderBy(_ => random.Next()).ToList();
            TabuLegals();
            Children = new List<Node>();
            Games = 0;
            Score = 0;
        }

        public void TabuLegals()
        {
            var color = 0;

            for (int i = 0; i < 5; i++)
            {
                if (GameState.ColorQuantity[i] > GameState.ColorQuantity[color])
                {
                    color = i;
                }
            }

            var tabuLegals = LegalMoves.Where(action => action.Color != color).ToList();

            if (tabuLegals.Count > 0)
                LegalMoves = tabuLegals;
        }



        public void Update(ulong result)
        {
            Games++;
            Score += result;
            SquareSum = SquareSum + result * result;
        }

        public Node Expand()
        {
            var nextAction = LegalMoves[Children.Count];

            Node child = new Node(GameState, nextAction, this);

            Children.Add(child);

            return child;
        }

        public Node ZobristExpand(HashTable table)
        {

            if (FullyExpanded)
                return null;
    
            var nextAction = LegalMoves[Children.Count];

            var game = GameState.Copy();

            game.Apply(nextAction);

            var nodeFromTable = table.Get(game);

            if (nodeFromTable == null)
            {
                var child = new Node(game);
                child.Parent = this;
                child.LastMove = nextAction;
                Children.Add(child);
                return child;
            }

            if (nodeFromTable.GameState.Score >= GameState.Score)
            {
                LegalMoves.RemoveAt(Children.Count);
                return null;
            }
            else
            {
                var parent = nodeFromTable.Parent;
                parent.RemoveChild(this);
            }
        }

        public Node BestChildUCT(double c, double d)
        {
            List<Node> bestChildren = new List<Node>();

            bestChildren.Add(Children[0]);

            var bestUCT = Children[0].UCTValue(Games, c, d);

            foreach (var child in Children.Skip(1))
            {
                var uct = child.UCTValue(Games, c, d);

                if (uct > bestUCT)
                    bestChildren = new List<Node>() { child };
                else if (uct == bestUCT)
                    bestChildren.Add(child);
            }

            Random random = new Random();

            return bestChildren[random.Next(bestChildren.Count)];
        }

        public Node BestChildAvg()
        {
            List<Node> bestChildren = new List<Node>();

            bestChildren.Add(Children[0]);

            var bestScore = Children[0].AvgScore;

            foreach (var child in Children.Skip(1))
            {
                var score = child.AvgScore;

                if (score > bestScore)
                    bestChildren = new List<Node>() { child };
                else if (score == bestScore)
                    bestChildren.Add(child);
            }

            Random random = new Random();

            return bestChildren[random.Next(bestChildren.Count)];
        }

        private double UCTValue(ulong parentGames, double c, double d)
        {
            if (Games == 0)
                return 0;

            return AvgScore + c * Math.Sqrt(Math.Log(parentGames) / Games);
            // + 0.5* Math.Sqrt((double)(SquareSum+d)/(double)Games - (double)AvgScore * (double)AvgScore);
        }

        private Node RemoveChild(Node child)
        {
            var index = Children.FindIndex(node => node == child);

            if (index == -1)
                return null;

            LegalMoves.RemoveAt(index);
            Children.RemoveAt(index);

            return child;
        }
    }
}
