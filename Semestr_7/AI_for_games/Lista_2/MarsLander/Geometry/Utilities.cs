using System;

namespace Geometry
{
    public static class Utilities
    {
        public static double Distance(Point A, Point B)
        {
            var leftXDist = Math.Abs(A.X - B.X);
            var leftYDist = Math.Abs(A.Y - B.Y);

            return Math.Sqrt(leftXDist*leftXDist + leftYDist*leftYDist);
        }

        public static Point LinesIntersection(Point A, Point B, Point C, Point D)
        {
            // Line AB represented as a1x + b1y = c1  
            double a1 = B.Y - A.Y;
            double b1 = A.X - B.X;
            double c1 = a1 * (A.X) + b1 * (A.Y);

            // Line CD represented as a2x + b2y = c2  
            double a2 = D.Y - C.Y;
            double b2 = C.X - D.X;
            double c2 = a2 * (C.X) + b2 * (C.Y);

            double determinant = a1 * b2 - a2 * b1;

            if (determinant == 0)
            {
                // The lines are parallel.
                return null;
            }
            else
            {
                double x = (b2 * c1 - b1 * c2) / determinant;
                double y = (a1 * c2 - a2 * c1) / determinant;
                return new Point(x, y);
            }
        }

        public static Point SegmentsIntersection(Point A, Point B, Point C, Point D)
        {
            Point s = LinesIntersection(A, B, C, D);

            if (s == null)
                return null;
            
            var minX = Math.Min(A.X, B.X);
            var maxX = Math.Max(A.X, B.X);

            if (s.X > maxX || s.X < minX)
                return null;

            minX = Math.Min(C.X, D.X);
            maxX = Math.Max(C.X, D.X);

            if (s.X > maxX || s.X < minX)
                return null;

            var minY = Math.Min(A.Y, B.Y);
            var maxY = Math.Max(A.Y, B.Y);

            if (s.Y > maxY || s.Y < minY)
                return null;

            minY = Math.Min(C.Y, D.Y);
            maxY = Math.Max(C.Y, D.Y);

            if (s.Y > maxY || s.Y < minY)
                return null;

            return s;
        }
    }
}
