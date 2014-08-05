using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using VanquisherAPI;

namespace HyperVLayout
{
    public partial class iSCSIForm : Form
    {
        private List<ISCSiInfo> iSCSiInfo = new List<ISCSiInfo>();
        public iSCSIForm(List<ISCSiInfo> iSCSiInfo)
        {
            InitializeComponent();
            this.iSCSiInfo = iSCSiInfo;
            this.AddISCSiToCheckBoxList();
            ISCSiStatusText.Text = string.Empty;
            PartitionSizeText.Text = string.Empty;

            ISCSiCheckedListBox.Click += new EventHandler(ISCSiCheckedListBox_Click);
        }

        void ISCSiCheckedListBox_Click(object sender, EventArgs e)
        {
            RefleshVolumeInfo(false);
        }

        private void AddISCSiToCheckBoxList()
        {
            foreach (var item in iSCSiInfo)
            {
                this.ISCSiCheckedListBox.Items.AddRange(new object[] { item.Number + ". " + item.FriendlyName });
            }

            //this.ISCSiCheckedListBox.ItemsAdd(new ListItem());
        }

       

        private void RefleshVolumeInfo(bool reflesh)
        {
            if (reflesh)
            {
                this.iSCSiInfo = ISCSiAPI.GetVolumeInfo();
            }
            string textInfo = ISCSiCheckedListBox.SelectedItem.ToString();
            // MessageBox.Show(ISCSiCheckedListBox.SelectedItem.ToString());
            ISCSiInfo info = this.iSCSiInfo.Find(x => textInfo.Contains(x.FriendlyName) && textInfo.Contains(x.Number.ToString()));
            ISCSiStatusText.Text = info.IsOffline == true ? Constants.offline : Constants.online;
            PartitionSizeText.Text = info.PartitionSizeInGb + "GB.";
        }

        private void InitDiskBtn_Click(object sender, EventArgs e)
        {
            CheckedListBox.CheckedItemCollection selecets = ISCSiCheckedListBox.CheckedItems;
            foreach (string item in selecets)
            {
                ISCSiInfo info = this.iSCSiInfo.Find(x => item.Contains(x.FriendlyName) && item.Contains(x.Number.ToString()));
                bool result = ISCSiAPI.InitializeDisk(info.Number);
                if (!result)
                {
                    MessageBox.Show("Initialize disk fail.");
                }
                else
                {
                    MessageBox.Show("Initialize disk Success.");
                }
            }
        }

        private void SetDiskOnline_Click(object sender, EventArgs e)
        {
            CheckedListBox.CheckedItemCollection selecets = ISCSiCheckedListBox.CheckedItems;
            foreach (string item in selecets)
            {
                ISCSiInfo info = this.iSCSiInfo.Find(x => item.Contains(x.FriendlyName) && item.Contains(x.Number.ToString()));
                bool result = ISCSiAPI.SetDiskOnline(info.Number);
                if (!result)
                {
                    MessageBox.Show("Set Online fail.");
                }
                else
                {
                    MessageBox.Show("Set Online Success.");
                }
            }

            if (selecets.Count > 0)
            {
                RefleshVolumeInfo(true);
            }
        }
    }
}
