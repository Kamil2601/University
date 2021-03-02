using System;

public class SingletonA
{
    private static SingletonA instance = null;
    private static Object _lock = new Object();

    public static SingletonA Instance()
    {
        if (instance == null)
        {
            lock (_lock)
            {
                if (instance == null)
                {
                    instance = new SingletonA();
                }
            }
        }
        return instance;
    }
};