using System.Collections.Generic;
using ForwardModel;
using Geometry;
using RHEA;

namespace Tests
{
    public static class Codingame
    {
        public static void Test1()
        {
            Lander lander = new Lander()
            {
                Position = new Point(2500, 2700),
                VerticalSpeed = 0,
                HorizontalSpeed = 0,
                Fuel = 550,
                Angle = 0,
            };

            var points = new List<Point>() {
                new Point(0, 1000),
                new Point(1000, 500),
                new Point(1500, 1500),
                new Point(3000, 1000),
                new Point(4500, 150),
                new Point(5500, 150),
                new Point(6999, 800),
            };

            Surface surface = new Surface(points);

            Evolution evolution = new Evolution(surface, lander, true);

            evolution.Algorithm();
        }
    }
}
