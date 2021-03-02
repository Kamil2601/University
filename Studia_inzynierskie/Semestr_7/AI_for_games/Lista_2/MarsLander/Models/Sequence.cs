using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;

namespace Models
{
    public class Sequence : List<LanderAction>, IComparer<Sequence>
    {
        public double Score { get; set; } = -1;
        public double CumulativeScore { get; set; } = 0;

        public Sequence() : base()
        { }

        public Sequence(IEnumerable<LanderAction> actions) : base(actions)
        { }

        public Sequence(int capacity) : base(capacity)
        { }



        public override string ToString()
        {
            string result = "";

            foreach (LanderAction action in this)
            {
                result += $"({action}), ";
            }

            return result;
        }

        public int Compare([AllowNull] Sequence x, [AllowNull] Sequence y)
        {
            return x.Score.CompareTo(y.Score);
        }
    }
}
