﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PhanHe2
{
    public partial class UC_Admin_Audit : UserControl
    {
        public UC_Admin_Audit()
        {
            InitializeComponent();
        }

        

        private void FGA_Click(object sender, EventArgs e)
        {
            UC_Admin_FGA uc = new UC_Admin_FGA();
            uc.Dock = DockStyle.Fill;
            this.Controls.Clear();
            this.Controls.Add(uc);
            uc.BringToFront();
        }

        private void SA_Click(object sender, EventArgs e)
        {
            UC_Admin_Standard uc = new UC_Admin_Standard();
            uc.Dock = DockStyle.Fill;
            this.Controls.Clear();
            this.Controls.Add(uc);
            uc.BringToFront();
        }
    }
}
