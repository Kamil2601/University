using ForwardModel.Spells;

namespace ForwardModel.Actions
{
    public class Cast : PlayerAction
    {
        public PlayerSpell Spell { get; set; }
        public int Count { get; set; } = 1;

        public override bool IsCast()
        {
            return true;
        }

        public override string CodingameString()
        {
            if (Spell.Repeatable)
                return $"CAST {Spell.Id} {Count}";

            return $"CAST {Spell.Id}";
        }

        public override string ToString()
        {
            if (Spell.Repeatable)
                return $"CAST {Spell.ToString()} {Count}";

            return $"CAST {Spell.ToString()}";
        }
    }
}
