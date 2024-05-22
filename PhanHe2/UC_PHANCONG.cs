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
using System.Configuration;
using System.Web.UI.WebControls;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
using System.Web.Security;


namespace PhanHe2
{
    public partial class UC_PHANCONG : UserControl
    {
        private string connectionString;
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        public UC_PHANCONG()
        {
            InitializeComponent();
            connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            // Replace placeholders with actual values
            connectionString = connectionString.Replace("{$user$}", LogIn.username);
            connectionString = connectionString.Replace("{$password%}", LogIn.password);
            conn = new OracleConnection(connectionString);
        }

        private void insert_btn_Click(object sender, EventArgs e)
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
                string query;
                query = "INSERT INTO KAN.TRK_PHANCONG_VIEW VALUES ('" + MAGVtxb.Text + "','" + idtxtb.Text + "','" + HKtxb.Text + "','" + Namtxb.Text + "','" + MACT.Text + "')";
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
                            UC_PHANCONG_Load(sender, e);
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error: " + ex.Message);
                            //MessageBox.Show(query);
                        }
                    }
                }
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
                string query;
                query = "DELETE FROM KAN.TRK_PHANCONG_VIEW WHERE MAGV = '" + MAGVtxb.Text + "' AND MAHP = '" + idtxtb.Text + "' AND HK ='" + HKtxb.Text + "' AND NAM='" + Namtxb.Text + "' AND MACT='" + MACT.Text + "'";
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
                            UC_PHANCONG_Load(sender, e);
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error: " + ex.Message);
                            //MessageBox.Show(query);
                        }
                    }
                }
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
                // do something ?
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

        private void UC_PHANCONG_Load(object sender, EventArgs e)
        {

            // Load datagridview
            if (LogIn.work == "SV0")
            {
                // do something ?
            }
            else if (LogIn.work == "GVU")
            {
                
            }
            else if (LogIn.work == "TBM")
            {
                // do something ?
            }
            else if (LogIn.work == "TK0")
            {
                Console.WriteLine("in here");
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM KAN.PHANCONG", conn);
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
                // do something ?
            }
            else if (LogIn.work == "GV0")
            {
                Console.WriteLine("in here");
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM CADMIN2.PHANCONG", conn);
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

        private void guna2Button1_Click(object sender, EventArgs e)
        {

        }
    }
}
