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
    public partial class UC_DetailUser : UserControl
    {
        public UC_DetailUser()
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
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
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


        private void label1_Click(object sender, EventArgs e)
        {

        }

        

        private void guna2Button2_Click(object sender, EventArgs e)
        {
            this.dataGridView1.SendToBack();
            this.guna2Button1.SendToBack();
            this.guna2Button2.SendToBack();
            var queryString = "SELECT * FROM ALL_USERS";
            
            var dt = new DataTable();
            var da = new OracleDataAdapter(queryString, conn);
            da.Fill(dt);

            dataGridView2.DataSource = dt;
            dataGridView2.BringToFront();
           /* this.Controls.Clear();
            UC_AllUser uc = new UC_AllUser();
            uc.allusers.Show();
            uc.allusers.bing*/

        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            UC_DetailUser uc = new UC_DetailUser();
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
