using System.Collections.Generic;
using Models;

namespace Algorithm
{
    public static class Directions
    {
        static readonly Dictionary<Direction, List<Direction>> directions =
            new Dictionary<Direction, List<Direction>>
            {
                {Direction.South, new List<Direction> {Direction.West, Direction.SouthWest, Direction.South, Direction.SouthEast, Direction.East}},
                {Direction.SouthEast, new List<Direction> {Direction.South, Direction.SouthEast, Direction.East}},
                {Direction.East, new List<Direction> {Direction.South, Direction.SouthEast, Direction.East, Direction.NorthEast, Direction.North}},
                {Direction.NorthEast, new List<Direction> { Direction.East, Direction.NorthEast, Direction.North}},
                {Direction.North, new List<Direction> { Direction.East, Direction.NorthEast, Direction.North, Direction.NorthWest, Direction.West}},
                {Direction.NorthWest, new List<Direction> { Direction.North, Direction.NorthWest, Direction.West}},
                {Direction.West, new List<Direction> { Direction.North, Direction.NorthWest, Direction.West, Direction.SouthWest, Direction.South}},
                {Direction.SouthWest, new List<Direction> { Direction.West, Direction.SouthWest, Direction.South}},
                {Direction.None, new List<Direction> {Direction.North, Direction.NorthEast, Direction.East, Direction.SouthEast, Direction.South, Direction.SouthWest, Direction.West, Direction.NorthWest}}

            };

        static readonly List<Direction> cardinals = new List<Direction>
        {
            Direction.North, Direction.South, Direction.East, Direction.West
        };

        static readonly List<Direction> diagonals = new List<Direction>
        {
            Direction.NorthEast, Direction.NorthWest, Direction.SouthEast, Direction.SouthWest
        };

        public static List<Direction> Next(Direction direction)
        {
            return directions[direction];
        }

        public static bool IsCardinal(Direction direction)
        {
            return cardinals.Contains(direction);
        }

        public static bool IsDiagonal(Direction direction)
        {
            return diagonals.Contains(direction);
        }
    }
}
