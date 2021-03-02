using System;
using System.Collections.Generic;
using System.Linq;
using Algorithm;
using JPS.Models;
using Models;

namespace JPS.Algorithm
{
    public class Runtime
    {
        Node[,] nodes;
        Node start;
        Node goal;
        private int width;
        private int height;

        public void LoadInput()
        {
            string[] inputs;
            inputs = Console.ReadLine().Split(' ');
            width = int.Parse(inputs[0]); // Width of the map
            height = int.Parse(inputs[1]); // Height of the map
            inputs = Console.ReadLine().Split(' ');
            int startColumn = int.Parse(inputs[0]); // coordinate of the starting tile
            int startRow = int.Parse(inputs[1]); // coordinate of the starting tile
            int goalColumn = int.Parse(inputs[2]); // coordinate of the goal tile
            int goalRow = int.Parse(inputs[3]); // coordinate of the goal tile
            int open = int.Parse(Console.ReadLine()); // number of open tiles on the map

            nodes = new Node[height, width];

            for (int i = 0; i < height; i++)
            {
                for (int j = 0; j < width; j++)
                {
                    nodes[i, j] = new Node()
                    {
                        Point = new Point(i, j)
                    };
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

                nodes[row, column].Distance = new Distance()
                {
                    North = N,
                    NorthEast = NE,
                    East = E,
                    SouthEast = SE,
                    South = S,
                    SouthWest = SW,
                    West = W,
                    NorthWest = NW
                };
            }

            start = nodes[startRow, startColumn];
            goal = nodes[goalRow, goalColumn];

            Node.Goal = goal.Point;
            Node.Start = start.Point;
        }

        public void Run()
        {
            PriorityQueue<Node> openList = new PriorityQueue<Node>();
            // visited = new bool[height, width];

            openList.Add(start);

            while (openList.Any())
            {
                // Console.WriteLine(openList.Count);
                Node currNode = openList.Pop();

                // if (currNode.Visited)
                //     continue;

                currNode.Print();

                currNode.Visited = true;

                if (currNode == goal)
                    return;

                Node parentNode = currNode.Parent;

                var last = currNode.LastDirection();

                foreach (var dir in Directions.Next(currNode.LastDirection()))
                {
                    Node newSuccessor = null;
                    double givenCost = 0;

                    if (Directions.IsCardinal(dir) && StraightToGoal(currNode, dir))
                    {
                        //Goal is closer than wall distance or
                        //closer than or equal to jump point distance
                        newSuccessor = goal;
                        givenCost = currNode.Cost + DiffNodes(currNode, goal);
                    }
                    else if (Directions.IsDiagonal(dir) && CloseToGoal(currNode, dir))
                    {
                        //Goal is closer or equal in either row or
                        //column than wall or jump point distance
                        //Create a target jump point

                        int minDiff = Math.Min(currNode.Point.ColDistance(goal.Point),
                            currNode.Point.RowDistance(goal.Point));

                        var nextPoint = currNode.Point.Move(dir, minDiff);
                        newSuccessor = GetNode(currNode, minDiff, dir);
                        givenCost = currNode.Cost + (Math.Sqrt(2) * minDiff);
                    }
                    else if (currNode.Distance.Value(dir) > 0)
                    {
                        // //Jump point in this direction
                        newSuccessor = GetNode(currNode, dir);
                        givenCost = DiffNodes(currNode, newSuccessor);
                        if (Directions.IsDiagonal(dir))
                            givenCost *= Math.Sqrt(2);

                        givenCost += currNode.Cost;
                    }

                    //Traditional A* from this point
                    if (newSuccessor != null)
                    {
                        if (!openList.Contains(newSuccessor) &&
                            !newSuccessor.Visited)
                        {
                            newSuccessor.Parent = currNode;
                            newSuccessor.Cost = givenCost;
                            openList.Push(newSuccessor);
                        }
                        else if (givenCost < newSuccessor.Cost && !newSuccessor.Visited)
                        {
                            newSuccessor.Parent = currNode;
                            newSuccessor.Cost = givenCost;
                            // openList.Remove(newSuccessor);
                            // openList.Push(newSuccessor);
                        }
                    }
                }
            }

            Console.WriteLine("NO PATH");
        }

        private Node GetNode(Node currNode, Direction dir)
        {
            var point = currNode.Point;

            var dist = currNode.Distance.Value(dir);

            Point nextPoint = currNode.Point.Move(dir, dist);

            return nodes[nextPoint.Row, nextPoint.Col];
        }

        private Node GetNode(Node currNode, int minDiff, Direction dir)
        {
            Point nextPoint = currNode.Point.Move(dir, minDiff);

            return nodes[nextPoint.Row, nextPoint.Col];
        }

        private double DiffNodes(Node a, Node b)
        {
            var rowDist = a.Point.RowDistance(b.Point);
            var colDist = a.Point.ColDistance(b.Point);

            if (rowDist == 0)
                return colDist;
            else
                return rowDist;
        }

        private double DiffNodesRow(Node a, Node b)
        {
            return Math.Abs(a.Point.Row - b.Point.Row);
        }

        private double DiffNodesCol(Node a, Node b)
        {
            return Math.Abs(a.Point.Col - b.Point.Col);
        }

        private bool CloseToGoal(Node currNode, Direction dir)
        {
            var dist = Math.Abs(currNode.Distance.Value(dir));

            var point = currNode.Point;

            var minDist = Math.Min(DiffNodesCol(currNode, goal), DiffNodesRow(currNode, goal));

            if (dir == Direction.NorthEast)
            {
                return goal.Point.Col > point.Col && goal.Point.Row < point.Row && dist >= minDist;
            }
            if (dir == Direction.NorthWest)
            {
                return goal.Point.Col < point.Col && goal.Point.Row < point.Row && dist >= minDist;
            }
            if (dir == Direction.SouthEast)
            {
                return goal.Point.Col > point.Col && goal.Point.Row > point.Row && dist >= minDist;
            }
            if (dir == Direction.SouthWest)
            {
                return goal.Point.Col < point.Col && goal.Point.Row > point.Row && dist >= minDist;
            }

            return false;
        }

        private bool StraightToGoal(Node currNode, Direction dir)
        {
            var currPoint = currNode.Point;

            Distance stats = nodes[currPoint.Row, currPoint.Col].Distance;

            int dist = stats.Value(dir);

            if (dist < 0)
                dist = -dist;

            if (dir == Direction.North)
            {
                return goal.Point.Col == currPoint.Col && goal.Point.Row <= currPoint.Row
                    && Math.Abs(goal.Point.Row - currPoint.Row) <= dist;
            }
            else if (dir == Direction.South)
            {
                return goal.Point.Col == currPoint.Col && goal.Point.Row >= currPoint.Row
                    && Math.Abs(goal.Point.Row - currPoint.Row) <= dist;
            }
            else if (dir == Direction.West)
            {
                return goal.Point.Row == currPoint.Row && goal.Point.Col <= currPoint.Col
                    && Math.Abs(goal.Point.Col - currPoint.Col) <= dist;
            }
            else if (dir == Direction.East)
            {
                return goal.Point.Row == currPoint.Row && goal.Point.Col >= currPoint.Col
                    && Math.Abs(goal.Point.Col - currPoint.Col) <= dist;
            }

            return false;
        }
    }
}
