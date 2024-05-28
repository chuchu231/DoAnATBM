using Oracle.ManagedDataAccess.Client;
using System;
using System.Configuration;
using System.Windows.Forms;

namespace PhanHe2
{
    public partial class Form_Admin_Grant_Revoke_Role : Form
    {
        private string connectionString;
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        public Form_Admin_Grant_Revoke_Role()
        {
            InitializeComponent();
            connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            // Replace the placeholders with actual username and password
            connectionString = connectionString.Replace("{$user$}", LogIn.username);
            connectionString = connectionString.Replace("{$password%}", LogIn.password);
            conn = new OracleConnection(connectionString);
        }

        private void grant_btn_Click(object sender, EventArgs e)
        {
            string query;
            string user = username.Text;
            string rolename = role.Text;
            query = "GRANT " + rolename + " TO " + user;
            using (OracleConnection connection = new OracleConnection(connectionString))
            {
                using (OracleCommand command = new OracleCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        MessageBox.Show("Thành công");

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error: " + ex.Message);
                        //MessageBox.Show(query);
                    }
                }
            }
        }

        private void revoke_Click(object sender, EventArgs e)
        {
            string query;
            string user = username.Text;
            string rolename = role.Text;
            query = "REVOKE " + rolename + " FROM " + user;
            using (OracleConnection connection = new OracleConnection(connectionString))
            {
                using (OracleCommand command = new OracleCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        MessageBox.Show("Thành công");

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error: " + ex.Message);
                    }
                }
            }
        }
    }
}
