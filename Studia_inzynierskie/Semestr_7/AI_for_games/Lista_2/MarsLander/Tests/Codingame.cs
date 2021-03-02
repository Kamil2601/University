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

        public static void Test2()
        {
            Lander lander = new Lander()
            {
                Position = new Point(6500, 2800),
                VerticalSpeed = 0,
                HorizontalSpeed = -100,
                Fuel = 600,
                Angle = 90,
                Power = 0
            };

            var points = new List<Point>() {
                new Point(0, 100),
                new Point(1000, 500),
                new Point(1500, 100),
                new Point(3000, 100),
                new Point(3500, 500),
                new Point(3700, 200),
                new Point(5000, 1500),
                new Point(5800, 300),
                new Point(6000, 1000),
                new Point(6999, 2000),
            };

            Surface surface = new Surface(points);

            Evolution evolution = new Evolution(surface, lander, true);

            evolution.Algorithm();
        }

        public static void Test3()
        {
            Lander lander = new Lander()
            {
                Position = new Point(6500, 2800),
                VerticalSpeed = 0,
                HorizontalSpeed = -90,
                Fuel = 750,
                Angle = 90,
                Power = 0
            };

            var points = new List<Point>() {
                new Point(0, 100),
                new Point(1000, 500),
                new Point(1500, 1500),
                new Point(3000, 1000),
                new Point(4000, 150),
                new Point(5500, 150),
                new Point(6999, 800),
            };

            Surface surface = new Surface(points);

            Evolution evolution = new Evolution(surface, lander, true);

            evolution.Algorithm();
        }

        public static void Test4()
        {
            Lander lander = new Lander()
            {
                Position = new Point(500, 2700),
                VerticalSpeed = 0,
                HorizontalSpeed = -100,
                Fuel = 800,
                Angle = -90,
                Power = 0
            };

            var points = new List<Point>() {
                new Point(0, 1000),
                new Point(300, 1500),
                new Point(350, 1400),
                new Point(500, 2000),
                new Point(800, 1800),
                new Point(1000, 2500),
                new Point(1200, 2100),
                new Point(1500, 2400),
                new Point(2000, 1000),
                new Point(2200, 500),
                new Point(2500, 100),
                new Point(2900, 800),
                new Point(3000, 500),
                new Point(3200, 1000),
                new Point(3500, 2000),
                new Point(3800, 800),
                new Point(4000, 200),
                new Point(5000, 200),
                new Point(5500, 1500),
                new Point(6999, 2800),
            };

            Surface surface = new Surface(points);

            Evolution evolution = new Evolution(surface, lander, true);

            evolution.Algorithm();
        }

        public static void Test5()
        {
            Lander lander = new Lander()
            {
                Position = new Point(6500, 2700),
                VerticalSpeed = 0,
                HorizontalSpeed = -50,
                Fuel = 1000,
                Angle = 90,
                Power = 0
            };

            var points = new List<Point>() {
                new Point(0, 1000),
                new Point(300, 1500),
                new Point(350, 1400),
                new Point(500, 2100),
                new Point(1500, 2100),
                new Point(2000, 200),
                new Point(2500, 500),
                new Point(2900, 300),
                new Point(3000, 200),
                new Point(3200, 1000),
                new Point(3500, 500),
                new Point(3800, 800),
                new Point(4000, 200),
                new Point(4200, 800),
                new Point(4800, 600),
                new Point(5000, 1200),
                new Point(5500, 900),
                new Point(6000, 500),
                new Point(6500, 300),
                new Point(6999, 500),
            };

            Surface surface = new Surface(points);

            Evolution evolution = new Evolution(surface, lander, true);

            evolution.Algorithm();
        }
    }
}
