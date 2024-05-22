using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Configuration;
using System.Windows.Forms;

namespace PhanHe2
{
    public partial class UC_PHANCONG_GIANGVIEN : UserControl
    {
        private string connectionString;
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        public UC_PHANCONG_GIANGVIEN()
        {
            InitializeComponent();
            connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            connectionString = connectionString.Replace("{$user$}", LogIn.username);
            connectionString = connectionString.Replace("{$password%}", LogIn.password);
            conn = new OracleConnection(connectionString);
        }

        private void UC_PHANCONG_GIANGVIEN_Load(object sender, EventArgs e)
        {
            UC_Containers.SendToBack();
            var queryString = "SELECT * FROM CADMIN2.UV_TRGDV_PHANCONG\r\n";

            var dt = new DataTable();

            var da = new OracleDataAdapter(queryString, conn);
            da.Fill(dt);
            giangvien.DataSource = dt;

            conn.Close();
            dt.Dispose();
            da.Dispose();
        }

        private void giangvien_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
