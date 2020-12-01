using System.Collections.Generic;
using ForwardModel.Spells;

namespace ForwardModel.Games
{
    public class GameBase
    {
        public Player Player { get; set; }
        public Player Opponent { get; set; }
        public List<Player> Players { get; set; }
        public Deck Deck { get; set; }
        public List<TomeSpell> Tome { get; set; }
        public List<DeliverySpell> Deliveries { get; set; }
        public int Turns { get; set; }
        public int BigBonusLeft { get; set; } = 4;
        public int smallBonusLeft { get; set; } = 4;
    }
}