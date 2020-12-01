using ForwardModel.Spells;

namespace ForwardModel.Actions
{
    public class Learn : PlayerAction
    {
        // public TomeSpell Spell { get; set; }

        public int SpellIndex { get; set; }

        public override bool IsLearn()
        {
            return true;
        }
    }
}
