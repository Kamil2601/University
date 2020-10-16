using System;
using System.Collections.Generic;
using System.Linq;

namespace Simple_Tic_Tac_Toe
{
    class Game
    {
        const int size = 3;
        int player = 1;
        public int[,] board = new int[size, size];
        Random rnd = new Random();

        public Game()
        {}

        public Game(int[,] board, int player)
        {
            this.player = player;
            Array.Copy(board, this.board, size*size);
        }

        public void Reset()
        {
            board = new int[size, size];
            player = 1;
        }

        public void Reset(int[,] board, int player)
        {
            this.player = player;
            Array.Copy(board, this.board, size*size);
        }

        public void RandomGame()
        {
            while (CheckResult() == -1)
            {
                RandomMove();
            }
        }

        public void PrintBoard()
        {
            Console.WriteLine();

            for (int i=0; i<size; i++)
            {
                for (int j=0; j<size; j++)
                {
                    Console.Write($"{board[i,j] }");
                }
                Console.Write("\n");
            }
        }

        public void Move(int i, int j)
        {
            board[i,j] = player;
            player = 3-player;
        }

        int CheckRow(int i)
        {
            HashSet<int> values = new HashSet<int>();

            for (int j=0; j<size; j++)
            {
                values.Add(board[i,j]);
            }

            if (values.Count == 1)
                return values.First();
            else
                return 0;
        }

        int CheckCol(int j)
        {
            HashSet<int> values = new HashSet<int>();

            for (int i=0; i<size; i++)
            {
                values.Add(board[i,j]);
            }

            if (values.Count == 1)
                return values.First();
            else
                return 0;
        }

        int CheckRows()
        {
            for (int i=0; i<size; i++)
            {
                var res = CheckRow(i);

                if (res != 0)
                    return res;
            }

            return 0;
        }

        int CheckCols()
        {
            for (int i=0; i<size; i++)
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

            for (int i=0; i<size; i++)
            {
                values.Add(board[i,i]);
            }

            if (values.Count == 1)
                return values.First();
            else
                return 0;
        }

        int CheckRightDiagonal()
        {
            HashSet<int> values = new HashSet<int>();

            for (int i=0; i<size; i++)
            {
                values.Add(board[i,size-1]);
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
            for (int i=0; i<size; i++)
            {
                for (int j=0; j<size; j++)
                {
                    if (board[i,j] == 0)
                        return false;
                }
            }

            return true;
        }

        int CheckResult()
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

        List<(int, int)> LegalMoves()
        {
            var moves = new List<(int, int)>();

            for (int i=0; i<size; i++)
            {
                for (int j=0; j<size; j++)
                {
                    if (board[i,j] == 0)
                    {
                        moves.Add((i,j));
                    }
                }
            }

            return moves;
        }

        public (int, int) GetRandomMove()
        {
            var moves = LegalMoves();

            if (!moves.Any())
                return (-1,-1);

            return moves[rnd.Next(moves.Count)];
        }

        public bool RandomMove()
        {
            var moves = LegalMoves();

            if (!moves.Any())
                return false;

            var (i,j) = moves[rnd.Next(moves.Count)];
            Move(i,j);

            return true;
        }
    }


    class FlatMC
    {
        // public (int, int) FindBestMove(int[,] board, int player)
        // {
        //     Game game = new Game(board, player);
        // }
    }

    class Player
    {
        
        static void Main(string[] args)
        {
            int [,] board = new int[3,3] {{1,1,0},{2,2,0},{0,0,0}};


            for (int i=0; i<10; i++)
            {
                Game game = new Game(board, 1);
                game.RandomGame();
                game.PrintBoard();
            }

            // for (int i=0; i<10; i++)
            // {
            //     player = 1;

            //     while (RandomMove(player))
            //     {
            //         player = 3 - player;
            //     }

            //     PrintBoard();

            //     board = new int[size, size];
            // }

            // string[] inputs;

            // // game loop
            // while (true)
            // {
            //     inputs = Console.ReadLine().Split(' ');
            //     int opponentRow = int.Parse(inputs[0]);
            //     int opponentCol = int.Parse(inputs[1]);
            //     int validActionCount = int.Parse(Console.ReadLine());


            //     for (int i = 0; i < validActionCount; i++)
            //     {
            //         inputs = Console.ReadLine().Split(' ');
            //         int row = int.Parse(inputs[0]);
            //         int col = int.Parse(inputs[1]);
            //     }

            //     // Write an action using Console.WriteLine()
            //     // To debug: Console.Error.WriteLine("Debug messages...");

            //     Console.WriteLine("0 0");
            // }
        }
    }
}
