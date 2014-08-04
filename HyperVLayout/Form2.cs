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

namespace HyperVLayout
{
    public partial class Form2 : Form
    {
        static Logger logger = LogManager.GetCurrentClassLogger();
        private Dictionary<CheckModule, bool> moudleStatus = new Dictionary<CheckModule, bool>();
        public static iSCSIForm iscsiForm;
        public Form2(ref Dictionary<CheckModule, bool> initMoudleStatus)
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
            ModuleCheckerRunner((CheckModule)Enum.Parse(typeof(CheckModule), ModuleListView.SelectedItems[0].Name.ToString()));
        }

        void ModuleCheckerRunner(CheckModule moduleName)
        {
            switch (moduleName)
            {
                case CheckModule.EnableRDP:
                    ProcessCaller.ProcessToOpenPowershell(MainForm.CorefigPath + PowershellScript.RemoteDesktop);
                    break;
                case CheckModule.EnableWinRM:
                    ProcessCaller.ProcessToOpenPowershell(MainForm.CorefigPath + PowershellScript.WINRM);
                    break;
                case CheckModule.IPconfig:
                    ProcessCaller.ProcessToOpenPowershell(MainForm.CorefigPath + PowershellScript.IpSettings);
                    break;
                case CheckModule.HyperVFeature:
                    ProcessCaller.ProcessToOpenPowershell(MainForm.CorefigPath + PowershellScript.Roles);
                    break;
                case CheckModule.ClusterFeature:
                    ProcessCaller.ProcessToOpenPowershell(MainForm.CorefigPath + PowershellScript.Roles);
                    break;
                case CheckModule.ISCSiConnection:
                   
                    // iscsiForm = new iSCSIForm(this.GetISCSiInfo());
                    break;
                case CheckModule.JoinDomain:
                    ProcessCaller.ProcessToOpenPowershell(MainForm.CorefigPath + PowershellScript.JoinDomainandRename);
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

        }

        private void CheckAllConfig_Click(object sender, EventArgs e)
        {
            NetworkChecker();
            RDPChecker();
            WinRMChecker();
            IsJoinDomain();
            CheckFeatureAreInstall();
            PaintingModuleListView();
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
            Dictionary<string, bool> moduleStatus = ModuleChecker.CheckModuleInstall(
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

        private List<ISCSiInfo> GetISCSiInfo()
        {
            List<ISCSiInfo> iscsiInfo = new List<ISCSiInfo>();
            try
            {
                iscsiInfo = ISCSiAPI.GetVolumeInfo();
            }
            catch (Exception ex)
            {
                logger.Error(ex.ToString());
                MessageBox.Show("ISCSI connection not ready.");
            }

            iscsiInfo.Add(new ISCSiInfo(1, "test", "qwe", 100));
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
            ProcessCaller.ProcessToOpenPowershell(PowershellScript.IscsiUI);
        }

    }
}
