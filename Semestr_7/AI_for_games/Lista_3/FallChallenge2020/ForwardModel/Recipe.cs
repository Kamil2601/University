namespace ForwardModel
{
    public class Recipe
    {
        public int[] Delta { get; set; } 

        // public static string[] CHARS = new string[] { "A", "B", "C", "D" };

        public Recipe(int a, int b, int c, int d)
        {
            this.Delta = new int[] { a, b, c, d };
        }

        public Recipe()
        {
            this.Delta = new int[] { 0, 0, 0, 0 };
        }

        public Recipe(Recipe other): this(other.Delta[0], other.Delta[1], other.Delta[2], other.Delta[3])
        { }

        public bool Equals(Recipe other)
        {
            for (int i=0; i<4; i++)
            {
                if (this.Delta[i] != other.Delta[i])
                    return false;
            }

            return true;
        }
    }
}
