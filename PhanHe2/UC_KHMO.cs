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
    public partial class UC_KHMO : UserControl
    {
        OracleConnection conn = new OracleConnection(LogIn.connectionString);

        string old_hp, old_hk, old_nam, old_mact;
        public UC_KHMO()
        {
            InitializeComponent();
            this.DetailStaff.RowEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.DetailStaff_RowEnter);
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

        private void insert_btn_Click(object sender, EventArgs e)
        {
            if (LogIn.work == "SV0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.work == "GVU")
            {
                try
                {
                    var queryString = "INSERT INTO ADMIN.KHMO VALUES ('" + idtxtb.Text + "', '" + HKtxb.Text + "', '" + Namtxb.Text + "', '" + MACT.Text + "')";

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
                // do something ?
            }
        }

        private void btn_Update_Click(object sender, EventArgs e)
        {
            if (LogIn.work == "SV0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");
            }
            else if (LogIn.work == "GVU")
            {
                try
                {

                    var queryString = "UPDATE ADMIN.UV_QUANLY_PHANCONG SET MAHP = '" + idtxtb.Text + "', HK = '" + HKtxb.Text + "', NAM = '" + Namtxb.Text + "', MACT = '" + MACT.Text + "', MADV = 'VPK' " +
                                        "WHERE MAHP = '" + old_hp + "' AND HK = '" + old_hk + "' AND NAM = '" + old_nam + "' AND MACT = '" + old_mact + "'";
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
            else if (LogIn.work == "TK0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.work == "NV0" || LogIn.work == "TBM")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.work == "GV0")
            {
                // do something ?
            }
        }

        private void UC_KHMO_Load(object sender, EventArgs e)
        {
            // Load datagridview
            if (LogIn.work == "SV0")
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
                //DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
                DetailStaff.ReadOnly = true;
                conn.Close();
                dt.Dispose();
            }
            else if (LogIn.work == "GVU")
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
            
            else if (LogIn.work == "TK0")
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM KAN.KHMO", conn);
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
            else if (LogIn.work == "NV0" || LogIn.work == "TBM")
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
            else if (LogIn.work == "GV0")
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
