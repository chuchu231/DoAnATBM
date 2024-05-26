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
using System.Diagnostics.Metrics;


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
                string alterstr = "ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY'";
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();
                    using (OracleCommand cmd = new OracleCommand(alterstr, conn))
                    { 
                        cmd.ExecuteNonQuery();
                    }
                }

                try
                {
                    // Chuỗi truy vấn với các tham số
                    var queryString = "INSERT INTO CADMIN2.SINHVIEN (MASV, HOTEN, NGSINH, DCHI, DT) VALUES (:MASV, :HOTEN, :NGSINH, :DCHI, :DT)";

                    using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (OracleCommand cmd = new OracleCommand(queryString, conn))
                        {
                            // Thêm các tham số vào câu lệnh
                            cmd.Parameters.Add(new OracleParameter(":MASV", mssv.Text));
                            cmd.Parameters.Add(new OracleParameter(":HOTEN", nametxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":NGSINH", DOB.Text));
                            cmd.Parameters.Add(new OracleParameter(":DCHI", addresstxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":DT", PhoneNumbertxb.Text));

                            // Thực thi câu lệnh SQL
                            cmd.ExecuteNonQuery();

                            // Hiển thị thông báo thành công
                            MessageBox.Show("Thêm sinh viên thành công.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Ghi lại lỗi hoặc hiển thị thông báo lỗi
                    MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
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
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.work == "GVU")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.work == "TBM")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
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
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
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
                string alterstr = "ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY'";
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();
                    using (OracleCommand cmd = new OracleCommand(alterstr, conn))
                    {
                        cmd.ExecuteNonQuery();
                    }
                }
                try
                {
                    var queryString = "UPDATE CADMIN2.SINHVIEN SET HOTEN = :HOTEN, NGSINH = :NGSINH, DCHI = :DCHI, DT = :DT WHERE MASV = :MASV";

                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
                            // Thêm các tham số vào câu lệnh SQL
                            cmd.Parameters.Add(new OracleParameter(":HOTEN", nametxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":NGSINH", DOB.Text));
                            cmd.Parameters.Add(new OracleParameter(":DCHI", addresstxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":DT", PhoneNumbertxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MASV", mssv.Text));

                            // Thực thi câu lệnh SQL
                            cmd.ExecuteNonQuery();
                        }
                    }
                    MessageBox.Show("Cập nhật thành công.");
                }
                catch (Exception ex)
                {
                    // Ghi lại lỗi hoặc hiển thị thông báo lỗi
                    MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
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
                var queryString = "SELECT * FROM CADMIN2.SINHVIEN";

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
                var queryString = "SELECT * FROM CADMIN2.SINHVIEN\r\n";

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
                UC_Containers.SendToBack();
                var queryString = "SELECT * FROM CADMIN2.SINHVIEN\r\n";

                var dt = new DataTable();

                var da = new OracleDataAdapter(queryString, conn);
                da.Fill(dt);
                DetailStaff.DataSource = dt;

                conn.Close();
                dt.Dispose();
                da.Dispose();
            }
            else if (LogIn.work == "GV0")
            {
                UC_Containers.SendToBack();
                var queryString = "SELECT * FROM CADMIN2.SINHVIEN\r\n";

                var dt = new DataTable();

                var da = new OracleDataAdapter(queryString, conn);
                da.Fill(dt);
                DetailStaff.DataSource = dt;

                conn.Close();
                dt.Dispose();
                da.Dispose();
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
