using System.Collections.Generic;
using System.Linq;
using ForwardModel.Spells;

namespace ForwardModel.Actions
{
    public class Rest : PlayerAction
    {
        public List<PlayerSpell> RefreshedSpells { get; set; }
        public Rest()
        {
            
        }

        public Rest(Player player)
        {
            RefreshedSpells = player.Spells.Where(s => !s.Active).ToList();
        }
        public override bool IsRest()
        {
            return true;
        }

        public override string CodingameString()
        {
            return "REST";
        }
    }
}
