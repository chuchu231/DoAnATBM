using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PhanHe1
{
    public partial class UC_GrantRevoke : UserControl
    {

        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        public UC_GrantRevoke()
        {
            InitializeComponent();
        }

        private void GrantRevoke_btn_Click(object sender, EventArgs e)
        {
            var grant_revoke = new FormGrant();
            grant_revoke.Show();
        }

        private void rolebtn_Click(object sender, EventArgs e)
        {
            var grant_revoke = new Form_Grant_Revoke_Role();
            grant_revoke.Show();
        }
    }
}
