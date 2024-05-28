using Oracle.ManagedDataAccess.Client;
using System;
using System.Configuration;
using System.Windows.Forms;

namespace PhanHe2
{
    public partial class Form_Admin_Grant : Form
    {
        private string connectionString = LogIn.connectionString;
        OracleConnection conn = new OracleConnection(LogIn.connectionString);
        public Form_Admin_Grant()
        {
            InitializeComponent();
           
        }

        private void grant_btn_Click(object sender, EventArgs e)
        {
            string query = "";
            string user = username_role.Text;
            string privs = privileges.Text;
            string tablename = table.Text;
            string userId = "";
            string[] parts = connectionString.Split(';');

            // Lặp qua từng phần con để tìm User Id
            foreach (string part in parts)
            {
                // Tách phần con thành cặp key-value dựa trên dấu bằng (=)
                string[] keyValue = part.Split('=');

                // Nếu phần tử đầu tiên trong cặp key-value là "User Id" (hoặc "User ID"), lấy giá trị của phần tử thứ hai
                if (keyValue.Length == 2 && (keyValue[0].Trim().Equals("User Id", StringComparison.OrdinalIgnoreCase) || keyValue[0].Trim().Equals("User ID", StringComparison.OrdinalIgnoreCase)))
                {
                    userId = keyValue[1].Trim();
                    break;
                }
            }
            if (privs == "INSERT" || privs == "UPDATE")
            {
                string att = "";
                for (int i = 0; i < att_list.Items.Count; i++)
                {
                    if (att_list.GetItemChecked(i))
                    {
                        att += att_list.Items[i].ToString();
                        att += ",";
                    }
                }
                if (att.Length != 0)
                {
                    att = att.Substring(0, att.Length - 1);
                    query = "GRANT " + privs + " (" + att + ") ON " + userId + "." + tablename + " TO " + user;
                }
                else
                {
                    query = "GRANT " + privs + " ON " + userId + "." + tablename + " TO " + user;
                }

            }
            else
            {
                query = "GRANT " + privs + " ON " + userId + "." + tablename + " TO " + user;
            }
            if (check_grantopt.Checked == true) { query += " WITH GRANT OPTION"; }

            using (OracleConnection connection = new OracleConnection(connectionString))
            {
                using (OracleCommand command = new OracleCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        MessageBox.Show("Thành công");
                        //MessageBox.Show(query);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Error: " + ex.Message);
                        //MessageBox.Show(query);
                    }
                }
            }
        }

        private void revoke_Click(object sender, EventArgs e)
        {
            string query = "";
            string user = username_role.Text;
            string privs = privileges.Text;
            string tablename = table.Text;
            string userId = "";
            string[] parts = connectionString.Split(';');

            // Lặp qua từng phần con để tìm User Id
            foreach (string part in parts)
            {
                // Tách phần con thành cặp key-value dựa trên dấu bằng (=)
                string[] keyValue = part.Split('=');

                // Nếu phần tử đầu tiên trong cặp key-value là "User Id" (hoặc "User ID"), lấy giá trị của phần tử thứ hai
                if (keyValue.Length == 2 && (keyValue[0].Trim().Equals("User Id", StringComparison.OrdinalIgnoreCase) || keyValue[0].Trim().Equals("User ID", StringComparison.OrdinalIgnoreCase)))
                {
                    userId = keyValue[1].Trim();
                    break;
                }
            }
            query = "REVOKE " + privs + " ON " + userId + "." + tablename + " FROM " + user;

            using (OracleConnection connection = new OracleConnection(connectionString))
            {
                using (OracleCommand command = new OracleCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        MessageBox.Show("Thành công");
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error: " + ex.Message);
                    }
                }
            }
        }
    }
}
