namespace Vanquisher
{
    partial class CreateClusterForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CreateClusterForm));
            this.ComputerListBox = new System.Windows.Forms.CheckedListBox();
            this.Createbtn = new System.Windows.Forms.Button();
            this.ClusterNameTB = new System.Windows.Forms.TextBox();
            this.ClusterIpTB = new System.Windows.Forms.TextBox();
            this.IgnoreIPTB = new System.Windows.Forms.TextBox();
            this.IgnoreIP = new System.Windows.Forms.Label();
            this.ClusterIPLB = new System.Windows.Forms.Label();
            this.ClusterNameLB = new System.Windows.Forms.Label();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.SuspendLayout();
            // 
            // ComputerListBox
            // 
            this.ComputerListBox.FormattingEnabled = true;
            this.ComputerListBox.HorizontalScrollbar = true;
            this.ComputerListBox.Location = new System.Drawing.Point(230, 34);
            this.ComputerListBox.Name = "ComputerListBox";
            this.ComputerListBox.Size = new System.Drawing.Size(176, 140);
            this.ComputerListBox.TabIndex = 1;
            // 
            // Createbtn
            // 
            this.Createbtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.Createbtn.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.Createbtn.Image = ((System.Drawing.Image)(resources.GetObject("Createbtn.Image")));
            this.Createbtn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.Createbtn.Location = new System.Drawing.Point(230, 180);
            this.Createbtn.Name = "Createbtn";
            this.Createbtn.Size = new System.Drawing.Size(176, 64);
            this.Createbtn.TabIndex = 2;
            this.Createbtn.Text = "Create Cluster";
            this.Createbtn.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.Createbtn.UseVisualStyleBackColor = true;
            this.Createbtn.Click += new System.EventHandler(this.Createbtn_Click);
            // 
            // ClusterNameTB
            // 
            this.ClusterNameTB.Font = new System.Drawing.Font("微軟正黑體", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.ClusterNameTB.Location = new System.Drawing.Point(44, 40);
            this.ClusterNameTB.Name = "ClusterNameTB";
            this.ClusterNameTB.Size = new System.Drawing.Size(167, 23);
            this.ClusterNameTB.TabIndex = 1;
            // 
            // ClusterIpTB
            // 
            this.ClusterIpTB.Font = new System.Drawing.Font("微軟正黑體", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.ClusterIpTB.Location = new System.Drawing.Point(44, 94);
            this.ClusterIpTB.Name = "ClusterIpTB";
            this.ClusterIpTB.Size = new System.Drawing.Size(167, 23);
            this.ClusterIpTB.TabIndex = 2;
            // 
            // IgnoreIPTB
            // 
            this.IgnoreIPTB.Font = new System.Drawing.Font("微軟正黑體", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.IgnoreIPTB.Location = new System.Drawing.Point(44, 153);
            this.IgnoreIPTB.Multiline = true;
            this.IgnoreIPTB.Name = "IgnoreIPTB";
            this.IgnoreIPTB.Size = new System.Drawing.Size(167, 91);
            this.IgnoreIPTB.TabIndex = 3;
            this.toolTip1.SetToolTip(this.IgnoreIPTB, "ex:172.16.99.0/24, 172.16.88.0/24");
            // 
            // IgnoreIP
            // 
            this.IgnoreIP.AutoSize = true;
            this.IgnoreIP.Font = new System.Drawing.Font("微軟正黑體", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.IgnoreIP.Location = new System.Drawing.Point(12, 134);
            this.IgnoreIP.Name = "IgnoreIP";
            this.IgnoreIP.Size = new System.Drawing.Size(124, 16);
            this.IgnoreIP.TabIndex = 4;
            this.IgnoreIP.Text = "Ignore IP (optional)";
            // 
            // ClusterIPLB
            // 
            this.ClusterIPLB.AutoSize = true;
            this.ClusterIPLB.Font = new System.Drawing.Font("微軟正黑體", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.ClusterIPLB.Location = new System.Drawing.Point(12, 75);
            this.ClusterIPLB.Name = "ClusterIPLB";
            this.ClusterIPLB.Size = new System.Drawing.Size(74, 16);
            this.ClusterIPLB.TabIndex = 4;
            this.ClusterIPLB.Text = "Cluster IP *";
            // 
            // ClusterNameLB
            // 
            this.ClusterNameLB.AutoSize = true;
            this.ClusterNameLB.Font = new System.Drawing.Font("微軟正黑體", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.ClusterNameLB.Location = new System.Drawing.Point(12, 21);
            this.ClusterNameLB.Name = "ClusterNameLB";
            this.ClusterNameLB.Size = new System.Drawing.Size(97, 16);
            this.ClusterNameLB.TabIndex = 4;
            this.ClusterNameLB.Text = "Cluster Name *";
            this.ClusterNameLB.Click += new System.EventHandler(this.ClusterNameLB_Click);
            // 
            // CreateClusterForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(428, 256);
            this.Controls.Add(this.ClusterNameLB);
            this.Controls.Add(this.ClusterIPLB);
            this.Controls.Add(this.IgnoreIP);
            this.Controls.Add(this.IgnoreIPTB);
            this.Controls.Add(this.ClusterIpTB);
            this.Controls.Add(this.ClusterNameTB);
            this.Controls.Add(this.Createbtn);
            this.Controls.Add(this.ComputerListBox);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "CreateClusterForm";
            this.ShowInTaskbar = false;
            this.Text = "CreateCluster";
            this.Load += new System.EventHandler(this.CreateClusterForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.CheckedListBox ComputerListBox;
        private System.Windows.Forms.Button Createbtn;
        private System.Windows.Forms.TextBox ClusterNameTB;
        private System.Windows.Forms.TextBox ClusterIpTB;
        private System.Windows.Forms.TextBox IgnoreIPTB;
        private System.Windows.Forms.Label IgnoreIP;
        private System.Windows.Forms.Label ClusterIPLB;
        private System.Windows.Forms.Label ClusterNameLB;
        private System.Windows.Forms.ToolTip toolTip1;
    }
}