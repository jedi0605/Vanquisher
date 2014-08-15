namespace Vanquisher
{
    partial class iSCSIForm
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.ISCSiCheckedListBox = new System.Windows.Forms.CheckedListBox();
            this.InitDiskBtn = new System.Windows.Forms.Button();
            this.SetDiskOnlineBtn = new System.Windows.Forms.Button();
            this.ISCSiStatusLable = new System.Windows.Forms.Label();
            this.PartitionSizeLable = new System.Windows.Forms.Label();
            this.ISCSiStatusText = new System.Windows.Forms.Label();
            this.PartitionSizeText = new System.Windows.Forms.Label();
            this.SetDiskOffbtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // ISCSiCheckedListBox
            // 
            this.ISCSiCheckedListBox.FormattingEnabled = true;
            this.ISCSiCheckedListBox.HorizontalScrollbar = true;
            this.ISCSiCheckedListBox.Location = new System.Drawing.Point(12, 12);
            this.ISCSiCheckedListBox.Name = "ISCSiCheckedListBox";
            this.ISCSiCheckedListBox.Size = new System.Drawing.Size(189, 174);
            this.ISCSiCheckedListBox.TabIndex = 0;
            // 
            // InitDiskBtn
            // 
            this.InitDiskBtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.InitDiskBtn.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.InitDiskBtn.Location = new System.Drawing.Point(215, 72);
            this.InitDiskBtn.Name = "InitDiskBtn";
            this.InitDiskBtn.Size = new System.Drawing.Size(257, 34);
            this.InitDiskBtn.TabIndex = 1;
            this.InitDiskBtn.Text = "Initialize Disk";
            this.InitDiskBtn.UseVisualStyleBackColor = true;
            this.InitDiskBtn.Click += new System.EventHandler(this.InitDiskBtn_Click);
            // 
            // SetDiskOnlineBtn
            // 
            this.SetDiskOnlineBtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.SetDiskOnlineBtn.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.SetDiskOnlineBtn.Location = new System.Drawing.Point(215, 112);
            this.SetDiskOnlineBtn.Name = "SetDiskOnlineBtn";
            this.SetDiskOnlineBtn.Size = new System.Drawing.Size(257, 34);
            this.SetDiskOnlineBtn.TabIndex = 1;
            this.SetDiskOnlineBtn.Text = "Set Dick Online";
            this.SetDiskOnlineBtn.UseVisualStyleBackColor = true;
            this.SetDiskOnlineBtn.Click += new System.EventHandler(this.SetDiskOnline_Click);
            // 
            // ISCSiStatusLable
            // 
            this.ISCSiStatusLable.AutoSize = true;
            this.ISCSiStatusLable.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.ISCSiStatusLable.Location = new System.Drawing.Point(211, 12);
            this.ISCSiStatusLable.Name = "ISCSiStatusLable";
            this.ISCSiStatusLable.Size = new System.Drawing.Size(108, 21);
            this.ISCSiStatusLable.TabIndex = 2;
            this.ISCSiStatusLable.Text = "ISCSi Status :";
            // 
            // PartitionSizeLable
            // 
            this.PartitionSizeLable.AutoSize = true;
            this.PartitionSizeLable.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.PartitionSizeLable.Location = new System.Drawing.Point(211, 43);
            this.PartitionSizeLable.Name = "PartitionSizeLable";
            this.PartitionSizeLable.Size = new System.Drawing.Size(117, 21);
            this.PartitionSizeLable.TabIndex = 3;
            this.PartitionSizeLable.Text = "Partition Size :";
            // 
            // ISCSiStatusText
            // 
            this.ISCSiStatusText.AutoSize = true;
            this.ISCSiStatusText.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.ISCSiStatusText.Location = new System.Drawing.Point(335, 12);
            this.ISCSiStatusText.Name = "ISCSiStatusText";
            this.ISCSiStatusText.Size = new System.Drawing.Size(129, 21);
            this.ISCSiStatusText.TabIndex = 4;
            this.ISCSiStatusText.Text = "ISCSiStatusText";
            // 
            // PartitionSizeText
            // 
            this.PartitionSizeText.AutoSize = true;
            this.PartitionSizeText.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.PartitionSizeText.Location = new System.Drawing.Point(335, 43);
            this.PartitionSizeText.Name = "PartitionSizeText";
            this.PartitionSizeText.Size = new System.Drawing.Size(138, 21);
            this.PartitionSizeText.TabIndex = 5;
            this.PartitionSizeText.Text = "PartitionSizeText";
            // 
            // SetDiskOffbtn
            // 
            this.SetDiskOffbtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.SetDiskOffbtn.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.SetDiskOffbtn.Location = new System.Drawing.Point(215, 152);
            this.SetDiskOffbtn.Name = "SetDiskOffbtn";
            this.SetDiskOffbtn.Size = new System.Drawing.Size(257, 34);
            this.SetDiskOffbtn.TabIndex = 1;
            this.SetDiskOffbtn.Text = "Set Dick Offline";
            this.SetDiskOffbtn.UseVisualStyleBackColor = true;
            this.SetDiskOffbtn.Click += new System.EventHandler(this.SetDiskOffbtn_Click);
            // 
            // iSCSIForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(481, 202);
            this.Controls.Add(this.PartitionSizeText);
            this.Controls.Add(this.ISCSiStatusText);
            this.Controls.Add(this.PartitionSizeLable);
            this.Controls.Add(this.ISCSiStatusLable);
            this.Controls.Add(this.SetDiskOffbtn);
            this.Controls.Add(this.SetDiskOnlineBtn);
            this.Controls.Add(this.InitDiskBtn);
            this.Controls.Add(this.ISCSiCheckedListBox);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "iSCSIForm";
            this.ShowInTaskbar = false;
            this.Text = "iSCSI Initialize";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.CheckedListBox ISCSiCheckedListBox;
        private System.Windows.Forms.Button InitDiskBtn;
        private System.Windows.Forms.Button SetDiskOnlineBtn;
        private System.Windows.Forms.Label ISCSiStatusLable;
        private System.Windows.Forms.Label PartitionSizeLable;
        private System.Windows.Forms.Label ISCSiStatusText;
        private System.Windows.Forms.Label PartitionSizeText;
        private System.Windows.Forms.Button SetDiskOffbtn;
    }
}