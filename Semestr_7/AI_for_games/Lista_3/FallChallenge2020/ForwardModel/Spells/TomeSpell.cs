using System.Linq;

namespace ForwardModel.Spells
{
    public class TomeSpell : Spell
    {
        public int Stock { get; set; }
        public bool Repeatable { get; set; }

        public TomeSpell(Recipe recipe): base()
        {
            Stock = 0;
            this.Recipe = recipe;
            Repeatable = recipe.Delta.Any(x => x < 0);
        }

        public bool Equals(TomeSpell other)
        {
            return base.Equals(other);
        }

        public override string ToString()
        {
            return $"({Recipe.ToString()})";
        }
    }
}
