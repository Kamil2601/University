using System;
using System.Collections.Generic;
using System.Linq;
using ForwardModel;
using Geometry;
using Models;

namespace Evaluation
{
    public class Simulator
    {
        public Lander lander;
        Lander startLander;
        Surface surface;
        Random random = new Random();

        public Simulator(Lander lander, Surface surface)
        {
            this.startLander = lander;
            this.lander = new Lander();
            this.surface = surface;

            var points = new List<Point> { 
                new Point(0,0),
                new Point(0,Surface.topBound),
                new Point(Surface.rightBound, 0),
                new Point(Surface.rightBound, Surface.topBound)
            };
        }

        public void Simulation()
        {
            SetLander();
            Lander previous = new Lander();
            do
            {
                LanderAction action = RandomAction();
                previous.Copy(lander);
                lander.PerformAction(action);
                lander.Move();

            } while (surface.MoveResult(previous, lander) == LandingResult.InProgress);
        }

        public Sequence RandomActionSequence(int n)
        {
            var result = new Sequence();

            var action = RandomAction();
            
            for (int i=0; i<n; i++)
            {
                result.Add(action);

                action = RandomAction();
            }

            return result;
        }

        public double EvaluateSequence(Sequence actions)
        {
            SetLander();
            Lander previous = new Lander();

            int gameOverState = -1;
            LandingResult moveResult = LandingResult.InProgress;

            for (int i=0; i<actions.Count; i++)
            {
                previous.Copy(lander);
                lander.PerformAction(actions[i]);
                lander.Move();

                // Maybe TODO: Some evaluation of each action

                moveResult = surface.MoveResult(previous, lander);

                if (moveResult != LandingResult.InProgress)
                {
                    gameOverState = i;
                    break;
                }
            }

            Lander toEval = lander;

            if (gameOverState != -1)
                toEval = previous;

            // Evaluate last state

            SequenceStats stats = new SequenceStats();

            stats.HorizontalDistanceScore = 1 - surface
                .HorizontalDistanceToLandingZone(toEval.Position)/Surface.rightBound;

            // Console.WriteLine((stats.HorizontalDistanceScore, stats.Score));
            
            stats.VerticalDistanceScore = 1 - surface
                .VerticalDistanceToLandingZone(toEval.Position)/Surface.topBound;


            stats.LandingScore = LandingScore.Score(previous, moveResult);
            // var distanceToLandingZone = surface.DistanceToLandingZone(lander.Position);

            // stats.DirectDistanceScore = 1 - distanceToLandingZone/maxDistanceToLandingZone;

            // if (moveResult != LandingResult.Success)
            //     stats.LandingScore = 0;
            // else
            //     stats.LandingScore = LandingScore.Score(lander);

            stats.FuelScore = previous.Fuel/startLander.Fuel;

            // stats.GroundDistanceScore = 1 - surface.GroundDistance(lander.Position)/surface.surfaceLength;

            actions.Score = stats.Score;

            return stats.Score;
        }

        public LanderAction RandomAction()
        {
            var thrust = random.Next(-1,2);

            var rotation = random.Next(-15, 16);

            // if (lander.Fuel < thrust)
            //     thrust = lander.Fuel;

            return new LanderAction(rotation, thrust);
        }

        private void SetLander()
        {
            lander.Copy(startLander);
        }
    }
}
