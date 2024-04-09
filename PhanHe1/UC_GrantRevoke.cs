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

        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        public UC_GrantRevoke()
        {
            InitializeComponent();
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
            OracleCommand cmd = new OracleCommand("SELECT DISTINCT GRANTEE, TABLE_NAME FROM ALL_COL_PRIVS WHERE TABLE_NAME = '" + TABLENAME +"'" ,conn);
           

       

            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);

                    Table.DataSource = dataTable;
                }
            }
             cmd = new OracleCommand("SELECT GRANTEE, TABLE_NAME, COLUMN_NAME , PRIVILEGE FROM ALL_COL_PRIVS WHERE TABLE_NAME = '" + TABLENAME + "'", conn);
            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);

                    Column.DataSource = dataTable;
                }
            }
        }
    }
}
