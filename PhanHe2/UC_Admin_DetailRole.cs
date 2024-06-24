using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PhanHe2
{
    public partial class UC_Admin_DetailRole : UserControl
    {
        private string connectionString = LogIn.connectionString;
        OracleConnection conn = new OracleConnection(LogIn.connectionString);
        public UC_Admin_DetailRole()
        {
            InitializeComponent();
        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                string rolename = this.lb_RoleName.Text;

                using (OracleCommand cmd = new OracleCommand("Delete_Role", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("Role_name", OracleDbType.Varchar2).Value = rolename;
                    cmd.ExecuteNonQuery();
                }
                MessageBox.Show("Deleted " + rolename + " successfully!");
            }
            catch (Exception ex)
            {
                MessageBox.Show("An error occurred: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        private void addUserControl(UserControl uc)
        {
            uc.Dock = DockStyle.Fill;
            UC_Containers.Controls.Clear();
            UC_Containers.Controls.Add(uc);
            uc.BringToFront();
        }
        private void guna2Button2_Click(object sender, EventArgs e)
        {
            this.dataGridView1.SendToBack();
            this.guna2Button1.SendToBack();
            this.guna2Button2.SendToBack();
            var queryString = "SELECT ROLE, ROLE_ID, PASSWORD_REQUIRED FROM DBA_ROLES";

            var dt = new DataTable();
            var da = new OracleDataAdapter(queryString, conn);
            da.Fill(dt);

            DataGridView2.DataSource = dt;
            DataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            DataGridView2.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            DataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            DataGridView2.ReadOnly = true;
            DataGridView2.BringToFront();
        }

        private void DataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            UC_Admin_DetailUser uc = new UC_Admin_DetailUser();
            UC_Containers.BringToFront();
            addUserControl(uc);
            string username = this.DataGridView2.Rows[e.RowIndex].Cells[0].Value.ToString();
            Console.WriteLine(username);
            conn.Open();


            using (OracleCommand command = new OracleCommand("GetRolePrivileges", conn))
            {
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("Role_name", OracleDbType.Varchar2).Value = username;
                command.Parameters.Add("cur", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                using (OracleDataReader reader = command.ExecuteReader())
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);
                    uc.dataGridView1.DataSource = dataTable;
                }
            }
        }
    }
}
