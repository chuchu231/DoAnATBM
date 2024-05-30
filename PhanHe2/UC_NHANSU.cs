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
                    Console.WriteLine(cell);
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
                // do something ?
            }
            else if (LogIn.role == "RL_TRUONGBM")
            {
                // do something ?
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

        private void delbtn_Click(object sender, EventArgs e)
        {
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_TRUONGBM")
            {
                // do something ?
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

        private void btn_Update_Click(object sender, EventArgs e)
        {
            if (LogIn.role == "RL_SINHVIEN")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
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

                            MessageBox.Show("Cập nhật học phần thành công.");
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

        private void UC_NHANSU_Load(object sender, EventArgs e)
        {
            // Load datagridview
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
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
