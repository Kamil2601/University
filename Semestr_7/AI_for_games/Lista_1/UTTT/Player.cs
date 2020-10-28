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

        // MCTSParams mCTSParams = new MCTSParams() {
        //     TreeDecayCoefficient = 0.5,
        //     TreePolicyCoefficient = 1,
        //     UseMAST = true,
        //     MASTDecayCoefficient = 0.5,
        //     MASTRandomMoveChance = 0.5
        // };

        // MCTS mcts = new MCTS(game, mCTSParams);

        // TimeSpan time = new TimeSpan(0,0,0,0,95);
        // TimeSpan firstMoveTime = new TimeSpan(0,0,0,0,995);

        // mcts.Search(time);
    }


    static void CodinGame()
    {
        Game game = new Game();

        MCTSParams mCTSParams = new MCTSParams() {
            TreeDecayCoefficient = 0.2,
            TreePolicyCoefficient = 0.7,
            UseMAST = false,
            MASTDecayCoefficient = 0.1,
            MASTRandomMoveChance = 0.4
        };

        MCTS mcts = new MCTS(game, mCTSParams);

        TimeSpan time = new TimeSpan(0,0,0,0,97);
        TimeSpan firstMoveTime = new TimeSpan(0,0,0,0,997);

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
