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
        const int selectionSize = 20;
        const int crossoverSize = populationSize - selectionSize;
        readonly int populationsPerIteration;

        Random random = new Random();

        public List<Sequence> Population { get => population; }

        public Evolution(Surface surface, Lander lander, int populations)
        {
            this.surface = surface;
            this.lander = lander;
            this.simulator = new Simulator(lander, surface);
            this.populationsPerIteration = populations;
        }

        public int Algorithm()
        {
            Initialize();

            int i=0;

            for (i=0; Iteration(); i++)
            { }

            Console.WriteLine(i);

            return i;
        }

        public bool Iteration()
        {
            SortByScore();

            for (int i=0; i<populationsPerIteration; i++)
            {
                Generation();
            }

            SortByScore();

            LanderAction best = population[0][0];

            Console.WriteLine($"{best.Rotation}, {best.Thrust}");


            Lander previous  = new Lander();
            previous.Copy(lander);

            lander.PerformAction(best);
            lander.Move();
            lander.Print();

            Roll();

            var (index, point) = surface.IntersectionSegment(previous.Position, lander.Position);

            Console.WriteLine(index);
            Console.WriteLine(point);

            return index == -1;
        }

        public void Roll()
        {
            foreach (Sequence sequence in population)
            {
                sequence.Score = 0;
                sequence.RemoveAt(0);
                sequence.Add(simulator.RandomAction());
            }
        }

        public void Generation()
        {
            SortByScore();

            var select = population.Take(selectionSize).ToList();

            var crossovers = new List<Sequence>();

            while (crossovers.Count < crossoverSize)
            {
                Sequence parent1 = select[random.Next(select.Count)];
                Sequence parent2 = select[random.Next(select.Count)];

                while (parent1 == parent2)
                    parent2 = select[random.Next(select.Count)];

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
                if (sequence.Score == -1)
                {
                    simulator.EvaluateSequence(sequence);
                }
            }

            population.Sort((x, y) => y.Score.CompareTo(x.Score));
        }

        public (Sequence, Sequence) Crossover(Sequence parent1, Sequence parent2)
        {
            Sequence child1 = new Sequence(sequenceLength);
            Sequence child2 = new Sequence(sequenceLength);

            var crossPoint = random.Next(1,sequenceLength-1);

            for (int i=0; i<crossPoint; i++)
            {
                child1.Add(new LanderAction(parent1[i]));
                child2.Add(new LanderAction(parent2[i]));
            }

            for (int i=crossPoint; i<sequenceLength; i++)
            {
                child1.Add(new LanderAction(parent2[i]));
                child2.Add(new LanderAction(parent1[i]));
            }
            
            return (child1, child2);
        }

        public void Mutation(Sequence sequence)
        {
            double probability = 1.0/sequenceLength;

            for (int i = 1; i < sequence.Count; i++)
            {
                if (random.NextDouble() < probability)
                {
                    sequence[i] = simulator.RandomAction();
                }
            }
        }
    }
}
