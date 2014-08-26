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
using System.Threading;

namespace Vanquisher
{
    public partial class InitializeHost : Form
    {
        static Logger logger = LogManager.GetCurrentClassLogger();
        private Dictionary<CheckModule, bool> initMoudleStatus = new Dictionary<CheckModule, bool>();
        public static iSCSIForm iscsiForm;
        // public static Dictionary<CheckModule, bool> initMoudleStatus = new Dictionary<CheckModule, bool>();

        public InitializeHost()
        {
            InitializeComponent();
            InitStatus();
            AddModuleListItem(initMoudleStatus);
            // this.moudleStatus = initMoudleStatus;
            this.ModuleListView.DoubleClick += new EventHandler(ModuleListView_DoubleClick);
        }

        private void InitStatus()
        {
            initMoudleStatus.Add(CheckModule.ClusterFeature, false);
            initMoudleStatus.Add(CheckModule.EnableRDP, false);
            initMoudleStatus.Add(CheckModule.EnableWinRM, false);
            initMoudleStatus.Add(CheckModule.HyperVFeature, false);
            initMoudleStatus.Add(CheckModule.IPconfig, false);
            initMoudleStatus.Add(CheckModule.ISCSiConnection, false);
            initMoudleStatus.Add(CheckModule.JoinDomain, false);
            initMoudleStatus.Add(CheckModule.EnableRemoteControle, false);
            initMoudleStatus.Add(CheckModule.GPUFeature, false);
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

        void ModuleListView_DoubleClick(object sender, EventArgs e)
        {
            Cursor.Current = Cursors.WaitCursor;

            SetupModule((CheckModule)Enum.Parse(typeof(CheckModule), ModuleListView.SelectedItems[0].Name.ToString()));

            Cursor.Current = Cursors.WaitCursor;
        }

        void SetupModule(CheckModule moduleName)
        {
            switch (moduleName)
            {
                case CheckModule.EnableRDP:
                    ProcessCaller.ProcessOpenByPowershell(MainForm.CorefigPath + VanScript.RemoteDesktop);
                    break;
                case CheckModule.EnableWinRM:
                    ProcessCaller.ProcessOpenByPowershell(MainForm.CorefigPath + VanScript.WINRM);
                    break;
                case CheckModule.IPconfig:
                    ProcessCaller.ProcessOpenByPowershell(MainForm.CorefigPath + VanScript.IpSettings);
                    break;
                case CheckModule.GPUFeature:
                    this.InstallGpuFeature();
                    break;
                case CheckModule.HyperVFeature:
                case CheckModule.ClusterFeature:
                    MessageBox.Show("After install those feature. You need reboot.");
                    ProcessCaller.ProcessOpenByPowershell(MainForm.CorefigPath + VanScript.Roles);
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
                    ProcessCaller.ProcessOpenByPowershell(MainForm.CorefigPath + VanScript.JoinDomainandRename);
                    break;
                case CheckModule.EnableRemoteControle:
                    try
                    {
                        bool result = Utilite.EnablePsRemoting();
                        bool remoteControle = Utilite.EnableRemoteControle();
                        if (result && remoteControle)
                        {
                            MessageBox.Show("Enable Remote Controle success");
                        }
                        else
                        {
                            MessageBox.Show("Enable Remote Controle fail");
                        }
                        ChangeStatus(CheckModule.EnableRemoteControle, result);
                        PaintingModuleListView();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Enable Remote Controle fail : {0}", ex.Message);
                    }

                    break;
                default:
                    MessageBox.Show("Not ready");
                    break;
            }
        }

        private void CheckAllConfig_Click(object sender, EventArgs e)
        {
            Cursor.Current = Cursors.WaitCursor;

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

            RemoteControleChecker();
            CheckConfigBar.Value = 80;

            ISCSiStatus();
            CheckConfigBar.Value = 90;

            PaintingModuleListView();
            CheckConfigBar.Value = 100;
            UseWaitCursor = false;

            Cursor.Current = Cursors.WaitCursor;
        }

        private void PaintingModuleListView()
        {
            try
            {
                foreach (var item in this.initMoudleStatus)
                {
                    Color c;
                    if (item.Value == false)
                        c = ColorTranslator.FromHtml("#FF6666");
                    else
                        c = ColorTranslator.FromHtml("#00FF66");

                    ModuleListView.Items.Find(item.Key.ToString(), false)[0].BackColor = c;
                }
            }
            catch (Exception ex)
            {
                logger.Debug(ex.ToString());
            }

        }

        private void RemoteControleChecker()
        {
            ChangeStatus(CheckModule.EnableRemoteControle, CheckServiceEnable.CheckRemoteControleEnable());
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
                                                    new WindownsFeature[5] { WindownsFeature.ClusterFeature, WindownsFeature.HyperV,
                                                                            WindownsFeature.iSCSI ,WindownsFeature.RemoteDesktopServices,
                                                                            WindownsFeature.RemoteDesktopVirtualizationHost});
            if (moduleStatus[WindownsFeature.ClusterFeature])
            {
                ChangeStatus(CheckModule.ClusterFeature, true);
            }

            if (moduleStatus[WindownsFeature.HyperV])
            {
                ChangeStatus(CheckModule.HyperVFeature, true);
            }

            if (moduleStatus[WindownsFeature.RemoteDesktopServices] &&
                moduleStatus[WindownsFeature.RemoteDesktopVirtualizationHost])
            {
                ChangeStatus(CheckModule.GPUFeature, true);
            }
        }

        private void ISCSiStatus()
        {
            try
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
            catch (Exception ex)
            {
                logger.Debug(ex.ToString());
                MessageBox.Show("Iscsi Error:" + ex.Message);
            }
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
            if (this.initMoudleStatus.ContainsKey(moduleName))
            {
                if (status)
                    this.initMoudleStatus[moduleName] = true;
                else
                    this.initMoudleStatus[moduleName] = false;
            }
        }

        private void RunIscsiUI_Click(object sender, EventArgs e)
        {
            ProcessCaller.ProcessOpen(VanScript.IscsiUI);
        }

        private void InstallGpuFeature()
        {
            try
            {
                if (MessageBox.Show("Want install Remote-Desktop-Services and RDS-Virtualization feature?", "Install GPU feature", MessageBoxButtons.YesNo,
                                    MessageBoxIcon.Information, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
                {
                    List<InstallResult> installResult = Utilite.InstallGPUFeature();

                    int showFlag = 0;

                    if (installResult.Where(s => s.RestartNeeded == true).Count() > 0)
                    {
                        if (MessageBox.Show("You need to restart your computer to finish installing.", "Reboot computer", MessageBoxButtons.YesNo,
                                   MessageBoxIcon.Information, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
                            {
                                showFlag++;
                                Utilite.Reboot();
                            }
                    }
                    
                    if (showFlag == 0 && (installResult.Where(s => s.Success == true).Count() == 2))
                    {
                        MessageBox.Show("Install Success.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Install fail : " + ex.ToString());
            }
        }
    }
}
