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
using Microsoft.Win32;
using NLog;
using System.Threading;


namespace Vanquisher
{
    public partial class MainForm : Form
    {


        static Logger logger = LogManager.GetCurrentClassLogger();
        public static InitializeHost initForm;
        public static CreateClusterForm clusterForm;
        public static string CorefigPath = string.Empty;
        public static string ExploerPlusPath = string.Empty;
        public static string FiveNinePath = string.Empty;
        public static string FiveNineInstallPath = string.Empty;
        public static string pshvm30 = string.Empty;
        private int FirstCount = 0;


        public MainForm()
        {
            InitializeComponent();
            initForm = new InitializeHost();
            clusterForm = new CreateClusterForm();
            GetThreadPartyPath();
            CreateVMFolder();

            RunspaceInvoke invoker = new RunspaceInvoke();
            invoker.Invoke("Set-ExecutionPolicy Unrestricted");
        }



        private void GetThreadPartyPath()
        {
            Configuration appconfig = System.Configuration.ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            CorefigPath = appconfig.AppSettings.Settings["CorefigPath"].Value;
            ExploerPlusPath = appconfig.AppSettings.Settings["ExploerPlusPath"].Value;
            FiveNineInstallPath = appconfig.AppSettings.Settings["FiveNineInstallPath"].Value;
            pshvm30 = appconfig.AppSettings.Settings["pshvm30"].Value;
        }

        private void initializeHyerVHostToolStripMenuItem_Click(object sender, EventArgs e)
        {
            initForm.SetDesktopLocation(this.Location.X + 10, this.Location.Y + 10);

            initForm.Show(this);
            
            if (FirstCount == 0)
            {
                Thread.Sleep(1000 * 2);
                initForm.StartCheckModule();
                this.FirstCount++;
            }
        }

        private void corefigToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpenByPowershell(MainForm.CorefigPath + VanScript.Corefig);
        }

        private void OpenCorefigbtn_Click(object sender, EventArgs e)
        {
            logger.Debug("open corefig path:" + MainForm.CorefigPath + VanScript.Corefig);
            ProcessCaller.ProcessOpenByPowershell(MainForm.CorefigPath + VanScript.Corefig);
        }

        private void OpenExpolerbtn_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpenByPowershell(MainForm.ExploerPlusPath + VanScript.ExplorePlus);
        }

        private void TaskManagerbtn_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpen(VanScript.TaskManager);
        }

        private void PowershellBtn_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpenByPowershell(VanScript.Powershell);
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
            Open59Manager();
        }

        public static void Open59Manager()
        {
            RegistryKey key = Registry.LocalMachine.OpenSubKey(@"SOFTWARE\Microsoft\Windows\CurrentVersion\Run");
            object o = key.GetValue("5nine Manager for Hyper-V");

            if (o == null)
            {
                if (MessageBox.Show("Install 59manager?", "Install 59manager?", MessageBoxButtons.YesNo, MessageBoxIcon.Information,
                                    MessageBoxDefaultButton.Button1) == DialogResult.Yes)
                {
                    ProcessCaller.ProcessOpen(MainForm.FiveNineInstallPath + VanScript.FiveNineInstall);
                }
            }
            else
            {
                logger.Debug(o.ToString());
                ProcessCaller.ProcessOpen(o.ToString());
            }
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
            ProcessCaller.ProcessOpenByPowershell(VanScript.CMD);
        }

        private void ISCSIConnector_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpenByPowershell(VanScript.IscsiUI);
        }

        private void CreateVMFolder()
        {
            if (!Directory.Exists(@"c:\VMs"))
            {
                Directory.CreateDirectory(@"c:\VMs\");
            }
        }

        private void pshvm30btn_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpen(MainForm.pshvm30 + VanScript.pshvm30);
        }

        private void createClusterToolStripMenuItem_Click(object sender, EventArgs e)
        {
            clusterForm.Show(this);
        }

    }
}
