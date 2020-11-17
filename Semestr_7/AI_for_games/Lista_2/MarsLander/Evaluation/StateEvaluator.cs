using System;
using ForwardModel;
using Models;

namespace Evaluation
{
    public class StateEvaluator
    {
        Surface surface;
        private readonly Lander startLander;
        double horizontalDistance;
        double verticalDistance;
        double distance;

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

            horizontalDistance = surface.HorizontalDistanceToLandingZone(lander.Position);
            verticalDistance = surface.VerticalDistanceToLandingZone(lander.Position);
            distance = surface.DistanceToLandingZone(lander.Position);
            var lhsScore = LandingHorizontalSpeedScore(lander);
            var lvsScore = LandingVerticalSpeedScore(lander);
            var angleScore = LandingAngleScore(lander);
            var dirScore = DirectionScore(lander);

            double bonus = 0;

            if (lastMoveResult == LandingResult.Success)
                bonus = 1000;

            // return 20000 - 3*Math.Abs(hDist) - Math.Abs(dist) / 10000 + 200 * lhsScore + 500 * lvsScore + 200 * angleScore;
        
            return (1-distance/6700) + (1-lander.Fuel/startLander.Fuel) + 2*lhsScore + 2*lvsScore + 50*dirScore + angleScore;
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
                if (landingSpeed < minSpeedForZero)
                {
                    double a = 1 / (maxSpeedForOne - minSpeedForZero);
                    double b = -minSpeedForZero * a;

                    return a * landingSpeed + b;
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

        public double LandingAngleScore(Lander lander)
        {
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

        public double DirectionScore(Lander lander)
        {
            var hDist = surface.HorizontalDistanceToLandingZone(lander.Position);

            if (Math.Sign(hDist) == Math.Sign(lander.HorizontalSpeed))
            {
                return 1;
            }

            var av = Math.Abs(lander.HorizontalSpeed);
            var ad = Math.Abs(hDist);

            return 1/(av+ad);
        }

        public double GroundDistanceScore(Lander lander, LandingResult moveResult)
        {
            if (moveResult >= LandingResult.CrashOnLandingZone)
            {
                return 1;
            }


            var dist = surface.GroundDistance(lander.Position);

            return 1-dist/surface.surfaceLength;
            
        }
    }
}
