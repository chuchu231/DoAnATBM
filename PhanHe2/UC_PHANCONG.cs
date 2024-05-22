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
        string old_gv, old_hp, old_hk, old_nam, old_mact, dv;

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
                try
                {
                    var queryString = "INSERT INTO CADMIN2.UV_TRGDV_QUANLY_PHANCONG VALUES ('" + MAGVtxb.Text + "', '" + dv + "', '" + idtxtb.Text + "', '" + HKtxb.Text + "', '" + Namtxb.Text + "', '" + MACT.Text + "')";

                    using (conn = new OracleConnection(connectionString))
                    {
                        conn.Open();
                        using (OracleCommand cmd = new OracleCommand(queryString, conn))
                        {

                            Console.WriteLine(queryString);
                            cmd.ExecuteNonQuery();

                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception or display a message
                    MessageBox.Show("An error occurred: " + ex.Message);
                }
            }
            else if (LogIn.work == "TK0")
            {
                string query;
                query = "INSERT INTO CADMIN2.TRK_PHANCONG_VIEW VALUES ('" + MAGVtxb.Text + "','" + idtxtb.Text + "','" + HKtxb.Text + "','" + Namtxb.Text + "','" + MACT.Text + "')";
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
                try
                {
                    string queryString = "DELETE FROM CADMIN2.PHANCONG WHERE MAGV = :MAGV AND MAHP = :MAHP AND HK = :HK AND NAM = :NAM AND MACT = :MACT";

                    using (OracleConnection conn = new OracleConnection(connectionString))
                    {
                        conn.Open();
                        using (OracleCommand cmd = new OracleCommand(queryString, conn))
                        {
                            cmd.Parameters.Add(new OracleParameter(":MAGV", MAGVtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MAHP", idtxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":HK", HKtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":NAM", Namtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MACT", MACT.Text));

                            cmd.ExecuteNonQuery();
                        }
                    }

                }
                catch (Exception ex)
                {
                    // Log the exception or display a message
                    MessageBox.Show("An error occurred: " + ex.Message);
                }
            }
            else if (LogIn.work == "TK0")
            {
                string query;
                query = "DELETE FROM CADMIN2.TRK_PHANCONG_VIEW WHERE MAGV = '" + MAGVtxb.Text + "' AND MAHP = '" + idtxtb.Text + "' AND HK ='" + HKtxb.Text + "' AND NAM='" + Namtxb.Text + "' AND MACT='" + MACT.Text + "'";
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
                try
                {

                    var queryString = "UPDATE CADMIN2.UV_QUANLY_PHANCONG SET MANV = :MAGV, MAHP = :MAHP, HK = :HK, NAM = :NAM, MACT = :CT, MADV = :MADV " +
                                        "WHERE MANV = :OMAGV AND MAHP = :OMAHP AND HK = :OHK AND NAM = :ONAM AND MACT = :OCT AND MADV = :MADV";
                    using (var conn = new OracleConnection(connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
                            cmd.CommandType = CommandType.Text;

                            // Add parameters with correct placeholders and values
                            cmd.Parameters.Add(new OracleParameter(":MAGV", MAGVtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MAHP", idtxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":HK", HKtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":NAM", Namtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":CT", MACT.Text));
                            cmd.Parameters.Add(new OracleParameter(":MADV", "VPK"));

                            cmd.Parameters.Add(new OracleParameter(":OMAGV", old_gv));
                            cmd.Parameters.Add(new OracleParameter(":OMAHP", old_hp));
                            cmd.Parameters.Add(new OracleParameter(":OHK", old_hk));
                            cmd.Parameters.Add(new OracleParameter(":ONAM", old_nam));
                            cmd.Parameters.Add(new OracleParameter(":OCT", old_mact));



                            // Execute the command
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception or display a message
                    MessageBox.Show("An error occurred: " + ex.Message);
                }
            }
            else if (LogIn.work == "TBM")
            {
                try
                {
                    var queryString = "UPDATE CADMIN2.UV_TRGDV_QUANLY_PHANCONG SET MAGV = :MAGV, MAHP = :MAHP, HK = :HK, NAM = :NAM, MACT = :CT, MADV = :MADV " +
                                 "WHERE MAGV = :OMAGV AND MAHP = :OMAHP AND HK = :OHK AND NAM = :ONAM AND MACT = :OCT AND MADV = :MADV";

                    using (var conn = new OracleConnection(connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
                            cmd.CommandType = CommandType.Text;

                            // Add parameters with correct placeholders and values
                            cmd.Parameters.Add(new OracleParameter(":MAGV", MAGVtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MAHP", idtxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":HK", HKtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":NAM", Namtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":CT", MACT.Text));
                            cmd.Parameters.Add(new OracleParameter(":MADV", dv));

                            cmd.Parameters.Add(new OracleParameter(":OMAGV", old_gv));
                            cmd.Parameters.Add(new OracleParameter(":OMAHP", old_hp));
                            cmd.Parameters.Add(new OracleParameter(":OHK", old_hk));
                            cmd.Parameters.Add(new OracleParameter(":ONAM", old_nam));

                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception or display a message
                    MessageBox.Show("An error occurred: " + ex.Message);
                }
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
                UC_Containers.SendToBack();
                var queryString = "SELECT * FROM CADMIN2.PHANCONG\r\n";

                var dt = new DataTable();

                var da = new OracleDataAdapter(queryString, conn);
                da.Fill(dt);
                DetailStaff.DataSource = dt;

                conn.Close();
                dt.Dispose();
                da.Dispose();
            }
            else if (LogIn.work == "TBM")
            {
                UC_Containers.SendToBack();
                var queryString = "SELECT * FROM CADMIN2.UV_TRGDV_QUANLY_PHANCONG\r\n";

                var dt = new DataTable();

                var da = new OracleDataAdapter(queryString, conn);
                da.Fill(dt);
                DetailStaff.DataSource = dt;

                conn.Close();
                dt.Dispose();
                da.Dispose();
            }
            else if (LogIn.work == "TK0")
            {
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
            else if (LogIn.work == "NV0")
            {
                // do something ?
            }
            else if (LogIn.work == "GV0")
            {
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

        private void DetailStaff_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (LogIn.work == "TBM")
            {
                if (e.RowIndex >= 0 && e.RowIndex < DetailStaff.Rows.Count)
                {
                    DataGridViewRow row = DetailStaff.Rows[e.RowIndex];

                    MAGVtxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[0].Value.ToString();
                    idtxtb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[2].Value.ToString();
                    HKtxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[3].Value.ToString();
                    Namtxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[4].Value.ToString();
                    MACT.Text = this.DetailStaff.Rows[e.RowIndex].Cells[5].Value.ToString();
                    dv = this.DetailStaff.Rows[e.RowIndex].Cells[1].Value.ToString();

                }
            }
            else
            {
                if (e.RowIndex >= 0 && e.RowIndex < DetailStaff.Rows.Count)
                {
                    DataGridViewRow row = DetailStaff.Rows[e.RowIndex];

                    MAGVtxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[0].Value.ToString();
                    idtxtb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[1].Value.ToString();
                    HKtxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[2].Value.ToString();
                    Namtxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[3].Value.ToString();
                    MACT.Text = this.DetailStaff.Rows[e.RowIndex].Cells[4].Value.ToString();


                }
            }

            // Store old values for potential update operation
            old_gv = MAGVtxb.Text;
            old_hp = idtxtb.Text;
            old_hk = HKtxb.Text;
            old_nam = Namtxb.Text;
            old_mact = MACT.Text;
        }
    }
}
