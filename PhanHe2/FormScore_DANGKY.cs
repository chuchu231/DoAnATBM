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
        private string connectionString;
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        public FormScore_DANGKY()
        {
            InitializeComponent();
            connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            // Replace placeholders with actual values
            connectionString = connectionString.Replace("{$user$}", LogIn.username);
            connectionString = connectionString.Replace("{$password%}", LogIn.password);
            conn = new OracleConnection(connectionString);
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
        }
    }
}
