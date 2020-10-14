using System;
using System.Collections;
using System.Collections.Generic;

public class PersonRegistry
{
    /// Pierwszy stopień swobody - różne wczytywanie
    public List<Person> GetPersons()
    {
        // ...
    }

    /// Drugi stopień swobody - różne użycie
    public void NotifyPersons()
    {
        foreach (Person person in _persons)
            Console.WriteLine(person);
    }
}

public class Person { }
abstract class PersonRegistry1
{
    protected PersonNotifier notifier;

    public PersonRegistry1(PersonNotifier notifier)
    {
        this.notifier = notifier;
    }
    public abstract IEnumerable<Person> GetPeople();

    public void NotifyPeople()
    {
        notifier.NotifyPeople(GetPeople());
    }
}

public abstract class PersonNotifier
{
    public abstract void NotifyPeople(IEnumerable<Person> people);
}
abstract class PersonRegistry2
{
    protected PeopleGetter getter;

    public PersonRegistry2(PeopleGetter getter)
    {
        this.getter = getter;
    }

    public IEnumerable<Person> GetPeople()
    {
        return getter.GetPeople();
    }

    public abstract void NotifyPeople();
}

abstract class PeopleGetter
{
    public abstract IEnumerable<Person> GetPeople();
}


class Program
{
    public static void Main()
    {

    }
}