using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Zad1
{
    public partial class ModifyUser : Form
    {
        static EventAggregator aggregator = new EventAggregator();
        static Data data = new Data();
        int groupId, userId;

        public ModifyUser(int groupId, int userId)
        {
            InitializeComponent();
            this.groupId = groupId;
            this.userId = userId;
        }

        private void CancelClick(object sender, EventArgs e)
        {
            Hide();
        }

        private void ModifyClick(object sender, EventArgs e)
        {
            string name = nameBox.Text;
            if (name != "")
            {
                string description = descriptionBox.Text;
                User user = new User(name, description);
                data.ModifyUser(groupId, userId, user);
                var notification = new UserModified(groupId, userId, user);
                aggregator.RaiseNotification(notification);
            }
        }
    }
}
