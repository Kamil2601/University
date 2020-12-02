using System;
using System.Collections.Generic;
using System.Linq;
using ForwardModel.Spells;

namespace ForwardModel
{
    public class Deck
    {
        public List<TomeSpell> tome = new List<TomeSpell>();
        public List<DeliverySpell> deliveries = new List<DeliverySpell>();
        private Random random = new Random();

        public Deck()
        {
            tome.Add(new TomeSpell(new Recipe(-3, 0, 0, 1)));
            tome.Add(new TomeSpell(new Recipe(3, -1, 0, 0)));
            tome.Add(new TomeSpell(new Recipe(1, 1, 0, 0)));
            tome.Add(new TomeSpell(new Recipe(0, 0, 1, 0)));
            tome.Add(new TomeSpell(new Recipe(3, 0, 0, 0)));
            tome.Add(new TomeSpell(new Recipe(2, 3, -2, 0)));
            tome.Add(new TomeSpell(new Recipe(2, 1, -2, 1)));
            tome.Add(new TomeSpell(new Recipe(3, 0, 1, -1)));
            tome.Add(new TomeSpell(new Recipe(3, -2, 1, 0)));
            tome.Add(new TomeSpell(new Recipe(2, -3, 2, 0)));
            tome.Add(new TomeSpell(new Recipe(2, 2, 0, -1)));
            tome.Add(new TomeSpell(new Recipe(-4, 0, 2, 0)));
            tome.Add(new TomeSpell(new Recipe(2, 1, 0, 0)));
            tome.Add(new TomeSpell(new Recipe(4, 0, 0, 0)));
            tome.Add(new TomeSpell(new Recipe(0, 0, 0, 1)));
            tome.Add(new TomeSpell(new Recipe(0, 2, 0, 0)));
            tome.Add(new TomeSpell(new Recipe(1, 0, 1, 0)));
            tome.Add(new TomeSpell(new Recipe(-2, 0, 1, 0)));
            tome.Add(new TomeSpell(new Recipe(-1, -1, 0, 1)));
            tome.Add(new TomeSpell(new Recipe(0, 2, -1, 0)));
            tome.Add(new TomeSpell(new Recipe(2, -2, 0, 1)));
            tome.Add(new TomeSpell(new Recipe(-3, 1, 1, 0)));
            tome.Add(new TomeSpell(new Recipe(0, 2, -2, 1)));
            tome.Add(new TomeSpell(new Recipe(1, -3, 1, 1)));
            tome.Add(new TomeSpell(new Recipe(0, 3, 0, -1)));
            tome.Add(new TomeSpell(new Recipe(0, -3, 0, 2)));
            tome.Add(new TomeSpell(new Recipe(1, 1, 1, -1)));
            tome.Add(new TomeSpell(new Recipe(1, 2, -1, 0)));
            tome.Add(new TomeSpell(new Recipe(4, 1, -1, 0)));
            tome.Add(new TomeSpell(new Recipe(-5, 0, 0, 2)));
            tome.Add(new TomeSpell(new Recipe(-4, 0, 1, 1)));
            tome.Add(new TomeSpell(new Recipe(0, 3, 2, -2)));
            tome.Add(new TomeSpell(new Recipe(1, 1, 3, -2)));
            tome.Add(new TomeSpell(new Recipe(-5, 0, 3, 0)));
            tome.Add(new TomeSpell(new Recipe(-2, 0, -1, 2)));
            tome.Add(new TomeSpell(new Recipe(0, 0, -3, 3)));
            tome.Add(new TomeSpell(new Recipe(0, -3, 3, 0)));
            tome.Add(new TomeSpell(new Recipe(-3, 3, 0, 0)));
            tome.Add(new TomeSpell(new Recipe(-2, 2, 0, 0)));
            tome.Add(new TomeSpell(new Recipe(0, 0, -2, 2)));
            tome.Add(new TomeSpell(new Recipe(0, -2, 2, 0)));
            tome.Add(new TomeSpell(new Recipe(0, 0, 2, -1)));

            deliveries.Add(new DeliverySpell(new Recipe(-2, -2, -0, -0), 6));
            deliveries.Add(new DeliverySpell(new Recipe(-3, -2, -0, -0), 7));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -4, -0, -0), 8));
            deliveries.Add(new DeliverySpell(new Recipe(-2, -0, -2, -0), 8));
            deliveries.Add(new DeliverySpell(new Recipe(-2, -3, -0, -0), 8));
            deliveries.Add(new DeliverySpell(new Recipe(-3, -0, -2, -0), 9));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -2, -2, -0), 10));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -5, -0, -0), 10));
            deliveries.Add(new DeliverySpell(new Recipe(-2, -0, -0, -2), 10));
            deliveries.Add(new DeliverySpell(new Recipe(-2, -0, -3, -0), 11));
            deliveries.Add(new DeliverySpell(new Recipe(-3, -0, -0, -2), 11));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -0, -4, -0), 12));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -2, -0, -2), 12));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -3, -2, -0), 12));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -2, -3, -0), 13));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -0, -2, -2), 14));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -3, -0, -2), 14));
            deliveries.Add(new DeliverySpell(new Recipe(-2, -0, -0, -3), 14));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -0, -5, -0), 15));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -0, -0, -4), 16));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -2, -0, -3), 16));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -0, -3, -2), 17));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -0, -2, -3), 18));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -0, -0, -5), 20));
            deliveries.Add(new DeliverySpell(new Recipe(-2, -1, -0, -1), 9));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -2, -1, -1), 12));
            deliveries.Add(new DeliverySpell(new Recipe(-1, -0, -2, -1), 12));
            deliveries.Add(new DeliverySpell(new Recipe(-2, -2, -2, -0), 13));
            deliveries.Add(new DeliverySpell(new Recipe(-2, -2, -0, -2), 15));
            deliveries.Add(new DeliverySpell(new Recipe(-2, -0, -2, -2), 17));
            deliveries.Add(new DeliverySpell(new Recipe(-0, -2, -2, -2), 19));
            deliveries.Add(new DeliverySpell(new Recipe(-1, -1, -1, -1), 12));
            deliveries.Add(new DeliverySpell(new Recipe(-3, -1, -1, -1), 14));
            deliveries.Add(new DeliverySpell(new Recipe(-1, -3, -1, -1), 16));
            deliveries.Add(new DeliverySpell(new Recipe(-1, -1, -3, -1), 18));
            deliveries.Add(new DeliverySpell(new Recipe(-1, -1, -1, -3), 20));
        }

        public TomeSpell NextTomeSpell()
        {
            if (!tome.Any())
                return null;

            var index = random.Next(tome.Count);
            var result = tome[index];

            tome.RemoveAt(index);

            return result;
        }

        public DeliverySpell NextDeliverySpell()
        {
            if (!deliveries.Any())
                return null;

            var index = random.Next(deliveries.Count);
            var result = deliveries[index];

            deliveries.RemoveAt(index);

            return result;
        }

        public TomeSpell RemoveTomeSpell(TomeSpell spell)
        {
            var result = tome.Find(s => spell.Recipe.Equals(s.Recipe));

            tome.Remove(result);

            return result;
        }

        public DeliverySpell RemoveDeliverySpell(DeliverySpell spell)
        {
            var result = deliveries.Find(s => spell.Recipe.Equals(s.Recipe));

            deliveries.Remove(result);

            return result;
        }

        public bool HasTomeSpell()
        {
            return tome.Any();
        }

        public bool HasDeliverySpell()
        {
            return deliveries.Any();
        }
    }
}
