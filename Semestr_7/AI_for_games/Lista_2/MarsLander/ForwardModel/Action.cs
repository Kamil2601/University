namespace ForwardModel
{
    public class Action
    {
        public int Rotation { get; set; }
        public int Thrust { get; set; }

        public Action(int rotation, int thrust)
        {
            Rotation = rotation;
            Thrust = thrust;
        }

        public override string ToString()
        {
            return $"R: {Rotation}, T: {Thrust}";
        }
    }
}
