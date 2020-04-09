using NUnit.Framework;
using ObjectPool;
using System;

namespace UnitTests
{
    public class Tests
    {
        [Test]
        public void PlanesCountLessThan0()
        {
            Assert.Throws<ArgumentException>(
                () => {
                    Airport airport = new Airport(-3);
                });
        }

        [Test]
        public void OnePlaneAirportSamePlane()
        {
            Airport airport = new Airport(1);
            Plane plane1 = airport.Departure();
            airport.Arrival(plane1);
            Plane plane2 = airport.Departure();

            Assert.AreSame(plane1, plane2);
        }

        [Test]
        public void NotEnoughPlanes()
        {
            Airport airport = new Airport(10);
            for (int i=0; i<10; i++)
            {
                airport.Departure();
            }

            Assert.Throws<Exception>(
                () => {
                    airport.Departure();
                }
            );
        }

        [Test]
        public void NotSamePlanes()
        {
            Airport airport = new Airport(2);
            Plane plane1 = airport.Departure();
            Plane plane2 = airport.Departure();

            Assert.AreNotSame(plane1, plane2);
        }
    }
}