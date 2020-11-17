using System;
using ForwardModel;
using Models;

namespace Evaluation
{
    public class StateEvaluator
    {
        Surface surface;
        private readonly Lander startLander;

        public StateEvaluator(Surface surface, Lander startLander)
        {
            this.surface = surface;
            this.startLander = startLander;
        }

        public double EvalState(Lander lander, LandingResult lastMoveResult)
        {
            if (lastMoveResult == LandingResult.Success)
            {
                return 1000000 + lander.Fuel;
            }

            var hDist = surface.HorizontalDistanceToLandingZone(lander.Position);
            var vDist = surface.VerticalDistanceToLandingZone(lander.Position);
            var dist = surface.DistanceToLandingZone(lander.Position);
            var lhsScore = LandingHorizontalSpeedScore(lander);
            var lvsScore = LandingVerticalSpeedScore(lander);
            var angleScore = LandingAngleScore(lander);

            // Console.WriteLine(lhsScore);
            // return 20000 - 3*Math.Abs(hDist) - Math.Abs(dist) / 10000 + 200 * lhsScore + 500 * lvsScore + 200 * angleScore;
        
            return (1-dist/6700) + (1-lander.Fuel/startLander.Fuel) + lhsScore;
        }

        public double EvalState2(Lander lander, LandingResult lastMoveResult)
        {
            var hDist = surface.HorizontalDistanceToLandingZone(lander.Position);
            var vDist = surface.VerticalDistanceToLandingZone(lander.Position);
            var rot = Math.Abs(lander.Angle);

            if (Math.Abs(hDist) < 500) hDist = 0;

            var hDScore = 1 - Math.Abs(hDist) / 7000;
            var vDScore = 1 - Math.Abs(vDist) / 3000;
            // var vsScore = LandingScore.VerticalSpeedScore(lander.VerticalSpeed);
            // var hSScore = LandingScore.HorizontalSpeedScore(lander.HorizontalSpeed);
            var lvsScore = LandingVerticalSpeedScore(lander);
            var lhsScore = LandingHorizontalSpeedScore(lander);
            // var laScore = LandingAngleScore(lander);
            var angleScore = AngleScore(lander);

            // Console.WriteLine($"{hDist}, {vDist}");

            // // double hSScore = HorizontalSpeedToDistance(lander);
            // double vs1 = VerticalSpeedToDistance(lander);
            // // var ds = 1 - surface.DistanceToLandingZone(lander.Position)/10000;

            // var vs2 = LandingScore.VerticalSpeedScore(lander.VerticalSpeed);

            // var vsScore = Math.Max(vs1, vs2);

            var res = -lander.VerticalSpeed / 40 + hDScore * (Math.Abs(vDist)) / 500 + vDScore * (Math.Abs(hDist)) / 1000
                + vDScore * 300 + angleScore * 10;

            if (lastMoveResult == LandingResult.Success)
            {
                res = 1000000 + lander.Fuel;
            }

            return res;
        }

        public double HorizontalSpeedToDistance(Lander lander)
        {
            var horizontalDistance = surface.HorizontalDistanceToLandingZone(lander.Position);

            if (Math.Sign(horizontalDistance) != Math.Sign(lander.HorizontalSpeed))
            {
                // TODO

                return 0;
            }
            else
            {
                // var hs = Math.Abs(lander.HorizontalSpeed)

                double secondsToStop = lander.HorizontalSpeed / 4.0;

                double secondsToReachLanding = horizontalDistance / lander.HorizontalSpeed;

                double ratio = secondsToStop / secondsToReachLanding;

                if (ratio >= 0.9 && ratio <= 1.1)
                    return 1;
                else if (ratio < 0.5 || ratio > 1.5)
                    return 0;
                else if (ratio < 0.9)
                    return 2.5 * ratio - 1.25;
                else
                    return -2.5 * ratio + 3.75;
            }
        }

        public double LandingVerticalSpeedScore(Lander lander)
        {
            var verticalDistance = surface.VerticalDistanceToLandingZone(lander.Position);

            // Console.WriteLine(verticalDistance);
            // Console.WriteLine(lander.VerticalSpeed);

            if (verticalDistance < 0 && lander.VerticalSpeed < 0)
            {
                double timeToLand = Math.Abs(verticalDistance) / Math.Abs(lander.VerticalSpeed);

                double landingSpeed = Math.Abs(Math.Abs(lander.VerticalSpeed) - 0.2 * timeToLand);


                double maxSpeedForOne = 40;
                double minSpeedForZero = 46;

                if (landingSpeed < maxSpeedForOne)
                {
                    return 1;
                }
                else if (landingSpeed < minSpeedForZero)
                {
                    double a = 1 / (maxSpeedForOne - minSpeedForZero);
                    double b = -minSpeedForZero * a;

                    return a * landingSpeed + b;
                }

                return 0;

            }
            else if (verticalDistance > 0 && lander.VerticalSpeed > 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        public double LandingHorizontalSpeedScore(Lander lander)
        {
            var horizontalDistance = surface.HorizontalDistanceToLandingZone(lander.Position);

            if (Math.Sign(horizontalDistance) == Math.Sign(lander.HorizontalSpeed))
            {
                var aHD = Math.Abs(horizontalDistance);
                var aHS = Math.Abs(lander.HorizontalSpeed);

                var timeToLand = aHD / aHS;

                var landingSpeed = aHS - timeToLand * 3;

                double maxSpeedForOne = 15;
                double minSpeedForZero = 20;

                if (landingSpeed < maxSpeedForOne)
                {
                    return 1;
                }
                // if (landingSpeed < minSpeedForZero)
                else
                {
                    double a = 1 / (maxSpeedForOne - minSpeedForZero);
                    double b = -minSpeedForZero * a;

                    return a * landingSpeed + b;
                }
                // else
                // {
                //     return 0;
                // }
            }
            else
            {
                return 0;
            }
        }

        public double LandingAngleScore(Lander lander)
        {
            var verticalDistance = surface.VerticalDistanceToLandingZone(lander.Position);

            // Console.WriteLine(verticalDistance);
            // Console.WriteLine(lander.VerticalSpeed);

            if (verticalDistance < 0 && lander.VerticalSpeed < 0)
            {
                double timeToLand = Math.Floor(Math.Abs(verticalDistance) / Math.Abs(lander.VerticalSpeed));

                double angle = Math.Abs(lander.Angle);

                double landingAngle = angle - 15 * timeToLand;

                if (landingAngle <= 0)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }

        public double AngleScore(Lander lander)
        {
            double angle = Math.Abs(lander.Angle);

            if (angle > 15)
                return 0;

            else
                return 1;
        }
    }
}
