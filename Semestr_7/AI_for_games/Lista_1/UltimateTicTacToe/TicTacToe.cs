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

    public void Set(TicTacToe src)
    {
        // Array.Copy(board, this.board, size * size);

        this.moves = src.moves;
        this.winner = src.winner;

        for (int i=0; i<size; i++)
        {
            for (int j=0; j<size; j++)
            {
                this.board[i,j]=src.board[i,j];
            }
        }
    }

    public void Reset()
    {
        board = new int[size, size];
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

    public void UndoMove(int row, int col)
    {
        board[row, col] = 0;
        winner = 0;
    }

    public bool IsFull()
    {
        return moves == 9;
    }

    public bool IsFinished()
    {
        return winner > 0 || IsFull();
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

        if (IsFull())
            return 3;

        return 0;
    }

    public List<(int, int)> EmptyFields()
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

    public List<(int, int)> LegalMoves()
    {
        if (winner != 0)
            return new List<(int, int)>();

        return EmptyFields();
    }
}
