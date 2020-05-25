using NUnit.Framework;
using Container;

namespace Tests
{

    interface ITest
    {
        int Value();
    }
    class A : ITest
    {
        public int x;

        public A()
        {
            x = 1;
        }

        public virtual int Value()
        {
            return 1;
        }
    }

    class B : A
    {
        public B()
        {
            x = 2;
        }

        public override int Value()
        {
            return 2;
        }
    }

    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void Singleton()
        {
            SimpleContainer container = new SimpleContainer();
            container.RegisterType<A>(true);
            A obj1 = container.Resolve<A>();
            A obj2 = container.Resolve<A>();
            Assert.AreSame(obj1, obj2);
        }

        [Test]
        public void NotSingleton()
        {
            SimpleContainer container = new SimpleContainer();
            container.RegisterType<A>(false);
            A obj1 = container.Resolve<A>();
            A obj2 = container.Resolve<A>();
            Assert.AreNotSame(obj1, obj2);
        }

        [Test]
        public void NotImplementedInterface()
        {
            SimpleContainer container = new SimpleContainer();

            Assert.Catch( () => {
                container.Resolve<ITest>();
            });
        }

        [Test]
        public void ImplementedInterface()
        {
            SimpleContainer container = new SimpleContainer();

            container.RegisterType<ITest, A>(false);
            
            ITest objA = container.Resolve<ITest>();

            Assert.IsNotNull(objA);
            Assert.AreEqual(objA.Value(), 1);

            container.RegisterType<A,B>(false);

            ITest objB = container.Resolve<ITest>();
            Assert.IsNotNull(objB);
            Assert.AreEqual(objB.Value(), 2);
        }
    }
}