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
using Newtonsoft.Json;
using System.Collections.ObjectModel;
using System.Management.Automation;

namespace Vanquisher
{
    public partial class iSCSIForm : Form
    {
        static Logger logger = LogManager.GetCurrentClassLogger();
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

            logger.Debug("RefleshVolumeInfo:" + textInfo);
            // MessageBox.Show(ISCSiCheckedListBox.SelectedItem.ToString());
            ISCSiInfo info = GetSelectVolum(textInfo);
            logger.Debug("RefleshVolumeInfo info :" + JsonConvert.SerializeObject(info));
            ISCSiStatusText.Text = info.IsOffline == true ? Constants.offline : Constants.online;
            PartitionSizeText.Text = info.PartitionSizeInGb + "GB.";
        }

        private ISCSiInfo GetSelectVolum(string checkedListBoxList)
        {
            int getVolumID;
            bool parseResult = int.TryParse(checkedListBoxList.Split('.')[0], out getVolumID);
            return this.iSCSiInfo.Find(x => checkedListBoxList.Contains(x.FriendlyName) && x.Number == getVolumID);
        }

        private void InitDiskBtn_Click(object sender, EventArgs e)
        {

            CheckedListBox.CheckedItemCollection selecets = ISCSiCheckedListBox.CheckedItems;
            foreach (string item in selecets)
            {
                try
                {
                    ISCSiInfo info = GetSelectVolum(item);
                    bool result = ISCSiAPI.InitializeDisk(info.Number);
                    if (!result)
                    {
                        MessageBox.Show("Initialize disk " + item + "Success.");
                    }
                    else
                    {
                        MessageBox.Show("Initialize disk " + item + "Success.");
                    }
                }
                catch (Exception ex)
                {
                    logger.Error(ex.ToString());
                    MessageBox.Show("InitDisk error: " + ex.Message);
                }

            }
        }

        private void SetDiskOnline_Click(object sender, EventArgs e)
        {
            CheckedListBox.CheckedItemCollection selecets = ISCSiCheckedListBox.CheckedItems;
            foreach (string item in selecets)
            {
                ISCSiInfo info = GetSelectVolum(item);
                bool result = ISCSiAPI.SetDiskStatus(info.Number, true);
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

        private void SetDiskOffbtn_Click(object sender, EventArgs e)
        {
            CheckedListBox.CheckedItemCollection selecets = ISCSiCheckedListBox.CheckedItems;
            foreach (string item in selecets)
            {
                ISCSiInfo info = GetSelectVolum(item);
                bool result = ISCSiAPI.SetDiskStatus(info.Number, false);
                if (!result)
                {
                    MessageBox.Show("Set offline fail.");
                }
                else
                {
                    MessageBox.Show("Set offline Success.");
                }
            }

            if (selecets.Count > 0)
            {
                RefleshVolumeInfo(true);
            }
        }

        private void CreatePartitionAndFormat_Click(object sender, EventArgs e)
        {
            CheckedListBox.CheckedItemCollection selecets = ISCSiCheckedListBox.CheckedItems;
            foreach (string item in selecets)
            {
                ISCSiInfo info = GetSelectVolum(item);
                try
                {
                    bool result = ISCSiAPI.CreatePartitionAndFormat(info.Number);
                    if (result)
                    {
                        MessageBox.Show("Create partition and format disk " + item + " Success.");
                    }
                    else
                    {
                        MessageBox.Show("Create partition and format disk " + item + " fail.");
                    }
                }
                catch (Exception ex)
                {
                    logger.Error(ex.ToString());
                    if (ex.Message.Contains("available capacity"))
                    {
                        this.ReFormatPartition(info.Number);
                    }
                }
            }
        }

        private void ReFormatPartition(int diskNumber)
        {
            if (MessageBox.Show("Partition " + diskNumber + " is already format. Are you sure re-format partision?", "Format partision", MessageBoxButtons.YesNo,
            MessageBoxIcon.Information, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
            {
                logger.Debug("In ReFormatPartition");
                bool removeResult = ISCSiAPI.RemovePartitionByDiskNumber(diskNumber);
                bool createResult = ISCSiAPI.CreatePartitionAndFormat(diskNumber);
                if (removeResult && createResult)
                {
                    MessageBox.Show("CreatePartition And Format Success");
                }
                else
                {
                    MessageBox.Show("Some error. Please see the log.");
                }
            }
        }
    }
}
