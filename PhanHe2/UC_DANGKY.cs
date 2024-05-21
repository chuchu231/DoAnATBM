using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
using static System.Formats.Asn1.AsnWriter;

namespace PhanHe2
{
    public partial class UC_DANGKY : UserControl
    {
        private string connectionString;
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        public FormScore_DANGKY score = new FormScore_DANGKY();

        public UC_DANGKY()
        {
            InitializeComponent();
            connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            // Replace placeholders with actual values
            connectionString = connectionString.Replace("{$user$}", LogIn.username);
            connectionString = connectionString.Replace("{$password%}", LogIn.password);
            conn = new OracleConnection(connectionString);
            show();
        }

        public void DetailStaff_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            score.Show();
            score.tbxMSSV.Text = this.DetailStaff.Rows[e.RowIndex].Cells[0].Value.ToString();
            score.tbxMAHP.Text = this.DetailStaff.Rows[e.RowIndex].Cells[2].Value.ToString();
            score.tbxHK.Text = this.DetailStaff.Rows[e.RowIndex].Cells[3].Value.ToString();
            score.tbxNamHoc.Text = this.DetailStaff.Rows[e.RowIndex].Cells[4].Value.ToString();
            score.tbxCT.Text = this.DetailStaff.Rows[e.RowIndex].Cells[5].Value.ToString();
            score.tbxTH.Text = this.DetailStaff.Rows[e.RowIndex].Cells[6].Value.ToString();
            score.tbxQT.Text = this.DetailStaff.Rows[e.RowIndex].Cells[7].Value.ToString();
            score.tbxCK.Text = this.DetailStaff.Rows[e.RowIndex].Cells[8].Value.ToString();
            score.lbOverall.Text = this.DetailStaff.Rows[e.RowIndex].Cells[8].Value.ToString();

        }
        void show()
        {
            UC_Containers.SendToBack();
            var queryString = "SELECT * FROM CADMIN2.DANGKY\r\n";

            var dt = new DataTable();

            var da = new OracleDataAdapter(queryString, conn);
            da.Fill(dt);
            DetailStaff.DataSource = dt;

            conn.Close();
            dt.Dispose();
            da.Dispose();
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

        private void updatebtn_Click(object sender, EventArgs e)
        {
            

        }
    }
}
