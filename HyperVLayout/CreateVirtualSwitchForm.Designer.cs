namespace Vanquisher
{
    partial class CreateVirtualSwitchForm
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CreateVirtualSwitchForm));
            this.NetAdapterCheckedListBox = new System.Windows.Forms.CheckedListBox();
            this.CreateSwitch = new System.Windows.Forms.Button();
            this.switchTextBox = new System.Windows.Forms.TextBox();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.SuspendLayout();
            // 
            // NetAdapterCheckedListBox
            // 
            this.NetAdapterCheckedListBox.Font = new System.Drawing.Font("微軟正黑體", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.NetAdapterCheckedListBox.FormattingEnabled = true;
            this.NetAdapterCheckedListBox.HorizontalScrollbar = true;
            this.NetAdapterCheckedListBox.Location = new System.Drawing.Point(13, 4);
            this.NetAdapterCheckedListBox.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.NetAdapterCheckedListBox.Name = "NetAdapterCheckedListBox";
            this.NetAdapterCheckedListBox.Size = new System.Drawing.Size(256, 104);
            this.NetAdapterCheckedListBox.TabIndex = 1;
            this.NetAdapterCheckedListBox.ItemCheck += new System.Windows.Forms.ItemCheckEventHandler(this.NetAdapterCheckedListBox_ItemCheck);
            // 
            // CreateSwitch
            // 
            this.CreateSwitch.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.CreateSwitch.Font = new System.Drawing.Font("微軟正黑體", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.CreateSwitch.Image = ((System.Drawing.Image)(resources.GetObject("CreateSwitch.Image")));
            this.CreateSwitch.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.CreateSwitch.Location = new System.Drawing.Point(154, 129);
            this.CreateSwitch.Name = "CreateSwitch";
            this.CreateSwitch.Size = new System.Drawing.Size(115, 27);
            this.CreateSwitch.TabIndex = 2;
            this.CreateSwitch.Text = "Create";
            this.CreateSwitch.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.CreateSwitch.UseVisualStyleBackColor = true;
            this.CreateSwitch.Click += new System.EventHandler(this.CreateSwitch_Click);
            // 
            // switchTextBox
            // 
            this.switchTextBox.BackColor = System.Drawing.SystemColors.Control;
            this.switchTextBox.Location = new System.Drawing.Point(13, 129);
            this.switchTextBox.Name = "switchTextBox";
            this.switchTextBox.Size = new System.Drawing.Size(135, 27);
            this.switchTextBox.TabIndex = 3;
            this.switchTextBox.Text = "vAccess";
            this.switchTextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.toolTip1.SetToolTip(this.switchTextBox, "Switch Name");
            // 
            // CreateVirtualSwitchForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 19F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(283, 166);
            this.Controls.Add(this.switchTextBox);
            this.Controls.Add(this.CreateSwitch);
            this.Controls.Add(this.NetAdapterCheckedListBox);
            this.Font = new System.Drawing.Font("微軟正黑體", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(136)));
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "CreateVirtualSwitchForm";
            this.Text = "Create Virtual Switch";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.CheckedListBox NetAdapterCheckedListBox;
        private System.Windows.Forms.Button CreateSwitch;
        private System.Windows.Forms.TextBox switchTextBox;
        private System.Windows.Forms.ToolTip toolTip1;
    }
}