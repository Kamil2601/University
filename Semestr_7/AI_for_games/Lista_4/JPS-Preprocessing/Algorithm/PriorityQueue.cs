using System.Collections.Generic;
using JPS.Models;

namespace JPS.Algorithm
{
    public class PriorityQueue<T>: SortedSet<T>
    {
        public T Pop()
        {
            var result = Min;

            if (result != null)
            {
                Remove(result);
            }

            return result;
        }

        public void Push(T element) => Add(element);
    }
}
