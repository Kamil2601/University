namespace Geometry
{
    public class Point
    {
        public double X { get; set; }
        public double Y { get; set; }
        public Point(double x, double y)
        {
            this.X = x;
            this.Y = y;
        }

        public Point(Point point)
        {
            this.X = point.X;
            this.Y = point.Y;
        }

        public override string ToString()
        {
            return $"({X.ToString("N1")}, {Y.ToString("N1")})";
        }

        public bool Equals(Point point)
        {
            return X == point.X && Y == point.Y; 
        }
    }
}
