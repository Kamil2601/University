using System;
using System.Windows.Forms;

namespace Zad1
{
    public partial class AddUser : Form
    {
        static EventAggregator aggregator = new EventAggregator();
        static Data data = new Data();

        public AddUser()
        {
            InitializeComponent();
            RefreshForm();
        }

        private void RefreshForm()
        {
            nameBox.Text = "";
            descriptionBox.Text = "";
            groupList.BeginUpdate();

            groupList.Clear();

            foreach (Group group in data.GetData())
            {
                groupList.Items.Add(group.Name);
            }

            groupList.EndUpdate();
        }

        private void CancelClick(object sender, EventArgs e)
        {
            Hide();
            RefreshForm();
        }

        private void AddClick(object sender, EventArgs e)
        {
            string name = nameBox.Text;
            if (name != "" && groupList.SelectedItems.Count > 0)
            {
                string description = descriptionBox.Text;
                int groupId = groupList.SelectedItems[0].Index;
                User user = new User(name, description);
                data.AddUser(groupId, user);
                var notification = new UserAdded(user,groupId);
                aggregator.RaiseNotification(notification);
            }
        }

    }
}
