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
    }
}
