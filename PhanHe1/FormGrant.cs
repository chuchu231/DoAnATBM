using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace PhanHe1
{
    public partial class FormGrant : Form
    {
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        public FormGrant()
        {
            InitializeComponent();
        }

        private void guna2TextBox1_TextChanged(object sender, EventArgs e)
        {

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
                // Tách phần con thành cặp key-value dựa trên dấu bằng 😊)
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
                att = att.Substring(0, att.Length - 1);
                query = "GRANT " + privs + " (" + att + ") ON " + userId + "." + tablename + " TO " + user;


            }
            else
            {
                query = "GRANT " + privs + " ON " + userId + "." + tablename + " TO " + user;
            }
            if (check_grantopt.Checked == true) { query += " WITH GRANT OPTION"; }
            Console.WriteLine(query);
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
                        Console.WriteLine("Error: " + ex.Message);
                    }
                }
            }
        }

        private void revoke_Click(object sender, EventArgs e)
        {

        }

        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        private void PopulateComboBox()
        {
            try
            {
                // Tạo kết nối đến cơ sở dữ liệu Oracle
                using (OracleConnection connection = new OracleConnection(connectionString))
                {
                    // Mở kết nối
                    connection.Open();

                    // Tạo OracleCommand để gọi stored procedure
                    using (OracleCommand cmd = new OracleCommand("GetAdminTables", connection))
                    {
                        // Đặt kiểu command là Stored Procedure
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Tạo tham số đầu ra
                        cmd.Parameters.Add("p_cursor", OracleDbType.RefCursor, ParameterDirection.Output);

                        // Thực thi command
                        using (OracleDataReader reader = cmd.ExecuteReader())
                        {
                            // Xóa các mục cũ trong comboBox trước khi thêm mới
                            table.Items.Clear();

                            // Duyệt qua kết quả và thêm vào comboBox
                            while (reader.Read())
                            {
                                table.Items.Add(reader["table_name"].ToString());
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }
        private void FormGrant_Load(object sender, EventArgs e)
        {
            PopulateComboBox();
        }

        private void table_SelectedValueChanged(object sender, EventArgs e)
        {
            if (privileges.Text == "SELECT" || privileges.Text == "UPDATE" || privileges.Text=="" && privileges.Text !="")
            {
               populateAttList();
            }
        }
        private void populateAttList()
        {
            string tablename = table.Text;
            try
            {
                // Tạo kết nối đến cơ sở dữ liệu Oracle
                using (OracleConnection connection = new OracleConnection(connectionString))
                {
                    // Mở kết nối
                    connection.Open();

                    // Tạo OracleCommand để gọi stored procedure
                    using (OracleCommand cmd = new OracleCommand("getAttributes", connection))
                    {
                        // Đặt kiểu command là Stored Procedure
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Tạo tham số đầu ra
                        cmd.Parameters.Add("tablename", OracleDbType.Varchar2).Value = tablename;
                        cmd.Parameters.Add("p_cursor", OracleDbType.RefCursor, ParameterDirection.Output);

                        // Thực thi command
                        using (OracleDataReader reader = cmd.ExecuteReader())
                        {
                            // Xóa các mục cũ trong comboBox trước khi thêm mới
                            att_list.Items.Clear();

                            // Duyệt qua kết quả và thêm vào comboBox
                            while (reader.Read())
                            {
                                att_list.Items.Add(reader["column_name"].ToString());
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }

        private void privileges_SelectedValueChanged(object sender, EventArgs e)
        {
            if (privileges.Text == "INSERT" ||  privileges.Text == "DELETE")
            {
                att_list.Items.Clear();
            }else
            {
                populateAttList();
            }
        }
    }
}


    







