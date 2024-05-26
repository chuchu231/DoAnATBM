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
            connectionString = connectionString.Replace("{$user$}", username);
            connectionString = connectionString.Replace("{$password%}", password);
            using (OracleConnection conn = new OracleConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    if (conn.State == ConnectionState.Open)
                    {

                        // Hiding LogIn form
                        this.Hide();

                        string rolePrefix = username.Substring(0, 3).ToUpper();
                        work = rolePrefix;

                        if (rolePrefix == "SV0")
                        {
                            HomeStudent form = new HomeStudent();
                            form.Show();
                            MessageBox.Show("Đăng nhập thành công");
                            return;
                        }
                        string queryStringTRDV = "SELECT COUNT(*) FROM CADMIN2.DONVI WHERE TRGDV = :username";
                        using (OracleCommand cmd = new OracleCommand(queryStringTRDV, conn))
                        {
                            try
                            {

                                cmd.Parameters.Add(new OracleParameter(":username", LogIn.username));

                                int count = Convert.ToInt32(cmd.ExecuteScalar());

                                if (count > 0)
                                {
                                    LogIn.work = "TBM";
                                }
                            }
                            catch (Exception ex)
                            {
                                MessageBox.Show("Lỗi: " + ex.Message);
                            }
                        }
                        string queryStringTRK = "SELECT COUNT(*) FROM CADMIN2.DONVI WHERE TRGDV = :username AND MADV = :MADV";
                        using (OracleCommand cmd = new OracleCommand(queryStringTRK, conn))
                        {
                            try
                            {
                                cmd.Parameters.Add(new OracleParameter(":username", LogIn.username));
                                cmd.Parameters.Add(new OracleParameter(":MADV", "VPK"));


                                int count = Convert.ToInt32(cmd.ExecuteScalar());

                                if (count > 0)
                                {
                                    LogIn.work = "TK0";
                                }
                            }
                            catch (Exception ex)
                            {
                                MessageBox.Show("Lỗi: " + ex.Message);
                            }
                        }
                        if (rolePrefix == "NV0")
                        {
                            HomeStaff form = new HomeStaff();
                            form.Show();
                            MessageBox.Show("Đăng nhập thành công");
                        }

                        else if (rolePrefix == "GV0" || rolePrefix == "TBM" || rolePrefix == "TK0" || rolePrefix == "GVU")
                        {
                            HomeLEC form = new HomeLEC();
                            form.Show();
                            MessageBox.Show("Đăng nhập thành công");

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
                        MessageBox.Show("Error: " + ex.Message);
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
