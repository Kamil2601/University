using System;
using System.Collections.Generic;
using System.Linq;

namespace Zad1
{
    public interface ISubscriber<T>
    {
        void Handle(T notification);
    }

    // Język powiadomień

    public class TreeViewGroupClicked
    {
        public int groupId;

        public TreeViewGroupClicked(int groupId)
        {
            this.groupId = groupId;
        }
    }

    public class TreeViewUserClicked
    {
        public int groupId, userId;

        public TreeViewUserClicked(int groupId, int userId)
        {
            this.groupId = groupId;
            this.userId = userId;
        }
    }

    public class UserAdded
    {
        public User user;
        public int groupId;

        public UserAdded(User user, int groupId)
        {
            this.user = user;
            this.groupId = groupId;
        }
    }

    public class GroupAdded
    {
    }

    public class UserModified
    {
        public int groupId, userId;
        public User modifiedUser;

        public UserModified(int groupId, int userId, User modifiedUser)
        {
            this.groupId = groupId;
            this.userId = userId;
            this.modifiedUser = modifiedUser;
        }
    }


    // Event aggregator

    public class EventAggregator
    {
        static Dictionary<Type, List<object>> subscribers = new Dictionary<Type, List<object>>();

        public void RegisterSubscriber<T>(ISubscriber<T> subscriber)
        {
            if (!subscribers.ContainsKey(typeof(T)))
                subscribers.Add(typeof(T), new List<object>());

            subscribers[typeof(T)].Add(subscriber);
        }

        public void UnRegisterSubscriber<T>(ISubscriber<T> subscriber)
        {
            if (subscribers.ContainsKey(typeof(T)))
                subscribers[typeof(T)].Remove(subscriber);
        }

        public void RaiseNotification<T>(T notification)
        {
            if (subscribers.ContainsKey(typeof(T)))
            {
                foreach (var subscriber in subscribers[typeof(T)].OfType<ISubscriber<T>>())
                {
                    subscriber.Handle(notification);
                }
            }
        }
    }
}
