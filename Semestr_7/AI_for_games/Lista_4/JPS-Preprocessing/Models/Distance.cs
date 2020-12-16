using Models;

namespace JPS.Models
{
    public class Distance
    {
        public int West { get; set; }
        public int East { get; set; }
        public int North { get; set; }
        public int South { get; set; }
        public int NorthWest { get; set; }
        public int NorthEast { get; set; }
        public int SouthWest { get; set; }
        public int SouthEast { get; set; }

        public int Value(Direction direction)
        {
            switch (direction)
            {
                case Direction.East: return East;
                case Direction.West: return West;
                case Direction.North: return North;
                case Direction.South: return South;
                case Direction.NorthWest: return NorthWest;
                case Direction.NorthEast: return NorthEast;
                case Direction.SouthEast: return SouthEast;
                default: return SouthWest;
            }
        }

        public override string ToString()
        {
            return $"{North} {NorthEast} {East} {SouthEast} {South} {SouthWest} {West} {NorthWest}";
        }
    }
}
