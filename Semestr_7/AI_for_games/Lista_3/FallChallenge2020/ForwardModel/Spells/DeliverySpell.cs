namespace ForwardModel.Spells
{
    public class DeliverySpell : Spell
    {
        public int Score { get; set; }

        public DeliverySpell(Recipe need, int score)
        {
            this.Recipe = new Recipe(-need.Delta[0], -need.Delta[1],
                -need.Delta[2], -need.Delta[3]);
            this.Score = score;
        }

        public bool Equals(DeliverySpell other)
        {
            return base.Equals(other) && Score == other.Score;
        }

    }
}
