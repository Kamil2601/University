using System;
using System.Windows.Forms;

namespace Zad1
{
    public partial class AddGroup : Form
    {
        static EventAggregator aggregator = new EventAggregator();
        static Data data = new Data();

        public AddGroup()
        {
            InitializeComponent();
        }

        private void AddClick(object sender, EventArgs e)
        {
            if (nameBox.Text != "")
            {
                data.AddGroup(new Group(nameBox.Text));
                var notification = new GroupAdded();
                aggregator.RaiseNotification(notification);
            }
        }

        private void CancelClick(object sender, EventArgs e)
        {

        }
    }
}
