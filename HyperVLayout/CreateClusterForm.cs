using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using VanquisherAPI;
using System.Net;

namespace Vanquisher
{
    public partial class CreateClusterForm : Form
    {
        private List<string> computerNames;
        public CreateClusterForm()
        {
            InitializeComponent();
            this.computerNames = Cluster.GetADComputerList();
            AddListToBox(this.computerNames);
        }

        private void AddListToBox(List<string> computerNames)
        {
            foreach (string item in computerNames)
            {
                ComputerListBox.Items.Add(item);
            }
        }

        private void CreateClusterForm_Load(object sender, EventArgs e)
        {

        }

        private void Createbtn_Click(object sender, EventArgs e)
        {
            bool result = ClusterInfoInvalid();
            CheckedListBox.CheckedItemCollection selecets = ComputerListBox.CheckedItems;
            List<string> selectedPC = new List<string>();
            foreach (string item in selecets)
            {
                selectedPC.Add(item);
            }
            string paresCPName = string.Join(",", selectedPC.ToArray());

            try
            {
                Cluster.CreateCluster(this.ClusterNameTB.Text, paresCPName, ClusterIpTB.Text);
            }
            catch (Exception)
            {
                
                throw;
            }

            // string computerName = this.computerNames.tos
            //if (result)
            //{
            //    if (string.IsNullOrEmpty(IgnoreIPTB.Text))
            //    {

            //    }
            //}
        }

        private bool ClusterInfoInvalid()
        {
            bool result = true;
            CheckedListBox.CheckedItemCollection selecets = ComputerListBox.CheckedItems;
            if (selecets.Count < 2)
            {
                MessageBox.Show("Cluster need over 2 computer");
                return false;
            }

            if (string.IsNullOrWhiteSpace(ClusterNameTB.Text))
            {
                MessageBox.Show("Cluster name error!!");
                return false;
            }
            IPAddress a;
            // IPAddress.TryParse(ClusterIpTB.Text, out a);
            if (!IPAddress.TryParse(ClusterIpTB.Text, out a))
            {
                MessageBox.Show("Cluster Ip error!!");
                return false;
            }
            return result;
        }
    }
}
