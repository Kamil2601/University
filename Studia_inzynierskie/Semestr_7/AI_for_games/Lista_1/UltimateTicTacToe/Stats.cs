class Stats
{
    public double Games { get; set; }

    public double Points { get; set; }

    public double Ratio
    {
        get { return Points/Games; }
    }
    

    public Stats(double games, double points)
    {
        Games = games;
        Points = points;
    }


}
