using System;
using System.Collections.Generic;
using System.Linq;

namespace Simple_Tic_Tac_Toe
{
    class Game
    {
        public const int size = 3;
        public int player = 1;
        public int[,] board = new int[size, size];

        public Game()
        { }

        public Game(int[,] board, int player)
        {
            this.player = player;
            Array.Copy(board, this.board, size * size);
        }

        public void Reset()
        {
            board = new int[size, size];
            player = 1;
        }

        public void Set(int[,] board, int player)
        {
            this.player = player;
            Array.Copy(board, this.board, size * size);
        }

        public void Move(int i, int j)
        {
            board[i, j] = player;
            player = 3 - player;
        }

        public void PrintBoard()
        {
            Console.WriteLine();

            for (int i = 0; i < size; i++)
            {
                for (int j = 0; j < size; j++)
                {
                    Console.Write($"{board[i, j] }");
                }
                Console.Write("\n");
            }
        }


    }

    class RandomGame : Game
    {
        public RandomGame()
        { }

        public RandomGame(int[,] board, int player)
        {
            this.player = player;
            Array.Copy(board, this.board, size * size);
        }

        Random rnd = new Random();

        public void Play()
        {
            while (CheckResult() == -1)
            {
                RandomMove();
            }
        }

        int CheckRow(int i)
        {
            HashSet<int> values = new HashSet<int>();

            for (int j = 0; j < size; j++)
            {
                values.Add(board[i, j]);
            }

            if (values.Count == 1)
                return values.First();
            else
                return 0;
        }

        int CheckCol(int j)
        {
            HashSet<int> values = new HashSet<int>();

            for (int i = 0; i < size; i++)
            {
                values.Add(board[i, j]);
            }

            if (values.Count == 1)
                return values.First();
            else
                return 0;
        }

        int CheckRows()
        {
            for (int i = 0; i < size; i++)
            {
                var res = CheckRow(i);

                if (res != 0)
                    return res;
            }

            return 0;
        }

        int CheckCols()
        {
            for (int i = 0; i < size; i++)
            {
                var res = CheckCol(i);

                if (res != 0)
                    return res;
            }

            return 0;
        }

        int CheckLeftDiagonal()
        {
            HashSet<int> values = new HashSet<int>();

            for (int i = 0; i < size; i++)
            {
                values.Add(board[i, i]);
            }

            if (values.Count == 1)
                return values.First();
            else
                return 0;
        }

        int CheckRightDiagonal()
        {
            HashSet<int> values = new HashSet<int>();

            for (int i = 0; i < size; i++)
            {
                values.Add(board[i, size - 1]);
            }

            if (values.Count == 1)
                return values.First();
            else
                return 0;
        }

        int CheckDiagonals()
        {
            var result = CheckLeftDiagonal();

            if (result != 0)
                return result;

            result = CheckRightDiagonal();

            return result;
        }

        bool IsFull()
        {
            for (int i = 0; i < size; i++)
            {
                for (int j = 0; j < size; j++)
                {
                    if (board[i, j] == 0)
                        return false;
                }
            }

            return true;
        }

        public int CheckResult()
        {
            var result = -1;

            result = CheckRows();

            if (result != 0)
                return result;

            result = CheckCols();

            if (result != 0)
                return result;

            result = CheckDiagonals();

            if (result != 0)
                return result;

            if (!IsFull())
            {
                return -1;
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

        public bool RandomMove()
        {
            var moves = LegalMoves();

            if (!moves.Any())
                return false;

            var (i, j) = moves[rnd.Next(moves.Count)];
            Move(i, j);

            return true;
        }
    }

    class MoveStats
    {
        public (int, int) move;
        public int games = 0;
        public int points = 0;

        public MoveStats((int, int) move)
        {
            this.move = move;
        }
    }

    class FlatMC
    {
        RandomGame game;
        int[,] board = new int[3, 3];
        int player;
        List<MoveStats> legalMoves;
        Random random = new Random();


        public FlatMC(Game game)
        {
            player = game.player;
            Array.Copy(game.board, this.board, 9);
            this.game = new RandomGame(game.board, game.player);
            legalMoves = this.game.LegalMoves().Select(move => new MoveStats(move)).ToList();
        }

        public void Simulate()
        {
            game.Set(board, player);

            var moveNumber = random.Next(legalMoves.Count);
            legalMoves[moveNumber].games++;

            var (y, x) = legalMoves[moveNumber].move;

            game.Move(y, x);

            game.Play();

            var result = game.CheckResult();

            if (result == 0)
                legalMoves[moveNumber].points += 1;
            else if (result == player)
                legalMoves[moveNumber].points += 2;
        }

        public (int, int) BestMove()
        {
            return legalMoves.Where(move => move.games > 0)
                .OrderByDescending(move => (double)move.points / (double)move.games)
                .First().move;
        }

        public (int, int) FindBestMove(int msForMove)
        {
            DateTime start = DateTime.Now;

            game.Set(board, player);

            while ((DateTime.Now - start).Milliseconds < msForMove)
            {
                Simulate();
            }

            return BestMove();
        }

        public void PrintStats()
        {
            foreach (var moveStats in legalMoves)
            {
                var r = (double)moveStats.points / (double)moveStats.games;
                Console.WriteLine($"{moveStats.move}, G = {moveStats.games}, P = {moveStats.points}, R = {r}");
            }
        }
    }

    class Player
    {

        static void Main(string[] args)
        {
            Game game = new Game();

            FlatMC flatMC;

            string[] inputs;

            while (true)
            {
                inputs = Console.ReadLine().Split(' ');
                int opponentRow = int.Parse(inputs[0]);
                int opponentCol = int.Parse(inputs[1]);
                int validActionCount = int.Parse(Console.ReadLine());
                for (int i = 0; i < validActionCount; i++)
                {
                    inputs = Console.ReadLine().Split(' ');
                    int r = int.Parse(inputs[0]);
                    int c = int.Parse(inputs[1]);
                }

                if (opponentRow != -1)
                    game.Move(opponentRow, opponentCol);

                flatMC = new FlatMC(game);

                var (row, col) = flatMC.FindBestMove(98);

                game.Move(row, col);



                // Write an action using Console.WriteLine()
                // To debug: Console.Error.WriteLine("Debug messages...");

                Console.WriteLine($"{row} {col}");
            }
        }
    }
}
