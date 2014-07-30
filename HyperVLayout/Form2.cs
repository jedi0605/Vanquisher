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
    public partial class Form2 : Form
    {
        private Dictionary<CheckModule, bool> moudleStatus = new Dictionary<CheckModule, bool>();
        public Form2(Dictionary<CheckModule, bool> initMoudleStatus)
        {
            InitializeComponent();
            AddModuleListItem(initMoudleStatus);
            this.moudleStatus = initMoudleStatus;

            // ModuleListView.Items.
            // ModuleListView.ItemMouseHover += new ListViewItemMouseHoverEventHandler(listView1_ItemMouseHover);
        }

        void AddModuleListItem(Dictionary<CheckModule, bool> initNMoudleStatus)
        {
            foreach (var item in initNMoudleStatus)
            {
                var newItem = new ListViewItem();
                newItem.Name = item.Key.ToString();
                newItem.Text = item.Key.ToString();
                newItem.BackColor = Color.FromArgb(255, 255, 128);
                newItem.Font = new System.Drawing.Font("微軟正黑體", 14.25F, System.Drawing.FontStyle.Bold);
                ModuleListView.Items.Add(newItem);
            }
        }

        void listView1_ItemMouseHover(object sender, ListViewItemMouseHoverEventArgs e)
        {
            //foreach (ListViewItem item in ModuleListView.Items)
            //{
            //    item.BackColor = Color.FromArgb(255, 255, 128);
            //}
            e.Item.BackColor = Color.LightBlue;
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }
        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (listView1.SelectedItems.Count > 0)
            //{
            //    string text = listView1.SelectedItems[0].Text;
            //    foreach (ListViewItem selected in listView1.SelectedItems)
            //    {
            //        selected.Selected = false;

            //    }
            //    var a = listView1.SelectedItems;
            //    label8.Text = text + i++;

            //}
            //((ListView)sender).SelectedItems[0].Text
        }

        private void CheckAllConfig_Click(object sender, EventArgs e)
        {
            // NetworkChecker();
            // RDPChecker();
            PaintingModuleListView();
        }

        private void PaintingModuleListView()
        {
            foreach (var item in this.moudleStatus)
            {
                Color c;
                if (item.Value == false)
                {
                    c = ColorTranslator.FromHtml("#FF6666");
                }
                else
                {
                    c = ColorTranslator.FromHtml("#00FF66");
                }
                ModuleListView.Items.Find(item.Key.ToString(), false)[0].BackColor = c;
            }
        }

        private void NetworkChecker()
        {
            APIResponse networkResult = NetworkCheker.CheckNetwork();
            if (networkResult.Result == true)
                ModuleListView.Items[2].BackColor = Color.Green;
            else
                ModuleListView.Items[2].BackColor = Color.Red;
            MessageBox.Show(networkResult.ObjectPayload.ToString());
        }

        private void RDPChecker()
        {
            bool result = CheckServiceEnable.CheckRDPServiceIsEnable();
            if (result == true)
                ModuleListView.Items[0].BackColor = Color.Green;
            else
                ModuleListView.Items[0].BackColor = Color.Red;
        }

    }
}
