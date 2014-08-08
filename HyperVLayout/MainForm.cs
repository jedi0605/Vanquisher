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
        public static InitializeHost initForm;
        public static string CorefigPath = string.Empty;
        public static string ExploerPlusPath = string.Empty;
        public static string FiveNinePath = string.Empty;
        public MainForm()
        {
            InitializeComponent();
            string LoadConfig = File.ReadAllText(@".\ModuleStatus.txt");
            // Object test = JsonConvert.DeserializeObject(LoadConfig);
            initNMoudleStatus = (Dictionary<CheckModule, bool>)JsonConvert.DeserializeObject(LoadConfig, typeof(Dictionary<CheckModule, bool>));
            initForm = new InitializeHost(ref initNMoudleStatus);
            GetThreadPartyPath();
        }

        private void GetThreadPartyPath()
        {
            Configuration appconfig = System.Configuration.ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            CorefigPath = appconfig.AppSettings.Settings["CorefigPath"].Value;
            ExploerPlusPath = appconfig.AppSettings.Settings["ExploerPlusPath"].Value;
            FiveNinePath = appconfig.AppSettings.Settings["FiveNinePath"].Value;
        }

        private void initializeHyerVHostToolStripMenuItem_Click(object sender, EventArgs e)
        {
            initForm.SetDesktopLocation(this.Location.X + 10, this.Location.Y + 10);
            initForm.Show(this);
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
            initNMoudleStatus.Add(CheckModule.EnablePSRemoting, false);
            string configToJson = JsonConvert.SerializeObject(initNMoudleStatus);

            File.AppendAllText(@".\ModuleStatus.txt", configToJson);
        }

        private void corefigToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpenPowershell(MainForm.CorefigPath + VanScript.Corefig);
        }

        private void OpenCorefigbtn_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpenPowershell(MainForm.CorefigPath + VanScript.Corefig);
        }

        private void OpenExpolerbtn_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpenPowershell(MainForm.ExploerPlusPath + VanScript.ExplorePlus);
        }

        private void TaskManagerbtn_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpenPowershell(VanScript.TaskManager);
        }

        private void PowershellBtn_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpenPowershell(VanScript.Powershell);
        }

        private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            About a = new About();
            a.SetDesktopLocation(this.Location.X + 10, this.Location.Y + 10);
            //a.Location.X = this.Location.X + 10;
            a.Show(this);
        }

        private void Reboot_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("This will reboot computer. Confirm?", "Reboot computer", MessageBoxButtons.YesNo,
                                    MessageBoxIcon.Information, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
            {
                Utilite.Reboot();
            }
        }

        private void Open59btn_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpenPowershell(MainForm.FiveNinePath + VanScript.FiveNine);
        }

        private void ShutdownComputer_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("This will shotdown computer. Confirm?", "Shotdown computer", MessageBoxButtons.YesNo,
                                    MessageBoxIcon.Information, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
            {
                Utilite.Shutdown();
            }
        }

        private void CommandPrompt_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpenPowershell(VanScript.CMD);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpenPowershell(VanScript.IscsiUI);
        }

    }
}
