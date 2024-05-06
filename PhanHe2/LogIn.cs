using System;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;
using static System.Collections.Specialized.BitVector32;
using static System.Net.Mime.MediaTypeNames;




namespace PhanHe2
{
    public partial class LogIn : Form
    {
        private string connectionString;
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        public static string username = "";
        public static string password = "";
        public static string work = "";
        public LogIn()
        {
            InitializeComponent();
            connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        }

        private void guna2HtmlLabel1_Click(object sender, EventArgs e)
        {
        }

        private void btnLogIn_Click(object sender, EventArgs e)
        {
            username = txtboxUsername.Text;
            password = txtBoxPassword.Text;
           
            try
            {
                
                connectionString = connectionString.Replace("{$user$}", username);
                connectionString = connectionString.Replace("{$password%}", password);
                conn = new OracleConnection(connectionString);

                MessageBox.Show("Dang nhap thanh cong");

                // Hiding LogIn form
                this.Hide();

                work = username.Substring(0, 3).ToUpper();
                if (work == "NV0")
                {
                    HomeStaff form = new HomeStaff();
                    form.Show();
                }
                else if (work == "GV0" || work == "TBM" || work == "TK0")
                {
                    HomeLEC form = new HomeLEC();
                    form.Show();
                }
                else if (work == "SV0")
                {
                    HomeStudent form = new HomeStudent();
                    form.Show();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
