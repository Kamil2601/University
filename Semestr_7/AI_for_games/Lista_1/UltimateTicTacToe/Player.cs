using System;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Player
{
    static void Main(string[] args)
    {

        RandomGame game = new RandomGame();

        for (int i=0; i<10; i++)
        {
            game.RandomMove();
            Console.WriteLine(game.moves.FindLast(x => true));
            game.PrintBoard();
        }

        // string[] inputs;

        // // game loop
        // while (true)
        // {
        //     inputs = Console.ReadLine().Split(' ');
        //     int opponentRow = int.Parse(inputs[0]);
        //     int opponentCol = int.Parse(inputs[1]);
        //     int validActionCount = int.Parse(Console.ReadLine());
        //     for (int i = 0; i < validActionCount; i++)
        //     {
        //         inputs = Console.ReadLine().Split(' ');
        //         int row = int.Parse(inputs[0]);
        //         int col = int.Parse(inputs[1]);
        //     }

        //     // Write an action using Console.WriteLine()
        //     // To debug: Console.Error.WriteLine("Debug messages...");

        //     Console.WriteLine("0 0");
        // }
    }
}
