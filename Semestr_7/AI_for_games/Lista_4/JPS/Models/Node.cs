using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using Models;

namespace JPS.Models
{
    public class Node : IComparable<Node>
    {
        static public Point Goal { get; set; }
        static public Point Start { get; set; }
        public Point Point { get; set; }
        public Node Parent { get; set; }
        public double Cost { get; set; }
        public Distance Distance { get; set; }
        public bool Visited { get; set; }
        public double Heuristic { get { return Point.OctileDistance(Goal); } }

        // public int Compare([AllowNull] Node x, [AllowNull] Node y)
        // {
        //     return (x.Cost + x.Heuristic).CompareTo(y.Cost + y.Heuristic);
        // }

        public void Print()
        {
            if (Parent == null)
                Console.WriteLine($"{Point.Col} {Point.Row} -1 -1 0.00");
            else
                Console.WriteLine($"{Point.Col} {Point.Row} {Parent.Point.Col} {Parent.Point.Row} {Cost}");
        }

        public Direction LastDirection()
        {
            if (Parent == null)
                return Direction.None;

            var dy = Point.Row - Parent.Point.Row;
            var dx = Point.Col - Parent.Point.Col;

            if (dy < 0 && dx == 0)
                return Direction.North;
            else if (dy > 0 && dx == 0)
                return Direction.South;
            else if (dy == 0 && dx > 0)
                return Direction.East;
            else if (dy == 0 && dx < 0)
                return Direction.West;
            else if (dy < 0 && dx < 0)
                return Direction.NorthWest;
            else if (dy < 0 && dx > 0)
                return Direction.NorthEast;
            else if (dy > 0 && dx > 0)
                return Direction.SouthEast;
            else if (dy > 0 && dx < 0)
                return Direction.SouthWest;
            else
                return Direction.None;
        }

        public int CompareTo([AllowNull] Node other)
        {
            // var result = Cost.CompareTo(other.Cost);
            var result = (Cost + Heuristic).CompareTo(other.Cost + other.Heuristic);

            if (result == 0)
            {
                result = Cost.CompareTo(other.Cost);
            }

            if (result == 0)
                return this.Point.CompareTo(other.Point);

            return result;
        }
    }
}
