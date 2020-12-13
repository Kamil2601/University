using System;
using System.Collections.Generic;
using ForwardModel.Games;

namespace FallChallenge2020
{
    class A
    {
        public int x;

        public A(int x)
        {
            this.x = x;
        }
    }
    class Program
    {
        static void Main(string[] args)
        {

            List<A> list = new List<A>() { new A(1), new A(2)};

            (list[0], list[1]) = (list[1], list[0]);

            Console.WriteLine(list[0].x);
            // RandomGame game = new RandomGame();

            // Console.WriteLine(game.Play());
        }

        public static void RunCodinGame()
        {
            
        }
    }
}
