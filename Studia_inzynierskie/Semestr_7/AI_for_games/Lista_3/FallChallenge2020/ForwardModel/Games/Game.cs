using System;
using System.Collections.Generic;
using System.Linq;
using ForwardModel.Actions;
using ForwardModel.Spells;

namespace ForwardModel.Games
{
    public abstract class Game : GameBase
    {
        HashSet<int> learntSpells;
        HashSet<int> brewedPotions;
        List<int> bonuses;
        List<ActionsInfo> history;
        private readonly bool refill;

        public Game(bool refill = true) : base()
        {
            history = new List<ActionsInfo>();
            this.refill = refill;
            if (refill)
                RefillSpells();
        }

        public void PerformGameUpdate()
        {
            Turns++;
            learntSpells = new HashSet<int>();
            brewedPotions = new HashSet<int>();
            bonuses = new List<int>();

            history.Add(new ActionsInfo(Player.Action, Opponent.Action));

            foreach (Player player in Players)
            {
                PlayerAction action = player.Action;

                if (action == null)
                    continue;

                if (action.IsRest())
                {
                    player.Rest();
                }
                else if (action.IsBrew())
                {
                    var brew = action as Brew;

                    int index = brew.DeliveryIndex;

                    brew.Bonus = CalculateBonus(brew);

                    bonuses.Add(brew.Bonus);

                    brewedPotions.Add(index);

                    player.Brew(brew.Delivery, brew.Bonus);
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

                        for (int i = 0; i < index; i++)
                        {
                            Tome[i].Stock++;
                        }
                    }

                    learntSpells.Add(index);

                    player.Learn(spell);
                }
            }

            UpdateBonuses();
            RemoveUsedSpells();

            if (refill)
                RefillSpells();
        }

        public void UndoLastActions()
        {
            if (history.Count == 0)
            {
                throw new Exception("No actions to Undo");
            }

            learntSpells = new HashSet<int>();
            brewedPotions = new HashSet<int>();
            bonuses = new List<int>();

            ActionsInfo actions = history[history.Count-1];

            history.RemoveAt(history.Count - 1);

            var pairs = new List<(Player, PlayerAction)>
                {(Player, actions.PlayerAction),
                 (Opponent, actions.OpponentAction)};

            foreach (var (player, action) in pairs)
            {
                if (action == null)
                    continue;

                if (action.IsRest())
                {
                    player.UndoRest(action as Rest);
                }
                else if (action.IsBrew())
                {
                    var brew = action as Brew;

                    int index = brew.DeliveryIndex;

                    int bonus = brew.Bonus;

                    bonuses.Add(bonus);

                    brewedPotions.Add(index);

                    player.UndoBrew(brew);
                }
                else if (action.IsCast())
                {
                    player.UndoCast(action as Cast);
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

                        for (int i = 0; i < index; i++)
                        {
                            Tome[i].Stock++;
                        }
                    }

                    learntSpells.Add(index);

                    player.Learn(spell);
                }
            }
        }

        private int CalculateBonus(Brew brew)
        {
            if (brew.DeliveryIndex == 0)
            {
                if (BigBonusLeft > 0)
                {
                    return 3;
                }
                else if (SmallBonusLeft > 0)
                {
                    return 1;
                }
            }
            else if (brew.DeliveryIndex == 1)
            {
                if (BigBonusLeft > 0 && SmallBonusLeft > 0)
                {
                    return 1;
                }
            }

            return 0;
        }

        private void UpdateBonuses()
        {
            foreach (int bonus in bonuses)
            {
                if (bonus == 3)
                {
                    BigBonusLeft--;
                }
                else if (bonus == 1)
                {
                    SmallBonusLeft--;
                }
            }

            BigBonusLeft = Math.Max(BigBonusLeft, 0);
            SmallBonusLeft = Math.Max(SmallBonusLeft, 0);
        }

        private void RemoveUsedSpells()
        {

            var lSpells = learntSpells.OrderByDescending(x => x).ToList();

            foreach (int index in lSpells)
            {
                Tome.RemoveAt(index);
            }


            var bPotions = brewedPotions.OrderByDescending(x => x).ToList();

            foreach (int index in brewedPotions)
            {
                Deliveries.RemoveAt(index);
            }
        }

        private void RefillSpells()
        {
            while (Tome.Count < 6)
            {
                var spell = Deck.NextTomeSpell();

                if (spell == null)
                    break;

                Tome.Add(spell);
            }

            while (Deliveries.Count < 6)
            {
                var spell = Deck.NextDeliverySpell();

                if (spell == null)
                    break;

                Deliveries.Add(spell);
            }
        }
    }
}
