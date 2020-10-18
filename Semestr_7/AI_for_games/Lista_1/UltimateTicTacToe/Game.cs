using System;
using System.Collections.Generic;

class Game
{
    public const int size = 3;
    public int player = 1;
    public int winner = 0;
    public List<(int, int)> moves;
    public TicTacToe[,] board = new TicTacToe[size, size];

    public Game()
    {
        moves = new List<(int, int)>();

        for (int i=0; i<size; i++)
        {
            for (int j=0; j<size; j++)
            {
                board[i,j] = new TicTacToe();
            }
        }
    }

    public int Move(int row, int col)
    {
        int bigRow = row / 3;
        int bigCol = col / 3;

        int smallRow = row % 3;
        int smallCol = col % 3;

        Action action = new Action(player, smallRow, smallCol);

        board[bigRow, bigCol].Move(action);

        moves.Add((row, col));

        player = 3 - player;

        winner = CheckWinner();
        return winner;
    }

    private int CheckWinner()
    {
        for (int i = 0; i < 3; i++)
        {
            // check rows
            if (board[i, 0].winner > 0 && board[i, 0].winner == board[i, 1].winner
                && board[i, 0].winner == board[i, 2].winner)
            {
                return board[i, 0].winner;
            }

            // check cols
            if (board[0, i].winner > 0 && board[0, i].winner == board[1, i].winner
                && board[0, i].winner == board[2, i].winner)
            {
                return board[0, i].winner;
            }
        }

        // check diags
        if (board[0, 0].winner > 0 && board[0, 0].winner == board[1, 1].winner
            && board[0, 0].winner == board[2, 2].winner)
        {
            return board[0, 0].winner;
        }
        if (board[2, 0].winner > 0 && board[2, 0].winner == board[1, 1].winner
            && board[2, 0].winner == board[0, 2].winner)
        {
            return board[2, 0].winner;
        }

        return 0;
    }

    public void PrintBoard()
    {
        for (int row=0; row<9; row++)
        {
            for (int col=0; col<9; col++)
            {
                int bigRow = row / 3;
                int bigCol = col / 3;

                int smallRow = row % 3;
                int smallCol = col % 3;

                Console.Write(board[bigRow, bigCol].board[smallRow, smallCol]);
                if (col == 2 || col == 5)
                    Console.Write("|");
            }

            Console.Write("\n");

            if (row == 2 || row == 5)
                Console.Write("-----------\n");
        }
    }
}
