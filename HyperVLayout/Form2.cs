using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace HyperVLayout
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
            listView1.ItemMouseHover += new ListViewItemMouseHoverEventHandler(listView1_ItemMouseHover);

        }

        void listView1_ItemMouseHover(object sender, ListViewItemMouseHoverEventArgs e)
        {
            foreach (ListViewItem item in listView1.Items)
            {
                item.BackColor = Color.FromArgb(255, 255, 128);
            }
            e.Item.BackColor = Color.LightBlue;
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }
        int i = 0;
        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listView1.SelectedItems.Count > 0)
            {
                string text = listView1.SelectedItems[0].Text;
                foreach (ListViewItem selected in listView1.SelectedItems)
                {
                    selected.Selected = false;

                }
                var a = listView1.SelectedItems;
                label8.Text = text + i++;

            }
            //((ListView)sender).SelectedItems[0].Text
        }




    }
}
