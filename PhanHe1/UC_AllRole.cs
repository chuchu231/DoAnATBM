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

        int click = 0;
        void show()
        {
            UC_Containers.SendToBack();
            var queryString = "SELECT * FROM dba_roles";

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

                conn.Open();

                OracleCommand cmd = new OracleCommand("Create_NewRole", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("Role_name", OracleDbType.Varchar2).Value = username;
                cmd.Parameters.Add("Pass_Word", OracleDbType.NVarchar2).Value = password;

                cmd.ExecuteNonQuery();

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
    }
}
