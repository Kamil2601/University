namespace ForwardModel.Actions
{
    public class Rest : PlayerAction
    {
        public override bool IsRest()
        {
            return true;
        }

        public override string CodingameString()
        {
            return "REST";
        }
    }
}
