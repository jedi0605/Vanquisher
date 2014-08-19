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

namespace Vanquisher
{
    public partial class InitializeHost : Form
    {
        static Logger logger = LogManager.GetCurrentClassLogger();
        private Dictionary<CheckModule, bool> moudleStatus = new Dictionary<CheckModule, bool>();
        public static iSCSIForm iscsiForm;
        public InitializeHost(ref Dictionary<CheckModule, bool> initMoudleStatus)
        {
            InitializeComponent();
            AddModuleListItem(initMoudleStatus);
            this.moudleStatus = initMoudleStatus;
            this.ModuleListView.DoubleClick += new EventHandler(ModuleListView_DoubleClick);

            // ModuleListView.Items.
            // ModuleListView.ItemMouseHover += new ListViewItemMouseHoverEventHandler(listView1_ItemMouseHover);
        }

        void ModuleListView_DoubleClick(object sender, EventArgs e)
        {
            UseWaitCursor = true;
            ModuleCheckerRunner((CheckModule)Enum.Parse(typeof(CheckModule), ModuleListView.SelectedItems[0].Name.ToString()));
            UseWaitCursor = false;
        }

        void ModuleCheckerRunner(CheckModule moduleName)
        {
            switch (moduleName)
            {
                case CheckModule.EnableRDP:
                    ProcessCaller.ProcessOpenPowershell(MainForm.CorefigPath + VanScript.RemoteDesktop);
                    break;
                case CheckModule.EnableWinRM:
                    ProcessCaller.ProcessOpenPowershell(MainForm.CorefigPath + VanScript.WINRM);
                    break;
                case CheckModule.IPconfig:
                    ProcessCaller.ProcessOpenPowershell(MainForm.CorefigPath + VanScript.IpSettings);
                    break;
                case CheckModule.HyperVFeature:
                    MessageBox.Show("After install Hyper-V feature. You need reboot.");
                    ProcessCaller.ProcessOpenPowershell(MainForm.CorefigPath + VanScript.Roles);
                    break;
                case CheckModule.ClusterFeature:
                    MessageBox.Show("After install Cluster feature. You need reboot.");
                    ProcessCaller.ProcessOpenPowershell(MainForm.CorefigPath + VanScript.Roles);
                    break;
                case CheckModule.ISCSiConnection:
                    List<ISCSiInfo> info = GetISCSiInfo();
                    if (info.Count > 0)
                    {
                        iscsiForm = new iSCSIForm(info);
                        iscsiForm.Show(this);
                    }
                    else
                    {
                        ProcessCaller.ProcessOpen(VanScript.IscsiUI);
                    }
                    break;
                case CheckModule.JoinDomain:
                    ProcessCaller.ProcessOpenPowershell(MainForm.CorefigPath + VanScript.JoinDomainandRename);
                    break;
                case CheckModule.EnablePSRemoting:
                    bool result = Utilite.EnablePsRemoting();
                    if (!result)
                    {
                        MessageBox.Show("Enable PSRemoting fail");
                    }
                    else
                    {
                        MessageBox.Show("Enable PSRemoting success");
                    }
                    ChangeStatus(CheckModule.EnablePSRemoting, result);
                    PaintingModuleListView();
                    break;
                //case CheckModule.CheckCluster:
                //case CheckModule.CreateCluster:
                //case CheckModule.JoinNodeToCluster:
                default:
                    MessageBox.Show("Not ready");
                    break;
            }
        }

        void AddModuleListItem(Dictionary<CheckModule, bool> initNMoudleStatus)
        {
            foreach (var item in initNMoudleStatus)
            {
                var newItem = new ListViewItem();
                newItem.Name = item.Key.ToString();
                newItem.Text = item.Key.GetCheckModuleDes();
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

        }

        private void CheckAllConfig_Click(object sender, EventArgs e)
        {
            UseWaitCursor = true;
            CheckConfigBar.Value = 0;
            NetworkChecker();
            CheckConfigBar.Value = 10;
            RDPChecker();
            CheckConfigBar.Value = 20;
            WinRMChecker();
            CheckConfigBar.Value = 30;
            IsJoinDomain();
            CheckConfigBar.Value = 50;
            CheckFeatureAreInstall();
            CheckConfigBar.Value = 60;
            RemotePsChecker();
            CheckConfigBar.Value = 80;
            ISCSiStatus();
            CheckConfigBar.Value = 90;
            PaintingModuleListView();
            CheckConfigBar.Value = 100;
            UseWaitCursor = false;
        }

        private void PaintingModuleListView()
        {
            foreach (var item in this.moudleStatus)
            {
                Color c;
                if (item.Value == false)
                    c = ColorTranslator.FromHtml("#FF6666");
                else
                    c = ColorTranslator.FromHtml("#00FF66");

                ModuleListView.Items.Find(item.Key.ToString(), false)[0].BackColor = c;
            }
        }

        private void RemotePsChecker()
        {
            ChangeStatus(CheckModule.EnablePSRemoting, CheckServiceEnable.CheckRemotePowershellEnable());
        }

        private void NetworkChecker()
        {
            ChangeStatus(CheckModule.IPconfig, NetworkCheker.CheckNetwork().Result);
        }

        private void RDPChecker()
        {
            ChangeStatus(CheckModule.EnableRDP, CheckServiceEnable.CheckRDPServiceIsEnable());
        }

        private void WinRMChecker()
        {
            ChangeStatus(CheckModule.EnableWinRM, CheckServiceEnable.CheckWinRMServiceIsEnable());
        }

        private void IsJoinDomain()
        {
            ChangeStatus(CheckModule.JoinDomain, CheckDomain.IsJoinDomain());
        }

        private void CheckFeatureAreInstall()
        {
            Dictionary<WindownsFeature, bool> moduleStatus = ModuleChecker.CheckModuleInstall(
                                                    new WindownsFeature[3] { WindownsFeature.ClusterFeature, WindownsFeature.HyperV, WindownsFeature.iSCSI });

            foreach (var item in moduleStatus)
            {
                CheckModule m = new CheckModule();
                if (item.Key.ToString().ToUpper().Contains("CLUSTERFEATURE"))
                {
                    m = CheckModule.ClusterFeature;
                }
                else if (item.Key.ToString().ToUpper().Contains("HYPERV"))
                {
                    m = CheckModule.HyperVFeature;
                }
                else if (item.Key.ToString().ToUpper().Contains("ISCSI"))
                {
                    // not finish
                    m = CheckModule.ISCSiConnection;
                    if (item.Value)
                    {
                        bool iscsiConnected = ISCSiAPI.IsIscsiConneted();
                        bool isPersistent = ISCSiAPI.IsPersistentConnetionType();

                        // bool  = ISCSiAPI.DiskAlready();
                    }
                }
                ChangeStatus(m, item.Value);
            }
        }

        private void ISCSiStatus()
        {
            bool isPer = ISCSiAPI.IsPersistentConnetionType();
            bool isConnected = ISCSiAPI.IsIscsiConneted();
            bool isDiskAlready = ISCSiAPI.DisksAlready();
            if (!isPer)
            {
                MessageBox.Show("ISCSi not persistent.");
            }

            if (!isConnected)
            {
                MessageBox.Show("ISCSi not connected.");
            }

            if (!isDiskAlready)
            {
                MessageBox.Show("ISCSi not online.");
            }
            ChangeStatus(CheckModule.ISCSiConnection, isPer && isConnected && isDiskAlready);
        }

        private List<ISCSiInfo> GetISCSiInfo()
        {
            List<ISCSiInfo> iscsiInfo = new List<ISCSiInfo>();
            try
            {
                iscsiInfo = ISCSiAPI.GetVolumeInfo();
                logger.Debug(JsonConvert.SerializeObject(iscsiInfo));
            }
            catch (Exception ex)
            {
                logger.Error(ex.ToString());
                MessageBox.Show("ISCSI connection is not ready. You shoud create iSCSI connection first (Open iSCSI UI).");
            }

            // iscsiInfo.Add(new ISCSiInfo(1, "test", "qwe", 100));
            return iscsiInfo;
        }

        private void ChangeStatus(CheckModule moduleName, bool status)
        {
            if (status)
                this.moudleStatus[moduleName] = true;
            else
                this.moudleStatus[moduleName] = false;
        }

        private void RunIscsiUI_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpen(VanScript.IscsiUI);
        }

        private void InitializeHost_Load(object sender, EventArgs e)
        {

        }


    }
}
