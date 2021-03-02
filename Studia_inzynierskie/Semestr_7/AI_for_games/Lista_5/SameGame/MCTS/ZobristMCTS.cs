using Engine;
using Hashing;
using Simulations;

namespace MCTS
{
    public class ZobristMCTS : SPMCTS
    {
        public HashTable Table { get; set; }

        public ZobristMCTS(GameState game, Simulation simulation, double c, double d) : base(game, simulation, c, d)
        {
        }

        protected override Node TreePolicy(Node node)
        {
            while (!node.GameState.Terminal)
            {
                while (!node.FullyExpanded)
                {
                    var child = Expand(node);

                    if (child != null)
                    {
                        return child;
                    }
                }

                node = BestChild(node);
            }

            return node;
        }

        protected override Node Expand(Node node)
        {
            
            return node.ZobristExpand(Table);
            // Node child = new Node(GameState, nextAction, this);

            // Children.Add(child);

            // return child;
        }
    }
}
