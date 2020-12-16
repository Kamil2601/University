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
            EastDistance();
            NorthDistance();
            SouthDistance();
            NorthWestDistance();
            NorthEastDistance();
            SouthWestDistance();
            SouthEastDistance();
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
                    primaryJumpPoints[row, col].East = true;
                }
            }
            if (board[row][col + 1] == '.')
            {
                if (board[row - 1][col + 1] == '#' && board[row - 1][col] == '.' ||
                    board[row + 1][col + 1] == '#' && board[row + 1][col] == '.')
                {
                    primaryJumpPoints[row, col].West = true;
                }
            }
            if (board[row - 1][col] == '.')
            {
                if (board[row - 1][col - 1] == '#' && board[row][col - 1] == '.' ||
                    board[row - 1][col + 1] == '#' && board[row][col + 1] == '.')
                {
                    primaryJumpPoints[row, col].South = true;
                }
            }
            if (board[row + 1][col] == '.')
            {
                if (board[row + 1][col - 1] == '#' && board[row][col - 1] == '.' ||
                    board[row + 1][col + 1] == '#' && board[row][col + 1] == '.')
                {
                    primaryJumpPoints[row, col].North = true;
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
                        distance[r, c].West = 0;
                        continue;
                    }
                    count++;
                    if (jumpPointLastSeen)
                    {
                        distance[r, c].West = count;
                    }
                    else
                    {
                        distance[r, c].West = -count;
                    }
                    if (primaryJumpPoints[r, c].West)
                    {
                        count = 0;
                        jumpPointLastSeen = true;
                    }
                }
            }
        }

        public void EastDistance()
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
                        distance[r, c].East = 0;
                        continue;
                    }
                    count++;
                    if (jumpPointLastSeen)
                    {
                        distance[r, c].East = count;
                    }
                    else
                    {
                        distance[r, c].East = -count;
                    }
                    if (primaryJumpPoints[r, c].East)
                    {
                        count = 0;
                        jumpPointLastSeen = true;
                    }
                }
            }
        }

        public void NorthDistance()
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
                        distance[r, c].North = 0;
                        continue;
                    }
                    count++;
                    if (jumpPointLastSeen)
                    {
                        distance[r, c].North = count;
                    }
                    else
                    {
                        distance[r, c].North = -count;
                    }
                    if (primaryJumpPoints[r, c].North)
                    {
                        count = 0;
                        jumpPointLastSeen = true;
                    }
                }
            }
        }

        public void SouthDistance()
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
                        distance[r, c].South = 0;
                        continue;
                    }
                    count++;
                    if (jumpPointLastSeen)
                    {
                        distance[r, c].South = count;
                    }
                    else
                    {
                        distance[r, c].South = -count;
                    }
                    if (primaryJumpPoints[r, c].South)
                    {
                        count = 0;
                        jumpPointLastSeen = true;
                    }
                }
            }
        }

        public void NorthWestDistance()
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
                            distance[r, c].NorthWest = 0;
                        }
                        else if (!IsWall(r - 1, c) && !IsWall(r, c - 1) &&
                            (distance[r - 1, c - 1].North > 0 ||
                            distance[r - 1, c - 1].West > 0))
                        {
                            //Straight jump point one away
                            distance[r, c].NorthWest = 1;
                        }
                        else
                        {
                            //Increment from last
                            int jumpDistance = distance[r - 1, c - 1].NorthWest;
                            if (jumpDistance > 0)
                            {
                                distance[r, c].NorthWest = 1 + jumpDistance;
                            }
                            else
                            {
                                distance[r, c].NorthWest = -1 + jumpDistance;
                            }
                        }
                    }
                }
            }
        }

        public void NorthEastDistance()
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
                            distance[r, c].NorthEast = 0;
                        }
                        else if (!IsWall(r - 1, c) && !IsWall(r, c + 1) &&
                            (distance[r - 1, c + 1].North > 0 ||
                            distance[r - 1, c + 1].East > 0))
                        {
                            //Straight jump point one away
                            distance[r, c].NorthEast = 1;
                        }
                        else
                        {
                            //Increment from last
                            int jumpDistance = distance[r - 1, c + 1].NorthEast;
                            if (jumpDistance > 0)
                            {
                                distance[r, c].NorthEast = 1 + jumpDistance;
                            }
                            else
                            {
                                distance[r, c].NorthEast = -1 + jumpDistance;
                            }
                        }
                    }
                }
            }
        }

        public void SouthWestDistance()
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
                            distance[r, c].SouthWest= 0;
                        }
                        else if (!IsWall(r + 1, c) && !IsWall(r, c - 1) &&
                            (distance[r + 1, c - 1].South > 0 ||
                            distance[r + 1, c - 1].West > 0))
                        {
                            //Straight jump point one away
                            distance[r, c].SouthWest = 1;
                        }
                        else
                        {
                            //Increment from last
                            int jumpDistance = distance[r + 1, c - 1].SouthWest;
                            if (jumpDistance > 0)
                            {
                                distance[r, c].SouthWest = 1 + jumpDistance;
                            }
                            else
                            {
                                distance[r, c].SouthWest = -1 + jumpDistance;
                            }
                        }
                    }
                }
            }
        }

        public void SouthEastDistance()
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
                            distance[r, c].SouthEast = 0;
                        }
                        else if (!IsWall(r + 1, c) && !IsWall(r, c + 1) &&
                            (distance[r + 1, c + 1].South > 0 ||
                            distance[r + 1, c + 1].East > 0))
                        {
                            //Straight jump point one away
                            distance[r, c].SouthEast = 1;
                        }
                        else
                        {
                            //Increment from last
                            int jumpDistance = distance[r + 1, c + 1].SouthEast;
                            if (jumpDistance > 0)
                            {
                                distance[r, c].SouthEast = 1 + jumpDistance;
                            }
                            else
                            {
                                distance[r, c].SouthEast = -1 + jumpDistance;
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
