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
    public partial class UC_SV_KETQUAHT : UserControl
    {
        OracleConnection conn = new OracleConnection(LogIn.connectionString);
        public UC_SV_KETQUAHT()
        {
            InitializeComponent();
        }
        private void UC_SV_KETQUAHT_Load(object sender, EventArgs e)
        {
            var queryString = "SELECT DK.MAHP, HP.TENHP, DK.HK, DK.NAM, DK.MACT, DK.DIEMTH, DK.DIEMQT, DK.DIEMCK, DK.DIEMTK  " +
                              "FROM CADMIN2.DANGKY DK JOIN CADMIN2.HOCPHAN HP ON DK.MAHP = HP.MAHP " +
                              "WHERE DIEMTH IS NOT NULL AND DIEMQT IS NOT NULL AND DIEMCK IS NOT NULL AND DIEMTK IS NOT NULL\r\n";

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
    }
}
