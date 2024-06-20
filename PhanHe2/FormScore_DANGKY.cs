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
using static System.Formats.Asn1.AsnWriter;


namespace PhanHe2
{
    public partial class FormScore_DANGKY : Form
    { 
        OracleConnection conn = new OracleConnection(LogIn.connectionString);

        public FormScore_DANGKY()
        {
            InitializeComponent();
        }
      

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void FormScore_DANGKY_Load(object sender, EventArgs e)
        {

        }

        private void updatebtn_Click(object sender, EventArgs e)
        {
            var queryString = "UPDATE ADMIN.DANGKY SET DIEMTH = :TBXTH, DIEMQT = :TBXQT, DIEMCK = :TBXCK WHERE MASV = :TBXMSSV AND MAHP = :TBXMAHP AND HK = :TBXHK AND NAM = :TBXNAMHOC";

            using (OracleConnection conn = new OracleConnection(LogIn.connectionString))
            {
                using (OracleCommand cmd = new OracleCommand(queryString, conn))
                {
                    try
                    {
                        conn.Open();

                        cmd.Parameters.Add(new OracleParameter(":TBXTH", float.Parse(tbxTH.Text)));
                        cmd.Parameters.Add(new OracleParameter(":TBXQT", float.Parse(tbxQT.Text)));
                        cmd.Parameters.Add(new OracleParameter(":TBXCK", float.Parse(tbxCK.Text)));
                        cmd.Parameters.Add(new OracleParameter(":TBXMSSV", tbxMSSV.Text));
                        cmd.Parameters.Add(new OracleParameter(":TBXMAHP", tbxMAHP.Text));
                        cmd.Parameters.Add(new OracleParameter(":TBXHK", tbxHK.Text));
                        cmd.Parameters.Add(new OracleParameter(":TBXNAMHOC", tbxNamHoc.Text));

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
                    catch (Exception ex)
                    {
                        MessageBox.Show("Lỗi: " + ex.Message);
                    }
                    finally
                    {
                        if (conn.State == ConnectionState.Open)
                        {
                            conn.Close();
                        }
                    }
                }
            }

            this.Hide();
        }


        private void tbxTH_TextChanged(object sender, EventArgs e)
        {
           /* var queryString = "UPDATE CADMIN2.DANGKY SET DIEMTH = @TBXTH, DIEMQT = @TBXQT, DIEMCK = @TBXCK WHERE MASV = @TBXMSSV AND MAHP = @TBXMAHP AND HK = @TBXHK AND NAMHOC = @TBXNAMHOC";

            using (OracleCommand cmd = new OracleCommand(queryString, conn))
            {
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.Add(new OracleParameter("@TBXTH", tbxTH));
                cmd.Parameters.Add(new OracleParameter("@TBXQT", tbxQT));
                cmd.Parameters.Add(new OracleParameter("@TBXCK", tbxCK));
                cmd.Parameters.Add(new OracleParameter("@TBXMSSV", tbxMSSV));
                cmd.Parameters.Add(new OracleParameter("@TBXMAHP", tbxMAHP));
                cmd.Parameters.Add(new OracleParameter("@TBXHK", tbxHK));
                cmd.Parameters.Add(new OracleParameter("@TBXNAMHOC", tbxNamHoc));

                cmd.ExecuteNonQuery();
            }
            this.Refresh();*/
        }

        private void tbxQT_TextChanged(object sender, EventArgs e)
        {
            /*var queryString = "UPDATE CADMIN2.DANGKY SET DIEMTH = @TBXTH, DIEMQT = @TBXQT, DIEMCK = @TBXCK WHERE MASV = @TBXMSSV AND MAHP = @TBXMAHP AND HK = @TBXHK AND NAMHOC = @TBXNAMHOC";

            using (OracleCommand cmd = new OracleCommand(queryString, conn))
            {
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.Add(new OracleParameter("@TBXTH", tbxTH));
                cmd.Parameters.Add(new OracleParameter("@TBXQT", tbxQT));
                cmd.Parameters.Add(new OracleParameter("@TBXCK", tbxCK));
                cmd.Parameters.Add(new OracleParameter("@TBXMSSV", tbxMSSV));
                cmd.Parameters.Add(new OracleParameter("@TBXMAHP", tbxMAHP));
                cmd.Parameters.Add(new OracleParameter("@TBXHK", tbxHK));
                cmd.Parameters.Add(new OracleParameter("@TBXNAMHOC", tbxNamHoc));

                cmd.ExecuteNonQuery();
            }
            this.Refresh();*/
        }

        private void tbxCK_TextChanged(object sender, EventArgs e)
        {
            /*var queryString = "UPDATE CADMIN2.DANGKY SET DIEMTH = @TBXTH, DIEMQT = @TBXQT, DIEMCK = @TBXCK WHERE MASV = @TBXMSSV AND MAHP = @TBXMAHP AND HK = @TBXHK AND NAMHOC = @TBXNAMHOC";

            using (OracleCommand cmd = new OracleCommand(queryString, conn))
            {
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.Add(new OracleParameter("@TBXTH", tbxTH));
                cmd.Parameters.Add(new OracleParameter("@TBXQT", tbxQT));
                cmd.Parameters.Add(new OracleParameter("@TBXCK", tbxCK));
                cmd.Parameters.Add(new OracleParameter("@TBXMSSV", tbxMSSV));
                cmd.Parameters.Add(new OracleParameter("@TBXMAHP", tbxMAHP));
                cmd.Parameters.Add(new OracleParameter("@TBXHK", tbxHK));
                cmd.Parameters.Add(new OracleParameter("@TBXNAMHOC", tbxNamHoc));

                cmd.ExecuteNonQuery();
            }
            this.Refresh();*/
        }
    }
}
