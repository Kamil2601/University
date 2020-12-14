using System;
using System.Linq;
using JPS.Models;

namespace JPS.Algorithm
{
    public class Preprocessing
    {
        int width, height;
        string[] board;
        PrimaryJumpPoint[,] primaryJumpPoints;
        Distance[,] distance;

        public void Run()
        {
            LoadInput();
            PrimaryJumpPoints();
            LefDistance();
            RightDistance();
            UpDistance();
            DownDistance();
            UpLeftDistance();
            UpRightDistance();
            DownLeftDistance();
            DownRightDistance();
        }

        public void LoadInput()
        {
            string[] inputs = Console.ReadLine().Split(' ');
            int width = int.Parse(inputs[0]);
            int height = int.Parse(inputs[1]);

            this.width = width;
            this.height = height;

            board = new string[height + 2];
            primaryJumpPoints = new PrimaryJumpPoint[height + 2, width + 2];
            distance = new Distance[height + 2, width + 2];

            for (int i = 0; i < height + 2; i++)
            {
                for (int j = 0; j < width + 2; j++)
                {
                    primaryJumpPoints[i, j] = new PrimaryJumpPoint();
                    distance[i, j] = new Distance();
                }
            }

            board[0] = string.Concat(Enumerable.Repeat("#", width + 2));
            board[height + 1] = string.Concat(Enumerable.Repeat("#", width + 2));

            for (int i = 1; i <= height; i++)
            {
                board[i] = "#" + Console.ReadLine() + "#";
            }
        }

        public void PrimaryJumpPoints()
        {
            for (int i = 1; i <= height; i++)
            {
                for (int j = 1; j <= width; j++)
                {
                    SetPrimaryJumpPoint(i, j);
                }
            }
        }

        private void SetPrimaryJumpPoint(int row, int col)
        {
            if (board[row][col - 1] == '.')
            {
                if (board[row - 1][col - 1] == '#' && board[row - 1][col] == '.' ||
                    board[row + 1][col - 1] == '#' && board[row + 1][col] == '.')
                {
                    primaryJumpPoints[row, col].Right = true;
                }
            }
            if (board[row][col + 1] == '.')
            {
                if (board[row - 1][col + 1] == '#' && board[row - 1][col] == '.' ||
                    board[row + 1][col + 1] == '#' && board[row + 1][col] == '.')
                {
                    primaryJumpPoints[row, col].Left = true;
                }
            }
            if (board[row - 1][col] == '.')
            {
                if (board[row - 1][col - 1] == '#' && board[row][col - 1] == '.' ||
                    board[row - 1][col + 1] == '#' && board[row][col + 1] == '.')
                {
                    primaryJumpPoints[row, col].Down = true;
                }
            }
            if (board[row + 1][col] == '.')
            {
                if (board[row + 1][col - 1] == '#' && board[row][col - 1] == '.' ||
                    board[row + 1][col + 1] == '#' && board[row][col + 1] == '.')
                {
                    primaryJumpPoints[row, col].Up = true;
                }
            }
        }

        public void LefDistance()
        {
            for (int r = 1; r <= height; r++)
            {
                int count = -1;
                bool jumpPointLastSeen = false;
                for (int c = 1; c <= width; c++)
                {
                    if (board[r][c] == '#')
                    {
                        count = -1;
                        jumpPointLastSeen = false;
                        distance[r, c].Left = 0;
                        continue;
                    }
                    count++;
                    if (jumpPointLastSeen)
                    {
                        distance[r, c].Left = count;
                    }
                    else
                    {
                        distance[r, c].Left = -count;
                    }
                    if (primaryJumpPoints[r, c].Left)
                    {
                        count = 0;
                        jumpPointLastSeen = true;
                    }
                }
            }
        }

        public void RightDistance()
        {
            for (int r = 1; r <= height; r++)
            {
                int count = -1;
                bool jumpPointLastSeen = false;
                for (int c = width; c >= 1; c--)
                {
                    if (board[r][c] == '#')
                    {
                        count = -1;
                        jumpPointLastSeen = false;
                        distance[r, c].Right = 0;
                        continue;
                    }
                    count++;
                    if (jumpPointLastSeen)
                    {
                        distance[r, c].Right = count;
                    }
                    else
                    {
                        distance[r, c].Right = -count;
                    }
                    if (primaryJumpPoints[r, c].Right)
                    {
                        count = 0;
                        jumpPointLastSeen = true;
                    }
                }
            }
        }

        public void UpDistance()
        {
            for (int c = 1; c <= width; c++)
            {
                int count = -1;
                bool jumpPointLastSeen = false;
                for (int r = 1; r <= height; r++)
                {
                    if (board[r][c] == '#')
                    {
                        count = -1;
                        jumpPointLastSeen = false;
                        distance[r, c].Up = 0;
                        continue;
                    }
                    count++;
                    if (jumpPointLastSeen)
                    {
                        distance[r, c].Up = count;
                    }
                    else
                    {
                        distance[r, c].Up = -count;
                    }
                    if (primaryJumpPoints[r, c].Up)
                    {
                        count = 0;
                        jumpPointLastSeen = true;
                    }
                }
            }
        }

        public void DownDistance()
        {
            for (int c = 1; c <= width; c++)
            {
                int count = -1;
                bool jumpPointLastSeen = false;
                for (int r = height; r >= 1; r--)
                {
                    if (board[r][c] == '#')
                    {
                        count = -1;
                        jumpPointLastSeen = false;
                        distance[r, c].Down = 0;
                        continue;
                    }
                    count++;
                    if (jumpPointLastSeen)
                    {
                        distance[r, c].Down = count;
                    }
                    else
                    {
                        distance[r, c].Down = -count;
                    }
                    if (primaryJumpPoints[r, c].Down)
                    {
                        count = 0;
                        jumpPointLastSeen = true;
                    }
                }
            }
        }

        public void UpLeftDistance()
        {
            for (int r = 1; r <= height; r++)
            {
                for (int c = 1; c <= width; c++)
                {
                    if (!IsWall(r, c))
                    {
                        if (IsWall(r - 1, c) ||
                            IsWall(r, c - 1) || IsWall(r - 1, c - 1))
                        {
                            //Wall one away
                            distance[r, c].UpLeft = 0;
                        }
                        else if (!IsWall(r - 1, c) && !IsWall(r, c - 1) &&
                            (distance[r - 1, c - 1].Up > 0 ||
                            distance[r - 1, c - 1].Left > 0))
                        {
                            //Straight jump point one away
                            distance[r, c].UpLeft = 1;
                        }
                        else
                        {
                            //Increment from last
                            int jumpDistance = distance[r - 1, c - 1].UpLeft;
                            if (jumpDistance > 0)
                            {
                                distance[r, c].UpLeft = 1 + jumpDistance;
                            }
                            else
                            {
                                distance[r, c].UpLeft = -1 + jumpDistance;
                            }
                        }
                    }
                }
            }
        }

        public void UpRightDistance()
        {
            for (int r = 1; r <= height; r++)
            {
                for (int c = width; c >= 1; c--)
                {
                    if (!IsWall(r, c))
                    {
                        if (IsWall(r - 1, c) ||
                            IsWall(r, c + 1) || IsWall(r - 1, c + 1))
                        {
                            //Wall one away
                            distance[r, c].UpRight = 0;
                        }
                        else if (!IsWall(r - 1, c) && !IsWall(r, c + 1) &&
                            (distance[r - 1, c + 1].Up > 0 ||
                            distance[r - 1, c + 1].Right > 0))
                        {
                            //Straight jump point one away
                            distance[r, c].UpRight = 1;
                        }
                        else
                        {
                            //Increment from last
                            int jumpDistance = distance[r - 1, c + 1].UpRight;
                            if (jumpDistance > 0)
                            {
                                distance[r, c].UpRight = 1 + jumpDistance;
                            }
                            else
                            {
                                distance[r, c].UpRight = -1 + jumpDistance;
                            }
                        }
                    }
                }
            }
        }

        public void DownLeftDistance()
        {
            for (int r = height; r >= 1; r--)
            {
                for (int c = 1; c <= width; c++)
                {
                    if (!IsWall(r, c))
                    {
                        if (IsWall(r + 1, c) ||
                            IsWall(r, c - 1) || IsWall(r + 1, c - 1))
                        {
                            //Wall one away
                            distance[r, c].DownLeft= 0;
                        }
                        else if (!IsWall(r + 1, c) && !IsWall(r, c - 1) &&
                            (distance[r + 1, c - 1].Down > 0 ||
                            distance[r + 1, c - 1].Left > 0))
                        {
                            //Straight jump point one away
                            distance[r, c].DownLeft = 1;
                        }
                        else
                        {
                            //Increment from last
                            int jumpDistance = distance[r + 1, c - 1].DownLeft;
                            if (jumpDistance > 0)
                            {
                                distance[r, c].DownLeft = 1 + jumpDistance;
                            }
                            else
                            {
                                distance[r, c].DownLeft = -1 + jumpDistance;
                            }
                        }
                    }
                }
            }
        }

        public void DownRightDistance()
        {
            for (int r = height; r >= 1; r--)
            {
                for (int c = width; c >= 1; c--)
                {
                    if (!IsWall(r, c))
                    {
                        if (IsWall(r + 1, c) ||
                            IsWall(r, c + 1) || IsWall(r + 1, c + 1))
                        {
                            //Wall one away
                            distance[r, c].DownRight = 0;
                        }
                        else if (!IsWall(r + 1, c) && !IsWall(r, c + 1) &&
                            (distance[r + 1, c + 1].Down > 0 ||
                            distance[r + 1, c + 1].Right > 0))
                        {
                            //Straight jump point one away
                            distance[r, c].DownRight = 1;
                        }
                        else
                        {
                            //Increment from last
                            int jumpDistance = distance[r + 1, c + 1].DownRight;
                            if (jumpDistance > 0)
                            {
                                distance[r, c].DownRight = 1 + jumpDistance;
                            }
                            else
                            {
                                distance[r, c].DownRight = -1 + jumpDistance;
                            }
                        }
                    }
                }
            }
        }

        private bool IsWall(int r, int c)
        {
            return board[r][c] == '#';
        }

        public void PrintBoard()
        {
            for (int i = 0; i < height + 2; i++)
            {
                Console.WriteLine(board[i]);
            }
        }

        public void PrintSolution()
        {
            for (int i=1; i<=height; i++)
            {
                for (int j=1; j<=width; j++)
                {
                    if (!IsWall(i,j))
                        Console.WriteLine($"{j-1} {i-1} {distance[i,j].ToString()}");
                }
            }
        }

    }
}
