using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using System.Diagnostics;
using System.Reflection;

namespace Vanquisher
{
    public partial class About : Form
    {
        public About()
        {
            InitializeComponent();
            Configuration appconfig = System.Configuration.ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            string website = appconfig.AppSettings.Settings["Website"].Value;
            Website.Text = website;
            this.Version.Text = "Vanquisher Version  " + Application.ProductVersion + " Beta (64bit)";
        }

        private void Website_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            ProcessStartInfo sInfo = new ProcessStartInfo(Website.Text);
            Process.Start(sInfo);
        }
    }
}
