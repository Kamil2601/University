using System;
using System.Collections.Generic;
using System.Linq;
using Evaluation;
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
            EasyOnTheRight();
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
                new Point(4000, 150),
                new Point(5500, 150),
                new Point(6999, 800),
            };

            Surface surface = new Surface(points);

            Simulator simulator = new Simulator(lander, surface);

            // simulator.EvaluateSequence(actions);

            // lander.PerformAction(new LanderAction(3))

            Evolution evolution = new Evolution(surface, lander, 50);


            evolution.Algorithm();
            
            // evolution.Initialize();

            // foreach (Sequence seq in evolution.Population)
            // {
            //     Console.WriteLine($"{seq.Score}, {seq}");
            // }
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

            Lander lander = new Lander()
            {
                Position = new Point(X, Y),
                HorizontalSpeed = HS,
                VerticalSpeed = VS,
                Fuel = F,
                Angle = R,
                Power = P
            };

            Simulator simulator = new Simulator(lander, surface);

            for (long i = 0; i < 10000; i++)
            {
                simulator.Simulation();
                // Console.Error.WriteLine(simulator.seconds);
            }

            Console.WriteLine("Hello there");

            // game loop
            while (true)
            {
                inputs = Console.ReadLine().Split(' ');
                X = int.Parse(inputs[0]);
                Y = int.Parse(inputs[1]);
                HS = int.Parse(inputs[2]); // the horizontal speed (in m/s), can be negative.
                VS = int.Parse(inputs[3]); // the vertical speed (in m/s), can be negative.
                F = int.Parse(inputs[4]); // the quantity of remaining fuel in liters.
                R = int.Parse(inputs[5]); // the rotation angle in degrees (-90 to 90).
                P = int.Parse(inputs[6]); // the thrust power (0 to 4).

                // Write an action using Console.WriteLine()
                // To debug: Console.Error.WriteLine("Debug messages...");

                // R P. R is the desired rotation angle. P is the desired thrust power.
                Console.WriteLine("0 4");
            }
        }
    }
}
