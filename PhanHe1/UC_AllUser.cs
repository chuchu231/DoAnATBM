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
namespace PhanHe1
{
    public partial class UC_AllUser : UserControl
    {
        // connect db
        // OleDbConnection conn = new OleDbConnection("Data Source=XE;Persist Security Info=True;User ID=system;Password=***********;Unicode=True");
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
       

        void show()
        {
            var queryString = "SELECT * FROM ALL_USERS";

            var dt = new DataTable();

            var da = new OracleDataAdapter(queryString, conn);
            da.Fill(dt);

            allusers.DataSource = dt;
            conn.Close();
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

        }
    }
}
