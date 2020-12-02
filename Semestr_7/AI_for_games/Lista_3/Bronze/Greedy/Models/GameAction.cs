namespace Greedy.Models
{
    public abstract class GameAction
    {
        public int ActionId { get; set; }
        public virtual string ActionType { get; }

        public override string ToString()
        {
            return $"{ActionType} {ActionId}";
        }
    }
}
