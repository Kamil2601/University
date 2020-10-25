using System;
using System.IO;

class TestGame
{
    string path;

    public TestGame(string path)
    {
        this.path = path;
    }

    public void Play()
    {
        Game game = new Game();

        using (StreamReader sr = File.OpenText(path))
        {
            string s;
            string []inputs;
            while ((s = sr.ReadLine()) != null)
            {
                inputs = s.Split(' ');
                int row = int.Parse(inputs[0]);
                int col = int.Parse(inputs[1]);

                game.Move(row, col);
            }
        }

        FlatMC flatMC = new FlatMC(game);

        TimeSpan time = new TimeSpan(0,0,0,0,100);

        Console.WriteLine(flatMC.FindBestMove(time));

        // game.PrintBoard();
        // game.PrintSmallBoardsResults();
        // Console.WriteLine(game.player);
        // Console.WriteLine(game.moves[game.moves.Count-1]);

        // Console.WriteLine(game.LegalMoves().Count);

        // foreach (var move in game.LegalMoves())
        // {
        //     Console.WriteLine(move);
        // }
    }
}
