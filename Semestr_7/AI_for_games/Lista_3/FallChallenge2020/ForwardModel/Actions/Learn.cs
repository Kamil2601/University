using ForwardModel.Spells;

namespace ForwardModel.Actions
{
    public class Learn : PlayerAction
    {
        public TomeSpell Spell { get; set; }
        public int SpellIndex { get; set; }

        public override bool IsLearn()
        {
            return true;
        }

        public override string CodingameString()
        {
            return $"LEARN {Spell.Id}";
        }

        public override string ToString()
        {
            return $"LEARN {Spell.ToString()}";
        }
    }
}
