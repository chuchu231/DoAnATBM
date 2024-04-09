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
    public partial class UC_AllRole : UserControl
    {
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);


        void show()
        {
            var queryString = "SELECT * FROM dba_roles";

            var dt = new DataTable();

            var da = new OracleDataAdapter(queryString, conn);
            da.Fill(dt);

            allrole.DataSource = dt;
            conn.Close();
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

        }
    }
}
