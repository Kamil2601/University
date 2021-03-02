using System;

namespace Greedy.Models
{
    public class Potion: GameAction
    {
        public override string ActionType { get => "BREW"; }
        public int[] Delta { get; set; } = new int[4];
        public int Price { get; set; }
        // public int TomeIndex { get; set; }
        // public int TaxCount { get; set; }

        public void Print()
        {
            string delta = $"[{Delta[0]}, {Delta[1]}, {Delta[2]}, {Delta[3]}]";

            Console.Error.WriteLine($"{ActionId}: {Price} {delta}");
        }
    }
}
