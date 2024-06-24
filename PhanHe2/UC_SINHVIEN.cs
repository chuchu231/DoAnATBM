using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;
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
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                string alterstr = "ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY'";
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();
                    using (OracleCommand cmd = new OracleCommand(alterstr, conn))
                    { 
                        cmd.ExecuteNonQuery();
                    }
                    conn.Close();
                }

                try
                {
                    // Chuỗi truy vấn với các tham số
                    var queryString = "INSERT INTO ADMIN.SINHVIEN (MASV, HOTEN, PHAI, NGSINH, DCHI, DT, MACT, MANGANH, SOTCTL, DTBTL) " +
                                        "VALUES (:MASV, :HOTEN, :PHAI,:NGSINH, :DCHI, :DT, :MACT, :MANGANH, 0, 0)";

                    using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (OracleCommand cmd = new OracleCommand(queryString, conn))
                        {
                            // Thêm các tham số vào câu lệnh
                            cmd.Parameters.Add(new OracleParameter(":MASV", mssv.Text));
                            cmd.Parameters.Add(new OracleParameter(":HOTEN", nametxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":PHAI", Gioitinh.Text));
                            cmd.Parameters.Add(new OracleParameter(":NGSINH", DOB.Text));
                            cmd.Parameters.Add(new OracleParameter(":DCHI", addresstxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":DT", PhoneNumbertxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MACT", mact.Text));
                            cmd.Parameters.Add(new OracleParameter(":MANGANH", manganh.Text));
                            Console.WriteLine(DOB.Text);
                            // Thực thi câu lệnh SQL
                            cmd.ExecuteNonQuery();

                            // Hiển thị thông báo thành công
                            MessageBox.Show("Thêm sinh viên thành công.");
                        }
                        conn.Close();
                        UC_SINHVIEN_Load(sender, e);
                    }
                }
                catch (OracleException ex)
                {
                    conn.Close();
                    // Bắt lỗi Oracle và hiển thị thông báo lỗi từ trigger
                    if (ex.Number == 00001)
                    {
                        MessageBox.Show("Mã sinh viên đã tồn tại!");
                    }
                    else
                    {
                        MessageBox.Show("Lỗi Oracle: " + ex.Message);
                    }
                }
                catch (Exception ex)
                {
                    conn.Close();
                    // Ghi lại lỗi hoặc hiển thị thông báo lỗi
                    MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
                }

            }
            else if (LogIn.role == "RL_TRUONGBM")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.role == "RL_NHANVIEN")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.role == "RL_GIANGVIEN")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
        }

        private void delbtn_Click(object sender, EventArgs e)
        {
            if (LogIn.role == "RL_SINHVIEN")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.role == "RL_TRUONGBM")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.role == "RL_NHANVIEN")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.role == "RL_GIANGVIEN")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
        }

        private void btn_Update_Click(object sender, EventArgs e)
        {
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                string alterstr = "ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY'";
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();
                    using (OracleCommand cmd = new OracleCommand(alterstr, conn))
                    {
                        cmd.ExecuteNonQuery();
                    }
                    conn.Close();
                }
                try
                {
                    var queryString = "UPDATE ADMIN.SINHVIEN SET HOTEN = :HOTEN, NGSINH = :NGSINH, PHAI = :PHAI, DCHI = :DCHI, DT = :DT, MACT = :MACT, MANGANH = :MANGANH" +
                                        " WHERE MASV = :MASV";

                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
                            // Thêm các tham số vào câu lệnh SQL
                            cmd.Parameters.Add(new OracleParameter(":HOTEN", nametxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":NGSINH", DOB.Text));
                            cmd.Parameters.Add(new OracleParameter(":PHAI", Gioitinh.Text));
                            cmd.Parameters.Add(new OracleParameter(":DCHI", addresstxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":DT", PhoneNumbertxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MACT", mact.Text));
                            cmd.Parameters.Add(new OracleParameter(":MANGANH", manganh.Text));
                            cmd.Parameters.Add(new OracleParameter(":MASV", mssv.Text));

                            // Thực thi câu lệnh SQL
                            cmd.ExecuteNonQuery();
                        }
                    }
                    conn.Close();
                    MessageBox.Show("Cập nhật thành công.");
                    UC_SINHVIEN_Load(sender, e);
                }
                catch (Exception ex)
                {
                    conn.Close();
                    // Ghi lại lỗi hoặc hiển thị thông báo lỗi
                    MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
                }


            }
            else if (LogIn.role == "RL_TRUONGBM")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.role == "RL_NHANVIEN")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.role == "RL_GIANGVIEN")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
        }
        private void UC_SINHVIEN_Load(object sender, EventArgs e)
        {
            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            DetailStaff.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            DetailStaff.ReadOnly = true;
            // Load datagridview
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIAOVU" || LogIn.role == "RL_TRUONGBM")
            {
                UC_Containers.SendToBack();
                var queryString = "SELECT * FROM ADMIN.SINHVIEN";

                var dt = new DataTable();

                var da = new OracleDataAdapter(queryString, conn);
                da.Fill(dt);
                DetailStaff.DataSource = dt;

                conn.Close();
                dt.Dispose();
                da.Dispose();
            }
            else if (LogIn.role == "RL_TRUONGKHOA")
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
            else if (LogIn.role == "RL_NHANVIEN")
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
            else if (LogIn.role == "RL_GIANGVIEN")
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
        }

        private void DetailStaff_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            mssv.Text = this.DetailStaff.Rows[e.RowIndex].Cells[0].Value.ToString();
            nametxtb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[1].Value.ToString();
            Gioitinh.Text = this.DetailStaff.Rows[e.RowIndex].Cells[2].Value.ToString();
            DOB.Text = this.DetailStaff.Rows[e.RowIndex].Cells[3].Value.ToString();
            addresstxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[4].Value.ToString();
            PhoneNumbertxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[5].Value.ToString();
            mact.Text = this.DetailStaff.Rows[e.RowIndex].Cells[6].Value.ToString();
            manganh.Text = this.DetailStaff.Rows[e.RowIndex].Cells[7].Value.ToString();
        }
    }
}
