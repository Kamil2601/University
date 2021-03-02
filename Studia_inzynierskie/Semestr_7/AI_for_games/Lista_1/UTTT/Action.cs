struct Action
{
    public int Row { get; set; }
    public int Col { get; set; }
    public int Player { get; set; }
    
    public (int, int) Move
    {
        get { return (Row, Col); }
        set { (Row, Col) = value; }
    }
    

    public Action(int player, int row, int col)
    {
        this.Player = player;
        this.Row = row;
        this.Col = col;
    }

    public Action(int player, (int, int) move)
    {
        this.Player = player;
        this.Row = move.Item1;
        this.Col = move.Item2;
    }

    public Action((int, int, int) action)
    {
        this.Player = action.Item1;
        this.Row = action.Item2;
        this.Col = action.Item3;
    }
}
