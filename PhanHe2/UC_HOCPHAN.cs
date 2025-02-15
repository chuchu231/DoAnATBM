﻿using Oracle.ManagedDataAccess.Client;
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
    public partial class UC_HOCPHAN : UserControl
    {
        OracleConnection conn = new OracleConnection(LogIn.connectionString);
        public UC_HOCPHAN()
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
                    if (cell.OwningColumn.HeaderText == "TENHP")
                    {
                        tenhptxb.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "SOTC")
                    {
                        SOTCtxb.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "STLT")
                    {
                        STLTtxb.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "STTH")
                    {
                        STTHtxb.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "SOSVTD")
                    {
                        SOSVTDtxb.Text = cell.Value?.ToString();
                    }
                    if (cell.OwningColumn.HeaderText == "MADV")
                    {
                        MADVtxb.Text = cell.Value?.ToString();
                    }
                }

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
                    var queryString = "INSERT INTO ADMIN.HOCPHAN (MAHP, TENHP, SOTC, STLT, STTH, SOSVTD, MADV) VALUES (:MAHP, :TENHP, :SOTC, :STLT, :STTH, :SOSVTD, :MADV)";

                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
                            cmd.Parameters.Add(new OracleParameter(":MAHP", idtxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":TENHP", tenhptxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":SOTC", SOTCtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":STLT", STLTtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":STTH", STTHtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":SOSVTD", SOSVTDtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MADV", MADVtxb.Text));
                            cmd.ExecuteNonQuery();

                            MessageBox.Show("Thêm học phần thành công.");
                        }
                        UC_HOCPHAN_Load(sender, e);
                    }
                }
                catch (OracleException ex)
                {
                    // Bắt lỗi Oracle và hiển thị thông báo lỗi từ trigger
                    if (ex.Number == 00001)
                    {
                        MessageBox.Show("Mã học phần đã tồn tại!");
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
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                try
                {
                    var queryString = "UPDATE ADMIN.HOCPHAN SET TENHP = :TENHP, SOTC = :SOTC, STLT = :STLT, STTH = :STTH, SOSVTD = :SOSVTD, MADV = :MADV WHERE MAHP = :MAHP";

                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
                            cmd.Parameters.Add(new OracleParameter(":TENHP", tenhptxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":SOTC", SOTCtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":STLT", STLTtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":STTH", STTHtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":SOSVTD", SOSVTDtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MADV", MADVtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MAHP", idtxtb.Text));

                            cmd.ExecuteNonQuery();

                            MessageBox.Show("Cập nhật học phần thành công.");
                        }
                        UC_HOCPHAN_Load(sender, e);
                    }
                }
                catch (OracleException ex)
                {
                    // Bắt lỗi Oracle và hiển thị thông báo lỗi từ trigger
                    if (ex.Number == 00001)
                    {
                        MessageBox.Show("Mã học phần đã tồn tại!");
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
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
        }

        private void UC_HOCPHAN_Load(object sender, EventArgs e)
        {
            idtxtb.Enabled = false;
            tenhptxb.Enabled = false;
            SOTCtxb.Enabled = false;
            STLTtxb.Enabled = false;
            STTHtxb.Enabled = false;
            SOSVTDtxb.Enabled = false;
            MADVtxb.Enabled = false;
            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            DetailStaff.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            DetailStaff.ReadOnly = true;
            // Load datagridview
            if (LogIn.role == "RL_SINHVIEN")
            {             
                var queryString = "SELECT * FROM ADMIN.HOCPHAN\r\n";

                var dt = new DataTable();

                var da = new OracleDataAdapter(queryString, conn);

                da.Fill(dt);
                DetailStaff.DataSource = dt;
                conn.Close();
                dt.Dispose();
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                idtxtb.Enabled = true;
                tenhptxb.Enabled = true;
                SOTCtxb.Enabled = true;
                STLTtxb.Enabled = true;
                STTHtxb.Enabled = true;
                SOSVTDtxb.Enabled = true;
                MADVtxb.Enabled = true;
                UC_Containers.SendToBack();
                var queryString = "SELECT * FROM ADMIN.HOCPHAN\r\n";

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
                        OracleCommand cmd = new OracleCommand("SELECT * FROM ADMIN.HOCPHAN", conn);
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
                        OracleCommand cmd = new OracleCommand("SELECT * FROM ADMIN.HOCPHAN", conn);
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
                        OracleCommand cmd = new OracleCommand("SELECT * FROM ADMIN.HOCPHAN", conn);
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

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            string key = searchtxb.Text;
            var queryString = $"SELECT * FROM ADMIN.HOCPHAN WHERE UPPER(MAHP) = UPPER('{key}') OR UPPER(TENHP) LIKE UPPER('%{key}%')\r\n";

            var dt = new DataTable();

            var da = new OracleDataAdapter(queryString, conn);

            da.Fill(dt);
            DetailStaff.DataSource = dt;
            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            DetailStaff.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            DetailStaff.ReadOnly = true;
            conn.Close();
            dt.Dispose();
        }

        private void DetailStaff_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            idtxtb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[0].Value.ToString();
            tenhptxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[1].Value.ToString();
            SOTCtxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[2].Value.ToString();
            STLTtxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[3].Value.ToString();
            STTHtxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[4].Value.ToString();
            SOSVTDtxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[5].Value.ToString();
            MADVtxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[6].Value.ToString();
        }
    }
}
