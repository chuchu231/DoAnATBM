using System;
using Oracle.ManagedDataAccess.Client;
using System.Windows.Forms;
using System.Configuration;
using System.Data;

namespace PhanHe2
{
    public partial class UC_Admin_FGA : UserControl
    {
        OracleConnection conn = new OracleConnection(LogIn.connectionString);
        public UC_Admin_FGA()
        {
            InitializeComponent();
        }

        private void UC_Admin_FGA_Load(object sender, EventArgs e)
        {
            FGA_DANGKY.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            FGA_DANGKY.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            FGA_DANGKY.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            FGA_DANGKY.ReadOnly = true;

            FGA_NHANSU.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            FGA_NHANSU.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            FGA_NHANSU.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            FGA_NHANSU.ReadOnly = true;
            conn.Open();

            OracleCommand cmd = new OracleCommand("SELECT DBUSERNAME ,ACTION_NAME, OBJECT_SCHEMA, OBJECT_NAME, EVENT_TIMESTAMP, SQL_TEXT"
                +" FROM UNIFIED_AUDIT_TRAIL WHERE OBJECT_NAME = 'DANGKY' AND AUDIT_TYPE = 'FineGrainedAudit'", conn);
            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                FGA_DANGKY.DataSource = null;
                if (reader.HasRows)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);
                    FGA_DANGKY.DataSource = dataTable;
                }
            }

             cmd = new OracleCommand("SELECT DBUSERNAME ,ACTION_NAME, OBJECT_SCHEMA, OBJECT_NAME, EVENT_TIMESTAMP, SQL_TEXT"
                + " FROM UNIFIED_AUDIT_TRAIL WHERE OBJECT_NAME = 'NHANSU' AND AUDIT_TYPE = 'FineGrainedAudit'", conn);
            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                FGA_NHANSU.DataSource = null;
                if (reader.HasRows)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);
                    FGA_NHANSU.DataSource = dataTable;
                }
            }
            conn.Close();
        }
    }
}
