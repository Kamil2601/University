using System;
using System.Collections.Generic;
using System.Linq;

class RandomGame: Game
{
    Random random = new Random();

    public int RandomMove()
    {
        var legalMoves = LegalMoves();

        var (row, col) = legalMoves[random.Next(legalMoves.Count)];

        return Move(row, col);
    }

    public int Play()
    {
        int result = winner;

        while (result == 0)
        {
            result = RandomMove();
            // PrintBoard();
        }

        return result;
    }
}
