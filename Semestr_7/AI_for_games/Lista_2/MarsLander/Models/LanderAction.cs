namespace Models
{
    public class LanderAction
    {
        // [-15, 15]
        public int Rotation { get; set; }
        // [-1,1]
        public int Thrust { get; set; }

        public LanderAction(int rotation, int thrust)
        {
            Rotation = rotation;
            Thrust = thrust;
        }

        public LanderAction(LanderAction action)
        {
            Rotation = action.Rotation;
            Thrust = action.Thrust;
        }

        public override string ToString()
        {
            return $"R: {Rotation}, T: {Thrust}";
        }
    }
}
