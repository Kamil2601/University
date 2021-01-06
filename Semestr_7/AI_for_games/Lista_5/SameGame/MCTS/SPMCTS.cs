using System;
using Engine;
using Simulations;

namespace MCTS
{
    public class SPMCTS
    {
        public Node Root { get; set; }
        public Simulation Simulation { get; set; }
        public double C { get; set; }
        public double D { get; set; }


        // Main method - compute best move for gamestate from root
        public GameAction ComputeBestMove(TimeSpan time)
        {
            var start = DateTime.Now;

            while ((DateTime.Now - start) < time)
            {
                Iteration();
            }

            return BestMove();
        }

        private GameAction BestMove()
        {
            var child = Root.ChildWithBestScore();

            Root = child;
            
            var move = child.LastMove;

            return move;
        }

        private void Iteration()
        {
            Node leaf = TreePolicy(Root);
            int result = Rollout(leaf);
            Backpropagate(leaf, result);
        }

        private void Backpropagate(Node node, int result)
        {
            if (node == Root)
                return;

            Update(node, result);
            Backpropagate(node.Parent, result);
        }

        private void Update(Node node, int result)
        {
            node.Update(result);
        }

        private int Rollout(Node leaf)
        {
            var game = leaf.GameState.Copy();
            Simulation.GameState = game;
            return Simulation.Simulate();
        }

        private Node TreePolicy(Node node)
        {
            while (!node.IsLeaf)
            {
                if (!node.FullyExpanded)
                    return Expand(node);
                else
                    node = BestChild(node);
            }

            return node;
        }

        private Node Expand(Node node)
        {
            return node.Expand();
        }

        private Node BestChild(Node node)
        {
            return node.BestChild(C, D);
        }
    }
}
