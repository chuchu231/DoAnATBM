using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;
using System.Windows.Forms;

namespace PhanHe1
{
    public partial class Form_Grant_Revoke_Role : Form
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        public Form_Grant_Revoke_Role()
        {
            InitializeComponent();
        }

        private void guna2HtmlLabel3_Click(object sender, EventArgs e)
        {

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
