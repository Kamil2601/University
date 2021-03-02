using System;
using System.Diagnostics.CodeAnalysis;
using Models;

namespace JPS.Models
{
    public class Point: IComparable<Point>
    {
        public int Row { get; set; }
        public int Col { get; set; }

        public Point(int row, int col)
        {
            Row = row;
            Col = col;
        }

        public bool Equals(Point other)
        {
            return Row == other.Row && Col == other.Col;
        }

        public Point Move(Direction direction, int distance = 1)
        {
            switch (direction)
            {
                case Direction.North: return new Point(Row-distance, Col);
                case Direction.NorthEast: return new Point(Row-distance, Col+distance);
                case Direction.East: return new Point(Row, Col+distance);
                case Direction.SouthEast: return new Point(Row+distance, Col+distance);
                case Direction.South: return new Point(Row+distance, Col);
                case Direction.SouthWest: return new Point(Row+distance, Col-distance);
                case Direction.West: return new Point(Row, Col-distance);
                case Direction.NorthWest: return new Point(Row-distance, Col-distance);
                default: return new Point(Row, Col);
            }
        }

        public int RowDistance(Point other)
        {
            return Math.Abs(Row - other.Row);
        }

        public int ColDistance(Point other)
        {
            return Math.Abs(Col - other.Col);
        }

        public int DirectDistance(Point other)
        {
            int dx = Math.Abs(Col - other.Col);
            int dy = Math.Abs(Row - other.Row);

            return Math.Min(dx, dy);
        }

        public double OctileDistance(Point other)
        {
            double dx = Math.Abs(Col - other.Col);
            double dy = Math.Abs(Row - other.Row);

            return dx+dy+(Math.Sqrt(2)-2)*Math.Min(dx, dy);
        }

        public int CompareTo([AllowNull] Point other)
        {
            var res = this.Row.CompareTo(other.Row);

            if (res == 0)
            {
                return this.Col.CompareTo(other.Col);
            }

            return res;
        }
    }
}
