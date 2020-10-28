using System;
using System.Collections.Generic;
using System.Linq;

class Game
{
    public int Player { get; set; } = 1;
    public int Winner { get; set; } = 0;
    public List<Action> moves;
    private TicTacToe[,] board = new TicTacToe[size, size];
    private const int size = 3;

    public Game()
    {
        moves = new List<Action>();

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
        this.moves = new List<Action>();
        this.moves.AddRange(game.moves);
        this.Player = game.Player;
        this.Winner = 0;

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

        Action action = new Action(Player, smallRow, smallCol);

        board[bigRow, bigCol].Move(action);

        moves.Add(new Action(Player, row, col));

        Player = 3 - Player;

        Winner = CheckWinner();
        return Winner;
    }

    public void UndoMove()
    {
        var (row, col) = moves.Last().Move;
        moves.RemoveAt(moves.Count-1);

        int bigRow = row / 3;
        int bigCol = col / 3;

        int smallRow = row % 3;
        int smallCol = col % 3;

        board[bigRow, bigCol].UndoMove(smallRow, smallCol);
        Winner = 0;
    }

    protected int CheckWinner()
    {
        for (int i = 0; i < 3; i++)
        {
            // check rows
            if (board[i, 0].Winner > 0 && board[i, 0].Winner == board[i, 1].Winner
                && board[i, 0].Winner == board[i, 2].Winner)
            {
                return board[i, 0].Winner;
            }

            // check cols
            if (board[0, i].Winner > 0 && board[0, i].Winner == board[1, i].Winner
                && board[0, i].Winner == board[2, i].Winner)
            {
                return board[0, i].Winner;
            }
        }

        // check diags
        if (board[0, 0].Winner > 0 && board[0, 0].Winner == board[1, 1].Winner
            && board[0, 0].Winner == board[2, 2].Winner)
        {
            return board[0, 0].Winner;
        }
        if (board[2, 0].Winner > 0 && board[2, 0].Winner == board[1, 1].Winner
            && board[2, 0].Winner == board[0, 2].Winner)
        {
            return board[2, 0].Winner;
        }
        
        if (IsFinished())
        {
            int p1Wins = 0;
            int p2Wins = 0;

            foreach (var game in board)
            {
                if (game.Winner == 1)
                    p1Wins++;
                else if (game.Winner == 2)
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

        var (lastRow, lastCol) = moves.Last().Move;

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
                Console.Write(board[i,j].Winner);
            }

            Console.Write("\n");
        }
    }
}
