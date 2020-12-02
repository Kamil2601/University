using System;

namespace Greedy.Models
{
    public class Spell: GameAction
    {
        public override string ActionType { get => "CAST"; }
        public int[] Delta { get; set; } = new int[4];
        public bool IsCastable { get; set; }

        public void Print()
        {
            string delta = $"[{Delta[0]}, {Delta[1]}, {Delta[2]}, {Delta[3]}]";

            Console.Error.WriteLine($"{ActionId}: {IsCastable} {delta}");
        }
    }
}
