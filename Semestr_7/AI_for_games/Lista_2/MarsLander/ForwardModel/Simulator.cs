using System;
using System.Collections.Generic;
using Geometry;

namespace ForwardModel
{
    public class Simulator
    {
        Lander lander;
        Lander startLander;
        Surface surface;
        private Random random = new Random();
        public Simulator(Lander lander, Surface surface)
        {
            this.startLander = lander;
            this.lander = new Lander();
            this.surface = surface;
        }

        public void Simulation()
        {
            SetLander();
            Lander previous = new Lander();
            do
            {
                Action action = RandomAction(lander.Rotation, lander.Thrust);
                lander.PerformAction(action);
                lander.Move();

            } while (surface.MoveResult(previous, lander) == LandingResult.InProgress);
        }

        public void CreateAndPerformRandomAction()
        {
            Action action = RandomAction(lander.Rotation, lander.Thrust);
            lander.PerformAction(action);
            lander.Move();
        }


        public List<Action> RandomActionSequence(int n)
        {
            var result = new List<Action>();
            
            Point lastPosition = new Point(lander.Position);

            var action = RandomAction(startLander.Rotation, startLander.Thrust);
            
            for (int i=1; i<n; i++)
            {
                result.Add(action);

                var lastAction = result[result.Count-1];

                action = RandomAction(lastAction.Rotation, lastAction.Thrust);
            }

            return result;
        }

        public double EvaluateSequence(List<Action> actions)
        {
            SetLander();
            Lander previous = new Lander();

            int lastState = actions.Count - 1;

            for (int i=0; i<actions.Count; i++)
            {
                lander.PerformAction(actions[i]);
                previous.Copy(lander);
                lander.Move();

                // Maybe TODO: Some evaluation of each action

                if (surface.MoveResult(previous, lander) != LandingResult.InProgress)
                {
                    lastState = i;
                    break;
                }
            }

            return EvaluateState();

            // TODO: Evaluate
        }

        private double EvaluateState()
        {
            throw new NotImplementedException();
        }

        private Action RandomAction(int lastRotation, int lastThrust)
        {
            var thrust = random.Next(Math.Max(0,lastThrust-1),
                Math.Min(5, lander.Thrust+2));

            var rotation = random.Next(Math.Max(-90, lastRotation - 15),
                Math.Min(91, lander.Rotation + 16));

            return new Action(rotation, thrust);
        }

        private Action RandomAction(Action lastAction)
        {
            return RandomAction(lastAction.Rotation, lastAction.Thrust);
        }

        private void SetLander()
        {
            lander.Copy(startLander);
        }
    }
}
