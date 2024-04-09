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

namespace PhanHe1
{
    public partial class UC_DetailRole : UserControl
    {
        public UC_DetailRole()
        {
            InitializeComponent();
        }
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
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
            this.updatebtn.SendToBack();
            var queryString = "SELECT * FROM ALL_USERS";

            var dt = new DataTable();
            var da = new OracleDataAdapter(queryString, conn);
            da.Fill(dt);

            DataGridView2.DataSource = dt;
            DataGridView2.BringToFront();

        }

        private void updatebtn_Click(object sender, EventArgs e)
        {
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                string username = row.Cells["ROLE"].Value.ToString();

                using (OracleCommand cmd = new OracleCommand("Alter_Role", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("Role_name", OracleDbType.Varchar2).Value = username;
                    cmd.ExecuteNonQuery();
                }
            }
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

        private void DataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            UC_DetailUser uc = new UC_DetailUser();
            UC_Containers.BringToFront();
            addUserControl(uc);
            string username = this.DataGridView2.Rows[e.RowIndex].Cells[0].Value.ToString();
            conn.Open();


            using (OracleCommand command = new OracleCommand("GetRolePrivileges", conn))
            {
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("Role_name", OracleDbType.Varchar2).Value = this.DataGridView2.Rows[e.RowIndex].Cells[0].Value.ToString();
                command.Parameters.Add("cur", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                using (OracleDataReader reader = command.ExecuteReader())
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);
                    uc.dataGridView1.DataSource = dataTable;
                }
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
