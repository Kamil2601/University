using System;
using System.Collections.Generic;

namespace ObjectPool
{
    public class Plane
    {

    }

    public class Airport
    {
        private int planesCount;
        private List<Plane> createdPlanes = new List<Plane>();
        private List<Plane> availablePlanes = new List<Plane>();

        public Airport(int planes)
        {
            if (planes <= 0)
            {
                throw new ArgumentException("Planes count must be greater than 0!");
            }
            this.planesCount = planes;
        }

        public Plane Departure()
        {
            Plane plane;
            if (availablePlanes.Count > 0)
            {
                plane = availablePlanes[0];
                availablePlanes.RemoveAt(0);
                return plane;
            }

            if (createdPlanes.Count < planesCount)
            {
                plane = new Plane();
                createdPlanes.Add(plane);
                return plane;
            }

            throw new Exception("No planes available!");
        }

        public void Arrival(Plane plane)
        {
            if (createdPlanes.Contains(plane))
            {
                availablePlanes.Add(plane);
            }
            else
            {
                throw new ArgumentException("Plane doesn't belong to airport!");
            }
        }
    }
}
