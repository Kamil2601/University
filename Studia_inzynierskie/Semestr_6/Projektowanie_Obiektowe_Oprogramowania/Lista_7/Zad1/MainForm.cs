using System;
using System.Windows.Forms;

namespace Zad1
{
    public partial class Register : Form,
        ISubscriber<TreeViewGroupClicked>,
        ISubscriber<TreeViewUserClicked>,
        ISubscriber<UserAdded>,
        ISubscriber<GroupAdded>,
        ISubscriber<UserModified>
    {
        EventAggregator aggregator = new EventAggregator();
        Data data = new Data();

        public Register()
        {
            InitializeComponent();
            aggregator.RegisterSubscriber<TreeViewUserClicked>(this);
            aggregator.RegisterSubscriber<TreeViewGroupClicked>(this);
            aggregator.RegisterSubscriber<UserAdded>(this);
            aggregator.RegisterSubscriber<GroupAdded>(this);
            aggregator.RegisterSubscriber<UserModified>(this);
            UpdateTreeView();
        }

        private void UpdateTreeView()
        {
            treeView.BeginUpdate();

            treeView.Nodes.Clear();

            foreach (Group group in data.GetData())
            {
                var node = treeView.Nodes.Add(group.Name);
                foreach (User user in group.users)
                {
                    node.Nodes.Add(user.Name);
                }
            }

            treeView.EndUpdate();
        }


        void ISubscriber<TreeViewGroupClicked>.Handle(TreeViewGroupClicked notification)
        {
            int groupId = notification.groupId;
            Group group = data.GetData()[groupId];
            string text = group.Name + "\n";
            foreach (User user in group.users)
            {
                text += user.Name + "\n";
            }
            info.Text = text;
        }

        void ShowUser(int groupId, int userId)
        {
            User user = data.GetData()[groupId].users[userId];
            string text = user.Name + "\n\n" + user.Description + "\n";
            info.Text = text;
        }

        void ISubscriber<TreeViewUserClicked>.Handle(TreeViewUserClicked notification)
        {
            int groupId = notification.groupId;
            int userId = notification.userId;
            ShowUser(groupId, userId);
        }

        private void AddGroupClick(object sender, EventArgs e)
        {
            AddGroup addGroup = new AddGroup();
            addGroup.Show();
        }

        private void AddUserClick(object sender, EventArgs e)
        {
            AddUser addUser = new AddUser();
            addUser.Show();
        }

        private void TreeViewAfterSelect(object sender, TreeViewEventArgs e)
        {
            var node = treeView.SelectedNode;
            if (node.Level == 0)
            {
                int groupId = node.Index;
                var notification = new TreeViewGroupClicked(groupId);
                aggregator.RaiseNotification(notification);
            }
            else
            {
                int userId = node.Index;
                int groupId = node.Parent.Index;
                var notification = new TreeViewUserClicked(groupId, userId);
                aggregator.RaiseNotification(notification);
            }
        }

        void ISubscriber<UserAdded>.Handle(UserAdded notification)
        {
            UpdateTreeView();
        }

        void ISubscriber<GroupAdded>.Handle(GroupAdded notification)
        {
            UpdateTreeView();
        }

        private void ModifyClick(object sender, EventArgs e)
        {
            if (treeView.SelectedNode.Level == 1)
            {
                int userId = treeView.SelectedNode.Index;
                int groupId = treeView.SelectedNode.Parent.Index;
                ModifyUser modifyUser = new ModifyUser(groupId, userId);
                modifyUser.Show();
            }
           
        }

        void ISubscriber<UserModified>.Handle(UserModified notification)
        {
            UpdateTreeView();
            ShowUser(notification.groupId, notification.userId);
        }
    }
}
