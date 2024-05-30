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
        public static string username = "";
        public static string password = "";
        public static string role = "";
        public LogIn()
        {
            InitializeComponent();
            connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        }

        private void guna2HtmlLabel1_Click(object sender, EventArgs e)
        {
        }

        private string Get_Role_ByUsername(string username, string password)
        {
            string role = "";
            connectionString = connectionString.Replace("Id=" + username, "Id=admin");
            connectionString = connectionString.Replace(password, "admin123");
            using (OracleConnection conn = new OracleConnection(connectionString))
            {
                conn.Open();
                using (OracleCommand cmd = new OracleCommand("SELECT GETROLE_BYUSERNAME(:USERNAME) FROM DUAL", conn))
                {
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.Add(new OracleParameter("USERNAME", OracleDbType.Varchar2)).Value = username;

                    role = cmd.ExecuteScalar().ToString();
                }
            }
            connectionString = connectionString.Replace("Id=admin", "Id=" + username);
            connectionString = connectionString.Replace("admin123", password);
            return role;
        }

        private void btnLogIn_Click(object sender, EventArgs e)
        {
            username = txtboxUsername.Text;
            password = txtBoxPassword.Text;
            connectionString = connectionString.Replace("{$user$}", username);
            connectionString = connectionString.Replace("{$password%}", password);
            Console.WriteLine(connectionString);
            using (OracleConnection conn = new OracleConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    if (conn.State == ConnectionState.Open)
                    {
                        
                        // Hiding LogIn form
                        this.Hide();
                        role = Get_Role_ByUsername(username, password);
                        Console.WriteLine(role);
                        if (role == "RL_SINHVIEN")
                        {
                            HomeStudent form = new HomeStudent();
                            form.Show();
                            MessageBox.Show("Đăng nhập thành công");
                            return;
                        }
                        else if (role == "ADMIN")
                        {
                            HomeAdmin form = new HomeAdmin();
                            form.Show();
                            MessageBox.Show("Đăng nhập thành công");
                            return;
                        }             
                        if (role == "RL_NHANVIEN")
                        {
                            HomeStaff form = new HomeStaff();
                            form.Show();;
                            MessageBox.Show("Đăng nhập thành công");
                        }
                        else if (role == "RL_GIANGVIEN" || role == "RL_TRUONGBM" || role == "RL_TRUONGKHOA" || role == "RL_GIAOVU")
                        {
                            HomeLEC form = new HomeLEC();
                            form.Show();
                            MessageBox.Show("Đăng nhập thành công");
                            return;
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
                catch (Exception ex)
                {
                    conn.Close();
                    //MessageBox.Show("Error: " + ex.Message);
                    Console.WriteLine(ex.Message);
                    connectionString = connectionString.Replace(username, "{$user$}");
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
