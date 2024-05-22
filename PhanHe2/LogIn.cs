using System;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;
using static System.Collections.Specialized.BitVector32;
using static System.Net.Mime.MediaTypeNames;
using System.Data;
using System.Drawing;




namespace PhanHe2
{
    public partial class LogIn : Form
    {
        public static string connectionString;
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        public static string username = "GV001";
        public static string password = "GV001";
        public static string work = "GV0";
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
            // username = txtboxUsername.Text;
            // password = txtBoxPassword.Text;

                connectionString = connectionString.Replace("{$user$}", username);
                connectionString = connectionString.Replace("{$password%}", password); 
                using (OracleConnection conn = new OracleConnection(connectionString))
                {
                    try
                    {
                        conn.Open();
                        if (conn.State == ConnectionState.Open)
                        {
                            MessageBox.Show("Đăng nhập thành công");

                            // Hiding LogIn form
                            this.Hide();

                            string rolePrefix = username.Substring(0, 3).ToUpper();
                            LogIn.work = rolePrefix;

                        if (rolePrefix == "NV0")
                             {
                                 HomeStaff form = new HomeStaff();
                                 form.Show();
                             }

                        else if (rolePrefix == "GV0" || rolePrefix == "TBM" || rolePrefix == "TK0")
                            {
                                HomeLEC form = new HomeLEC();
                                form.Show();
                            }
                        else if (rolePrefix == "SV0")
                            {
                                HomeStudent form = new HomeStudent();
                                form.Show();
                            }
                        else
                            {
                                conn.Close();
                                MessageBox.Show("Đăng nhập thất bại. Tên đăng nhập hoặc mật khẩu không đúng.");
                                connectionString = connectionString.Replace(username, "{$user$}");
                                connectionString = connectionString.Replace(password, "{$password%}");
                             }
                        } 
                    }
                    catch(Exception ex)
                    {   
                        conn.Close();
                        Console.WriteLine("Error: " + ex.Message);
                        connectionString = connectionString.Replace( username, "{$user$}");
                        connectionString = connectionString.Replace(password, "{$password%}");
                    
                }
                }
        }

        private void txtBoxPassword_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                e.Handled = false;
                btnLogIn_Click(sender, e);
            }
        }

        private void txtboxUsername_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                txtBoxPassword.Focus();
                e.Handled = true;
            }
        }

        private void txtBoxPassword_Enter(object sender, EventArgs e)
        {
            txtBoxPassword.Text = "";

            txtBoxPassword.ForeColor = Color.Black;

            txtBoxPassword.UseSystemPasswordChar = true;
        }

        private void txtBoxPassword_Leave(object sender, EventArgs e)
        {
            if (txtBoxPassword.Text.Length == 0)
            {
                txtBoxPassword.ForeColor = Color.Gray;

                txtBoxPassword.Text = "Enter password";

                txtBoxPassword.UseSystemPasswordChar = false;

                SelectNextControl(txtBoxPassword, true, true, false, true);
            }
        }
    }
}
