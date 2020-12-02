namespace ForwardModel.Spells
{
    public class DeliverySpell : Spell
    {
        public int Score { get; set; }

        public DeliverySpell(Recipe recipe, int score)
        {
            this.Recipe = new Recipe(recipe.Delta[0], recipe.Delta[1],
                recipe.Delta[2], recipe.Delta[3]);
            this.Score = score;
        }

        public bool Equals(DeliverySpell other)
        {
            return base.Equals(other) && Score == other.Score;
        }

    }
}
