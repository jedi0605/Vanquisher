namespace HyperVLayout
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
            this.checkedListBox1 = new System.Windows.Forms.CheckedListBox();
            this.InitDisk = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // checkedListBox1
            // 
            this.checkedListBox1.FormattingEnabled = true;
            this.checkedListBox1.Location = new System.Drawing.Point(12, 12);
            this.checkedListBox1.Name = "checkedListBox1";
            this.checkedListBox1.Size = new System.Drawing.Size(118, 89);
            this.checkedListBox1.TabIndex = 0;
            // 
            // InitDisk
            // 
            this.InitDisk.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.InitDisk.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.InitDisk.Location = new System.Drawing.Point(137, 13);
            this.InitDisk.Name = "InitDisk";
            this.InitDisk.Size = new System.Drawing.Size(146, 34);
            this.InitDisk.TabIndex = 1;
            this.InitDisk.Text = "Initialize Disk";
            this.InitDisk.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button1.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.button1.Location = new System.Drawing.Point(137, 67);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(146, 34);
            this.button1.TabIndex = 1;
            this.button1.Text = "Set Dick Online";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // iSCSIForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(308, 117);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.InitDisk);
            this.Controls.Add(this.checkedListBox1);
            this.Name = "iSCSIForm";
            this.Text = "iSCSIForm";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.CheckedListBox checkedListBox1;
        private System.Windows.Forms.Button InitDisk;
        private System.Windows.Forms.Button button1;
    }
}