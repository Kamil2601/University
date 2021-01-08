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

        public SPMCTS(GameState game, Simulation simulation, double c, double d)
        {
            Root = new Node(game);
            Simulation = simulation;
            C = c;
            D = d;
        }

        public GameAction FindBestMove(TimeSpan time)
        {
            var bestChild = Next(time);
            Root = bestChild;
            return Root.LastMove;
        }

        public Node Next(TimeSpan time)
        {
            var start = DateTime.Now;

            while ((DateTime.Now - start) < time)
            {
                Iteration();
            }

            return BestChild();
        }

        public Node BestChild()
        {
            return Root.BestChildAvg();
        }

        public GameAction BestMove()
        {
            return BestChild().LastMove;
        }

        private void Iteration()
        {
            Node leaf = TreePolicy(Root);
            ulong result = Rollout(leaf);
            Backpropagate(leaf, result);
        }

        private void Backpropagate(Node node, ulong result)
        {
            Update(node, result);
            
            if (node == Root)
                return;

            Backpropagate(node.Parent, result);
        }

        private void Update(Node node, ulong result)
        {
            node.Update(result);
        }

        private ulong Rollout(Node leaf)
        {
            var game = leaf.GameState.Copy();
            Simulation.GameState = game;
            return (ulong)Simulation.Simulate();
        }

        protected virtual Node TreePolicy(Node node)
        {
            while (node.FullyExpanded && !node.GameState.Terminal)
            {
                node = BestChild(node);
            }

            if (node.GameState.Terminal)
                return node;

            return Expand(node);
        }

        protected virtual Node Expand(Node node)
        {
            return node.Expand();
        }

        protected Node BestChild(Node node)
        {
            return node.BestChildUCT(C, D);
        }
    }
}
