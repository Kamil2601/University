class MCTSParams
{
    // Basic
    public double TreePolicyCoefficient { get; set; } = 1;
    public double TreeDecayCoefficient { get; set; } = 1;

    // MAST
    public bool UseMAST { get; set; } = false;
    public double MASTDecayCoefficient { get; set; } = 1;
    public double MASTRandomMoveChance { get; set; } = 1;
}
