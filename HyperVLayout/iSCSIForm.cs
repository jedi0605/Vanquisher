﻿using System;
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
                ISCSiInfo info = GetSelectVolum(item);
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
    }
}
