using System;
using System.Collections.Generic;
using System.Linq;
using ForwardModel.Actions;
using ForwardModel.Spells;

namespace ForwardModel
{
    public class Player
    {
        public int[] Inventory { get; set; } = new int[4];
        public List<PlayerSpell> Spells { get; set; }
        public PlayerAction Action { get; set; }
        public int Score { get; set; }
        public string Name { get; set; } = "";
        public int BrewedPotions { get; set; }

        public Player()
        {
            Inventory = new int[4] {3, 0, 0, 0};
            Spells = new List<PlayerSpell>();
            Score = 0;
            BrewedPotions = 0;

            Spells.Add(new PlayerSpell(new Recipe(2, 0, 0, 0), this));
            Spells.Add(new PlayerSpell(new Recipe(-1, 1, 0, 0), this));
            Spells.Add(new PlayerSpell(new Recipe(0, -1, 1, 0), this));
            Spells.Add(new PlayerSpell(new Recipe(0, 0, -1, 1), this));
        }

        public Player(Player other)
        {
            Inventory = new int[4];

            for (int i=0; i<4; i++)
            {
                Inventory[i] = other.Inventory[i];
            }
        }

        public void Rest()
        {
            foreach (var spell in Spells)
            {
                spell.Active = true;
            }
        }

        public void Cast(PlayerSpell spell, int times = 1)
        {
            if (spell.Owner != this)
            {
                throw new Exception($"{Name}: Spell does not belong to this player!");
            }
            if (!spell.Active)
            {
                throw new Exception($"{Name}: Spell is not active!");
            }

            if (times > 1 && !spell.Repeatable)
            {
                throw new Exception($"{Name}: Spell isn't repeatable!");
            }

            for (int i=0; i<4; i++)
            {
                Inventory[i] += spell.Recipe.Delta[i] * times;

                if (Inventory[i] < 0)
                {
                    throw new Exception($"{Name}: tier-{i} ingredient is below 0 after spell cast!");
                }
            }
        }

        public void Brew(DeliverySpell spell, int bonus = 0)
        {
            for (int i=0; i<4; i++)
            {
                Inventory[i] += spell.Recipe.Delta[i];

                if (Inventory[i] < 0)
                {
                    throw new Exception($"{Name}: tier-{i} ingredient is below 0 after brew!");
                }
            }

            Score += spell.Score + bonus;
            BrewedPotions += 1;
        }

        public void Learn(TomeSpell spell)
        {
            var playerSpell = new PlayerSpell(spell, this);

            Spells.Add(playerSpell);

            Inventory[0] += spell.Stock;

            var ingredientsCount = Inventory.Sum();

            if (ingredientsCount > 10)
            {
                Inventory[0] -= (ingredientsCount - 10);
            }
        }

        public bool CanBrew(DeliverySpell spell)
        {
            for (int i=0; i<4; i++)
            {
                if (Inventory[i] + spell.Recipe.Delta[i] < 0)
                {
                    return false;
                }
            }

            return true;
        }

        public int PossibleCasts(PlayerSpell spell)
        {
            if (spell.Owner != this || !spell.Active)
                return 0;

            if (!spell.Repeatable)
            {
                var inv = new int[4] {Inventory[0], Inventory[1], Inventory[2], Inventory[3]};

                for (int i=0; i<4; i++)
                {
                    inv[i] += spell.Recipe.Delta[i];

                    if (inv[i] < 0)
                        return 0;
                }

                if (inv.Sum() > 10)
                {
                    return 0;
                }

                return 1;
            }
            else
            {
                var inv = new int[4] {Inventory[0], Inventory[1], Inventory[2], Inventory[3]};

                for (int count=0; ; count++)
                {
                    for (int i=0; i<4; i++)
                    {
                        inv[i] += spell.Recipe.Delta[i];

                        if (inv[i] < 0)
                            return count;
                    }

                    if (inv.Sum() > 10)
                    {
                        return count;
                    }
                }
            }    
        }

        public int Points()
        {
            return Score + Inventory.Sum() - Inventory[0];
        }

        Player Copy() {
            return new Player(this);
        }
    }
}
