using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Newtonsoft.Json;
using System.IO;
using NLog.Internal;
using System.Configuration;
using VanquisherAPI;
using System.Collections.ObjectModel;
using System.Management.Automation;
using System.Reflection;
using System.Diagnostics;


namespace HyperVLayout
{
    public partial class MainForm : Form
    {
        public static Dictionary<CheckModule, bool> initNMoudleStatus = new Dictionary<CheckModule, bool>();
        public static Form2 form;
        public static string CorefigPath = string.Empty;

        public MainForm()
        {
            InitializeComponent();
            string LoadConfig = File.ReadAllText(@".\ModuleStatus.txt");
            // Object test = JsonConvert.DeserializeObject(LoadConfig);
            initNMoudleStatus = (Dictionary<CheckModule, bool>)JsonConvert.DeserializeObject(LoadConfig, typeof(Dictionary<CheckModule, bool>));
            form = new Form2(ref initNMoudleStatus);
            GetThreadPartyPath();
        }

        private void GetThreadPartyPath()
        {
            Configuration appconfig = System.Configuration.ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            CorefigPath = appconfig.AppSettings.Settings["CorefigPath"].Value;
        }

        private void initializeHyerVHostToolStripMenuItem_Click(object sender, EventArgs e)
        {
            form.Show();
        }

        private void splitContainer1_Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void LoadModulStatus()
        {

        }

        private void CreateModulStatusfile()
        {
            initNMoudleStatus.Add(CheckModule.CheckCluster, false);
            initNMoudleStatus.Add(CheckModule.ClusterFeature, false);
            initNMoudleStatus.Add(CheckModule.CreateCluster, false);
            initNMoudleStatus.Add(CheckModule.EnableRDP, false);
            initNMoudleStatus.Add(CheckModule.EnableWinRM, false);
            initNMoudleStatus.Add(CheckModule.HyperVFeature, false);
            initNMoudleStatus.Add(CheckModule.IPconfig, false);
            initNMoudleStatus.Add(CheckModule.ISCSiConnection, false);
            initNMoudleStatus.Add(CheckModule.JoinDomain, false);
            initNMoudleStatus.Add(CheckModule.JoinNodeToCluster, false);
            string configToJson = JsonConvert.SerializeObject(initNMoudleStatus);

            File.AppendAllText(@".\ModuleStatus.txt", configToJson);
        }

        private void corefigToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessToOpenPowershell(MainForm.CorefigPath + PowershellScript.Corefig);
        }

        private void OpenCorefigbtn_Click(object sender, EventArgs e)
        {

        }


    }
}
