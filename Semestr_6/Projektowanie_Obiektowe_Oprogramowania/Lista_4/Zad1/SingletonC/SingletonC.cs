using System;

public class SingletonC
{
    private static SingletonC instance;
    private static DateTime creationTime;
    private static Object _lock = new Object();
    private SingletonC()
    {
        creationTime = DateTime.Now;
    }
    private static bool EnoughTimePassed()
    {
        return DateTime.Now > creationTime.AddSeconds(5);
    }
    public static SingletonC Instance()
    {
        if (instance == null || EnoughTimePassed())
        {
            lock (_lock)
            {
                if (instance == null || EnoughTimePassed())
                {
                    instance = new SingletonC();
                }
            }
        }
        return instance;
    }
};