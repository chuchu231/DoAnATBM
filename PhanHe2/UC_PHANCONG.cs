﻿using Oracle.ManagedDataAccess.Client;
using System;
using System.Configuration;
using System.Data;
using System.Windows.Forms;


namespace PhanHe2
{
    public partial class UC_PHANCONG : UserControl
    {
        OracleConnection conn = new OracleConnection(LogIn.connectionString);

        // bien tam
        string old_gv, old_hp, old_hk, old_nam, old_mact, dv;

        public UC_PHANCONG()
        {
            InitializeComponent();
            
        }

        private void insert_btn_Click(object sender, EventArgs e)
        {
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                // ignore role ni`
            }
            else if (LogIn.role == "RL_TRUONGBM")
            {

                try
                {
                    var queryString = "INSERT INTO ADMIN.UV_TRGDV_QUANLY_PHANCONG VALUES ('" + MAGVtxb.Text + "', '" + dv + "', '" + idtxtb.Text + "', '" + HKtxb.Text + "', '" + Namtxb.Text + "', '" + MACT.Text + "')";

                    using (conn = new OracleConnection(LogIn.connectionString))
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
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                string query;
                query = "INSERT INTO ADMIN.TRK_PHANCONG_VIEW VALUES ('" + MAGVtxb.Text + "','" + idtxtb.Text + "','" + HKtxb.Text + "','" + Namtxb.Text + "','" + MACT.Text + "')";
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
            else if (LogIn.role == "RL_NHANVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIANGVIEN")
            {
                // do something ?
            }
            UC_PHANCONG_Load(sender, e);
        }

        private void delbtn_Click(object sender, EventArgs e)
        {
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                // ignore role ni`
            }
            else if (LogIn.role == "RL_TRUONGBM")
            {

                try
                {
                    string queryString = "DELETE FROM ADMIN.PHANCONG WHERE MAGV = :MAGV AND MAHP = :MAHP AND HK = :HK AND NAM = :NAM AND MACT = :MACT";

                    using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
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
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                // do something ?
                string query;
                query = "DELETE FROM ADMIN.TRK_PHANCONG_VIEW WHERE MAGV = '" + MAGVtxb.Text + "' AND MAHP = '" + idtxtb.Text + "' AND HK ='" + HKtxb.Text + "' AND NAM='" + Namtxb.Text + "' AND MACT='" + MACT.Text + "'";
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
            else if (LogIn.role == "RL_NHANVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIANGVIEN")
            {
                // do something ?
            }
            UC_PHANCONG_Load(sender, e);
        }

        private void btn_Update_Click(object sender, EventArgs e)
        {
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                try
                {

                    var queryString = "UPDATE ADMIN.UV_QUANLY_PHANCONG SET MANV = '" + MAGVtxb.Text + "', MAHP = '" + idtxtb.Text + "', HK = '" + HKtxb.Text + "', NAM = '" + Namtxb.Text + "', MACT = '" + MACT.Text + "', MADV = 'VPK' " +
                                        "WHERE MANV = '" + old_gv + "' AND MAHP = '" + old_hp + "' AND HK = '" + old_hk + "' AND NAM = '" + old_nam + "' AND MACT = '" + old_mact + "' AND MADV = 'VPK'";
                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
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
            else if (LogIn.role == "RL_TRUONGBM")
            {

                try
                {
                    var queryString = "UPDATE ADMIN.UV_TRGDV_QUANLY_PHANCONG SET MAGV = '" + MAGVtxb.Text + "', MAHP = '" + idtxtb.Text + "', HK = '" + HKtxb.Text + "', NAM = '" + Namtxb.Text + "', MACT = '" + MACT.Text + "', MADV = '" + dv + "' " +
                                        "WHERE MAGV = '" + old_gv + "' AND MAHP = '" + old_hp + "' AND HK = '" + old_hk + "' AND NAM = '" + old_nam + "' AND MACT = '" + old_mact + "' AND MADV = '" + dv + "'";

                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {

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
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                try
                {
                    var queryString = "UPDATE ADMIN.TRK_PHANCONG_VIEW SET MAGV = '" + MAGVtxb.Text + "', MAHP = '" + idtxtb.Text + "', HK = '" + HKtxb.Text + "', NAM = '" + Namtxb.Text + "', MACT = '" + MACT.Text + "'" +
                                        "WHERE MAGV = '" + old_gv + "' AND MAHP = '" + old_hp + "' AND HK = '" + old_hk + "' AND NAM = '" + old_nam + "' AND MACT = '" + old_mact + "'";

                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {

                            cmd.ExecuteNonQuery();
                            conn.Close();   
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception or display a message
                    MessageBox.Show("An error occurred: " + ex.Message);
                }

            }
            else if (LogIn.role == "RL_NHANVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIANGVIEN")
            {
                // do something ?
            }
            UC_PHANCONG_Load(sender, e);
        }

        private void UC_PHANCONG_Load(object sender, EventArgs e)
        {
            // Load datagridview
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                UC_Containers.SendToBack();
                var queryString = "SELECT * FROM ADMIN.PHANCONG\r\n";

                var dt = new DataTable();

                var da = new OracleDataAdapter(queryString, conn);
                da.Fill(dt);
                DetailStaff.DataSource = dt;

                conn.Close();
                dt.Dispose();
                da.Dispose();
            }
            else if (LogIn.role == "RL_TRUONGBM")
            {
                UC_Containers.SendToBack();
                var queryString = "SELECT * FROM ADMIN.UV_TRGDV_QUANLY_PHANCONG\r\n";

                var dt = new DataTable();

                var da = new OracleDataAdapter(queryString, conn);
                da.Fill(dt);
                DetailStaff.DataSource = dt;

                conn.Close();
                dt.Dispose();
                da.Dispose();
            }
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand("SELECT * FROM ADMIN.PHANCONG", conn);
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
            else if (LogIn.role == "RL_NHANVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIANGVIEN")
            {
                var queryString = "SELECT * FROM ADMIN.UV_GV_Phancong";

                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();

                    if (conn.State == ConnectionState.Open)
                    {
                        OracleCommand cmd = new OracleCommand(queryString, conn);
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
            if (LogIn.role == "RL_TRUONGBM")
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
