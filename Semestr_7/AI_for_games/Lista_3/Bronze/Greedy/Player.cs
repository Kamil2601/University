using System;
using System.Collections.Generic;
using System.Linq;
using Greedy.Models;

namespace Greedy
{
    // This agent was enough to reach bronze league
    // BREW best possible potion
    // If not possible - CAST random spell
    // If not possible - WAIT
    public class Player
    {
        public int[] Inventory { get; set; } = new int[4];
        public List<Potion> Potions { get; set; }
        public List<Spell> Spells { get; set; }
        readonly Wait wait = new Wait();
        private readonly bool opponent;
        public int Score { get; set; }
        Random random = new Random();
        int goalId = -1;

        public Player(bool opponent = false)
        {
            this.opponent = opponent;
        }

        public void Reset()
        {
            Inventory = new int[4] { 0, 0, 0, 0 };
            Potions = new List<Potion>();
            Spells = new List<Spell>();
        }

        public GameAction BestMove()
        {
            var bestPotion = Potions.Where(potion => CanBrew(potion))
                    .OrderByDescending(potion => potion.Price)
                    .FirstOrDefault();

            if (bestPotion != null)
                return bestPotion;

            // foreach (var spell in Spells)
            // {
            //     spell.Print();
            // }

            foreach (var potion in Potions)
            {
                potion.Print();
            }

            var possibleSpells = Spells.Where(spell => CanCast(spell)).ToList();

            if (possibleSpells.Any())
            {
                return possibleSpells[random.Next(possibleSpells.Count)];
            }

            return wait;
        }

        public bool CanBrew(Potion potion)
        {
            for (int i = 0; i < 4; i++)
            {
                if (Inventory[i] + potion.Delta[i] < 0)
                    return false;
            }

            return true;
        }

        public bool CanCast(Spell spell)
        {
            int count = 0;
            for (int i = 0; i < 4; i++)
            {
                var newCounti = Inventory[i] + spell.Delta[i];
                if (newCounti < 0)
                    return false;

                count += newCounti;
            }

            return spell.IsCastable && count <= 10;
        }

        public void ReadAction(string data)
        {
            string[] inputs;
            int[] delta = new int[4];

            inputs = data.Split(' ');
            int actionId = int.Parse(inputs[0]); // the unique ID of this spell or recipe
            string actionType = inputs[1]; // in the first league: BREW; later: CAST, OPPONENT_CAST, LEARN, BREW
            delta[0] = int.Parse(inputs[2]); // tier-0 ingredient change
            delta[1] = int.Parse(inputs[3]); // tier-1 ingredient change
            delta[2] = int.Parse(inputs[4]); // tier-2 ingredient change
            delta[3] = int.Parse(inputs[5]); // tier-3 ingredient change
            int price = int.Parse(inputs[6]); // the price in rupees if this is a potion
            int tomeIndex = int.Parse(inputs[7]); // in the first two leagues: always 0; later: the index in the tome if this is a tome spell, equal to the read-ahead tax; For brews, this is the value of the current urgency bonus
            int taxCount = int.Parse(inputs[8]); // in the first two leagues: always 0; later: the amount of taxed tier-0 ingredients you gain from learning this spell; For brews, this is how many times you can still gain an urgency bonus
            bool castable = inputs[9] != "0"; // in the first league: always 0; later: 1 if this is a castable player spell
            bool repeatable = inputs[10] != "0"; // for the first two leagues: always 0; later: 1 if this is a repeatable player spell
        
            // Console.Error.WriteLine($"{actionType}, {actionType.Length} {actionType == "BREW"}");
            
            if (actionType.Equals("BREW"))
            {
                Potion potion = new Potion
                {
                    ActionId = actionId,
                    Delta = delta,
                    Price = price
                };

                Potions.Add(potion);
            }
            else if (actionType == "CAST" && !opponent ||
                actionType == "OPPONENT_CAST" && opponent)
            {
                Spell spell = new Spell
                {
                    ActionId = actionId,
                    Delta = delta,
                    IsCastable = castable
                };

                Spells.Add(spell);
            }
        }

        public void ReadInventory()
        {
            string[] inputs;

            int[] inv = new int[4];

            inputs = Console.ReadLine().Split(' ');
            Inventory[0] = int.Parse(inputs[0]); // tier-0 ingredients in inventory
            Inventory[1] = int.Parse(inputs[1]);
            Inventory[2] = int.Parse(inputs[2]);
            Inventory[3] = int.Parse(inputs[3]);
            Score = int.Parse(inputs[4]); // amount of rupees
        }
    }
}
