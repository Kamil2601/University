using System.Collections.Generic;

namespace Engine
{
    public class Action
    {
        public int X { get; set; }
        public int Y { get; set; }
        public int Color { get; set; } = -1;
        public HashSet<int> Region { get; set; } = new HashSet<int>();
    }
}
