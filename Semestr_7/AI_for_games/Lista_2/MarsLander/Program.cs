using System;
using System.Collections.Generic;
using ForwardModel;
using Geometry;

namespace MarsLander
{
    class Program
    {
        static void Main(string[] args)
        {
            // CodinGame();

            Lander lander = new Lander()
            {
                Position = new Point(2100, 1000),
                VerticalSpeed = 0,
                HorizontalSpeed = 0,
                Fuel = 100,
                Rotation = 0,
            };

            var points = new List<Point>() {
                new Point(0,0),
                new Point(2000, 500),
                new Point(3000, 500),
                new Point(7000, 0)
            };

            Surface surface = new Surface(points);

            Simulator simulator = new Simulator(lander, surface);

            var m = 0;

            for (int i=0; i<100; i++)
            {
                var seq = simulator.RandomActionSequence(100);

                m = Math.Max(m, seq.Count);
            }

            Console.WriteLine(m);
               

            // foreach (var action in seq)
            // {
            //     Console.WriteLine(action);
            // }


            // int sim = 0;

            // TimeSpan time = new TimeSpan(0,0,1);

            // DateTime start = DateTime.Now;

            // while (DateTime.Now - start < time)
            // {
            //     simulator.Simulation();
            //     sim++;
            // }

            // Console.WriteLine(sim);

            // Console.WriteLine(simulator.seconds);

            // Console.WriteLine(surface.DidCrash(new Point(2100, 550), new Point(2100, 450)));
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
                Position = new Point(X,Y),
                HorizontalSpeed = HS,
                VerticalSpeed = VS,
                Fuel = F,
                Rotation = R,
                Thrust = P
            };

            Simulator simulator = new Simulator(lander, surface);

            for (long i=0; i<10000 ; i++)
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
