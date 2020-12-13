namespace ForwardModel.Actions
{
    public class ActionsInfo
    {
        public PlayerAction PlayerAction { get; set; }
        public PlayerAction OpponentAction { get; set; }

        public ActionsInfo(PlayerAction playerAction, PlayerAction opponentAction)
        {
            PlayerAction = playerAction;
            OpponentAction = opponentAction;
        }
    }
}
