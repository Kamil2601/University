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

    }

    public class SimpleContainer
    {
        Dictionary<Type, TypeInfo> registered = new Dictionary<Type, TypeInfo>();

        public void RegisterType<T>(bool singleton) where T : class
        {
            TypeInfo info = new TypeInfo(singleton, typeof(T));
            registered.Add(typeof(T), info);
        }
        public void RegisterType<From, To>(bool singleton) where To : From
        {
            if (!registered.ContainsKey(typeof(From)))
            {
                registered.Add(typeof(From), new TypeInfo(singleton, typeof(To)));
            }
            else
            {
                registered[typeof(From)].implementBy = typeof(To);
                registered[typeof(From)].isSingleton = singleton;
            }
        }

        public T Resolve<T>()
        {
            Type type = typeof(T);
            while (registered.ContainsKey(type) && registered[type].implementBy != type)
            {
                type = registered[type].implementBy;
            }

            if (type.IsInterface)
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
