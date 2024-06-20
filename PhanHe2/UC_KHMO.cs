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
    public partial class UC_KHMO : UserControl
    {
        OracleConnection conn = new OracleConnection(LogIn.connectionString);

        string old_hp, old_hk, old_nam, old_mact;
        public UC_KHMO()
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
                    if (cell.OwningColumn.HeaderText == "MAHP")
                    {
                        idtxtb.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "HK")
                    {
                        HKtxb.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "NAM")
                    {
                        Namtxb.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "MACT")
                    {
                        MACT.Text = cell.Value?.ToString();
                    }
                }
            }
        }

        private void delbtn_Click_1(object sender, EventArgs e)
        {
            if (LogIn.role == "RL_SINHVIEN")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                // do something ?
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
                // do something ?
            }
        }

        private void insert_btn_Click(object sender, EventArgs e)
        {
            if (LogIn.role == "RL_SINHVIEN")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                try
                {
                    var queryString = "INSERT INTO ADMIN.KHMO (MAHP, HK, NAM, MACT) VALUES (:MAHP, :HK, :NAM, :MACT)";

                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
                            cmd.Parameters.Add(new OracleParameter(":MAHP", idtxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":HK", HKtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":NAM", Namtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MACT", MACT.Text));

                            cmd.ExecuteNonQuery();
                        }
                    }

                    MessageBox.Show("Thêm kế hoạch mở môn thành công.");
                    UC_KHMO_Load(sender, e);
                }
                catch (OracleException ex)
                {
                    // Bắt lỗi Oracle và hiển thị thông báo lỗi từ trigger
                    if (ex.Number == 02291)
                    {
                        MessageBox.Show("Mã học phần không tồn tại!");
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
                // do something ?
            }
        }

        private void btn_Update_Click_1(object sender, EventArgs e)
        {
            if (LogIn.role == "RL_SINHVIEN")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                try
                {
                    var queryString = "UPDATE ADMIN.KHMO SET MAHP = :MAHP, HK = :HK, NAM = :NAM, MACT = :MACT " +
                                      "WHERE MAHP = :OLD_MAHP AND HK = :OLD_HK AND NAM = :OLD_NAM AND MACT = :OLD_MACT";

                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
                            cmd.Parameters.Add(new OracleParameter(":MAHP", idtxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":HK", HKtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":NAM", Namtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MACT", MACT.Text));
                            cmd.Parameters.Add(new OracleParameter(":OLD_MAHP", old_hp));
                            cmd.Parameters.Add(new OracleParameter(":OLD_HK", old_hk));
                            cmd.Parameters.Add(new OracleParameter(":OLD_NAM", old_nam));
                            cmd.Parameters.Add(new OracleParameter(":OLD_MACT", old_mact));

                            cmd.ExecuteNonQuery();
                        }
                    }
                    MessageBox.Show("Cập nhật khóa học thành công.");
                    UC_KHMO_Load(sender, e);
                }
                catch (OracleException ex)
                {
                    // Bắt lỗi Oracle và hiển thị thông báo lỗi từ trigger
                    if (ex.Number == 02291)
                    {
                        MessageBox.Show("Mã học phần không tồn tại!");
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
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.role == "RL_NHANVIEN" || LogIn.role == "RL_TRUONGBM")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.role == "RL_GIANGVIEN")
            {
                // do something ?
            }
        }

        private void UC_KHMO_Load(object sender, EventArgs e)
        {
            if (LogIn.role == "RL_SINHVIEN")
            {
                idtxtb.Enabled = false;
                HKtxb.Enabled = false; 
                Namtxb.Enabled = false;
                MACT.Enabled = false;
                var queryString = "SELECT * FROM ADMIN.KHMO\r\n";

                var dt = new DataTable();

                var da = new OracleDataAdapter(queryString, conn);

                da.Fill(dt);
                DetailStaff.DataSource = dt;
                DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                DetailStaff.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
                DetailStaff.ReadOnly = true;
                conn.Close();
                dt.Dispose();
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                UC_Containers.SendToBack();
                var queryString = "SELECT * FROM ADMIN.KHMO\r\n";

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
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM ADMIN.KHMO", conn);
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
                    conn.Close();
                }

            }
            else if (LogIn.role == "RL_NHANVIEN" || LogIn.role == "RL_TRUONGBM")
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM ADMIN.KHMO", conn);
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
                    conn.Close();
                }

            }
            else if (LogIn.role == "RL_GIANGVIEN")
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM ADMIN.KHMO", conn);
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
                    conn.Close();
                }
            }
        }

        private void searchKHMOButton_Click(object sender, EventArgs e)
        {
            string year = yeartxb.Text;
            string semester = semesterComB.Text;
            string queryString;
            if (year == "" && semester != "" && semester != "Tất cả")
            {
                queryString = $"SELECT * FROM ADMIN.KHMO WHERE HK = '{semester}'\r\n";
            }
            else if ((semester == "" || semester == "Tất cả") && year != "")
            {
                queryString = $"SELECT * FROM ADMIN.KHMO WHERE NAM = '{year}'\r\n";
            }
            else if ((semester == "" || semester == "Tất cả") && year == "")
            {
                queryString = $"SELECT * FROM ADMIN.KHMO\r\n";
            }
            else
            {
                queryString = $"SELECT * FROM ADMIN.KHMO WHERE NAM = '{year}' AND HK = '{semester}'\r\n";
            }

            var dt = new DataTable();

            var da = new OracleDataAdapter(queryString, conn);

            da.Fill(dt);
            DetailStaff.DataSource = dt;
            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            DetailStaff.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            DetailStaff.ReadOnly = true;
            conn.Close();
            dt.Dispose();
        }

        private void DetailStaff_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            idtxtb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[0].Value.ToString();
            HKtxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[1].Value.ToString();
            Namtxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[2].Value.ToString();
            MACT.Text = this.DetailStaff.Rows[e.RowIndex].Cells[3].Value.ToString();

           
            old_hp = idtxtb.Text;
            old_hk = HKtxb.Text;
            old_nam = Namtxb.Text;
            old_mact = MACT.Text;
        }
    }
}
