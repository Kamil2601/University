using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

namespace Zad1
{
    public class Data
    {
        public static List<Group> data = new List<Group>();

        public void AddUser(int groupId, User user)
        {
            data[groupId].users.Add(user);
        }

        public void AddGroup(Group group)
        {
            data.Add(group);
        }

        public void ModifyUser(int groupId, int userId, User user)
        {
            data[groupId].users[userId] = user;
        }

        public List<Group> GetData()
        {
            return data;
        }
    }

    public class User
    {
        public string Name { get; set; }
        public string Description { get; set; }

        public User(string name, string description)
        {
            Name = name;
            Description = description;
        }
    }

    public class Group
    {
        public string Name { get; set; }
        public List<User> users = new List<User>();

        public Group(string name)
        {
            Name = name;
        }
    }
}
