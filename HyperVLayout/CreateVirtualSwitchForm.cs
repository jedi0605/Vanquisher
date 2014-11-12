using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using VanquisherAPI;
using NLog;


namespace Vanquisher
{
    public partial class CreateVirtualSwitchForm : Form
    {
        static Logger logger = LogManager.GetCurrentClassLogger();
        private List<NetworkCheker.NetworkAdapter> adapterInfo = new List<NetworkCheker.NetworkAdapter>();
        public CreateVirtualSwitchForm()
        {
            InitializeComponent();
            this.adapterInfo = NetworkCheker.GetAdapterInfo();
            AppendInfoToCheckListBox();
        }

        private void AppendInfoToCheckListBox()
        {
            foreach (NetworkCheker.NetworkAdapter item in adapterInfo)
            {
                this.NetAdapterCheckedListBox.Items.AddRange(new object[] { item.adapterName + ": " + item.ipaddress });

            }
        }

        private void NetAdapterCheckedListBox_ItemCheck(object sender, ItemCheckEventArgs e)
        {
            for (int ix = 0; ix < NetAdapterCheckedListBox.Items.Count; ++ix)
                if (ix != e.Index) NetAdapterCheckedListBox.SetItemChecked(ix, false);
        }

        private void CreateSwitch_Click(object sender, EventArgs e)
        {
            CheckedListBox.CheckedItemCollection selecets = this.NetAdapterCheckedListBox.CheckedItems;
            foreach (string item in selecets)
            {
                if (string.IsNullOrEmpty(switchTextBox.Text))
                {
                    MessageBox.Show("Please enter swich name");
                    break;
                }
                string parseAdapterName = item.Substring(0, item.IndexOf(":"));
                logger.Debug("adpater nam:" + parseAdapterName + ".");
                try
                {
                    bool result = VirtualSwitch.CreateVSwitch(parseAdapterName, switchTextBox.Text);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Create switch error:" + ex.Message);
                    logger.Error(ex.ToString());
                }
            }
        }
    }
}
