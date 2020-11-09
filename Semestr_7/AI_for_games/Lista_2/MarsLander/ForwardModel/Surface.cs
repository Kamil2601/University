using System;
using System.Collections.Generic;
using Geometry;

namespace ForwardModel
{
    public class Surface
    {
        const int topBound = 3000;
        const int rightBound = 7000;
        public List<Point> points;
        Point flatLeft;
        Point flatRight;
        int flatLeftIndex;
        
        public Surface(List<Point> points = null)
        {
            if (points != null)
            {
                this.points = new List<Point>();
                this.points.AddRange(points);
            }
            else
            {
                Load();
            }
            FindFlatSurface();
        }

        public void Load()
        {
            points = new List<Point>();

            string[] inputs;
            int N = int.Parse(Console.ReadLine()); // the number of points used to draw the surface of Mars.
            for (int i = 0; i < N; i++)
            {
                inputs = Console.ReadLine().Split(' ');
                int landX = int.Parse(inputs[0]); // X coordinate of a surface point. (0 to 6999)
                int landY = int.Parse(inputs[1]); // Y coordinate of a surface point. By linking all the points together in a sequential fashion, you form the surface of Mars.
            
                points.Add(new Point(landX, landY));
            }            
        }

        public int IntersectionSegment(Point from, Point to)
        {
            for (int i=0; i < points.Count - 1; i++)
            {
                if (Utilities.DoIntersect(from, to, points[i], points[i+1]))
                {
                    return i;
                }
            }

            return -1;
        }

        public bool OutOfBounds(Point point)
        {
            return point.X < 0 || point.X > rightBound ||
                point.Y < 0 || point.Y > topBound;
        }

        public LandingResult MoveResult(Lander from, Lander to)
        {
            if (OutOfBounds(to.Position))
                return LandingResult.Failure;

            int index = IntersectionSegment(from.Position, to.Position);

            if (index == -1)
                return LandingResult.InProgress;

            if (index != flatLeftIndex)
                return LandingResult.Failure;

            return LandingOnFlatResult(from, to);
        }

        private LandingResult LandingOnFlatResult(Lander from, Lander to)
        {
            if (from.Rotation != 0)
                return LandingResult.Failure;

            if (Math.Abs(from.HorizontalSpeed) > 20)
                return LandingResult.Failure;

            var s = from.Position.Y - flatLeft.Y;

            var delta = from.VerticalSpeed * from.VerticalSpeed + 2*Lander.MarsGravity*s;

            var t = (-from.VerticalSpeed + Math.Sqrt(delta))/Lander.MarsGravity;

            var landingVSpeed = from.VerticalSpeed + t*Lander.MarsGravity;

            if (landingVSpeed > 40)
                return LandingResult.Failure;
            
            return LandingResult.Success;
        }

        private void FindFlatSurface()
        {
            for (int i=0; i<points.Count-1; i++)
            {
                if (points[i].Y == points[i+1].Y)
                {
                    flatLeftIndex = i;
                    flatLeft = points[i];
                    flatRight = points[i+1];

                    break;
                }
            }
        }
    }
}
