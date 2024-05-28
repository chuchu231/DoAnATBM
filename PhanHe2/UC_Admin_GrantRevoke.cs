using Oracle.ManagedDataAccess.Client;
using System.Windows.Forms;
using System.Configuration;
using System.Data;
namespace PhanHe2
{
    public partial class UC_Admin_GrantRevoke : UserControl
    {
        private string connectionString;
        OracleConnection conn = new OracleConnection(LogIn.connectionString);
        public UC_Admin_GrantRevoke()
        {
            InitializeComponent();
        }

        private void guna2Button1_Click(object sender, System.EventArgs e)
        {
            conn.Open();

            string TABLENAME = guna2TextBox1.Text;
            TABLENAME = TABLENAME.ToUpper();
            OracleCommand cmd = new OracleCommand("SELECT GRANTOR, GRANTEE, TABLE_NAME, PRIVILEGE, GRANTABLE FROM ALL_TAB_PRIVS WHERE TABLE_NAME = '" + TABLENAME + "'", conn);
            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                Table.DataSource = null;
                if (reader.HasRows)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);
                    Table.DataSource = dataTable;
                }
            }
            cmd = new OracleCommand("SELECT GRANTEE, TABLE_NAME, COLUMN_NAME , PRIVILEGE, GRANTABLE FROM ALL_COL_PRIVS WHERE TABLE_NAME = '" + TABLENAME + "'", conn);
            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                Column.DataSource = null;
                if (reader.HasRows)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);
                    Column.DataSource = dataTable;
                }
            }
            conn.Close();
        }

        private void GrantRevoke_btn_Click(object sender, System.EventArgs e)
        {
            var grant_revoke = new Form_Admin_Grant();
            grant_revoke.Show();
        }

        private void rolebtn_Click(object sender, System.EventArgs e)
        {
            var grant_revoke = new Form_Admin_Grant_Revoke_Role();
            grant_revoke.Show();
        }
    }
}
