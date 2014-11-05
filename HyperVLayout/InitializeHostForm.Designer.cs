using IPAddressControlLib;

namespace Vanquisher
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(InitializeHost));
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.CheckAllConfig = new System.Windows.Forms.Button();
            this.ModuleListView = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.shapeContainer1 = new Microsoft.VisualBasic.PowerPacks.ShapeContainer();
            this.lineShape1 = new Microsoft.VisualBasic.PowerPacks.LineShape();
            this.InitToolStrip = new System.Windows.Forms.ToolStrip();
            this.CheckConfigBar = new System.Windows.Forms.ToolStripProgressBar();
            this.ProgressLabel = new System.Windows.Forms.ToolStripLabel();
            this.UpdateBtn = new System.Windows.Forms.Button();
            this.UpdateToolTip = new System.Windows.Forms.ToolTip(this.components);
            this.InitToolStrip.SuspendLayout();
            this.SuspendLayout();
            // 
            // CheckAllConfig
            // 
            this.CheckAllConfig.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.CheckAllConfig.Font = new System.Drawing.Font("微軟正黑體", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.CheckAllConfig.Image = ((System.Drawing.Image)(resources.GetObject("CheckAllConfig.Image")));
            this.CheckAllConfig.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.CheckAllConfig.Location = new System.Drawing.Point(12, 12);
            this.CheckAllConfig.Name = "CheckAllConfig";
            this.CheckAllConfig.Size = new System.Drawing.Size(145, 38);
            this.CheckAllConfig.TabIndex = 6;
            this.CheckAllConfig.Text = "  Check Config";
            this.CheckAllConfig.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.UpdateToolTip.SetToolTip(this.CheckAllConfig, "Check Host Conifg");
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
            this.ModuleListView.Location = new System.Drawing.Point(8, 64);
            this.ModuleListView.Margin = new System.Windows.Forms.Padding(3, 3, 3, 5);
            this.ModuleListView.Name = "ModuleListView";
            this.ModuleListView.Size = new System.Drawing.Size(418, 423);
            this.ModuleListView.TabIndex = 17;
            this.ModuleListView.UseCompatibleStateImageBehavior = false;
            this.ModuleListView.View = System.Windows.Forms.View.Details;
            this.ModuleListView.VirtualListSize = 5;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Width = 418;
            // 
            // shapeContainer1
            // 
            this.shapeContainer1.Location = new System.Drawing.Point(0, 0);
            this.shapeContainer1.Margin = new System.Windows.Forms.Padding(0);
            this.shapeContainer1.Name = "shapeContainer1";
            this.shapeContainer1.Shapes.AddRange(new Microsoft.VisualBasic.PowerPacks.Shape[] {
            this.lineShape1});
            this.shapeContainer1.Size = new System.Drawing.Size(432, 511);
            this.shapeContainer1.TabIndex = 19;
            this.shapeContainer1.TabStop = false;
            // 
            // lineShape1
            // 
            this.lineShape1.Name = "lineShape1";
            this.lineShape1.X1 = -2;
            this.lineShape1.X2 = 437;
            this.lineShape1.Y1 = 58;
            this.lineShape1.Y2 = 58;
            // 
            // InitToolStrip
            // 
            this.InitToolStrip.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.InitToolStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.CheckConfigBar,
            this.ProgressLabel});
            this.InitToolStrip.LayoutStyle = System.Windows.Forms.ToolStripLayoutStyle.Flow;
            this.InitToolStrip.Location = new System.Drawing.Point(0, 492);
            this.InitToolStrip.Name = "InitToolStrip";
            this.InitToolStrip.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.InitToolStrip.Size = new System.Drawing.Size(432, 19);
            this.InitToolStrip.TabIndex = 23;
            this.InitToolStrip.Text = "toolStrip1";
            // 
            // CheckConfigBar
            // 
            this.CheckConfigBar.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.CheckConfigBar.Name = "CheckConfigBar";
            this.CheckConfigBar.Size = new System.Drawing.Size(100, 15);
            // 
            // ProgressLabel
            // 
            this.ProgressLabel.Font = new System.Drawing.Font("微軟正黑體", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.ProgressLabel.Name = "ProgressLabel";
            this.ProgressLabel.Size = new System.Drawing.Size(61, 16);
            this.ProgressLabel.Text = "Progress";
            // 
            // UpdateBtn
            // 
            this.UpdateBtn.BackColor = System.Drawing.SystemColors.Control;
            this.UpdateBtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.UpdateBtn.Font = new System.Drawing.Font("微軟正黑體", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.UpdateBtn.Image = ((System.Drawing.Image)(resources.GetObject("UpdateBtn.Image")));
            this.UpdateBtn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.UpdateBtn.Location = new System.Drawing.Point(163, 12);
            this.UpdateBtn.Name = "UpdateBtn";
            this.UpdateBtn.Size = new System.Drawing.Size(172, 38);
            this.UpdateBtn.TabIndex = 24;
            this.UpdateBtn.Text = "Windows Update";
            this.UpdateBtn.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.UpdateToolTip.SetToolTip(this.UpdateBtn, "Windows Update");
            this.UpdateBtn.UseVisualStyleBackColor = false;
            this.UpdateBtn.Click += new System.EventHandler(this.UpdateBtn_Click);
            // 
            // UpdateToolTip
            // 
            this.UpdateToolTip.Popup += new System.Windows.Forms.PopupEventHandler(this.toolTip1_Popup);
            // 
            // InitializeHost
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(432, 511);
            this.Controls.Add(this.UpdateBtn);
            this.Controls.Add(this.InitToolStrip);
            this.Controls.Add(this.ModuleListView);
            this.Controls.Add(this.CheckAllConfig);
            this.Controls.Add(this.shapeContainer1);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "InitializeHost";
            this.ShowInTaskbar = false;
            this.Text = "Initialize Hype-V Host";
            this.InitToolStrip.ResumeLayout(false);
            this.InitToolStrip.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.Button CheckAllConfig;
        private System.Windows.Forms.ListView ModuleListView;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private Microsoft.VisualBasic.PowerPacks.ShapeContainer shapeContainer1;
        private Microsoft.VisualBasic.PowerPacks.LineShape lineShape1;
        private System.Windows.Forms.ToolStrip InitToolStrip;
        private System.Windows.Forms.ToolStripProgressBar CheckConfigBar;
        private System.Windows.Forms.ToolStripLabel ProgressLabel;
        private System.Windows.Forms.Button UpdateBtn;
        private System.Windows.Forms.ToolTip UpdateToolTip;


    }
}