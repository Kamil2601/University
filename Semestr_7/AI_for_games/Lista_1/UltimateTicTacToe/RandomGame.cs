using System;
using System.Collections.Generic;
using System.Linq;

class RandomGame: Game
{
    Random random = new Random();

    public int RandomMove()
    {
        if (!moves.Any())
        {
            var row = random.Next(9);
            var col = random.Next(9);

            return Move(row,col);
        }

        var (lastRow, lastCol) = moves.Last();

        var bigRow = lastRow%size;
        var bigCol = lastCol%size;

        Action action = board[bigRow, bigCol].RandomMove(player);

        if (action == null)
        {
            var emptyFields = EmptyFields();
            var (row, col) = emptyFields[random.Next(emptyFields.Count)];

            return Move(row, col);
        }
        else
        {
            var row = bigRow*size+action.row;
            var col = bigCol*size+action.col;

            return Move(row, col);
        }
    }

    public List<(int, int)> EmptyFields()
    {
        List<(int, int)> result = new List<(int, int)>();

        for (int i=0; i<size; i++)
        {
            for (int j=0; j<size; j++)
            {
                result.AddRange(board[i,j].LegalMoves());
            }
        }

        return result;
    }
}
