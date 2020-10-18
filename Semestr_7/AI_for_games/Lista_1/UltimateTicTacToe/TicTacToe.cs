using System;
using System.Collections.Generic;
using System.Linq;

class TicTacToe
{
    Random random = new Random();
    public const int size = 3;
    public int winner = 0;
    int moves = 0;
    public int[,] board = new int[size, size];

    public void Reset()
    {
        board = new int[size, size];
        // player = 1;
    }

    public int Move(Action action)
    {
        if (action.row < 0 || action.row >= 3 || action.col < 0 ||
            action.col >= 3 || board[action.row, action.col] != 0)
        {
            throw new Exception("Invalid move!");
        }

        board[action.row, action.col] = action.player;
        moves++;

        winner = CheckWinner();
        return winner;
    }

    public bool isFull()
    {
        return moves == 9;
    }


    private int CheckWinner()
    {
        for (int i = 0; i < 3; i++)
        {
            // check rows
            if (board[i, 0] > 0 && board[i, 0] == board[i, 1] && board[i, 0] == board[i, 2])
            {
                return board[i, 0];
            }

            // check cols
            if (board[0, i] > 0 && board[0, i] == board[1, i] && board[0, i] == board[2, i])
            {
                return board[0, i];
            }
        }

        // check diags
        if (board[0, 0] > 0 && board[0, 0] == board[1, 1] && board[0, 0] == board[2, 2])
        {
            return board[0, 0];
        }
        if (board[2, 0] > 0 && board[2, 0] == board[1, 1] && board[2, 0] == board[0, 2])
        {
            return board[2, 0];
        }

        return 0;
    }

    public List<(int, int)> LegalMoves()
    {
        var moves = new List<(int, int)>();

        for (int i = 0; i < size; i++)
        {
            for (int j = 0; j < size; j++)
            {
                if (board[i, j] == 0)
                {
                    moves.Add((i, j));
                }
            }
        }

        return moves;
    }

    public Action RandomMove(int player)
    {
        if (winner != 0)
            return null;

        var legalMoves = LegalMoves();

        if (!legalMoves.Any())
            return null;

        var (i, j) = legalMoves[random.Next(legalMoves.Count)];
        
        Action action = new Action(player, i, j);

        return action;
    }
}
