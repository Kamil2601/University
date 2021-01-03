using Engine;

namespace MonteCarlo
{
    public class ActionStats
    {
        public GameAction Action { get; set; }
        public int SumScore { get; set; }
        public int Games { get; set; }

        public double Ratio { get => Games == 0 ? 0 : (double)SumScore / (double)Games; }

        public ActionStats(GameAction action)
        {
            Action = action;
            SumScore = 0;
            Games = 0;
        }        
    }
}
