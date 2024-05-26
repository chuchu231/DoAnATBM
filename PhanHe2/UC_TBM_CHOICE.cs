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
    public partial class UC_TBM_CHOICE : UserControl
    {
        public UC_TBM_CHOICE()
        {
            InitializeComponent();
        }


        private void hp_Click(object sender, EventArgs e)
        {
            UC_PHANCONG uc = new UC_PHANCONG();
            uc.Dock = DockStyle.Fill;
            this.Controls.Clear();
            this.Controls.Add(uc);
            uc.BringToFront();
        }

        private void gv_Click(object sender, EventArgs e)
        {

            UC_PHANCONG_GIANGVIEN uc = new UC_PHANCONG_GIANGVIEN();
            uc.Dock = DockStyle.Fill;
            this.Controls.Clear();
            this.Controls.Add(uc);
            uc.BringToFront();
        }
    }
}
