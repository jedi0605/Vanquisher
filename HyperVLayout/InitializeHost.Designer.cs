using IPAddressControlLib;

namespace HyperVLayout
{
    partial class InitializeHost
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        protected override void OnClosing(System.ComponentModel.CancelEventArgs e)
        {
            e.Cancel = true;
            this.Hide();
            base.OnClosing(e);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.CheckAllConfig = new System.Windows.Forms.Button();
            this.ModuleListView = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.RunIscsiUI = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // CheckAllConfig
            // 
            this.CheckAllConfig.Location = new System.Drawing.Point(348, 288);
            this.CheckAllConfig.Name = "CheckAllConfig";
            this.CheckAllConfig.Size = new System.Drawing.Size(113, 38);
            this.CheckAllConfig.TabIndex = 6;
            this.CheckAllConfig.Text = "Check Config";
            this.CheckAllConfig.UseVisualStyleBackColor = true;
            this.CheckAllConfig.Click += new System.EventHandler(this.CheckAllConfig_Click);
            // 
            // ModuleListView
            // 
            this.ModuleListView.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.ModuleListView.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.ModuleListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1});
            this.ModuleListView.Font = new System.Drawing.Font("微軟正黑體", 18.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.ModuleListView.FullRowSelect = true;
            this.ModuleListView.GridLines = true;
            this.ModuleListView.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.None;
            this.ModuleListView.Location = new System.Drawing.Point(43, 33);
            this.ModuleListView.Margin = new System.Windows.Forms.Padding(3, 3, 3, 5);
            this.ModuleListView.Name = "ModuleListView";
            this.ModuleListView.Size = new System.Drawing.Size(418, 247);
            this.ModuleListView.TabIndex = 17;
            this.ModuleListView.UseCompatibleStateImageBehavior = false;
            this.ModuleListView.View = System.Windows.Forms.View.Details;
            this.ModuleListView.VirtualListSize = 5;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Width = 418;
            // 
            // RunIscsiUI
            // 
            this.RunIscsiUI.Location = new System.Drawing.Point(221, 288);
            this.RunIscsiUI.Name = "RunIscsiUI";
            this.RunIscsiUI.Size = new System.Drawing.Size(121, 38);
            this.RunIscsiUI.TabIndex = 18;
            this.RunIscsiUI.Text = "Open ISCSI UI";
            this.RunIscsiUI.UseVisualStyleBackColor = true;
            this.RunIscsiUI.Click += new System.EventHandler(this.RunIscsiUI_Click);
            // 
            // InitializeHost
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(506, 338);
            this.Controls.Add(this.RunIscsiUI);
            this.Controls.Add(this.ModuleListView);
            this.Controls.Add(this.CheckAllConfig);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "InitializeHost";
            this.ShowInTaskbar = false;
            this.Text = "Initialize Hype-V Host";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.Button CheckAllConfig;
        private System.Windows.Forms.ListView ModuleListView;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.Button RunIscsiUI;


    }
}