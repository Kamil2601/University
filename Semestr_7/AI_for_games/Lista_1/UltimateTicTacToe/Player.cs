using System;
using System.Collections.Generic;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Player
{
    static void Main(string[] args)
    {
        Game game = new Game();

        FlatMC flatMC;

        flatMC = new FlatMC(game);

        TimeSpan time = new TimeSpan(0,0,0,0,98);
        
        string[] inputs;


        // game loop
        while (true)
        {
            inputs = Console.ReadLine().Split(' ');
            int opponentRow = int.Parse(inputs[0]);
            int opponentCol = int.Parse(inputs[1]);
            int validActionCount = int.Parse(Console.ReadLine());
            for (int i = 0; i < validActionCount; i++)
            {
                inputs = Console.ReadLine().Split(' ');
                // int row = int.Parse(inputs[0]);
                // int col = int.Parse(inputs[1]);
            }

            if (opponentRow != -1)
            {
                game.Move(opponentRow, opponentCol);
            }

            flatMC = new FlatMC(game);

             var (row, col) = flatMC.FindBestMove(time);

             game.Move(row, col);

            // Write an action using Console.WriteLine()
            // To debug: Console.Error.WriteLine("Debug messages...");

            Console.WriteLine($"{row} {col}");
        }
    }
}
