using System;
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
            var queryString = "SELECT DK.MAHP, HP.TENHP, DK.HK, DK.NAM, DK.MACT" +
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
            using (OracleConnection connection = new OracleConnection(LogIn.connectionString))
            {
                try
                {
                    connection.Open();

                    using (OracleCommand cmd = new OracleCommand("CADMIN2.DeleteDangKy", connection))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.Add("p_maHP", OracleDbType.Varchar2).Value = idtxtb.Text;
                        cmd.Parameters.Add("p_hocKy", OracleDbType.Varchar2).Value = HKtxb.Text; ;
                        cmd.Parameters.Add("p_namHoc", OracleDbType.Varchar2).Value = Namtxb.Text;
                        cmd.Parameters.Add("p_maCT", OracleDbType.Varchar2).Value = MACT.Text;

                        cmd.ExecuteNonQuery();
                        MessageBox.Show("DELETE thành công.");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi: " + ex.Message);
                }
                UC_SV_KETQUADK_Load(sender, e);

            }
        }   
    }
}
