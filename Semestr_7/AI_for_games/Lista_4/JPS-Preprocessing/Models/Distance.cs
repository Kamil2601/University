namespace JPS.Models
{
    public class Distance
    {
        public int Left { get; set; }
        public int Right { get; set; }
        public int Up { get; set; }
        public int Down { get; set; }
        public int UpLeft { get; set; }
        public int UpRight { get; set; }
        public int DownLeft { get; set; }
        public int DownRight { get; set; }

        public override string ToString()
        {
            return $"{Up} {UpRight} {Right} {DownRight} {Down} {DownLeft} {Left} {UpLeft}";
        }
    }
}
