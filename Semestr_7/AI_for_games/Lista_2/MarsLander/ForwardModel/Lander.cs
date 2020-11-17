using System;
using Geometry;
using Models;

namespace ForwardModel
{
    public class Lander
    {
        public static double MarsGravity { get; } = -3.711;
        public Point Position { get; set; }
        public double VerticalSpeed { get; set; }
        public double HorizontalSpeed { get; set; }
        public int Angle { get; set; }
        public int Power { get; set; }
        public int Fuel { get; set; }

        public void Move(LanderAction action)
        {
            Angle += action.Rotation;

            if (Angle > 90)
                Angle = 90;
            else if (Angle < -90)
                Angle = -90;

            Power += action.Thrust;

            if (Power < 0)
                Power = 0;
            else if (Power > 4)
                Power = 4;

            Fuel -= Power;

            var radians = Math.PI * Angle / 180.0;

            var horizontalAcc = -Power * Math.Sin(radians);

            var verticalAcc = Power * Math.Cos(radians) + MarsGravity;

            Position.X += HorizontalSpeed + horizontalAcc/2;
            Position.Y += VerticalSpeed + verticalAcc/2;

            VerticalSpeed += verticalAcc;
            
            HorizontalSpeed += horizontalAcc;
        }

        public void Print()
        {
            Console.WriteLine($"({Position.X}, {Position.Y}), HS: {HorizontalSpeed}, " +
                $"VS: {VerticalSpeed}, P: {Power}, A: {Angle}, F: {Fuel}");
        }

        public void Copy(Lander source)
        {
            Position = new Point(source.Position);
            VerticalSpeed = source.VerticalSpeed;
            HorizontalSpeed = source.HorizontalSpeed;
            Power = source.Power;
            Angle = source.Angle;
            Fuel = source.Fuel;
        }
    }
}
