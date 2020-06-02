using System;
using System.Collections.Generic;

namespace Container
{
    class TypeInfo
    {
        public bool isSingleton;
        public Type implementBy;
        public Object instance;

        public TypeInfo(bool isSingleton, Type implementBy)
        {
            this.isSingleton = isSingleton;
            this.implementBy = implementBy;
            this.instance = null;
        }

        public TypeInfo(bool isSingleton, Type implementBy, Object instance)
        {
            this.isSingleton = isSingleton;
            this.implementBy = implementBy;
            this.instance = instance;
        }
    }

    public class SimpleContainer
    {
        Dictionary<Type, TypeInfo> registered = new Dictionary<Type, TypeInfo>();

        public void RegisterType<T>(bool singleton) where T : class
        {
            Type type= typeof(T);
            if (!registered.ContainsKey(type))
            {
                TypeInfo info = new TypeInfo(singleton, type);
                registered.Add(type, info);
            }
            else
            {
                registered[type].isSingleton = singleton;
                if (!singleton)
                {
                    registered[type].instance = null;
                }
            }
        }
        public void RegisterType<From, To>(bool singleton) where To : From
        {
            Type from = typeof(From);
            Type to = typeof(To);
            if (!registered.ContainsKey(from))
            {
                registered.Add(from, new TypeInfo(singleton, to));
            }
            else
            {
                registered[from].implementBy = to;
                registered[from].isSingleton = singleton;
            }
        }

        public void RegisterInstance<T>( T instance )
        {
            Type type = typeof(T);
            registered[type] = new TypeInfo(true, type, instance);
            Console.WriteLine(registered.Count);
        }

        public T Resolve<T>()
        {
            Type type = typeof(T);
            while (registered.ContainsKey(type) && registered[type].implementBy != type)
            {
                type = registered[type].implementBy;
            }

            if (type.IsInterface && registered[type].instance == null)
                throw new Exception(String.Format("Unknown implemenation of interface: {0}!", type));

            if (!registered.ContainsKey(type))
            {
                var constructor = type.GetConstructor(Type.EmptyTypes);
                if (constructor == null)
                    throw new Exception(
                        String.Format("Argumentless constructor for type {0} doesn't exist!",type)
                    );
                return (T)constructor.Invoke(Type.EmptyTypes);
            }
            else
            {
                var info = registered[type];
                if (info.isSingleton)
                {
                    if (info.instance == null)
                    {
                        var constructor = type.GetConstructor(Type.EmptyTypes);
                        info.instance = constructor.Invoke(Type.EmptyTypes);
                    }

                    return (T)info.instance;
                }
                else
                {
                    var constructor = type.GetConstructor(Type.EmptyTypes);
                    return (T)constructor.Invoke(Type.EmptyTypes);
                }
            }
           
        }
    }
}
