using NUnit.Framework;
using System.Diagnostics;
using System.Threading;

namespace UnitTests
{
    public class Tests
    {
        [Test]
        public void SameObjectsA()
        {
            SingletonA object1 = SingletonA.Instance();
            SingletonA object2 = SingletonA.Instance();
            Assert.AreSame(object1, object2);
        }

        [Test]
        public void ThreadSafeA()
        {
            SingletonA object1 = null;
            SingletonA object2 = null;

            Thread thread1 = new Thread(() => object1 = SingletonA.Instance());
            Thread thread2 = new Thread(() => object2 = SingletonA.Instance());

            thread1.Start();
            thread2.Start();

            thread1.Join();
            thread2.Join();

            Assert.AreSame(object1, object2);
        }

        [Test]
        public void SameObjectsC()
        {
            SingletonC object1 = SingletonC.Instance();
            SingletonC object2 = SingletonC.Instance();
            Assert.AreSame(object1, object2);
        }

        [Test]
        public void DifferentObjectsC()
        {
            SingletonC object1 = SingletonC.Instance();
            Thread.Sleep(5100);
            SingletonC object2 = SingletonC.Instance();
            Assert.AreNotSame(object1, object2);
        }

        [Test]
        public void ThreadSafeC()
        {
            SingletonC object1 = null;
            SingletonC object2 = null;

            Thread thread1 = new Thread(() => object1 = SingletonC.Instance());
            Thread thread2 = new Thread(() => object2 = SingletonC.Instance());

            thread1.Start();
            thread2.Start();

            thread1.Join();
            thread2.Join();

            Assert.AreSame(object1, object2);
        }

        [Test]
        public void SameObjectsB()
        {
            SingletonB object1 = SingletonB.Instance();
            SingletonB object2 = SingletonB.Instance();
            Assert.AreSame(object1, object2);
        }

        [Test]
        public void ThreadsObjectAreNotSameB()
        {
            SingletonB object1 = null;
            SingletonB object2 = null;

            Thread thread1 = new Thread(() => object1 = SingletonB.Instance());
            Thread thread2 = new Thread(() => object2 = SingletonB.Instance());

            thread1.Start();
            thread2.Start();
            thread1.Join();
            thread2.Join();

            Assert.AreNotSame(object1, object2);
        }
    }
}