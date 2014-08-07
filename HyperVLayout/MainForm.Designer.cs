namespace HyperVLayout
{
    partial class MainForm
    {
        /// <summary>
        /// 設計工具所需的變數。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清除任何使用中的資源。
        /// </summary>
        /// <param name="disposing">如果應該處置 Managed 資源則為 true，否則為 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form 設計工具產生的程式碼

        /// <summary>
        /// 此為設計工具支援所需的方法 - 請勿使用程式碼編輯器
        /// 修改這個方法的內容。
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.initializeHyerVHostToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.corefigToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.OpenCorefigbtn = new System.Windows.Forms.Button();
            this.OpenExpolerbtn = new System.Windows.Forms.Button();
            this.Open59btn = new System.Windows.Forms.Button();
            this.notifyIcon1 = new System.Windows.Forms.NotifyIcon(this.components);
            this.Corefigbox = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.TaskManagerbtn = new System.Windows.Forms.Button();
            this.PowershellBtn = new System.Windows.Forms.Button();
            this.Reboot = new System.Windows.Forms.Button();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem1,
            this.helpToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(472, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.initializeHyerVHostToolStripMenuItem,
            this.corefigToolStripMenuItem});
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(43, 20);
            this.toolStripMenuItem1.Text = "Tools";
            // 
            // initializeHyerVHostToolStripMenuItem
            // 
            this.initializeHyerVHostToolStripMenuItem.Name = "initializeHyerVHostToolStripMenuItem";
            this.initializeHyerVHostToolStripMenuItem.Size = new System.Drawing.Size(166, 22);
            this.initializeHyerVHostToolStripMenuItem.Text = "Initialize HyerV host";
            this.initializeHyerVHostToolStripMenuItem.Click += new System.EventHandler(this.initializeHyerVHostToolStripMenuItem_Click);
            // 
            // corefigToolStripMenuItem
            // 
            this.corefigToolStripMenuItem.Name = "corefigToolStripMenuItem";
            this.corefigToolStripMenuItem.Size = new System.Drawing.Size(166, 22);
            this.corefigToolStripMenuItem.Text = "Corefig";
            this.corefigToolStripMenuItem.Click += new System.EventHandler(this.corefigToolStripMenuItem_Click);
            // 
            // helpToolStripMenuItem
            // 
            this.helpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutToolStripMenuItem});
            this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
            this.helpToolStripMenuItem.Size = new System.Drawing.Size(39, 20);
            this.helpToolStripMenuItem.Text = "Help";
            // 
            // aboutToolStripMenuItem
            // 
            this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
            this.aboutToolStripMenuItem.Size = new System.Drawing.Size(99, 22);
            this.aboutToolStripMenuItem.Text = "About";
            this.aboutToolStripMenuItem.Click += new System.EventHandler(this.aboutToolStripMenuItem_Click);
            // 
            // OpenCorefigbtn
            // 
            this.OpenCorefigbtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.OpenCorefigbtn.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.OpenCorefigbtn.Location = new System.Drawing.Point(274, 119);
            this.OpenCorefigbtn.Name = "OpenCorefigbtn";
            this.OpenCorefigbtn.Size = new System.Drawing.Size(187, 38);
            this.OpenCorefigbtn.TabIndex = 1;
            this.OpenCorefigbtn.Text = "Open Corefig";
            this.OpenCorefigbtn.UseVisualStyleBackColor = true;
            this.OpenCorefigbtn.Click += new System.EventHandler(this.OpenCorefigbtn_Click);
            // 
            // OpenExpolerbtn
            // 
            this.OpenExpolerbtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.OpenExpolerbtn.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.OpenExpolerbtn.Location = new System.Drawing.Point(28, 291);
            this.OpenExpolerbtn.Name = "OpenExpolerbtn";
            this.OpenExpolerbtn.Size = new System.Drawing.Size(187, 38);
            this.OpenExpolerbtn.TabIndex = 1;
            this.OpenExpolerbtn.Text = "Open Expoler++";
            this.OpenExpolerbtn.UseVisualStyleBackColor = true;
            this.OpenExpolerbtn.Click += new System.EventHandler(this.OpenExpolerbtn_Click);
            // 
            // Open59btn
            // 
            this.Open59btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.Open59btn.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.Open59btn.Location = new System.Drawing.Point(274, 291);
            this.Open59btn.Name = "Open59btn";
            this.Open59btn.Size = new System.Drawing.Size(187, 38);
            this.Open59btn.TabIndex = 1;
            this.Open59btn.Text = "Open 59 Manager";
            this.Open59btn.UseVisualStyleBackColor = true;
            this.Open59btn.Click += new System.EventHandler(this.Open59btn_Click);
            // 
            // notifyIcon1
            // 
            this.notifyIcon1.Text = "notifyIcon1";
            this.notifyIcon1.Visible = true;
            // 
            // Corefigbox
            // 
            this.Corefigbox.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.Corefigbox.Cursor = System.Windows.Forms.Cursors.Default;
            this.Corefigbox.Font = new System.Drawing.Font("微軟正黑體", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.Corefigbox.Location = new System.Drawing.Point(274, 37);
            this.Corefigbox.Multiline = true;
            this.Corefigbox.Name = "Corefigbox";
            this.Corefigbox.ReadOnly = true;
            this.Corefigbox.Size = new System.Drawing.Size(187, 76);
            this.Corefigbox.TabIndex = 3;
            this.Corefigbox.Text = resources.GetString("Corefigbox.Text");
            // 
            // textBox2
            // 
            this.textBox2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.textBox2.Cursor = System.Windows.Forms.Cursors.Default;
            this.textBox2.Font = new System.Drawing.Font("微軟正黑體", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.textBox2.Location = new System.Drawing.Point(28, 181);
            this.textBox2.Multiline = true;
            this.textBox2.Name = "textBox2";
            this.textBox2.ReadOnly = true;
            this.textBox2.Size = new System.Drawing.Size(187, 104);
            this.textBox2.TabIndex = 3;
            this.textBox2.Text = resources.GetString("textBox2.Text");
            // 
            // textBox3
            // 
            this.textBox3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.textBox3.Cursor = System.Windows.Forms.Cursors.Default;
            this.textBox3.Font = new System.Drawing.Font("微軟正黑體", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.textBox3.Location = new System.Drawing.Point(274, 181);
            this.textBox3.Multiline = true;
            this.textBox3.Name = "textBox3";
            this.textBox3.ReadOnly = true;
            this.textBox3.Size = new System.Drawing.Size(187, 104);
            this.textBox3.TabIndex = 3;
            this.textBox3.Text = resources.GetString("textBox3.Text");
            // 
            // TaskManagerbtn
            // 
            this.TaskManagerbtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.TaskManagerbtn.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.TaskManagerbtn.Image = ((System.Drawing.Image)(resources.GetObject("TaskManagerbtn.Image")));
            this.TaskManagerbtn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.TaskManagerbtn.Location = new System.Drawing.Point(28, 39);
            this.TaskManagerbtn.Name = "TaskManagerbtn";
            this.TaskManagerbtn.Size = new System.Drawing.Size(166, 34);
            this.TaskManagerbtn.TabIndex = 4;
            this.TaskManagerbtn.Text = "Task Manager";
            this.TaskManagerbtn.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.TaskManagerbtn.UseVisualStyleBackColor = true;
            this.TaskManagerbtn.Click += new System.EventHandler(this.TaskManagerbtn_Click);
            // 
            // PowershellBtn
            // 
            this.PowershellBtn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.PowershellBtn.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.PowershellBtn.Image = ((System.Drawing.Image)(resources.GetObject("PowershellBtn.Image")));
            this.PowershellBtn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.PowershellBtn.Location = new System.Drawing.Point(28, 79);
            this.PowershellBtn.Name = "PowershellBtn";
            this.PowershellBtn.Size = new System.Drawing.Size(166, 34);
            this.PowershellBtn.TabIndex = 4;
            this.PowershellBtn.Text = "Powershell";
            this.PowershellBtn.UseVisualStyleBackColor = true;
            this.PowershellBtn.Click += new System.EventHandler(this.PowershellBtn_Click);
            // 
            // Reboot
            // 
            this.Reboot.FlatAppearance.BorderColor = System.Drawing.Color.White;
            this.Reboot.FlatAppearance.BorderSize = 0;
            this.Reboot.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.Reboot.Image = ((System.Drawing.Image)(resources.GetObject("Reboot.Image")));
            this.Reboot.Location = new System.Drawing.Point(420, 332);
            this.Reboot.Name = "Reboot";
            this.Reboot.Size = new System.Drawing.Size(41, 41);
            this.Reboot.TabIndex = 5;
            this.toolTip1.SetToolTip(this.Reboot, "Reboot");
            this.Reboot.UseVisualStyleBackColor = true;
            this.Reboot.Click += new System.EventHandler(this.Reboot_Click);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(472, 373);
            this.Controls.Add(this.Reboot);
            this.Controls.Add(this.PowershellBtn);
            this.Controls.Add(this.TaskManagerbtn);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.Corefigbox);
            this.Controls.Add(this.Open59btn);
            this.Controls.Add(this.OpenExpolerbtn);
            this.Controls.Add(this.OpenCorefigbtn);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.MaximizeBox = false;
            this.Name = "MainForm";
            this.Text = "Vanquisher";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem initializeHyerVHostToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem corefigToolStripMenuItem;
        private System.Windows.Forms.Button OpenCorefigbtn;
        private System.Windows.Forms.Button OpenExpolerbtn;
        private System.Windows.Forms.Button Open59btn;
        private System.Windows.Forms.NotifyIcon notifyIcon1;
        private System.Windows.Forms.TextBox Corefigbox;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.Button TaskManagerbtn;
        private System.Windows.Forms.Button PowershellBtn;
        private System.Windows.Forms.Button Reboot;
        private System.Windows.Forms.ToolTip toolTip1;
    }
}

