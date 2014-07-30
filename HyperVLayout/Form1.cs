﻿using System;
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


namespace HyperVLayout
{
    public partial class Form1 : Form
    {
        public static Dictionary<CheckModule, bool> initNMoudleStatus = new Dictionary<CheckModule, bool>();
        public static Form2 form;
        private string CorefigPath = string.Empty;
        
        public Form1()
        {
            InitializeComponent();
            string LoadConfig = File.ReadAllText(@".\ModuleStatus.txt");
            // Object test = JsonConvert.DeserializeObject(LoadConfig);
            initNMoudleStatus = (Dictionary<CheckModule, bool>)JsonConvert.DeserializeObject(LoadConfig, typeof(Dictionary<CheckModule, bool>));
            form = new Form2(initNMoudleStatus);
            GetThreadPartyPath();
        }

        private void GetThreadPartyPath()
        {
            Configuration appconfig = System.Configuration.ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            this.CorefigPath = appconfig.AppSettings.Settings["CorefigPath"].Value;
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
            PSInvoker invoker = new PSInvoker();
            Collection<PSObject> result = invoker.invokeCommand("localhost", this.CorefigPath+PowershellScript.Corefig, false);
        }
    }
}
