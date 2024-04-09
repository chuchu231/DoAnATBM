using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.OleDb;
using Guna.UI2.WinForms;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;
using System.Data.SqlClient;

namespace PhanHe1
{
    public partial class UC_AllUser : UserControl
    {
        // connect db


        //OleDbConnection oleDbConn = new OleDbConnection("Provider=OraOLEDB.Oracle;Data Source=localhost;Persist Security Info=True;User ID=sys;Unicode=True");
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        void show()
        {
            UC_Containers.Controls.Clear();
            UC_Containers.SendToBack();
            var queryString = "SELECT * FROM ALL_USERS";

            var dt = new DataTable();
            var da = new OracleDataAdapter(queryString, conn);
            da.Fill(dt);

            allusers.DataSource = dt;

            conn.Close();
        }
        private void addUserControl(UserControl uc)
        {
            uc.Dock = DockStyle.Fill;
            UC_Containers.Controls.Clear();
            UC_Containers.Controls.Add(uc);
            uc.BringToFront();
        }
        public UC_AllUser()
        {
            InitializeComponent();
            conn.Open();
        }

        private void UC_AllUser_Load(object sender, EventArgs e)
        {
            show();
        }

        private void guna2Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void allusers_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            UC_DetailUser uc = new UC_DetailUser();
            UC_Containers.BringToFront();
            addUserControl(uc);

            uc.lb_UserName.Text = this.allusers.Rows[e.RowIndex].Cells[0].Value.ToString();
            string username = this.allusers.Rows[e.RowIndex].Cells[0].Value.ToString();

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

        private void UC_Containers_Paint(object sender, PaintEventArgs e)
        {

        }

        private void addRole_btn_Click(object sender, EventArgs e)
        {
            try
            {
                string username = this.usernametxtb.Text;
                string password = this.pwtxtb.Text;

                conn.Open();

                OracleCommand cmd = new OracleCommand("Create_NewUser", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("User_name", OracleDbType.Varchar2).Value = username;
                cmd.Parameters.Add("Pass_Word", OracleDbType.NVarchar2).Value = password;

                cmd.ExecuteNonQuery();

                MessageBox.Show("User " + username + " created successfully!");
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
