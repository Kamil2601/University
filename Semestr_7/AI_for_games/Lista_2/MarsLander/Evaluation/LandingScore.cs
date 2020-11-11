using System;
using ForwardModel;
using Models;

namespace Evaluation
{
    public static class LandingScore
    {
        const double bestHS = 20;
        const double worstHS = 40;
        const double aHS = 1 / (bestHS - worstHS);
        const double bHS = -worstHS * aHS;


        const double bestVS = 40;
        const double worstVS = 60;
        const double aVS = 1 / (bestVS - worstVS);
        const double bVS = -worstVS * aVS;

        const int worstRotation = 20;
        const double aR = -1.0 / worstRotation;
        const double bR = 1;

        public static double Score(double verticalSpeed, double horizontalSpeed, int rotation)
        {
            return 0.33 * VerticalSpeedScore(verticalSpeed) +
                0.33 * HorizontalSpeedScore(horizontalSpeed) +
                0.32 * RotationScore(rotation);
        }

        public static double Score(Lander lander, LandingResult landingResult)
        {
            // if (landingResult == LandingResult.Failure ||
            //     landingResult == LandingResult.InProgress)
            //     return 0;

            // // return Score(lander.VerticalSpeed, lander.HorizontalSpeed,
            // //     lander.Angle);

            if (landingResult != LandingResult.Success)
                return 0;
            
            return 1;
        }


        public static double RotationScore(int rotation)
        {
            int absR = Math.Abs(rotation);

            if (rotation > worstRotation)
                return 0;
            else
                return aR * absR + bR;
        }

        private static double HorizontalSpeedScore(double horizontalSpeed)
        {
            double absHS = Math.Abs(horizontalSpeed);

            if (absHS <= bestHS)
                return 1;
            else if (absHS < worstHS)
                return aHS * absHS + bHS;
            else
                return 0;
        }

        private static double VerticalSpeedScore(double verticalSpeed)
        {
            double absVS = Math.Abs(verticalSpeed);

            if (absVS <= bestVS)
                return 1;
            else if (absVS < worstVS)
                return aVS * absVS + bVS;
            else
                return 0;
        }
    }
}
