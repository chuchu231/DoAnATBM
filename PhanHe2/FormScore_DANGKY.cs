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
            var queryString = "UPDATE CADMIN2.DANGKY SET DIEMTH = @TBXTH, DIEMQT = @TBXQT, DIEMCK = @TBXCK WHERE MASV = @TBXMSSV AND MAHP = @TBXMAHP AND HK = @TBXHK AND NAMHOC = @TBXNAMHOC";

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
            this.Refresh();
        }

        private void tbxTH_TextChanged(object sender, EventArgs e)
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

        private void tbxQT_TextChanged(object sender, EventArgs e)
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
