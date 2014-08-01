using IPAddressControlLib;

namespace HyperVLayout
{
    partial class Form2
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
            this.label2 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.CheckAllConfig = new System.Windows.Forms.Button();
            this.label8 = new System.Windows.Forms.Label();
            this.ModuleListView = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.SuspendLayout();
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(164, 432);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(27, 12);
            this.label2.TabIndex = 3;
            this.label2.Text = "AD :";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(209, 429);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(140, 22);
            this.textBox1.TabIndex = 4;
            this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // CheckAllConfig
            // 
            this.CheckAllConfig.Location = new System.Drawing.Point(383, 427);
            this.CheckAllConfig.Name = "CheckAllConfig";
            this.CheckAllConfig.Size = new System.Drawing.Size(113, 23);
            this.CheckAllConfig.TabIndex = 6;
            this.CheckAllConfig.Text = "Check Config";
            this.CheckAllConfig.UseVisualStyleBackColor = true;
            this.CheckAllConfig.Click += new System.EventHandler(this.CheckAllConfig_Click);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("新細明體", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.label8.Location = new System.Drawing.Point(12, 438);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(83, 12);
            this.label8.TabIndex = 13;
            this.label8.Text = "Check feature";
            this.label8.Click += new System.EventHandler(this.label8_Click);
            // 
            // ModuleListView
            // 
            this.ModuleListView.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.ModuleListView.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.ModuleListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1});
            this.ModuleListView.Font = new System.Drawing.Font("微軟正黑體", 18.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.ModuleListView.FullRowSelect = true;
            this.ModuleListView.GridLines = true;
            this.ModuleListView.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.None;
            this.ModuleListView.Location = new System.Drawing.Point(42, 33);
            this.ModuleListView.Margin = new System.Windows.Forms.Padding(3, 3, 3, 5);
            this.ModuleListView.Name = "ModuleListView";
            this.ModuleListView.Size = new System.Drawing.Size(419, 352);
            this.ModuleListView.TabIndex = 17;
            this.ModuleListView.UseCompatibleStateImageBehavior = false;
            this.ModuleListView.View = System.Windows.Forms.View.Details;
            this.ModuleListView.VirtualListSize = 5;
            // this.ModuleListView.SelectedIndexChanged += new System.EventHandler(this.listView1_SelectedIndexChanged);
            // 
            // columnHeader1
            // 
            this.columnHeader1.Width = 418;
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(537, 481);
            this.Controls.Add(this.ModuleListView);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.CheckAllConfig);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label2);
            this.Name = "Form2";
            this.Text = "Form2";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button CheckAllConfig;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.ListView ModuleListView;
        private System.Windows.Forms.ColumnHeader columnHeader1;


    }
}