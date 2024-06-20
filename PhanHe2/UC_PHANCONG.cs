using Oracle.ManagedDataAccess.Client;
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
                string insertQuery = "INSERT INTO ADMIN.UV_TRGDV_QUANLY_PHANCONG (MAGV, MAHP, HK, NAM, MACT) VALUES (:MAGV, :MAHP, :HK, :NAM, :MACT)";

                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    try
                    {
                        conn.Open();
                        using (OracleCommand cmd = new OracleCommand(insertQuery, conn))
                        {
                            cmd.Parameters.Add(new OracleParameter(":MAGV", MAGVtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MAHP", idtxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":HK", HKtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":NAM", Namtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MACT", MACT.Text));

                            cmd.ExecuteNonQuery();
                            MessageBox.Show("Thành công");
                            UC_PHANCONG_Load(sender, e);
                        }
                    }
                    catch (OracleException ex)
                    {
                        // Bắt lỗi Oracle và hiển thị thông báo lỗi từ trigger
                        if (ex.Number == 20001)
                        {
                            MessageBox.Show("Mã học phần không thuộc chuyên ngành");
                        }
                        else if (ex.Number == 20002)
                        {
                            MessageBox.Show("Học phần không được mở");
                        }
                        else
                        {
                            MessageBox.Show("Lỗi Oracle: " + ex.Message);
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Lỗi: " + ex.Message);
                    }
                    
                }


            }
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                string insertQuery = "INSERT INTO ADMIN.UV_QUANLY_PHANCONG (MAGV, MAHP, HK, NAM, MACT) VALUES (:MAGV, :MAHP, :HK, :NAM, :MACT)";

                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    try
                    {
                        conn.Open();
                        using (OracleCommand cmd = new OracleCommand(insertQuery, conn))
                        {
                            cmd.Parameters.Add(new OracleParameter(":MAGV", MAGVtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MAHP", idtxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":HK", HKtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":NAM", Namtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MACT", MACT.Text));

                            cmd.ExecuteNonQuery();
                            MessageBox.Show("Thêm thành công");
                            UC_PHANCONG_Load(sender, e);


                        }
                    }
                    catch (OracleException ex)
                    {
                        // Bắt lỗi Oracle và hiển thị thông báo lỗi từ trigger
                        if (ex.Number == 20001)
                        {
                            MessageBox.Show("Mã học phần không thuộc văn phòng khoa");
                        }
                        else if( ex.Number == 20002)
                        {
                            MessageBox.Show("Học phần này không được mở");
                        }
                        else
                        {
                            MessageBox.Show("Lỗi Oracle: " + ex.Message);
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Lỗi: " + ex.Message);
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
                    string queryString = "DELETE FROM ADMIN.UV_TRGDV_QUANLY_PHANCONG WHERE MAGV = :MAGV AND MAHP = :MAHP AND HK = :HK AND NAM = :NAM AND MACT = :MACT AND MADV = :MADV";

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
                            cmd.Parameters.Add(new OracleParameter(":MADV", dv));

                            int row = cmd.ExecuteNonQuery();
                            if (row > 0)
                            {
                                MessageBox.Show("Xóa thành công");
                            }
                            else
                            {
                                MessageBox.Show("Xóa thất bại");

                            }
                            UC_PHANCONG_Load(sender, e);
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
                    string queryString = "DELETE FROM ADMIN.UV_QUANLY_PHANCONG WHERE MAGV = :MAGV AND MAHP = :MAHP AND HK = :HK AND NAM = :NAM AND MACT = :MACT";

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

                            int row = cmd.ExecuteNonQuery();
                            if (row > 0)
                            {
                                MessageBox.Show("Xóa thành công");
                            }
                            else
                            {
                                MessageBox.Show("Không có quyền xóa trên dòng này");

                            }
                            UC_PHANCONG_Load(sender, e);
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
                    var queryString = "UPDATE ADMIN.UV_QUANLY_PHANCONG SET MAGV = :MAGV, MAHP = :MAHP, HK = :HK, NAM = :NAM, MACT = :MACT " +
                                      "WHERE MAGV = :OLD_GV AND MAHP = :OLD_HP AND HK = :OLD_HK AND NAM = :OLD_NAM AND MACT = :OLD_MACT";

                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
                            cmd.Parameters.Add(":MAGV", OracleDbType.Varchar2).Value = MAGVtxb.Text;
                            cmd.Parameters.Add(":MAHP", OracleDbType.Varchar2).Value = idtxtb.Text;
                            cmd.Parameters.Add(":HK", OracleDbType.Varchar2).Value = HKtxb.Text;
                            cmd.Parameters.Add(":NAM", OracleDbType.Varchar2).Value = Namtxb.Text;
                            cmd.Parameters.Add(":MACT", OracleDbType.Varchar2).Value = MACT.Text;

                            cmd.Parameters.Add(":OLD_GV", OracleDbType.Varchar2).Value = old_gv;
                            cmd.Parameters.Add(":OLD_HP", OracleDbType.Varchar2).Value = old_hp;
                            cmd.Parameters.Add(":OLD_HK", OracleDbType.Varchar2).Value = old_hk;
                            cmd.Parameters.Add(":OLD_NAM", OracleDbType.Varchar2).Value = old_nam;
                            cmd.Parameters.Add(":OLD_MACT", OracleDbType.Varchar2).Value = old_mact;

                            int row = cmd.ExecuteNonQuery();
                            if (row > 0)
                            {
                                MessageBox.Show("update thành công");
                            }
                            else {
                                MessageBox.Show("Không có quyền update trên dòng này");

                            }
                            UC_PHANCONG_Load(sender, e);
                        }
                    }
                }
                catch (OracleException ex)
                {
                    // Bắt lỗi Oracle và hiển thị thông báo lỗi từ trigger
                    if (ex.Number == 20001)
                    {
                        MessageBox.Show("Mã học phần không thuộc văn phòng khoa");
                    }
                    else if (ex.Number == 20002)
                    {
                        MessageBox.Show("Học phần này không được mở");
                    }
                    else
                    {
                        MessageBox.Show("Lỗi Oracle: " + ex.Message);
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
                    var queryString = "UPDATE ADMIN.UV_TRGDV_QUANLY_PHANCONG " +
                                      "SET MAGV = :MAGV, MAHP = :MAHP, HK = :HK, NAM = :NAM, MACT = :MACT, MADV = :MADV " +
                                      "WHERE MAGV = :old_gv AND MAHP = :old_hp AND HK = :old_hk AND NAM = :old_nam AND MACT = :old_mact AND MADV = :old_dv";

                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
                            cmd.Parameters.Add(new OracleParameter(":MAGV", MAGVtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MAHP", idtxtb.Text));
                            cmd.Parameters.Add(new OracleParameter(":HK", HKtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":NAM", Namtxb.Text));
                            cmd.Parameters.Add(new OracleParameter(":MACT", MACT.Text));
                            cmd.Parameters.Add(new OracleParameter(":MADV", dv));
                            cmd.Parameters.Add(new OracleParameter(":old_gv", old_gv));
                            cmd.Parameters.Add(new OracleParameter(":old_hp", old_hp));
                            cmd.Parameters.Add(new OracleParameter(":old_hk", old_hk));
                            cmd.Parameters.Add(new OracleParameter(":old_nam", old_nam));
                            cmd.Parameters.Add(new OracleParameter(":old_mact", old_mact));
                            cmd.Parameters.Add(new OracleParameter(":old_dv", dv));

                            int rowsUpdated = cmd.ExecuteNonQuery();
                            if (rowsUpdated > 0)
                            {
                                MessageBox.Show("Cập nhật thành công.");
                            }
                            else
                            {
                                MessageBox.Show("Cập nhật thất bại.");
                            }
                        }
                    }
                }
                catch (OracleException ex)
                {
                    // Bắt lỗi Oracle và hiển thị thông báo lỗi từ trigger
                    if (ex.Number == 20001)
                    {
                        MessageBox.Show("Mã học phần không thuộc chuyên ngành");
                    }
                    else if (ex.Number == 20002)
                    {
                        MessageBox.Show("Học phần này không được mở");
                    }
                    else
                    {
                        MessageBox.Show("Lỗi Oracle: " + ex.Message);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("An error occurred: " + ex.Message);
                }

            }
            else if (LogIn.role == "RL_TRUONGKHOA")
            {
                try
                {
                    var queryString = "UPDATE ADMIN.UV_QUANLY_PHANCONG SET MAGV = :MAGV, MAHP = :MAHP, HK = :HK, NAM = :NAM, MACT = :MACT " +
                                      "WHERE MAGV = :OLD_GV AND MAHP = :OLD_HP AND HK = :OLD_HK AND NAM = :OLD_NAM AND MACT = :OLD_MACT";

                    using (var conn = new OracleConnection(LogIn.connectionString))
                    {
                        conn.Open();
                        using (var cmd = new OracleCommand(queryString, conn))
                        {
                            cmd.Parameters.Add(":MAGV", OracleDbType.Varchar2).Value = MAGVtxb.Text;
                            cmd.Parameters.Add(":MAHP", OracleDbType.Varchar2).Value = idtxtb.Text;
                            cmd.Parameters.Add(":HK", OracleDbType.Varchar2).Value = HKtxb.Text;
                            cmd.Parameters.Add(":NAM", OracleDbType.Varchar2).Value = Namtxb.Text;
                            cmd.Parameters.Add(":MACT", OracleDbType.Varchar2).Value = MACT.Text;

                            cmd.Parameters.Add(":OLD_GV", OracleDbType.Varchar2).Value = old_gv;
                            cmd.Parameters.Add(":OLD_HP", OracleDbType.Varchar2).Value = old_hp;
                            cmd.Parameters.Add(":OLD_HK", OracleDbType.Varchar2).Value = old_hk;
                            cmd.Parameters.Add(":OLD_NAM", OracleDbType.Varchar2).Value = old_nam;
                            cmd.Parameters.Add(":OLD_MACT", OracleDbType.Varchar2).Value = old_mact;

                            int row = cmd.ExecuteNonQuery();
                            if (row > 0)
                            {
                                MessageBox.Show("update thành công");
                            }
                            else
                            {
                                MessageBox.Show("Không có quyền update trên dòng này");

                            }
                            UC_PHANCONG_Load(sender, e);
                        }
                    }
                }
                catch (OracleException ex)
                {
                    // Bắt lỗi Oracle và hiển thị thông báo lỗi từ trigger
                    if (ex.Number == 20001)
                    {
                        MessageBox.Show("Mã học phần không thuộc văn phòng khoa");
                    }
                    else if (ex.Number == 20002)
                    {
                        MessageBox.Show("Học phần này không được mở");
                    }
                    else
                    {
                        MessageBox.Show("Lỗi Oracle: " + ex.Message);
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
            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            DetailStaff.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            DetailStaff.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            DetailStaff.ReadOnly = true;
            // Load datagridview
            if (LogIn.role == "RL_SINHVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIAOVU")
            {
                UC_Containers.SendToBack();
                var queryString = "SELECT PC.*, HP.MADV" +
                                  " FROM ADMIN.PHANCONG PC JOIN ADMIN.HOCPHAN HP ON PC.MAHP = HP.MAHP\r\n";

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
                    var queryString = "SELECT PC.*, HP.MADV" +
                                  " FROM ADMIN.PHANCONG PC JOIN ADMIN.HOCPHAN HP ON PC.MAHP = HP.MAHP\r\n";
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
            else if (LogIn.role == "RL_NHANVIEN")
            {
                // do something ?
            }
            else if (LogIn.role == "RL_GIANGVIEN")
            {
                DetailStaff.ReadOnly = true;
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
        private DataTable GetQuanLyPhanCongData()
        {
            DataTable dataTable = new DataTable();

            try
            {
                using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
                {
                    conn.Open();
                    string query = "SELECT * FROM ADMIN.UV_Quanly_Phancong";
                    using (OracleDataAdapter adapter = new OracleDataAdapter(query, conn))
                    {
                        adapter.Fill(dataTable);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }

            return dataTable;
        }
    }
}
