namespace Models
{
    public class Wait: GameAction
    {
        public override string ActionType { get => "WAIT"; }

        public override string ToString()
        {
            return "REST";
        }
    }
}
