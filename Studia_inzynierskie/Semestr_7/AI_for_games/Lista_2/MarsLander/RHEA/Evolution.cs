using System;
using System.Collections.Generic;
using System.Linq;
using Evaluation;
using ForwardModel;
using Models;

namespace RHEA
{
    public class Evolution
    {
        Surface surface;
        Lander lander;
        Simulator simulator;
        List<Sequence> population;
        const int populationSize = 50;
        const int sequenceLength = 20;
        const int selectionSize = 6;
        const int crossoverSize = populationSize - selectionSize;
        readonly int populationsPerIteration = 20;
        Random random = new Random();
        public List<Sequence> Population { get => population; }
        private readonly bool debug;

        public Evolution(Surface surface, Lander lander, bool debug = false)
        {
            this.debug = debug;
            this.surface = surface;
            this.lander = lander;
            this.simulator = new Simulator(lander, surface);
        }

        public int Algorithm()
        {
            Initialize();

            int i = 0;

            for (i = 0; Iteration(); i++) {}

            // Console.WriteLine(i);

            return i;
        }

        public int AlgorithmWithInput()
        {
            Initialize();

            int i = 0;

            while (Iteration()) {
                Console.ReadLine();
            }

            return i;
        }

        public bool Iteration()
        {
            SortByScore();

            for (int i = 0; i < populationsPerIteration; i++)
            {
                Generation();
            }

            SortByScore();

            LanderAction best = population[0][0];


            Lander previous = new Lander();
            previous.Copy(lander);

            lander.Move(best);
            

            var (index, point) = surface.IntersectionSegment(previous.Position, lander.Position);

            

            if (debug)
                lander.Print();
            else
                Console.WriteLine($"{lander.Angle} {lander.Power}");

            Roll();

            return surface.MoveResult(previous, lander) == LandingResult.InProgress;
        }

        public void Roll()
        {
            foreach (Sequence sequence in population)
            {
                sequence.Score = -1;
                sequence.CumulativeScore = 0;
                sequence.RemoveAt(0);
                sequence.Add(simulator.RandomAction());
            }
        }

        public void Generation()
        {
            SortByScore();

            var select = population.Take(selectionSize).ToList();

            var crossovers = new List<Sequence>();

            double sum = 0;

            foreach (Sequence seq in population)
            {
                sum += seq.Score;
            }

            foreach (var sequence in population)
            {
                sequence.Score /= sum;
            }

            double cs = 0;

            for (int i=populationSize-1; i>=0; i--)
            {
                cs += population[i].Score;
                population[i].CumulativeScore = cs;
            }


            while (crossovers.Count < crossoverSize)
            {
                Sequence parent1 = RouleteWheel();
                Sequence parent2 = RouleteWheel();

                while (parent1 == parent2)
                {
                    parent2 = RouleteWheel();
                }

                var (child1, child2) = Crossover(parent1, parent2);

                Mutation(child1);
                Mutation(child2);

                crossovers.Add(child1);
                crossovers.Add(child2);
            }

            population = select;
            population.AddRange(crossovers);

            SortByScore();
        }

        public void Initialize()
        {
            population = new List<Sequence>();

            for (int i = 0; i < populationSize; i++)
            {
                population.Add(simulator.RandomActionSequence(sequenceLength));
            }

            SortByScore();
        }

        public void SortByScore()
        {
            foreach (Sequence sequence in population)
            {
                if (sequence.Score == -1 || double.IsNaN(sequence.Score))
                {
                    simulator.EvaluateSequence(sequence);
                }
            }

            population.Sort((x, y) => y.Score.CompareTo(x.Score));
        }

        public (Sequence, Sequence) Crossover(Sequence parent1, Sequence parent2)
        {
            return Crossover1(parent1, parent2);
        }

        public (Sequence, Sequence) Crossover1(Sequence parent1, Sequence parent2)
        {
            Sequence child1 = new Sequence(sequenceLength);
            Sequence child2 = new Sequence(sequenceLength);

            var crossPoint = random.Next(1, sequenceLength - 1);

            for (int i = 0; i < crossPoint; i++)
            {
                child1.Add(new LanderAction(parent1[i]));
                child2.Add(new LanderAction(parent2[i]));
            }

            for (int i = crossPoint; i < sequenceLength; i++)
            {
                child1.Add(new LanderAction(parent2[i]));
                child2.Add(new LanderAction(parent1[i]));
            }

            return (child1, child2);
        }

        public (Sequence, Sequence) Crossover2(Sequence parent1, Sequence parent2)
        {
            var r = random.NextDouble();

            Sequence child1 = new Sequence(sequenceLength);
            Sequence child2 = new Sequence(sequenceLength);

            for (int i = 0; i < sequenceLength; i++)
            {
                int c1R = (int)Math.Round(r*parent1[i].Rotation + (1-r)*parent2[i].Rotation);
                int c1T = (int)Math.Round(r*parent1[i].Thrust + (1-r)*parent2[i].Thrust); 
                child1.Add(new LanderAction(c1R, c1T));

                int c2R = (int)Math.Round(r*parent2[i].Rotation + (1-r)*parent1[i].Rotation);
                int c2T = (int)Math.Round(r*parent2[i].Thrust + (1-r)*parent1[i].Thrust); 
                child2.Add(new LanderAction(c2R, c2T));
            }

            return (child1, child2);
        }

        public void Mutation(Sequence sequence)
        {
            double probability = 0.5 / sequenceLength;

            for (int i = 1; i < sequence.Count; i++)
            {
                if (random.NextDouble() < probability)
                {
                    sequence[i] = simulator.RandomAction();
                }
            }
        }

        private Sequence RouleteWheel()
        {

            double val = random.NextDouble();

            for (int i = 0; i < population.Count-1; i++)
            {
                if (val < population[i].CumulativeScore && val > population[i+1].CumulativeScore)
                {
                    return population[i];
                }
            }

            return population[population.Count-1];
        }
    }
}
