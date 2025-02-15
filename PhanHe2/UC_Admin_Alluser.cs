﻿using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PhanHe2
{
    public partial class UC_Admin_Alluser : UserControl
    {
        OracleConnection conn = new OracleConnection(LogIn.connectionString);
        public UC_Admin_Alluser()
        {
            InitializeComponent();
        }
        void show()
        {
            UC_Containers.Controls.Clear();
            UC_Containers.SendToBack();
            var queryString = "SELECT USERNAME, USER_ID, PASSWORD_CHANGE_DATE FROM DBA_USERS\r\n";

            var dt = new DataTable();
            var da = new OracleDataAdapter(queryString, conn);
            da.Fill(dt);

            allusers.DataSource = dt;
            allusers.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            allusers.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            allusers.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            allusers.ReadOnly = true;
            conn.Close();
        }
        private void addUserControl(UserControl uc)
        {
            uc.Dock = DockStyle.Fill;
            UC_Containers.Controls.Clear();
            UC_Containers.Controls.Add(uc);
            uc.BringToFront();
        }

        private void UC_Admin_Alluser_Load(object sender, EventArgs e)
        {
            show();
        }

        private void addUser_btn_Click(object sender, EventArgs e)
        {
            try
            {
                string username = this.usernametxtb.Text;
                string password = this.pwtxtb.Text;

                conn.Open();

                OracleCommand cmd = new OracleCommand("Create_NewUser", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("User_name", OracleDbType.Varchar2).Value = username;
                cmd.Parameters.Add("Pass_Word", OracleDbType.NVarchar2).Value = password;

                cmd.ExecuteNonQuery();
                show();
                MessageBox.Show("User " + username + " created successfully!");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                conn.Close();
            }
        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            string searchValue = this.searchtxb.Text.Trim();
            bool userFound = false;
            this.allusers.Refresh();
            foreach (DataGridViewRow row in allusers.Rows)
            {
                if (row.Cells["Username"].Value != null &&
                    row.Cells["Username"].Value.ToString().Equals(searchValue, StringComparison.OrdinalIgnoreCase))
                {
                    row.Selected = true;
                    allusers.FirstDisplayedScrollingRowIndex = row.Index;
                    userFound = true;
                    break;
                }
            }
            if (!userFound)
            {
                MessageBox.Show("User not found.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void btn_Update_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                string username = this.usernametxtb.Text;
                this.allusers.Refresh();
                using (OracleCommand cmd = new OracleCommand("Alter_User", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("User_name", OracleDbType.Varchar2).Value = username;
                    cmd.Parameters.Add("Pass_Word", OracleDbType.Varchar2).Value = this.pwtxtb.Text;
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("User " + username + " alter successfully!");
                }

                UC_Admin_DetailUser uc = new UC_Admin_DetailUser();
                UC_Containers.BringToFront();
                addUserControl(uc);

                uc.lb_UserName.Text = username;


                OracleCommand cmd2 = new OracleCommand("GetUserPrivilegesByUsername", conn);
                cmd2.CommandType = CommandType.StoredProcedure;

                cmd2.Parameters.Add("Username", OracleDbType.Varchar2).Value = username;
                cmd2.Parameters.Add("UserCursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                using (OracleDataReader reader = cmd2.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        DataTable dataTable = new DataTable();
                        dataTable.Load(reader);

                        uc.dataGridView1.DataSource = dataTable;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                conn.Close();
            }
        }

        private void allusers_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            UC_Admin_DetailUser uc = new UC_Admin_DetailUser();
            UC_Containers.BringToFront();
            addUserControl(uc);
            this.usernametxtb.Text = this.allusers.Rows[e.RowIndex].Cells[0].Value.ToString();
            this.pwtxtb.Text = "*****";
            uc.lb_UserName.Text = this.allusers.Rows[e.RowIndex].Cells[0].Value.ToString();
            string username = this.allusers.Rows[e.RowIndex].Cells[0].Value.ToString();

            conn.Open();


            OracleCommand cmd = new OracleCommand("GetUserPrivilegesByUsername", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("Username", OracleDbType.Varchar2).Value = username;
            cmd.Parameters.Add("UserCursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

            using (OracleDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Load(reader);

                    uc.dataGridView1.DataSource = dataTable;
                }
            }
            conn.Close();
        }
    }
}
