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
        OracleConnection conn = new OracleConnection(LogIn.connectionString);
        public FormScore_DANGKY score = new FormScore_DANGKY();
        public UC_DANGKY()
        {
            InitializeComponent();
            this.DetailStaff.RowEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.DetailStaff_RowEnter);
        }

        private void DetailStaff_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                MSSVtxb.Text = LogIn.username;
                // Lấy dữ liệu của hàng được chọn
                DataGridViewRow row = DetailStaff.Rows[e.RowIndex];

                // Lấy dữ liệu của từng cột
                foreach (DataGridViewCell cell in row.Cells)
                {
                    if (cell.OwningColumn.HeaderText == "MAGV")
                    {
                        MAGVtxb.Text = cell.Value?.ToString();
                    }
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



        private void Score_btn_Click(object sender, EventArgs e)
        {
            if (LogIn.work == "SV0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.work == "GVU")
            {
                // do something ?
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

        private void insertbtn_Click(object sender, EventArgs e)
        {
            if (LogIn.work == "SV0")
            {
                try
                {
                    // Lấy dữ liệu từ các TextBox hoặc các điều khiển nhập liệu
                    string maSV = MSSVtxb.Text;
                    string maGV = MAGVtxb.Text;
                    string maHP = idtxtb.Text;
                    string hocKy = HKtxb.Text;
                    string namHoc = Namtxb.Text;
                    string maCT = MACT.Text;


                    // Tạo câu lệnh INSERT
                    string insertQuery = "INSERT INTO ADMIN.DANGKY (MASV, MAGV, MAHP, HK, NAM, MACT, DIEMTH, DIEMQT, DIEMCK, DIEMTK) VALUES (:maSV, :maGV, :maHP, :hocKy, :namHoc, :maCT, null, null, null, null)";
                    using (OracleConnection connection = new OracleConnection(LogIn.connectionString))
                    {
                        connection.Open();
                        using (OracleCommand cmd = new OracleCommand(insertQuery, connection))
                        {
                            // Thêm các tham số cho câu lệnh INSERT
                            cmd.Parameters.Add(new OracleParameter("maSV", maSV));
                            cmd.Parameters.Add(new OracleParameter("maGV", maGV));
                            cmd.Parameters.Add(new OracleParameter("maHP", maHP));
                            cmd.Parameters.Add(new OracleParameter("hocKy", hocKy));
                            cmd.Parameters.Add(new OracleParameter("namHoc", namHoc));
                            cmd.Parameters.Add(new OracleParameter("maCT", maCT));

                            // Thực thi câu lệnh INSERT
                            int rowsInserted = cmd.ExecuteNonQuery();

                            if (rowsInserted > 0)
                            {
                                MessageBox.Show("Đăng ký thành công.");
                            }
                        }
                    }
                }
                catch (OracleException ex)
                {
                    // Bắt lỗi Oracle và hiển thị thông báo lỗi từ trigger
                    if (ex.Number == 20002 || ex.Number == 20001)
                    {
                        MessageBox.Show(ex.Message);
                    }
                    else
                    {
                        MessageBox.Show("Lỗi Oracle: " + ex.Message);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi: " + ex.Message);
                }
            }
            else if (LogIn.work == "GVU")
            {
                // do something ?
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
                // do something ?
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

        private void UC_DANGKY_Load(object sender, EventArgs e)
        {
            // Load datagridview
            if (LogIn.work == "SV0")
            {
                MSSVtxb.Enabled = false;
                MAGVtxb.Enabled=false;
                HKtxb.Enabled=false;
                Namtxb.Enabled=false;
                idtxtb.Enabled=false;
                MACT.Enabled=false;
                try
                {   
                    // Tạo kết nối đến cơ sở dữ liệu Oracle
                    using (OracleConnection connection = new OracleConnection(LogIn.connectionString))
                    {
                        // Mở kết nối
                        connection.Open();

                        // Tạo OracleCommand để gọi stored procedure
                        using (OracleCommand cmd = new OracleCommand("ADMIN.GET_KHMO_BYDAY", connection))
                        {
                            // Đặt kiểu command là Stored Procedure
                            cmd.CommandType = CommandType.StoredProcedure;

                            // Tạo tham số đầu ra
                            cmd.Parameters.Add("khmo_cursor", OracleDbType.RefCursor, ParameterDirection.Output);

                            OracleDataAdapter da = new OracleDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            DetailStaff.DataSource = dt;
                            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                            DetailStaff.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
                            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
                            DetailStaff.ReadOnly = true;
                            conn.Close();
                            dt.Dispose();

                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
            else if (LogIn.work == "GVU")
            {
                // do something ?
            }
            else if (LogIn.work == "TBM")
            {
                // do something ?
            }
            else if (LogIn.work == "TK0")
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM CADMIN2.DANGKY", conn);
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
            else if (LogIn.work == "NV0")
            {
               

            }
            else if (LogIn.work == "GV0")
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM CADMIN2.DANGKY", conn);
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

        private void updatebtn_Click(object sender, EventArgs e)
        {
            // Load datagridview
            if (LogIn.work == "SV0")
            {               
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.work == "GVU")
            {
                // do something ?
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

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            string key = searchtxb.Text;
            if (key == "")
            {
                try
                {
                    // Tạo kết nối đến cơ sở dữ liệu Oracle
                    using (OracleConnection connection = new OracleConnection(LogIn.connectionString))
                    {
                        // Mở kết nối
                        connection.Open();

                        // Tạo OracleCommand để gọi stored procedure
                        using (OracleCommand cmd = new OracleCommand("ADMIN.GET_KHMO_BYDAY", connection))
                        {
                            // Đặt kiểu command là Stored Procedure
                            cmd.CommandType = CommandType.StoredProcedure;

                            // Tạo tham số đầu ra
                            cmd.Parameters.Add("khmo_cursor", OracleDbType.RefCursor, ParameterDirection.Output);

                            OracleDataAdapter da = new OracleDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            DetailStaff.DataSource = dt;
                            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                            DetailStaff.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
                            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
                            DetailStaff.ReadOnly = true;
                            conn.Close();
                            dt.Dispose();

                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
            else
            {
                try
                {
                    // Tạo kết nối đến cơ sở dữ liệu Oracle
                    using (OracleConnection connection = new OracleConnection(LogIn.connectionString))
                    {
                        // Mở kết nối
                        connection.Open();

                        // Tạo OracleCommand để gọi stored procedure
                        using (OracleCommand cmd = new OracleCommand("ADMIN.GET_KHMO_BYNAME", connection))
                        {
                            // Đặt kiểu command là Stored Procedure
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("name", OracleDbType.Varchar2).Value = key;
                            // Tạo tham số đầu ra
                            cmd.Parameters.Add("khmo_cursor", OracleDbType.RefCursor, ParameterDirection.Output);

                            OracleDataAdapter da = new OracleDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            DetailStaff.DataSource = dt;
                            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                            DetailStaff.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
                            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
                            DetailStaff.ReadOnly = true;
                            conn.Close();
                            dt.Dispose();

                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void DetailStaff_CellContentClick(object sender, DataGridViewCellEventArgs e)
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
    }
}
