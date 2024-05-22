﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;

namespace PhanHe2
{
    public partial class UC_SV_KETQUADK : UserControl
    {
        OracleConnection conn = new OracleConnection(LogIn.connectionString);
        public UC_SV_KETQUADK()
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

        private void UC_SV_KETQUADK_Load(object sender, EventArgs e)
        {
            var queryString = "SELECT DK.MAGV, DK.MAHP, HP.TENHP, DK.HK, DK.NAM, DK.MACT" +
                              " FROM CADMIN2.DANGKY DK JOIN CADMIN2.HOCPHAN HP ON DK.MAHP = HP.MAHP  " +
                              "WHERE DIEMTH IS NULL AND DIEMQT IS NULL AND DIEMCK IS NULL AND DIEMTK IS NULL\r\n";

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

        private void delbtn_Click(object sender, EventArgs e)
        {
            try
            {
                // Lấy dữ liệu từ các TextBox hoặc các điều khiển nhập liệu
                //string maSV = MSSVtxb.Text;
                string maGV = MAGVtxb.Text;
                string maHP = idtxtb.Text;
                string hocKy = HKtxb.Text;
                string namHoc = Namtxb.Text;
                string maCT = MACT.Text;


                // Tạo câu lệnh INSERT
                string insertQuery = "DELETE FROM CADMIN2.DANGKY WHERE MAGV = :maGV AND MAHP = :maHP AND HK = :hocky AND NAM = :namHoc AND MACT = :maCT";
                using (OracleConnection connection = new OracleConnection(LogIn.connectionString))
                {
                    connection.Open();
                    using (OracleCommand cmd = new OracleCommand(insertQuery, connection))
                    {
                        // Thêm các tham số cho câu lệnh INSERT
                        //cmd.Parameters.Add(new OracleParameter("maSV", maSV));
                        cmd.Parameters.Add(new OracleParameter("maGV", maGV));
                        cmd.Parameters.Add(new OracleParameter("maHP", maHP));
                        cmd.Parameters.Add(new OracleParameter("hocKy", hocKy));
                        cmd.Parameters.Add(new OracleParameter("namHoc", namHoc));
                        cmd.Parameters.Add(new OracleParameter("maCT", maCT));

                        // Thực thi câu lệnh INSERT
                        int rowsDeleted = cmd.ExecuteNonQuery();

                        if (rowsDeleted > 0)
                        {
                            MessageBox.Show("Xoá thành công.");
                            UC_SV_KETQUADK_Load(sender, e);
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
    }
}
