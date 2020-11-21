using System;
using System.Collections.Generic;
using System.Linq;
using Geometry;
using Models;

namespace ForwardModel
{
    public class Surface
    {
        public const int topBound = 3000;
        public const int rightBound = 7000;
        public List<Point> points;
        public Point flatLeft;
        public Point flatRight;
        int flatLeftIndex;
        public double surfaceLength;
        public List<double> groundDistanceToLandingZone;

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
            CalculateSurfaceLength();
            CalculateGroundDistance();
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

        public (int, Point) IntersectionSegment(Point from, Point to)
        {
            Point firstIntersection = null;
            int index = -1;
            for (int i = 0; i < points.Count - 1; i++)
            {
                Point intersection = Utilities.SegmentsIntersection(from, to, points[i], points[i + 1]);
                if (intersection != null)
                {    
                    if (firstIntersection == null)
                    {
                        firstIntersection = intersection;
                        index = i;
                    }
                    else if (Utilities.Distance(from, intersection) < 
                        Utilities.Distance(from, firstIntersection))
                    {
                        firstIntersection = intersection;
                        index = i;
                    }
                }
            }

            return (index, firstIntersection);
        }

        public bool OutOfBounds(Point point)
        {
            return point.X < 0 || point.X > rightBound ||
                point.Y < 0 || point.Y > topBound;
        }

       public LandingResult MoveResult(Lander previous, Lander current)
        {
            var (index, point) = IntersectionSegment(previous.Position, current.Position);

            if (index == -1)
            {
                if (OutOfBounds(current.Position))
                    return LandingResult.OutOfBounds;

                return LandingResult.InProgress;
            }

            current.Position.X = point.X;
            current.Position.Y = point.Y;

            if (index != flatLeftIndex)
                return LandingResult.Crash;

            return LandingOnFlatResult(previous, current);
        }

        public double DistanceToLandingZone(Point point)
        {
            if (point.X >= flatLeft.X && point.X <= flatRight.X)
                return Math.Abs(point.Y - flatLeft.Y);

            return Math.Min(Utilities.Distance(point, flatLeft),
                Utilities.Distance(point, flatRight));
        }

        public double HorizontalDistanceToLandingZone(Point point)
        {
            var mid = (flatLeft.X + flatRight.X)/2;

            return mid - point.X;
        }

        public double VerticalDistanceToLandingZone(Point point)
        {
            return flatLeft.Y - point.Y;
        }

        private LandingResult LandingOnFlatResult(Lander previous, Lander current)
        {
            if (Math.Abs(previous.Angle) > 15 || Math.Abs(current.Angle) > 15)
                return LandingResult.CrashOnLandingZone;

            if (Math.Abs(previous.VerticalSpeed) > 40 || Math.Abs(current.VerticalSpeed) > 40)
                return LandingResult.CorrectAngle;

            if (Math.Abs(previous.HorizontalSpeed) > 20 || Math.Abs(current.HorizontalSpeed) > 20)
                return LandingResult.CorrectVerticalSpeed;

            // return LandingResult.Success;


            // var s = previous.Position.Y - flatLeft.Y;

            // var a = -Lander.MarsGravity;

            // var delta = previous.VerticalSpeed * previous.VerticalSpeed + 2*a*s;

            // var t = (-previous.VerticalSpeed + Math.Sqrt(delta))/a;

            // var landingVSpeed = previous.VerticalSpeed + t*a;

            // if (landingVSpeed > 40)
            //     return LandingResult.Failure;

            return LandingResult.Success;


        }

        public double GroundDistance(Point point)
        {
            Point landingCenter = new Point((flatLeft.X + flatRight.X) / 2, flatLeft.Y);

            var s = GroundDistance(point, flatLeft);
            s = Math.Min(s, GroundDistance(point, flatRight));
            s = Math.Min(s, GroundDistance(point, landingCenter));

            return s;
        }

        private double GroundDistance(Point point, Point pointOnLandingZone)
        {
            var (index ,intersection) = IntersectionSegment(point, pointOnLandingZone);

            if (index == -1 || index == flatLeftIndex || index == flatLeftIndex+1)
                return 0;

            double s = 0;

            if (index < flatLeftIndex)
                s = Utilities.Distance(intersection, points[index+1]) +
                    groundDistanceToLandingZone[index+1];
            else
                s = Utilities.Distance(intersection, points[index]) +
                    groundDistanceToLandingZone[index];

            return s;
        }

        private void FindFlatSurface()
        {
            for (int i = 0; i < points.Count - 1; i++)
            {
                if (points[i].Y == points[i + 1].Y)
                {
                    flatLeftIndex = i;
                    flatLeft = points[i];
                    flatRight = points[i + 1];

                    break;
                }
            }
        }

        private void CalculateSurfaceLength()
        {
            surfaceLength = 0;
            for (int i = 0; i < points.Count - 1; i++)
            {
                surfaceLength += Utilities.Distance(points[i], points[i + 1]);
            }
        }

        private void CalculateGroundDistance()
        {
            groundDistanceToLandingZone = new List<double>(points.Select(_ => 0.0));

            groundDistanceToLandingZone[flatLeftIndex] = 0;
            groundDistanceToLandingZone[flatLeftIndex + 1] = 0;

            double dist = 0;

            for (int i = flatLeftIndex - 1; i >= 0; i--)
            {
                dist += Utilities.Distance(points[i], points[i + 1]);
                groundDistanceToLandingZone[i] = dist;
            }

            dist = 0;

            for (int i = flatLeftIndex + 2; i < points.Count; i++)
            {
                dist += Utilities.Distance(points[i], points[i - 1]);
                groundDistanceToLandingZone[i] = dist;
            }
        }
    }
}
