using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;


namespace PhanHe2
{
    public partial class UC_SINHVIEN : UserControl
    {
        private string connectionString;
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        
        public UC_SINHVIEN()
        {

            InitializeComponent();
            connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            // Replace the placeholders with actual username and password
            connectionString = connectionString.Replace("{$user$}", LogIn.username);
            connectionString = connectionString.Replace("{$password%}", LogIn.password);
            conn = new OracleConnection(connectionString);
        }

        private void addUser_btn_Click(object sender, EventArgs e)
        {
            if (LogIn.work == "SV0")
            {
                // do something ?
            }
            else if (LogIn.work == "GVU")
            {
                try
                {
                    var queryString = "INSERT INTO ADMIN.SINHVIEN (MASV, HOTEN, NGSINH, DCHI, DT) VALUES ('" + mssv.Text + "', '" + nametxtb.Text + "', '" + DOB.Text + "', '" + addresstxb.Text + "', " + PhoneNumbertxb.Text + "')";

                    using (conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (OracleCommand cmd = new OracleCommand(queryString, conn))
                        {

                            Console.WriteLine(queryString);
                            cmd.ExecuteNonQuery();

                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception or display a message
                    MessageBox.Show("An error occurred: " + ex.Message);
                }
            }
            else if (LogIn.work == "TBM")
            {
                // do something ?
            }
            else if (LogIn.work == "TK0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.work == "NV0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.work == "GV0")
            {
                // do something ?
            }
        }

        private void delbtn_Click(object sender, EventArgs e)
        {
            if (LogIn.work == "SV0")
            {
                // do something ?
            }
            else if (LogIn.work == "GVU")
            {
                
            }
            else if (LogIn.work == "TBM")
            {
                // do something ?
            }
            else if (LogIn.work == "TK0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.work == "NV0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.work == "GV0")
            {
                // do something ?
            }
        }

        private void btn_Update_Click(object sender, EventArgs e)
        {
            if (LogIn.work == "SV0")
            {
                // do something ?
            }
            else if (LogIn.work == "GVU")
            {
                try
                {

                    var queryString = "UPDATE ADMIN.SINHVIEN SET HOTEN = '" + nametxtb.Text + "', NGSINH = '" + DOB.Text + "', DCHI = '" + addresstxb.Text + "', DT = '"+ PhoneNumbertxb.Text+"' " +
                                        "WHEREMASV = '" + mssv.Text + "'";
                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception or display a message
                    MessageBox.Show("An error occurred: " + ex.Message);
                }

            }
            else if (LogIn.work == "TBM")
            {
                // do something ?
            }
            else if (LogIn.work == "TK0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.work == "NV0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.work == "GV0")
            {
                // do something ?
            }
        }
        private void UC_SINHVIEN_Load(object sender, EventArgs e)
        {

            // Load datagridview
            if (LogIn.work == "SV0")
            {
                // do something ?
            }
            else if (LogIn.work == "GVU" || LogIn.work == "TBM")
            {
                UC_Containers.SendToBack();
                var queryString = "SELECT * FROM ADMIN.SINHVIEN\r\n";

                var dt = new DataTable();

                var da = new OracleDataAdapter(queryString, conn);
                da.Fill(dt);
                DetailStaff.DataSource = dt;

                conn.Close();
                dt.Dispose();
                da.Dispose();
            }
            else if (LogIn.work == "TK0")
            {
                UC_Containers.SendToBack();
                var queryString = "SELECT * FROM KAN.SINHVIEN\r\n";

                var dt = new DataTable();

                var da = new OracleDataAdapter(queryString, conn);
                da.Fill(dt);
                DetailStaff.DataSource = dt;

                conn.Close();
                dt.Dispose();
                da.Dispose();
            }
            else if (LogIn.work == "NV0")
            {
                // do something ?
            }
            else if (LogIn.work == "GV0")
            {
                // do something ?
            }
        }

        private void DetailStaff_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            mssv.Text = this.DetailStaff.Rows[e.RowIndex].Cells[0].Value.ToString();
            nametxtb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[1].Value.ToString();
            DOB.Text = this.DetailStaff.Rows[e.RowIndex].Cells[3].Value.ToString();
            addresstxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[4].Value.ToString();
            PhoneNumbertxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[5].Value.ToString();

        }
    }
}
