namespace Wood2
{
    public class Order
    {
        public int ActionId { get; set; }
        public string ActionType { get; set; }
        public int[] Delta { get; set; } = new int[4];
        public int Price { get; set; }
        public int TomeIndex { get; set; }
        public int TaxCount { get; set; }
        public bool Castable { get; set; }
        public bool Repeatable { get; set; }

        public bool CanCreate(int[] inventory)
        {
            for (int i=0; i<4; i++)
            {
                if (inventory[i] < - Delta[i])
                    return false;
            }

            return true;
        }
    }
}
