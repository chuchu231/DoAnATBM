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
using System.Collections;


namespace PhanHe2
{
    public partial class UC_DONVI : UserControl
    {

        public UC_DONVI()
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
                var queryString = "INSERT INTO CADMIN2.DONVI (MADV, TENDV, TRGDV) VALUES (:MADV, :TENDV, :TRGDV)";

                using (OracleConnection connection = new OracleConnection(LogIn.connectionString))
                {
                    using (OracleCommand command = new OracleCommand(queryString, connection))
                    {
                        try
                        {
                            command.Parameters.Add(new OracleParameter(":MADV", id_donvitxtb.Text));
                            command.Parameters.Add(new OracleParameter(":TENDV", donvitxb.Text));
                            command.Parameters.Add(new OracleParameter(":TRGDV", trgDVtxb.Text));

                            connection.Open();
                            command.ExecuteNonQuery();
                            MessageBox.Show("Thêm đơn vị thành công.");
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
                        }
                    }
                }


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
                var queryString = "UPDATE CADMIN2.DONVI SET TENDV = :TENDV, TRGDV = :TRGDV WHERE MADV = :MADV";

                using (OracleConnection connection = new OracleConnection(LogIn.connectionString))
                {
                    using (OracleCommand command = new OracleCommand(queryString, connection))
                    {
                        try
                        {
                            command.Parameters.Add(new OracleParameter(":TENDV", donvitxb.Text));
                            command.Parameters.Add(new OracleParameter(":TRGDV", trgDVtxb.Text));
                            command.Parameters.Add(new OracleParameter(":MADV", id_donvitxtb.Text));

                            connection.Open();
                            command.ExecuteNonQuery();
                            MessageBox.Show("Cập nhật đơn vị thành công.");
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Đã xảy ra lỗi: " + ex.Message);
                        }
                    }
                }

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

        private void UC_DONVI_Load(object sender, EventArgs e)
        {
            // Load datagridview
            if (LogIn.work == "SV0")
            {
                // do something ?
            }
            else if (LogIn.work == "GVU")
            {
                UC_Containers.SendToBack();
                var queryString = "SELECT * FROM CADMIN2.DONVI";
                using (OracleConnection connection = new OracleConnection(LogIn.connectionString))
                {
                    using (OracleCommand command = new OracleCommand(queryString, connection))
                    {
                        try
                        {
                            connection.Open();
                            var dt = new DataTable();

                            var da = new OracleDataAdapter(queryString, connection);
                            da.Fill(dt);
                            DetailStaff.DataSource = dt;

                            connection.Close();
                            dt.Dispose();
                            da.Dispose();
                        }
                        catch (Exception ex)
                        {
                            // Log the exception or display a message
                            MessageBox.Show("An error occurred: " + ex.Message);
                        }
                    }
                }
                
            }
            
            else if (LogIn.work == "TK0")
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM CADMIN2.DONVI", conn);
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
            else if (LogIn.work == "NV0" || LogIn.work == "TBM")
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM CADMIN2.DONVI", conn);
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
                        OracleCommand cmd = new OracleCommand("SELECT * FROM CADMIN2.DONVI", conn);
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

        private void DetailStaff_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            id_donvitxtb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[0].Value.ToString();
            donvitxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[1].Value.ToString();
            trgDVtxb.Text = this.DetailStaff.Rows[e.RowIndex].Cells[2].Value.ToString();
        }
    }
}
