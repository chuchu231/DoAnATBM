using Oracle.ManagedDataAccess.Client;
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
    public partial class UC_NHANSU : UserControl
    {

        public UC_NHANSU()
        {
            InitializeComponent();
        }

        private void addUser_btn_Click(object sender, EventArgs e)
        {
            if (LogIn.work == "SV0")
            {
                // do something ?
            }
            else if (LogIn.work == "GVU")
            {
                // do something ?
            }
            else if (LogIn.work == "TBM")
            {
                // do something ?
            }
            else if (LogIn.work == "TK0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.work == "NV0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.work == "GV0")
            {
                // do something ?
            }
        }

        private void delbtn_Click(object sender, EventArgs e)
        {
            if (LogIn.work == "SV0")
            {
                // do something ?
            }
            else if (LogIn.work == "GVU")
            {
                // do something ?
            }
            else if (LogIn.work == "TBM")
            {
                // do something ?
            }
            else if (LogIn.work == "TK0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.work == "NV0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.work == "GV0")
            {
                // do something ?
            }
        }

        private void btn_Update_Click(object sender, EventArgs e)
        {
            if (LogIn.work == "SV0")
            {
                // do something ?
            }
            else if (LogIn.work == "GVU")
            {
                // do something ?
            }
            else if (LogIn.work == "TBM")
            {
                // do something ?
            }
            else if (LogIn.work == "TK0")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.work == "NV0")
            {
                string query;
                query = "UPDATE CADMIN2.NVCB_NHANSU_VIEW SET DT = '" + PhoneNumbertxb.Text + "'";
                Console.WriteLine(query);
                using (OracleConnection connection = new OracleConnection(LogIn.connectionString))
                {
                    using (OracleCommand command = new OracleCommand(query, connection))
                    {
                        try
                        {
                            Console.WriteLine("ok");

                            connection.Open();
                            command.ExecuteNonQuery();
                            MessageBox.Show("Thành công");
                            connection.Close();

                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error: " + ex.Message);
                            //MessageBox.Show(query);
                        }
                    }
                }
            }
            else if (LogIn.work == "GV0")
            {
                // do something ?
            }
        }

        private void UC_NHANSU_Load(object sender, EventArgs e)
        {
            // Load datagridview
            if (LogIn.work == "SV0")
            {
                // do something ?
            }
            else if (LogIn.work == "GVU")
            {
                // do something ?
            }
            else if (LogIn.work == "TBM")
            {
                // do something ?
            }
            else if (LogIn.work == "TK0")
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM CADMIN2.NHANSU", conn);
                        using (OracleDataReader reader = cmd.ExecuteReader())
                        {
                            DetailStaff.DataSource = null;
                            if (reader.HasRows)
                            {
                                DataTable dataTable = new DataTable();
                                dataTable.Load(reader);
                                DetailStaff.DataSource = dataTable;
                            }
                        }
                    }
                    conn.Close();
                }

            }
            else if (LogIn.work == "NV0")
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM CADMIN2.NVCB_NHANSU_VIEW", conn);
                        using (OracleDataReader reader = cmd.ExecuteReader())
                        {
                            DetailStaff.DataSource = null;
                            if (reader.HasRows)
                            {
                                DataTable dataTable = new DataTable();
                                dataTable.Load(reader);
                                DetailStaff.DataSource = dataTable;
                            }
                        }
                    }
                    conn.Close();
                }

            }
            else if (LogIn.work == "GV0")
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM CADMIN2.NVCB_NHANSU_VIEW", conn);
                        using (OracleDataReader reader = cmd.ExecuteReader())
                        {
                            DetailStaff.DataSource = null;
                            if (reader.HasRows)
                            {
                                DataTable dataTable = new DataTable();
                                dataTable.Load(reader);
                                DetailStaff.DataSource = dataTable;
                            }
                        }
                    }
                    conn.Close();
                }
            }
        }
    }
}
