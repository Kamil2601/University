using System;

public class SingletonB
{
    [ThreadStatic]
    private static SingletonB instance;
    private static Object _lock = new Object();

    public static SingletonB Instance()
    {
        if (instance == null)
        {
            lock (_lock)
            {
                if (instance == null)
                {
                    instance = new SingletonB();
                }
            }
        }
        return instance;
    }
};