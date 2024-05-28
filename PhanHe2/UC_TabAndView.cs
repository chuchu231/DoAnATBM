using Oracle.ManagedDataAccess.Client;
using System;
using System.Configuration;
using System.Data;
using System.Windows.Forms;

namespace PhanHe1
{
    public partial class UC_TabAndView : UserControl
    {
        private string connectionString;
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        public UC_TabAndView()
        {
            InitializeComponent();
            connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            // Replace placeholders with actual values
            string username = Program.username.ToUpper(); // Assuming Program.username contains the username
            string password = Program.password; // Assuming Program.password contains the password
            connectionString = connectionString.Replace("{$user$}", username);
            connectionString = connectionString.Replace("{$password%}", password);
            conn = new OracleConnection(connectionString);
        }

        private void guna2Panel1_Paint(object sender, PaintEventArgs e)
        {

        }


        // find table
        private void guna2Button1_Click(object sender, EventArgs e)
        {
            conn.Open();

            string TABLENAME = guna2TextBox1.Text;
            TABLENAME = TABLENAME.ToUpper();
            OracleCommand cmd = new OracleCommand("SELECT TABLE_NAME FROM USER_TABLES WHERE TABLE_NAME = '" + TABLENAME + "'", conn);
            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                Table.DataSource = null;
                if (reader.HasRows)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);
                    Table.DataSource = dataTable;
                }
            }
            
            conn.Close();
        }

        private void SELECT_Click(object sender, EventArgs e)
        {
            conn.Open();

            string TABLENAME = guna2TextBox1.Text;
            TABLENAME = TABLENAME.ToUpper();
            OracleCommand cmd = new OracleCommand("SELECT TABLE_NAME FROM ALL_TABLES", conn);
            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                Table.DataSource = null;
                if (reader.HasRows)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);
                    Table.DataSource = dataTable;
                }
            }
            cmd = new OracleCommand("SELECT VIEW_NAME FROM ALL_VIEWS", conn);
            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                View.DataSource = null;
                if (reader.HasRows)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);
                    View.DataSource = dataTable;
                }
            }
            conn.Close();
        }

        private void addTable_btn_Click(object sender, EventArgs e)
        {

        }

        private void guna2TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
