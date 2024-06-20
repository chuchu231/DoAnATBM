using System;
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
    public partial class UC_TK_CHOICE_DK : UserControl
    {
        public static int temp;
        public UC_TK_CHOICE_DK()
        {
            InitializeComponent();
        }

        private void dk_Click(object sender, EventArgs e)
        {
            temp = 1;
            UC_DANGKY uc = new UC_DANGKY();
            uc.Dock = DockStyle.Fill;
            this.Controls.Clear();
            this.Controls.Add(uc);
            uc.BringToFront();
        }

        private void own_Click(object sender, EventArgs e)
        {
            temp = 0;
            UC_DANGKY uc = new UC_DANGKY();
            uc.Dock = DockStyle.Fill;
            this.Controls.Clear();
            this.Controls.Add(uc);
            uc.BringToFront();
        }
    }
}
