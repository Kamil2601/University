using System;
using System.Collections.Generic;
using System.Linq;
using Hashing;

namespace Engine
{
    public class GameState
    {
        public int[,] Board { get; set; } = new int[Constants.ROWS, Constants.COLUMNS];
        public int[] ColorQuantity { get; private set; } = new int[5];
        public int Score { get; private set; }
        public bool Terminal { get; private set; }
        public uint Hash { get; set; }

        public void ReadInput()
        {
            for (int i = 14; i >= 0; i--)
            {
                string[] inputs = Console.ReadLine().Split(' ');
                for (int j = 0; j < 15; j++)
                {
                    int color = int.Parse(inputs[j]);
                    Board[i, j] = color;
                }
            }

            Hash = Zobrist.Hash(this);
        }

        public void RandomInit()
        {
            Random random = new Random();

            for (int i=0; i<15; i++)
            {
                for (int j=0; j<15; j++)
                {
                    var color = random.Next(5);
                    ColorQuantity[color]++;
                    Board[i, j] = color;
                }
            }
        }

        public GameState Copy()
        {
            GameState result = new GameState();

            result.Board = Board.Clone() as int[,];
            result.ColorQuantity = ColorQuantity.Clone() as int[];
            result.Score = Score;
            result.Terminal = Terminal;
            result.Hash = Hash;

            return result;
        }

        public void Apply(GameAction action)
        {
            foreach (int yyxx in action.Region)
            {
                Board[yyxx / 100, yyxx % 100] = -1;
            }

            Score += (action.Region.Count - 2) * (action.Region.Count - 2);
            ColorQuantity[action.Color] -= action.Region.Count;

            NormalizeVertically();
            NormalizeHorizontaly();

            Terminal = CheckTerminal();
            if (Board[0, 0]==-1)
                Score += 1000;

            Hash = Zobrist.Hash(this);
        }

        private GameAction ComputeRegion(int x, int y)
        {
            int color = Board[y, x];
            HashSet<int> region = new HashSet<int>();
            HashSet<int> visited = new HashSet<int>();
            Queue<int> open = new Queue<int>();

            open.Enqueue(y * 100 + x);
            visited.Add(y * 100 + x);

            while (open.Any())
            {
                int yyxx = open.Dequeue();
                if (region.Contains(yyxx))
                    continue;

                region.Add(yyxx);

                int up = ((yyxx / 100) - 1) * 100 + yyxx % 100;
                if (yyxx / 100 > 0 && Board[up / 100, up % 100] == color && !visited.Contains(up))
                    open.Enqueue(up);
                visited.Add(up);

                int down = ((yyxx / 100) + 1) * 100 + yyxx % 100;
                if (yyxx / 100 < Constants.COLUMNS - 1 && Board[down / 100, down % 100] == color && !visited.Contains(down))
                    open.Enqueue(down);
                visited.Add(down);

                int left = yyxx - 1;
                if (yyxx % 100 > 0 && Board[left / 100, left % 100] == color && !visited.Contains(left))
                    open.Enqueue(left);
                visited.Add(left);

                int right = yyxx + 1;
                if (yyxx % 100 < Constants.ROWS - 1 && Board[right / 100, right % 100] == color && !visited.Contains(right))
                    open.Enqueue(right);
                visited.Add(right);
            }

            GameAction result = new GameAction()
            {
                X = x,
                Y = y,
                Color = color,
                Region = region
            };

            return result;
        }

        private void NormalizeVertically()
        {
            for (int x = 0; x < Constants.COLUMNS; x++)
            {
                for (int y = 0; y < Constants.ROWS; y++)
                {
                    if (Board[y, x] != -1)
                        continue;

                    int gapEnd = y + 1;
                    while (gapEnd < Constants.ROWS && Board[gapEnd, x] == -1)
                        gapEnd++;

                    if (gapEnd == Constants.ROWS)
                        break; // column checked
                    Board[y, x] = Board[gapEnd, x];
                    Board[gapEnd, x] = -1;
                }
            }
        }

        private void NormalizeHorizontaly()
        {
            for (int x = 0; x < Constants.COLUMNS; x++)
            {
                if (Board[0, x] != -1)
                    continue;

                int gapEnd = x + 1;

                while (gapEnd < Constants.COLUMNS && Board[0, gapEnd] == -1)
                    gapEnd++;

                if (gapEnd == Constants.COLUMNS)
                    return; // all columns checked

                for (int y = 0; y < Constants.ROWS; y++)
                {
                    Board[y, x] = Board[y, gapEnd];
                    Board[y, gapEnd] = -1;
                }
            }
        }

        private bool CheckTerminal()
        {
            return Legals().Count == 0;
        }

        private bool CheckTerminal2()
        {
            if (Board[0, 0] == -1)
                return true;

            HashSet<int> closed = new HashSet<int>();
            Queue<int> open = new Queue<int>();
            open.Enqueue(0);

            while (open.Any())
            {
                int yyxx = open.Dequeue();

                if (closed.Contains(yyxx))
                    continue;
                closed.Add(yyxx);

                int color = Board[yyxx / 100,yyxx % 100];
                if (color == -1)
                    continue;

                int left = yyxx - 1;
                if (yyxx / 100 > 0)
                {
                    if (Board[left / 100,left % 100] == color)
                        return false;
                    if (!closed.Contains(left))
                        open.Enqueue(left);
                }

                int right = yyxx + 1;
                if (yyxx / 100 < Constants.COLUMNS - 1)
                {
                    if (Board[right / 100,right % 100] == color)
                        return false;
                    if (!closed.Contains(right))
                        open.Enqueue(right);
                }

                int down = ((yyxx / 100) - 1) * 100 + yyxx % 100;
                if (yyxx % 100 > 0)
                {
                    if (Board[down / 100,down % 100] == color)
                        return false;
                    if (!closed.Contains(down))
                        open.Enqueue(down);
                }

                int up = ((yyxx / 100) + 1) * 100 + yyxx % 100;
                if (yyxx % 100 < Constants.ROWS - 1)
                {
                    if (Board[up / 100,up % 100] == color)
                        return false;
                    if (!closed.Contains(up))
                        open.Enqueue(up);
                }
            }

            return true;
        }

        public List<GameAction> Legals()
        {
            List<GameAction> actions = new List<GameAction>();
            HashSet<int> closed = new HashSet<int>();

            for (int x = 0; x < Constants.COLUMNS; x++)
            {
                for (int y = 0; y < Constants.ROWS; y++)
                {
                    if (Board[y, x] == -1 || closed.Contains(y * 100 + x))
                        continue;

                    GameAction action = ComputeRegion(x, y);
                    if (action.Region.Count < 2)
                        continue;
                    actions.Add(action);
                    foreach (int yyxx in action.Region)
                        closed.Add(yyxx);
                }
            }
            return actions;
        }

        public override string ToString()
        {
            string result = "";

            for (int i=14; i>=0; i--)
            {
                for (int j=0; j<15; j++)
                {
                    if (Board[i,j]==-1)
                        result += ".";
                    else
                        result += Board[i,j].ToString();
                }
                result += "\n";
            }

            return result;
        }
    }
}
