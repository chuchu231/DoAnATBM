using System;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;
using System.Data;

namespace PhanHe2
{
    public partial class UC_Admin_Standard : UserControl
    {
        
        OracleConnection conn = new OracleConnection(LogIn.connectionString);
        public UC_Admin_Standard()
        {
            InitializeComponent();
        }

        private void UC_Admin_Standard_Load(object sender, EventArgs e)
        {
            standard.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            standard.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            standard.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            standard.ReadOnly = true;
            conn.Open();
            

            OracleCommand cmd = new OracleCommand("SELECT DBUSERNAME ,ACTION_NAME, OBJECT_SCHEMA, OBJECT_NAME, EVENT_TIMESTAMP, SQL_TEXT"
                + " FROM UNIFIED_AUDIT_TRAIL WHERE AUDIT_TYPE = 'Standard' AND OBJECT_SCHEMA = 'ADMIN' ORDER BY EVENT_TIMESTAMP DESC", conn);
            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                standard.DataSource = null;
                if (reader.HasRows)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);
                    standard.DataSource = dataTable;
                }
            }
        }
    }
}
