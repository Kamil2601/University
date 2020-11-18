using System;
using ForwardModel;
using Models;

namespace Evaluation
{
    public static class LandingScore
    {
        const double bestHS = 20;
        const double worstHS = 200;
        const double aHS = 1 / (bestHS - worstHS);
        const double bHS = -worstHS * aHS;


        const double bestVS = 40;
        const double worstVS = 120;
        const double aVS = 1 / (bestVS - worstVS);
        const double bVS = -worstVS * aVS;

        const int worstRotation = 20;
        const double aR = -1.0 / worstRotation;
        const double bR = 1;

        public static double Score(double verticalSpeed, double horizontalSpeed, int rotation)
        {
            return  VerticalSpeedScore(verticalSpeed) *
                 HorizontalSpeedScore(horizontalSpeed);
                // * RotationScore(rotation);

            // return VerticalSpeedScore(verticalSpeed);
        }

        public static double Score(Lander lander)
        {
            return Score(lander.VerticalSpeed, lander.HorizontalSpeed,
                lander.Angle);
            
        }


        public static double RotationScore(int rotation)
        {
            int absR = Math.Abs(rotation);

            if (rotation > worstRotation)
                return 0;
            else
                return aR * absR + bR;
        }

        public static double HorizontalSpeedScore(double horizontalSpeed)
        {
            double absHS = Math.Abs(horizontalSpeed);

            if (absHS <= bestHS)
                return 1;
            else if (absHS < worstHS)
                return aHS * absHS + bHS;
            else
                return 0;
        }

        public static double VerticalSpeedScore(double verticalSpeed)
        {
            if (verticalSpeed >= -10)
                return 0;

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
