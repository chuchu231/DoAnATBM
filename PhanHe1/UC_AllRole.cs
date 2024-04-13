using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PhanHe1
{
    public partial class UC_AllRole : UserControl
    {
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        void show()
        {
            UC_Containers.SendToBack();
            var queryString = "SELECT ROLE, ROLE_ID, PASSWORD_REQUIRED FROM dba_roles\r\n";

            var dt = new DataTable();

            var da = new OracleDataAdapter(queryString, conn);
            da.Fill(dt);
            allrole.DataSource = dt;

            conn.Close();
        }
        private void addUserControl(UserControl uc)
        {
            uc.Dock = DockStyle.Fill;
            UC_Containers.Controls.Clear();
            UC_Containers.Controls.Add(uc);
            uc.BringToFront();
        }
        public UC_AllRole()
        {
            InitializeComponent();
        }

        private void guna2HtmlLabel1_Click(object sender, EventArgs e)
        {

        }

        private void UC_AllRole_Load(object sender, EventArgs e)
        {
            show();
        }

        private void allrole_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            UC_DetailRole uc = new UC_DetailRole();
            UC_Containers.BringToFront();
            addUserControl(uc);
            this.usernametxtb.Text = this.allrole.Rows[e.RowIndex].Cells[0].Value.ToString(); ;
            this.pwtxtb.Text = "*****";
            uc.lb_RoleName.Text = this.allrole.Rows[e.RowIndex].Cells[0].Value.ToString();
            conn.Open();
            using (OracleCommand command = new OracleCommand("GetRolePrivileges", conn))
            {
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("Role_name", OracleDbType.Varchar2).Value = this.allrole.Rows[e.RowIndex].Cells[0].Value.ToString();
                command.Parameters.Add("cur", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                using (OracleDataReader reader = command.ExecuteReader())
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);
                    uc.dataGridView1.DataSource = dataTable;
                }
            }
            using (OracleCommand command = new OracleCommand("GetUsersOfRole", conn))
            {
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("Role_name", OracleDbType.Varchar2).Value = this.allrole.Rows[e.RowIndex].Cells[0].Value.ToString();
                command.Parameters.Add("UsersCursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                using (OracleDataReader reader = command.ExecuteReader())
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);
                    uc.DGV_USERONROLE.DataSource = dataTable;
                }
            }
            conn.Close();
        }

        private void oracleDataAdapter1_RowUpdated(object sender, OracleRowUpdatedEventArgs e)
        {

        }


        private void addUser_btn_Click(object sender, EventArgs e)
        {
            try
            {
                string username = this.usernametxtb.Text;
                string password = this.pwtxtb.Text;
                if ( password == null) { 
                    password = string.Empty;
                }
                conn.Open();

                OracleCommand cmd = new OracleCommand("Create_NewRole", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("Role_name", OracleDbType.Varchar2).Value = username;
                cmd.Parameters.Add("Pass_Word", OracleDbType.NVarchar2).Value = password;

                cmd.ExecuteNonQuery();
                show();
                MessageBox.Show("Role " + username + " created successfully!");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                conn.Close();
            }
        }

        private void btn_Update_Click(object sender, EventArgs e)
        { 
            try
            {
                string rolename = this.usernametxtb.Text;
                string pass = this.pwtxtb.Text;
                conn.Open();
                using (OracleCommand cmd = new OracleCommand("Alter_role", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("role_name", OracleDbType.Varchar2).Value = rolename;
                    cmd.Parameters.Add("pass_word", OracleDbType.NVarchar2).Value = pass;
                    cmd.ExecuteNonQuery();
                }

                MessageBox.Show("Role " + rolename + " alter successfully!");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                conn.Close();
            }
        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            string searchValue = this.searchtxb.Text.Trim();
            bool userFound = false;
            foreach (DataGridViewRow row in allrole.Rows)
            {
                if (row.Cells["Role"].Value != null &&
                    row.Cells["Role"].Value.ToString().Equals(searchValue, StringComparison.OrdinalIgnoreCase))
                {
                    row.Selected = true;
                    allrole.FirstDisplayedScrollingRowIndex = row.Index;
                    userFound = true;
                    break;
                }
            }
            if (!userFound)
            {
                MessageBox.Show("Role not found.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
    }
}
