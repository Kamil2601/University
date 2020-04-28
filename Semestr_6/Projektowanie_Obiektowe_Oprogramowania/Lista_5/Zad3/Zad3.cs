using System;
using System.Collections.Generic;

namespace Zad3
{
    class Plane
    {

    }

    class Airport
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

        public virtual Plane Departure()
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

        public virtual void Arrival(Plane plane)
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

    class TimeAirportProxy
    {
        private Airport airport;

        public TimeAirportProxy(int planes)
        {
            this.airport = new Airport(planes);
        }

        public TimeAirportProxy(Airport airport)
        {
            this.airport = airport;
        }

        private bool IsOpen()
        {
            DateTime now = DateTime.Now;
            return now.Hour >= 8 && now.Hour < 22;
        }

        public Plane Departure()
        {
            if (IsOpen())
            {
                return airport.Departure();
            }
            else
            {
                throw new Exception("Airport closed!");
            }
        }

        public void Arrival(Plane plane)
        {
            if (IsOpen())
            {
                airport.Arrival(plane);
            }
            else
            {
                throw new Exception("Airport closed!");
            }
        }
    }

    class UseLog
    {
        public DateTime time;
        public string methodName;
        public object [] parameters;
        public UseLog(DateTime time, string methodName, params object [] parameters)
        {
            this.time = time;
            this.methodName = String.Copy(methodName);
            this.parameters = new object[parameters.Length];
            Array.Copy(parameters, this.parameters, parameters.Length);
        }
    }

    class LogAirportProxy
    {
        private Airport airport;
        private List<UseLog> logs = new List<UseLog>();

        public LogAirportProxy(int planes)
        {
            this.airport = new Airport(planes);
        }

        public LogAirportProxy(Airport airport)
        {
            this.airport = airport;
        }

        public Plane Departure()
        {
            logs.Add(new UseLog(DateTime.Now, "Departure"));
            return airport.Departure();
        }

        public void Arrival(Plane plane)
        {
            logs.Add(new UseLog(DateTime.Now, "Arrival", plane));
            airport.Arrival(plane);
        }

        public IReadOnlyList<UseLog> Logs()
        {
            return logs;
        }
    }

    class Program
    {
        public static void Main()
        {

        }
    }
}