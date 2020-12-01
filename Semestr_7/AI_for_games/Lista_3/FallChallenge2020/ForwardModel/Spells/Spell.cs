namespace ForwardModel.Spells
{
    public abstract class Spell
    {
        public Recipe Recipe { get; set; }
        public int Id { get; set; }

        public bool Equals(Spell other)
        {
            return Recipe.Equals(other.Recipe);
        }

        public Spell()
        {
            
        }

        public Spell(Spell other)
        {
            
        }
    }
}
