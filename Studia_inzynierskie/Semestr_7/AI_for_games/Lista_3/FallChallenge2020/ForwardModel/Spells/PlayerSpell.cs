using System.Linq;

namespace ForwardModel.Spells
{
    public class PlayerSpell : Spell
    {
        public bool Active { get; set; }
        public bool Repeatable { get; set; }
        public Player Owner { get; set; }

        public PlayerSpell(Recipe recipe, Player owner, bool repeatable)
        {
            this.Recipe = recipe;
            this.Active = true;
            this.Owner = owner;
            this.Repeatable = repeatable;
        }

        public PlayerSpell(Recipe recipe, Player owner) : this(recipe, owner, false)
        { }

        public PlayerSpell(TomeSpell learnt, Player owner) :
            this(new Recipe(learnt.Recipe), owner, learnt.Repeatable)
        { }

        public PlayerSpell(PlayerSpell other): base(other)
        {

            this.Active = other.Active;
            this.Repeatable = other.Repeatable;
        }

        public bool CanCast()
        {
            if (!Active)
                return false;

            for (int i=0; i<4; i++)
            {
                if (Owner.Inventory[i] < - Recipe.Delta[i])
                    return false;
            }

            return Owner.Inventory.Sum() + Recipe.Delta.Sum() <= 10;
        }

        public override string ToString()
        {
            return $"({Recipe.ToString()})";
        }
    }

}
