using System;
using System.Collections.Generic;
using ForwardModel.Spells;

namespace ForwardModel.Games
{
    public class CodinGame: GameBase
    {
        public CodinGame() : base()
        {

        }

        public void ReadState()
        {
            string line;
            string[] inputs;

            var newDeliveries = new List<DeliverySpell>();
            var newTome = new List<TomeSpell>();
            var newPlayerSpells = new List<PlayerSpell>();
            var newOpponentSpells = new List<PlayerSpell>();
            Player player = null;

            int actionCount = int.Parse(Console.ReadLine()); // the number of spells and recipes in play

            for (int i = 0; i < actionCount; i++)
            {
                line = Console.ReadLine();
                Console.WriteLine(line);
                inputs = line.Split(' ');
                int actionId = int.Parse(inputs[0]); // the unique ID of this spell or recipe
                string actionType = inputs[1]; // in the first league: BREW; later: CAST, OPPONENT_CAST, LEARN, BREW
                int delta0 = int.Parse(inputs[2]); // tier-0 ingredient change
                int delta1 = int.Parse(inputs[3]); // tier-1 ingredient change
                int delta2 = int.Parse(inputs[4]); // tier-2 ingredient change
                int delta3 = int.Parse(inputs[5]); // tier-3 ingredient change
                int price = int.Parse(inputs[6]); // the price in rupees if this is a potion
                int tomeIndex = int.Parse(inputs[7]); // in the first two leagues: always 0; later: the index in the tome if this is a tome spell, equal to the read-ahead tax; For brews, this is the value of the current urgency bonus
                int taxCount = int.Parse(inputs[8]); // in the first two leagues: always 0; later: the amount of taxed tier-0 ingredients you gain from learning this spell; For brews, this is how many times you can still gain an urgency bonus
                bool castable = inputs[9] != "0"; // in the first league: always 0; later: 1 if this is a castable player spell
                bool repeatable = inputs[10] != "0"; // for the first two leagues: always 0; later: 1 if this is a repeatable player spell
            
                var recipe = new Recipe(delta0, delta1, delta2, delta3);
                
                if (actionType == "BREW")
                {
                    price -= tomeIndex;

                    if (tomeIndex == 3)
                        BigBonusLeft = taxCount;
                    else if (tomeIndex == 1)
                        SmallBonusLeft = taxCount;

                    DeliverySpell spell = new DeliverySpell(recipe, price);

                    spell.Id = actionId;

                    newDeliveries.Add(spell);

                    if (Deliveries.Find(spell => spell.Id == actionId) == null)
                    {
                        Deck.RemoveDeliverySpell(spell);
                    }
                }
                else if (actionType == "LEARN")
                {
                    TomeSpell spell = new TomeSpell(recipe);
                    spell.Id = actionId;
                    spell.Repeatable = repeatable;
                    spell.Stock = taxCount;

                    newTome.Add(spell);

                    if (Tome.Find(spell => spell.Id == actionId) == null)
                    {
                        Deck.RemoveTomeSpell(spell);
                    }
                }
                else if (actionType == "CAST" || actionType == "OPPONENT_CAST")
                {
                    player = Opponent;
                    var spells = newOpponentSpells;

                    if (actionType == "CAST")
                    {
                        player = Player;
                        spells = newPlayerSpells;
                    }
                    
                    PlayerSpell spell = new PlayerSpell(recipe, player, repeatable);
                    spell.Id = actionId;

                    spells.Add(spell);
                }
            }

            player = Player;

            for (int i = 0; i < 2; i++)
            {
                inputs = Console.ReadLine().Split(' ');
                int inv0 = int.Parse(inputs[0]); // tier-0 ingredients in inventory
                int inv1 = int.Parse(inputs[1]);
                int inv2 = int.Parse(inputs[2]);
                int inv3 = int.Parse(inputs[3]);
                int score = int.Parse(inputs[4]); // amount of rupees

                player.Inventory = new int[4] {inv0, inv1, inv2, inv3};
                player.Score = score;
            }

            Deliveries = newDeliveries;
            Tome = newTome;
            Player.Spells = newPlayerSpells;
            Opponent.Spells = newOpponentSpells;
        }
    }
}
