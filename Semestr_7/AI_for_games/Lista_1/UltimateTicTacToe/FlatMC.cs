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
        this.player = game.player;
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

        int i=0;

        while ((DateTime.Now - start) < time)
        {
            i++;
            Simulate();
        }


        return BestMove();
    }
    public void Simulate()
    {
        game.Set(copy);

        var moveNumber = random.Next(legalMoves.Count);
        legalMoves[moveNumber].games++;

        var (row, col) = legalMoves[moveNumber].move;

        var result = game.Play();

        if (result == 3)
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
