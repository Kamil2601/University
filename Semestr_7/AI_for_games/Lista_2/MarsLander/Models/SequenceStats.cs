namespace Models
{
    public class SequenceStats
    {
        // Everything in interval [0,1]
        public double DirectDistanceScore { get; set; }
        public double GroundDistanceScore { get; set; }
        public double LandingScore { get; set; }
        public double FuelScore { get; set; }
        public double HorizontalDistanceScore { get; set; }
        public double VerticalDistanceScore { get; set; }
        public double Score =>  
            0.25 * HorizontalDistanceScore +
            0.25 * VerticalDistanceScore +
            0.5 * LandingScore;
    }
}
