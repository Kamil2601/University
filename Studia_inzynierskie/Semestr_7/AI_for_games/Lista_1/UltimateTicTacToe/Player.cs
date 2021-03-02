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
        CodinGame();
        // Game game = new Game();

        // MCTSWithMAST mcts = new MCTSWithMAST(game);

        // TimeSpan time = new TimeSpan(0,0,0,0,95);

        // var move = mcts.Search(time);

        // mcts.PrintActionStats();
    }


    static void CodinGame()
    {
        Game game = new Game();

        MCTSWithMAST mcts = new MCTSWithMAST(game);

        TimeSpan time = new TimeSpan(0,0,0,0,95);
        TimeSpan firstMoveTime = new TimeSpan(0,0,0,0,995);

        bool firstMove = true;
        int row, col;

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
                mcts.Move(opponentRow, opponentCol);
            }

            if (firstMove)
            {
                (row, col) = mcts.Search(firstMoveTime);
                firstMove = false;
            }
            else
            {
                (row, col) = mcts.Search(time);
            }

            mcts.Move(row, col);

            mcts.DecayStats();

            // Write an action using Console.WriteLine()
            // To debug: Console.Error.WriteLine("Debug messages...");

            Console.WriteLine($"{row} {col}");
        }
    }
}
