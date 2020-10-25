using System;
using System.Collections.Generic;
using System.Linq;

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

    public void Set(Game game)
    {
        this.moves = new List<(int, int)>();
        this.moves.AddRange(game.moves);
        this.player = game.player;

        for (int i=0; i<size; i++)
        {
            for (int j=0; j<size; j++)
            {
                this.board[i,j].Set(game.board[i,j]);
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

    public void UndoMove()
    {
        var (row, col) = moves.Last();
        moves.RemoveAt(moves.Count-1);

        int bigRow = row / 3;
        int bigCol = col / 3;

        int smallRow = row % 3;
        int smallCol = col % 3;

        board[bigRow, bigCol].UndoMove(smallRow, smallCol);
        winner = 0;
    }

    protected int CheckWinner()
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
        
        if (IsFinished())
        {
            int p1Wins = 0;
            int p2Wins = 0;

            foreach (var game in board)
            {
                if (game.winner == 1)
                    p1Wins++;
                else if (game.winner == 2)
                    p2Wins++;
            }

            if (p1Wins > p2Wins)
                return 1;
            else if (p2Wins > p1Wins)
                return 2;
            else
                return 3;
        }

        return 0;
    }

    protected bool IsFinished()
    {
        for (int i=0; i<size; i++)
        {
            for (int j=0; j<3; j++)
            {
                if (!board[i,j].IsFinished())
                    return false;
            }
        }

        return true;
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
        Console.WriteLine();
    }

    public List<(int, int)> LegalMoves()
    {
        if (!moves.Any())
            return EmptyFieldsForUnfinished();

        var (lastRow, lastCol) = moves.Last();

        var bigRow = lastRow%size;
        var bigCol = lastCol%size;

        var movesOnSmallBoard = board[bigRow, bigCol].LegalMoves();

        if (!movesOnSmallBoard.Any())
            return EmptyFieldsForUnfinished();

        return movesOnSmallBoard.Select(move =>
                (bigRow*size + move.Item1, bigCol*size + move.Item2))
                .ToList();
    }

    public List<(int, int)> EmptyFieldsForUnfinished()
    {
        List<(int, int)> result = new List<(int, int)>();

        for (int i=0; i<size; i++)
        {
            for (int j=0; j<size; j++)
            {
                var movesOnSmallBoard = board[i,j].LegalMoves().Select(move =>
                    (i*size + move.Item1, j*size + move.Item2));
                result.AddRange(movesOnSmallBoard);
            }
        }

        return result;
    }

    public void PrintSmallBoardsResults()
    {
        for (int i=0; i<size; i++)
        {
            for (int j=0; j<size; j++)
            {
                Console.Write(board[i,j].winner);
            }

            Console.Write("\n");
        }
    }
}
