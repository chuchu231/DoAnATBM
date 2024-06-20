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

namespace PhanHe2
{
    public partial class UC_NHANSU : UserControl
    {

        public UC_NHANSU()
        {
            InitializeComponent();
        }

        private void DetailStaff_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                // Lấy dữ liệu của hàng được chọn
                DataGridViewRow row = DetailStaff.Rows[e.RowIndex];

                // Lấy dữ liệu của từng cột
                foreach (DataGridViewCell cell in row.Cells)
                {
                    if (cell.OwningColumn.HeaderText == "HOTEN")
                    {
                        nametxtb.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "NGSINH")
                    {
                        DOB.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "VAITRO")
                    {
                        roletxb.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "DT")
                    {
                        PhoneNumbertxb.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "MANV")
                    {
                        manv.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "PHAI")
                    {
                        phai.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "PHUCAP")
                    {
                        salary.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "MADV")
                    {
                        madv.Text = cell.Value?.ToString();
                    }
                }
            }
        }

        private void addUser_btn_Click(object sender, EventArgs e)
        {
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
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
                    var queryString = "INSERT INTO ADMIN.NHANSU (MANV, HOTEN, PHAI, NGSINH, PHUCAP,  DT, VAITRO, MADV) " +
                        "VALUES (:MANV, :HOTEN, :PHAI, :NGAYSINH, :PHUCAP, :DT, :VAITRO, :MADV)";

                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
                            cmd.Parameters.Add(new OracleParameter(":MANV", manv.Text));
                            cmd.Parameters.Add(new OracleParameter(":HOTEN", nametxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":PHAI", phai.Text));
                            cmd.Parameters.Add(new OracleParameter(":NGAYSINH", DOB.Text));
                            cmd.Parameters.Add(new OracleParameter(":PHUCAP", salary.Text));
                            cmd.Parameters.Add(new OracleParameter(":DT", PhoneNumbertxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":VAITRO", roletxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MADV", madv.Text));

                            cmd.ExecuteNonQuery();

                            MessageBox.Show("Thêm nhân viên thành công.");
                        }
                        conn.Close();
                        UC_NHANSU_Load(sender, e);
                    }
                }
                catch (OracleException ex)
                {
                    // Bắt lỗi Oracle và hiển thị thông báo lỗi từ trigger
                    if (ex.Number == 00001)
                    {
                        MessageBox.Show("Mã nhân viên đã tồn tại!");
                    }
                    else
                    {
                        MessageBox.Show("Lỗi Oracle: " + ex.Message);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
                }
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
                try
                {
                    var queryString = "DELETE FROM ADMIN.NHANSU WHERE MANV = :MANV";
                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
                            cmd.Parameters.Add(new OracleParameter(":MANV", manv.Text));

                            cmd.ExecuteNonQuery();

                            MessageBox.Show("Xóa nhân viên thành công.");
                        }
                        UC_NHANSU_Load(sender, e);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
                }

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
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.role == "RL_TRUONGKHOA")
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
                    var queryString = "UPDATE ADMIN.NHANSU SET HOTEN = :HOTEN, PHAI = :PHAI, NGSINH= :NGAYSINH, PHUCAP = :PHUCAP, DT = :DT, VAITRO = :VAITRO, MADV = :MADV WHERE MANV = :MANV";

                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {

                            cmd.Parameters.Add(new OracleParameter(":HOTEN", nametxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":PHAI", phai.Text));
                            cmd.Parameters.Add(new OracleParameter(":NGAYSINH", DOB.Text));
                            cmd.Parameters.Add(new OracleParameter(":PHUCAP", salary.Text));
                            cmd.Parameters.Add(new OracleParameter(":DT", PhoneNumbertxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":VAITRO", roletxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MADV", madv.Text));
                            cmd.Parameters.Add(new OracleParameter(":MANV", manv.Text));
                            Console.WriteLine(DOB.Text);
                            cmd.ExecuteNonQuery();
                            MessageBox.Show("Cập nhật nhân viên thành công.");
                        }
                        UC_NHANSU_Load(sender, e);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
                }
            }
            else
            {
                try
                {
                    string query = "UPDATE ADMIN.NHANSU SET DT = :phone";

                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(query, conn))
                        {
                            cmd.Parameters.Add(new OracleParameter(":phone", PhoneNumbertxb.Text));

                            cmd.ExecuteNonQuery();

                            MessageBox.Show("Cập nhật số điện thoại thành công.");
                            UC_NHANSU_Load(sender, e);
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
                }

            }
        }

        private void PopulateComboBox()
        {
            try
            {
                using (OracleConnection connection = new OracleConnection(LogIn.connectionString))
                {
                    connection.Open();
                    OracleCommand cmd = new OracleCommand("SELECT MADV FROM ADMIN.DONVI", connection);
                    using (OracleDataReader reader = cmd.ExecuteReader())
                    {
                        madv.Items.Clear();
                        while (reader.Read())
                        {
                            madv.Items.Add(reader["MADV"].ToString());
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }

        private void UC_NHANSU_Load(object sender, EventArgs e)
        {
            PopulateComboBox();
            manv.Enabled = false;
            phai.Enabled = false;
            salary.Enabled = false; 
            madv.Enabled = false;
            nametxtb.Enabled = false;
            DOB.Enabled = false;
            roletxb.Enabled = false; 
            // Load datagridview
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                manv.Enabled = true;
                phai.Enabled = true;
                salary.Enabled = true;
                madv.Enabled = true;
                nametxtb.Enabled = true;
                DOB.Enabled = true;
                roletxb.Enabled = true;
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM ADMIN.NHANSU", conn);
                        using (OracleDataReader reader = cmd.ExecuteReader())
                        {
                            DetailStaff.DataSource = null;
                            if (reader.HasRows)
                            {
                                DataTable dataTable = new DataTable();
                                dataTable.Load(reader);
                                DetailStaff.DataSource = dataTable;
                            }
                        }
                    }
                    DetailStaff.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
                    DetailStaff.ReadOnly = true;
                    conn.Close();
                }
            }
            else
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM ADMIN.NHANSU", conn);
                        using (OracleDataReader reader = cmd.ExecuteReader())
                        {
                            DetailStaff.DataSource = null;
                            if (reader.HasRows)
                            {
                                DataTable dataTable = new DataTable();
                                dataTable.Load(reader);
                                DetailStaff.DataSource = dataTable;
                            }
                        }
                    }
                    DetailStaff.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
                    DetailStaff.ReadOnly = true;
                    conn.Close();
                }
            }
            
            //nametxtb.Text = this.DetailStaff.Rows[0].Cells[1].Value.ToString();
            //DOB.Text = this.DetailStaff.Rows[0].Cells[3].Value.ToString();
            //roletxb.Text = this.DetailStaff.Rows[0].Cells[6].Value.ToString();
            //PhoneNumbertxb.Text = this.DetailStaff.Rows[0].Cells[5].Value.ToString();
        }
    }
}
