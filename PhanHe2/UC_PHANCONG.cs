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

namespace PhanHe2
{
    public partial class UC_PHANCONG : UserControl
    {
        private string connectionString;
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        public UC_PHANCONG()
        {
            InitializeComponent();
            connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            // Replace placeholders with actual values
            connectionString = connectionString.Replace("{$user$}", LogIn.username);
            connectionString = connectionString.Replace("{$password%}", LogIn.password);
            conn = new OracleConnection(connectionString);
            show();
        }
        void show()
        {
            UC_Containers.SendToBack();
            var queryString = "SELECT * FROM CADMIN2.PHANCONG\r\n";

            var dt = new DataTable();

            var da = new OracleDataAdapter(queryString, conn);
            da.Fill(dt);
            DetailStaff.DataSource = dt;

            conn.Close();
            dt.Dispose();
            da.Dispose();
        }
    }
}
