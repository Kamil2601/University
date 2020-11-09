using System;
using Geometry;

namespace ForwardModel
{
    public class Lander
    {
        public static double MarsGravity { get; } = -3.711f;
        public Point Position { get; set; }
        public double VerticalSpeed { get; set; }
        public double HorizontalSpeed { get; set; }
        public int Rotation { get; set; }
        public int Thrust { get; set; }
        public int Fuel { get; set; }

        public Point Move(int seconds = 1)
        {
            Position.X += HorizontalSpeed * seconds;

            Position.Y += VerticalSpeed * seconds + MarsGravity * seconds * seconds / 2;

            VerticalSpeed = VerticalSpeed + MarsGravity * seconds;

            return Position;
        }

        public void PerformAction(Action action)
        {
            Rotation = action.Rotation;
            Thrust = action.Thrust;
            Fuel -= action.Thrust;

            var radians = Math.PI * action.Rotation / 180.0;

            var horizontalAcc = action.Thrust * Math.Sin(radians);

            var verticalAcc = action.Thrust * Math.Cos(radians);

            VerticalSpeed += verticalAcc;
            
            HorizontalSpeed += horizontalAcc;
        }

        public void Print()
        {
            Console.WriteLine($"({Position.X}, {Position.Y}), HS: {HorizontalSpeed}, " +
                $"VS: {VerticalSpeed} A: {Rotation}, F: {Fuel}");
        }

        public void Copy(Lander source)
        {
            Position = new Point(source.Position);
            VerticalSpeed = source.VerticalSpeed;
            HorizontalSpeed = source.HorizontalSpeed;
            Thrust = source.Thrust;
            Rotation = source.Rotation;
            Fuel = source.Fuel;
        }
    }
}
