using System;
using System.Collections.Generic;
using System.Linq;

class FlatMC
{
    List<MoveStats> legalMoves;
    Random random = new Random();
    RandomGame game;
    Game copy;
    int player;

    public FlatMC(Game game)
    {
        this.game = new RandomGame();
        legalMoves = game.LegalMoves().Select(move =>
            new MoveStats(move)).ToList();
        copy = game;
        this.player = game.Player;
    }

    public (int, int) BestMove()
    {
        return legalMoves.Where(move => move.games > 0)
            .OrderByDescending(move => (double)move.points / (double)move.games)
            .First().move;
    }

    public (int, int) FindBestMove(TimeSpan time)
    {
        DateTime start = DateTime.Now;

        while ((DateTime.Now - start) < time)
        {
            Simulate();
        }

        return BestMove();
    }

    public int SimulationCount(TimeSpan time)
    {
        DateTime start = DateTime.Now;

        int count = 0;

        while ((DateTime.Now - start) < time)
        {
            Simulate();
            count++;
        }

        return count;
    }

    public void Simulate()
    {
        game.Set(copy);

        var moveNumber = random.Next(legalMoves.Count);
        legalMoves[moveNumber].games++;

        var (row, col) = legalMoves[moveNumber].move;

        var result = game.Play();

        if (result == 0)
            legalMoves[moveNumber].points += 1;
        else if (result == player)
            legalMoves[moveNumber].points += 2;
    }

    public void PrintStats()
    {
        foreach (var moveStats in legalMoves)
        {
            Console.WriteLine($"{moveStats.move}: G = {moveStats.games} P = {moveStats.points}; R = {(double)moveStats.points/(double)moveStats.games}");
        }
    }
}
