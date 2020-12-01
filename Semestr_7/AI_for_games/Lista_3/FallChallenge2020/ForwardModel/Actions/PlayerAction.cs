namespace ForwardModel.Actions
{
    public abstract class PlayerAction
    {
        
        public virtual bool IsBrew()
        {
            return false;
        }

        public virtual bool IsCast()
        {
            return false;
        }

        public virtual bool IsLearn()
        {
            return false;
        }

        public virtual bool IsRest()
        {
            return false;
        }
    }
}
