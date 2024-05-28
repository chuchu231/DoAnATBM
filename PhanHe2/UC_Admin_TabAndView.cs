using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Windows.Forms;

namespace PhanHe2
{
    public partial class UC_Admin_TabAndView : UserControl
    {
        private string connectionString;
        OracleConnection conn = new OracleConnection(LogIn.connectionString);
        public UC_Admin_TabAndView()
        {
            InitializeComponent();
        }

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
                    Table.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                    Table.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
                    Table.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
                    Table.ReadOnly = true;
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
    }
}
