using System;
using System.Collections.Generic;
using System.Linq;
using ForwardModel;
using Geometry;
using Models;
using RHEA;

namespace MarsLander
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length > 0)
            {
                if (args[0] == "1")
                    EasyOnTheRight();
            }
            else
                CodinGame();
        }

        public static void EasyOnTheRight()
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

        public static void CodinGame()
        {
            Surface surface = new Surface();

            string[] inputs;

            inputs = Console.ReadLine().Split(' ');
            int X = int.Parse(inputs[0]);
            int Y = int.Parse(inputs[1]);
            int HS = int.Parse(inputs[2]); // the horizontal speed (in m/s), can be negative.
            int VS = int.Parse(inputs[3]); // the vertical speed (in m/s), can be negative.
            int F = int.Parse(inputs[4]); // the quantity of remaining fuel in liters.
            int R = int.Parse(inputs[5]); // the rotation angle in degrees (-90 to 90).
            int P = int.Parse(inputs[6]); // the thrust power (0 to 4).

            Lander lander = new Lander
            {
                Position = new Point(X, Y),
                HorizontalSpeed = HS,
                VerticalSpeed = VS,
                Fuel = F,
                Angle = R,
                Power = P
            };

            Evolution evolution = new Evolution(surface, lander);


            evolution.Initialize();

            evolution.AlgorithmWithInput();

            // // game loop
            // while (true)
            // {
            //     evolution.Iteration();

            //     inputs = Console.ReadLine().Split(' ');

            //     // R P. R is the desired rotation angle. P is the desired thrust power.
            //     // Console.WriteLine("-20 3");
            // }
        }
    }
}
