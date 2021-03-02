using System;
using Engine;

namespace Hashing
{
    public static class Zobrist
    {
        public static uint [,,] Key { get;} = Init();

        private static uint[,,] Init()
        {
            Random random = new Random();
            var key = new uint[15, 15, 5];

            for (int i=0; i<15; i++)
            {
                for (int j=0; j<15; j++)
                {
                    for (int c=0; c<5; c++)
                    {
                        key[i, j, c] = (uint)random.Next(int.MinValue, int.MaxValue);
                    }
                }
            }

            return key;
        }

        public static uint Hash(GameState game)
        {
            uint result = 0;

            for (int i=0; i<15; i++)
            {
                for (int j=0; j<15; j++)
                {
                    var color = game.Board[i, j];
                    if (color != -1)
                    {
                        result ^= Key[i, j, color];
                    }
                }
            }

            return result;
        }

        public static uint Hash(GameAction action)
        {
            uint result = 0;

            foreach (var yyxx in action.Region)
            {
                int row = yyxx/100;
                int col = yyxx%100;

                result ^= Key[row, col, action.Color];
            }

            return result;
        }
    }
}
