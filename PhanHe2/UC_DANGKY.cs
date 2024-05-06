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
    public partial class UC_DANGKY : UserControl
    {
        public UC_DANGKY()
        {
            InitializeComponent();
        }

        private void DetailStaff_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Score_btn_Click(object sender, EventArgs e)
        {
            if(LogIn.work != "SV0") {
                var score = new FormScore_DANGKY();
                score.Show();
            } else
            {
                MessageBox.Show("Bạn không được cấp quyền");
            }
        }
    }
}
