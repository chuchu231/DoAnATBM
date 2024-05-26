using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;

namespace PhanHe2
{
    public partial class UC_SV_THONGTIN : UserControl
    {
        public UC_SV_THONGTIN()
        {
            InitializeComponent();
        }

        private void UC_SV_THONGTIN_Load(object sender, EventArgs e)
        {
            save.Visible = false;
            using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT * FROM ADMIN.SINHVIEN";
                    using (OracleCommand cmd = new OracleCommand(query, conn))
                    {
                        using (OracleDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Giả sử các textbox trên form của bạn có tên lần lượt là txtMaSV, txtHoTen, txtEmail, v.v.
                                nameTxtB.Text = reader["HOTEN"].ToString();
                                dobTxtB.Text = reader["NGSINH"].ToString();
                                genderTxtB.Text = reader["PHAI"].ToString();
                                addressTxtB.Text = reader["DCHI"].ToString();
                                phoneTxtB.Text = reader["DT"].ToString();
                                if (reader["MACT"].ToString() == "CLC")
                                {
                                    programmeTxtB.Text = "Chất lượng cao";
                                }
                                else if (reader["MACT"].ToString() == "CQ")
                                {
                                    programmeTxtB.Text = "Chính quy";
                                }
                                else if (reader["MACT"].ToString() == "VP")
                                {
                                    programmeTxtB.Text = "Việt - Pháp";
                                }
                                else
                                {
                                    programmeTxtB.Text = "Chương trình tiên tiến";
                                }
                                majorTxtB.Text = reader["MANGANH"].ToString();
                                scoreTxtB.Text = reader["DTBTL"].ToString();
                                // Tiếp tục với các cột khác tương ứng với các textbox khác
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }

        }

        private void UpdateStudent(string address, string phone)
        {
            string queryString = "UPDATE CADMIN2.SINHVIEN SET DCHI = :DCHI, DT = :DT";

            using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
            {
                conn.Open();
                using (OracleCommand cmd = new OracleCommand("ADMIN.UPDATE_STUDENT", conn))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.Add(":DCHI", OracleDbType.NVarchar2).Value = address;
                    cmd.Parameters.Add(":DT", OracleDbType.NVarchar2).Value = phone;
                    cmd.ExecuteNonQuery();
                }
            }
        }


        private void save_Click(object sender, EventArgs e)
        {
            string address = addressTxtB.Text;
            string phone = phoneTxtB.Text;
            try
            {
                UpdateStudent(address, phone);
                MessageBox.Show("Cập nhật thành công");
                addressTxtB.Enabled = false;
                phoneTxtB.Enabled = false;
                save.Visible = false;
                update.Visible = true;
            }
            catch (OracleException ex)
            {
                // Check the error code and display custom error messages
                if (ex.Number == 20001)
                {
                    MessageBox.Show("Thông tin địa chỉ không được để trống");
                }
                else if (ex.Number == 20002)
                {
                    MessageBox.Show("Thông tin số điện thoại không được để trống");
                }
                else
                {
                    MessageBox.Show("Lỗi: " + ex.Message);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }

        private void update_Click(object sender, EventArgs e)
        {
            addressTxtB.Enabled = true;
            phoneTxtB.Enabled = true;
            save.Visible = true;
            update.Visible = false;
        }
    }
}
