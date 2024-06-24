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
    public partial class UC_THONGBAO : UserControl
    {
        public UC_THONGBAO()
        {
            InitializeComponent();
        }

        private void UC_THONGBAO_Load(object sender, EventArgs e)
        {
            //string connectionString = LogIn.connectionString;
            //connectionString = connectionString.Replace("xe", "OLS_DEMO");
            OracleConnection conn = new OracleConnection(LogIn.connectionString);
            var queryString = "SELECT ID, NoiDung FROM ADMIN_OLS.THONGBAO ORDER BY ID";

            var dt = new DataTable();

            var da = new OracleDataAdapter(queryString, conn);

            da.Fill(dt);
            thongbao.DataSource = dt;
            thongbao.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            thongbao.ReadOnly = true;
            conn.Close();
            dt.Dispose();
        }
    } 
}
