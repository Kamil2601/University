using ForwardModel.Spells;

namespace ForwardModel.Actions
{
    public class Brew : PlayerAction
    {
        public DeliverySpell Delivery { get; set; }
        public int DeliveryIndex { get; set; }

        public override bool IsBrew()
        {
            return true;
        }

        public override string CodingameString()
        {
            return $"BREW {Delivery.Id}";
        }

        public override string ToString()
        {
            return $"BREW {Delivery.ToString()}";
        }
    }
}
