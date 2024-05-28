using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace PhanHe1
{
    public partial class UC_GrantRevoke : UserControl
    {
        private string connectionString;
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        public UC_GrantRevoke()
        {
            InitializeComponent();
            connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            // Replace placeholders with actual values
            string username = Program.username.ToUpper(); // Assuming Program.username contains the username
            string password = Program.password; // Assuming Program.password contains the password
            connectionString = connectionString.Replace("{$user$}", username);
            connectionString = connectionString.Replace("{$password%}", password);
            conn = new OracleConnection(connectionString);
        }

        private void GrantRevoke_btn_Click(object sender, EventArgs e)
        {
            var grant_revoke = new FormGrant();
            grant_revoke.Show();
        }

        private void rolebtn_Click(object sender, EventArgs e)
        {
            var grant_revoke = new Form_Grant_Revoke_Role();
            grant_revoke.Show();
        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            conn.Open();

            string TABLENAME = guna2TextBox1.Text;
            TABLENAME = TABLENAME.ToUpper();
            OracleCommand cmd = new OracleCommand("SELECT GRANTOR, GRANTEE, TABLE_NAME, PRIVILEGE, GRANTABLE FROM ALL_TAB_PRIVS WHERE TABLE_NAME = '" + TABLENAME +"'" ,conn);
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

        private void guna2TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
