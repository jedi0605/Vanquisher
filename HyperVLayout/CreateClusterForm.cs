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
using NLog;

namespace Vanquisher
{

    public partial class CreateClusterForm : Form
    {
        static Logger logger = LogManager.GetCurrentClassLogger();

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
            Cursor.Current = Cursors.WaitCursor;

            bool invalidResult = ClusterInfoInvalid();
            CheckedListBox.CheckedItemCollection selecets = ComputerListBox.CheckedItems;
            List<string> selectedPC = new List<string>();
            foreach (string item in selecets)
            {
                selectedPC.Add(item);
            }
            string paresCPName = string.Join(",", selectedPC.ToArray());

            try
            {
                if (invalidResult)
                {
                    Cluster.CreateCluster(this.ClusterNameTB.Text, paresCPName, ClusterIpTB.Text, IgnoreIPTB.Text);
                    MessageBox.Show("Create Cluster " + ClusterNameTB.Text + " success.");
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

                //string[] ipMessage = ex.Message.Split(' ');
                //string ip = string.Empty;
                //int t = 0;
                //foreach (string item in ipMessage)
                //{
                //    if (int.TryParse(item[0].ToString(), out t))
                //    {
                //        ip = item;
                //        break;
                //    }
                //}
                //logger.Debug("ip:" + ip);

                //string[] getIP = ip.Split('/');
                //string ipOne = getIP.Count() > 0 ? getIP[0] : string.Empty;
                //string ipTwo = string.Empty;
                //foreach (char item in getIP[1])
                //{
                //    if (int.TryParse(item.ToString(), out t))
                //    {
                //        ipTwo += item.ToString();
                //    }
                //}

                //string outIP = ipOne + "/" + ipTwo;
                //if (string.IsNullOrEmpty(IgnoreIPTB.Text))
                //{
                //    IgnoreIPTB.Text += outIP;
                //}
                //else
                //{
                //    IgnoreIPTB.Text = IgnoreIPTB.Text + "," + outIP;
                //}
            }
            Cursor.Current = Cursors.Default;
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

        private void ClusterNameLB_Click(object sender, EventArgs e)
        {

        }
    }
}
