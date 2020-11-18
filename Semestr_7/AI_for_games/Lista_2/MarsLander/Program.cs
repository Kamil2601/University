using System;
using System.Collections.Generic;
using System.Linq;
using ForwardModel;
using Geometry;
using Models;
using RHEA;
using Tests;

namespace MarsLander
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length > 0)
            {
                if (args[0] == "1")
                    Codingame.Test1();
                if (args[0] == "2")
                    Codingame.Test2();
                if (args[0] == "3")
                    Codingame.Test3();
                if (args[0] == "4")
                    Codingame.Test4();
                if (args[0] == "5")
                    Codingame.Test5();
            }
            else
                CodinGame();
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
        }
    }
}
