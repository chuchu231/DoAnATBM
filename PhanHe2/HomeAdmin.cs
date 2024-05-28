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

namespace PhanHe2
{
    public partial class HomeAdmin : Form
    {
        
        public HomeAdmin()
        {
            InitializeComponent();
            this.UC_Container.Location = new Point(100, 90);
        }
        private void addUserControl(UserControl uc)
        {
            uc.Dock = DockStyle.Fill;
            UC_Container.Controls.Clear();
            UC_Container.Controls.Add(uc);
            uc.BringToFront();

        }
        private void menuOpenbtn_Click(object sender, EventArgs e)
        {
            menuOpenbtn.Hide();
            menuOpenbtn.Visible = false;
            menubtn.Visible = true;
            Menu.Visible = false;
            Menu.Width = 200;
            this.UC_Container.Location = new Point(240, 90);
            guna2Transition1.ShowSync(Menu);
        }

        private void menubtn_Click(object sender, EventArgs e)
        {
            menubtn.Visible = false;
            menuOpenbtn.Visible = true;
            Menu.Visible = true;
            Menu.Width = 8;
            this.UC_Container.Location = new Point(100, 90);
            guna2Transition1.ShowSync(Menu);
        }

        private void btnTableAndView_Click(object sender, EventArgs e)
        {
            UC_Admin_TabAndView uc = new UC_Admin_TabAndView();
            addUserControl(uc);
        }

        private void AllUserbtn_Click(object sender, EventArgs e)
        {
            UC_Admin_Alluser uc = new UC_Admin_Alluser();
            addUserControl(uc);
        }

        private void User_Role_Privileges_Click(object sender, EventArgs e)
        {
            UC_Admin_Allrole uc = new UC_Admin_Allrole();
            addUserControl(uc);
        }

        private void Grant_Revoke_Privileges_Click(object sender, EventArgs e)
        {
            UC_Admin_GrantRevoke uc = new UC_Admin_GrantRevoke();
            addUserControl(uc);
        }

        private void LogOutBtn_Click(object sender, EventArgs e)
        {
            this.Hide();
            LogIn form = new LogIn();
            form.Show();
        }
    }
}
