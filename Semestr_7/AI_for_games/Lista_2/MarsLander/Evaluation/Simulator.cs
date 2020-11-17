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
        StateEvaluator stateEvaluator;

        public Simulator(Lander lander, Surface surface)
        {
            this.startLander = lander;
            this.lander = new Lander();
            this.surface = surface;
            this.stateEvaluator = new StateEvaluator(surface, startLander);

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
                lander.Move(action);

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

            int moves = 0;
            LandingResult moveResult = LandingResult.InProgress;
            double res = 0;
            double c = 1;
            double bonus = 0;
            var stop = actions.Count;

            for (int i=0; i<actions.Count-1; i++)
            {
                previous.Copy(lander);
                
                lander.Move(actions[i]);

                actions[i].Rotation = lander.Angle-previous.Angle;
                actions[i].Thrust = lander.Power - previous.Power;


                

                moveResult = surface.MoveResult(previous, lander);

                moves++;
                res += c*stateEvaluator.EvalState(lander, moveResult);
                c *= 1;

                if (moveResult != LandingResult.InProgress)
                {
                    stop = i;
                    if (moveResult == LandingResult.Success)
                    {
                        actions[i].Rotation = - previous.Angle;
                        actions[i+1].Rotation = 0;
                        bonus = 100000;
                    }
                    else if (moveResult == LandingResult.CorrectAngle)
                    {
                        actions[i].Rotation = - previous.Angle;
                        // bonus = 100;
                    }
                    break;
                }
                // moves++;

                // res += stateEvaluator.EvalState(lander, moveResult);
            }

            actions.Score = res; // stateEvaluator.EvalState(lander, moveResult);

            // Console.WriteLine($"{stop}, {actions.Score}");

            // if (moves == 0)
            // {
            //     if (moveResult != LandingResult.Success)
            //         actions.Score = 0.01;
            //     else
            //         actions.Score = 1;
            // }
            // else
            // {
            //     actions.Score = res/moves;
            // }

            

            return actions.Score;
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
