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
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                var queryString = "INSERT INTO ADMIN.DONVI (MADV, TENDV, TRGDV) VALUES (:MADV, :TENDV, :TRGDV)";

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
            else if (LogIn.role == "RL_TRUONGBM")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.role == "RL_NHANVIEN")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.role == "RL_GIANGVIEN")
            {
                // do something ?
            }
        }

        private void delbtn_Click(object sender, EventArgs e)
        {
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_TRUONGBM")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.role == "RL_NHANVIEN")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.role == "RL_GIANGVIEN")
            {
                // do something ?
            }
        }

        private void btn_Update_Click(object sender, EventArgs e)
        {
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                var queryString = "UPDATE ADMIN.DONVI SET TENDV = :TENDV, TRGDV = :TRGDV WHERE MADV = :MADV";

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
            else if (LogIn.role == "RL_TRUONGBM")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.role == "RL_NHANVIEN")
            {
                MessageBox.Show("Bạn không có quyền thực hiện thao tác này!");

            }
            else if (LogIn.role == "RL_GIANGVIEN")
            {
                // do something ?
            }
        }

        private void UC_DONVI_Load(object sender, EventArgs e)
        {
            // Load datagridview
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                UC_Containers.SendToBack();
                var queryString = "SELECT * FROM ADMIN.DONVI";
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
            
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM ADMIN.DONVI", conn);
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
            else if (LogIn.role == "RL_NHANVIEN" || LogIn.role == "RL_TRUONGBM")
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM ADMIN.DONVI", conn);
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
            else if (LogIn.role == "RL_GIANGVIEN")
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM ADMIN.DONVI", conn);
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
