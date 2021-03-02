using System;
using System.Collections.Generic;
using ForwardModel.Actions;
using ForwardModel.Spells;

namespace ForwardModel.Games
{
    public abstract class GameBase
    {
        public Player Player { get; set; }
        public Player Opponent { get; set; }
        public List<Player> Players { get; set; }
        public Deck Deck { get; set; }
        public List<TomeSpell> Tome { get; set; }
        public List<DeliverySpell> Deliveries { get; set; }
        public int Turns { get; set; }
        public int BigBonusLeft { get; set; } = 4;
        public int SmallBonusLeft { get; set; } = 4;

        public GameBase()
        {
            Player = new Player();
            Opponent = new Player();
            Players = new List<Player>() { Player, Opponent };
            Deck = new Deck();
            Tome = new List<TomeSpell>();
            Deliveries = new List<DeliverySpell>();
            Turns = 0;
            Player.Name = "Player";
            Opponent.Name = "Opponent";
        }

        public GameBase(GameBase source)
        {
            Player = new Player(source.Player);
            Opponent = new Player(source.Player);
            Players = new List<Player>() { Player, Opponent };
            Deck = new Deck(source.Deck);
            Tome = new List<TomeSpell>(source.Tome);
            Deliveries = new List<DeliverySpell>(source.Deliveries);
            Turns = source.Turns;
            Player.Name = source.Player.Name;
            Opponent.Name = source.Opponent.Name;
        }

        public List<Brew> LegalBrews(Player player)
        {
            var result = new List<Brew>();

            for (int i = 0; i < Deliveries.Count; i++)
            {
                DeliverySpell delivery = Deliveries[i];
                
                if (player.CanBrew(delivery))
                {
                    var action = new Brew()
                    {
                        Delivery = delivery,
                        DeliveryIndex = i
                    };

                    result.Add(action);
                }
            }

            return result;
        }

        public List<Learn> LegalLearns(Player player)
        {
            var result = new List<Learn>();

            for (int i = 0; i < Tome.Count; i++)
            {
                TomeSpell spell = Tome[i];

                if (player.Inventory[0] >= i)
                {
                    var learn = new Learn()
                    {
                        Spell = spell,
                        SpellIndex = i
                    };

                    result.Add(learn);
                }
            }

            return result;
        }


        public List<Cast> LegalCasts(Player player)
        {
            var result = new List<Cast>();

            foreach (var spell in player.Spells)
            {
                var castsCount = player.PossibleCasts(spell);

                for (int i=1; i<=castsCount; i++)
                {
                    var cast = new Cast()
                    {
                        Spell = spell,
                        Count = i
                    };

                    result.Add(cast);
                }
            }

            return result;
        }

        public List<PlayerAction> LegalActions(Player player)
        {
            var result = new List<PlayerAction>();

            result.AddRange(LegalLearns(player));
            result.AddRange(LegalBrews(player));
            result.AddRange(LegalCasts(player));
            result.Add(new Rest(player));

            return result;
        }

        public bool GameOver()
        {
            return Turns >= 100 || Player.BrewedPotions >= 6 || Opponent.BrewedPotions >= 6;
        }

        public int Result()
        {
            if (!GameOver())
                return -1;

            if (Player.Points() > Opponent.Points())
                return 0;
            if (Player.Points() < Opponent.Points())
                return 1;

            return 2;
        }
    }
}
