using System;
using System.Collections.Generic;
using ForwardModel.Actions;
using ForwardModel.Spells;

namespace ForwardModel.Games
{
    public abstract class Game : GameBase
    {
        HashSet<int> learntSpells;
        HashSet<int> brewedPotions;
        
        public Game(): base()
        {
            
        }

        public void PerformGameUpdate()
        {
            Turns++;
            learntSpells = new HashSet<int>();
            brewedPotions = new HashSet<int>();
            List<int> learnSpellsIndexes = new List<int>();

            foreach (Player player in  Players)
            {
                PlayerAction action = player.Action;

                if (action.IsRest())
                {
                    player.Rest();
                }
                else if (action.IsBrew())
                {
                    var brew = action as Brew;

                    int index = Deliveries.FindIndex(del => del == brew.Delivery);

                    int bonus = 0;

                    if (index == 0)
                        bonus = 3;
                    else if (index == 1)
                        bonus = 1;

                    brewedPotions.Add(index);

                    player.Brew(brew.Delivery, bonus);
                }
                else if (action.IsCast())
                {
                    var cast = action as Cast;

                    player.Cast(cast.Spell, cast.Count);
                }
                else if (action.IsLearn())
                {
                    var learn = action as Learn;

                    var index = learn.SpellIndex;

                    var spell = Tome[index];

                    if (index > 0)
                    {
                        if (player.Inventory[0] < index)
                        {
                            throw new Exception("LEARN Exception: Player can't pay tax");
                        }

                        player.Inventory[0] -= index;

                        for (int i=0; i<index; i++)
                        {
                            Tome[i].Stock++;
                        }
                    }

                    learntSpells.Add(index);

                    player.Learn(spell);
                }
            }

            foreach (var index in learntSpells)
            {
                Tome.RemoveAt(index);
                
                var spell = Deck.NextTomeSpell();

                if (spell != null)
                {
                    
                }
            }
        }
    }
}
