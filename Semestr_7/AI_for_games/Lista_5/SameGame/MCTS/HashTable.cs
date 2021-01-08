using System.Collections.Generic;
using Engine;

namespace MCTS
{
    public class HashTable
    {
        public Dictionary<uint, List<Node>> Nodes { get; set; } = new Dictionary<uint, List<Node>>();

        public Node Get(GameState gameState)
        {
            if (!Nodes.ContainsKey(gameState.Hash))
                return null;

            var nodesWithHash = Nodes[gameState.Hash];

            foreach (var node in nodesWithHash)
            {
                if (node.GameState.ToString() == gameState.ToString())
                    return node;
            }

            return null;
        }

        public void Add(Node node)
        {
            var key = node.GameState.Hash;

            if (Nodes.ContainsKey(key))
            {
                Nodes[key].Add(node);
                return;
            }
                
            Nodes.Add(key, new List<Node>() {node});
        }
    }
}
