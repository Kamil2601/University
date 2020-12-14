using System;
using JPS.Models;

namespace JPS.Algorithm
{
    public class Runtime
    {
        Distance[,] distance;
        Point start;
        Point goal;
        string[] board;

        public void LoadInput()
        {
            string[] inputs;
            inputs = Console.ReadLine().Split(' ');
            int width = int.Parse(inputs[0]); // Width of the map
            int height = int.Parse(inputs[1]); // Height of the map
            inputs = Console.ReadLine().Split(' ');
            int startColumn = int.Parse(inputs[0]); // coordinate of the starting tile
            int startRow = int.Parse(inputs[1]); // coordinate of the starting tile
            int goalColumn = int.Parse(inputs[2]); // coordinate of the goal tile
            int goalRow = int.Parse(inputs[3]); // coordinate of the goal tile
            int open = int.Parse(Console.ReadLine()); // number of open tiles on the map

            start = new Point(startRow, startColumn);
            goal = new Point(goalRow, goalColumn);

            distance = new Distance[height, width];

            for (int i = 0; i < height; i++)
            {
                for (int j = 0; j < width; j++)
                {
                    distance[i, j] = new Distance();
                }
            }

            for (int i = 0; i < open; i++)
            {
                inputs = Console.ReadLine().Split(' ');
                int column = int.Parse(inputs[0]); // coordinate of the empty tile described
                int row = int.Parse(inputs[1]); // coordinate of the empty tile described
                int N = int.Parse(inputs[2]); // distance to the closest jump point (positive number) or wall (otherwise) going north
                int NE = int.Parse(inputs[3]); // distance to the closest jump point (positive number) or wall (otherwise) going northeast
                int E = int.Parse(inputs[4]); // distance to the closest jump point (positive number) or wall (otherwise) going east
                int SE = int.Parse(inputs[5]); // distance to the closest jump point (positive number) or wall (otherwise) going southeast
                int S = int.Parse(inputs[6]); // distance to the closest jump point (positive number) or wall (otherwise) going south
                int SW = int.Parse(inputs[7]); // distance to the closest jump point (positive number) or wall (otherwise) going southwest
                int W = int.Parse(inputs[8]); // distance to the closest jump point (positive number) or wall (otherwise) going west
                int NW = int.Parse(inputs[9]); // distance to the closest jump point (positive number) or wall (otherwise) going northwest
            
                distance[row, column] = new Distance() {
                    Up = N,
                    UpRight = NE,
                    Right = E,
                    DownRight = SE,
                    Down = S,
                    DownLeft = SW,
                    Left = W,
                    UpLeft = NW
                };
            }
        }

        public void Run()
        {
            
        }
    }
}
