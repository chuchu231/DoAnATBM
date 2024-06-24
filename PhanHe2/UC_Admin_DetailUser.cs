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
    public partial class UC_Admin_DetailUser : UserControl
    {
        OracleConnection conn = new OracleConnection(LogIn.connectionString);
        public UC_Admin_DetailUser()
        {
            InitializeComponent();
        }
        private void addUserControl(UserControl uc)
        {
            uc.Dock = DockStyle.Fill;
            UC_Containers.Controls.Clear();
            UC_Containers.Controls.Add(uc);
            uc.BringToFront();
        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                string username = this.lb_UserName.Text;

                using (OracleCommand cmd = new OracleCommand("Delete_User", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("User_name", OracleDbType.Varchar2).Value = username;
                    cmd.ExecuteNonQuery();
                }
                MessageBox.Show("Deleted " + username + " successfully!");
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

        private void guna2Button2_Click(object sender, EventArgs e)
        {
            this.dataGridView1.SendToBack();
            this.guna2Button1.SendToBack();
            this.guna2Button2.SendToBack();
            var queryString = "SELECT USERNAME, USER_ID, PASSWORD_CHANGE_DATE FROM DBA_USERS";

            var dt = new DataTable();
            var da = new OracleDataAdapter(queryString, conn);
            da.Fill(dt);

            dataGridView2.DataSource = dt;
            dataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView2.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            dataGridView2.ReadOnly = true;
            dataGridView2.BringToFront();
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            UC_Admin_DetailUser uc = new UC_Admin_DetailUser();
            UC_Containers.BringToFront();
            addUserControl(uc);
            string username = this.dataGridView2.Rows[e.RowIndex].Cells[0].Value.ToString();
            conn.Open();


            OracleCommand cmd = new OracleCommand("GetUserPrivilegesByUsername", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("Username", OracleDbType.Varchar2).Value = username;
            cmd.Parameters.Add("UserCursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);

                    uc.dataGridView1.DataSource = dataTable;
                }
            }
        }
    }
}
