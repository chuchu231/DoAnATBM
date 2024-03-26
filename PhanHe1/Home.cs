using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PhanHe1
{
    public partial class Home : Form
    {
        public Home()
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

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {

        }

        

        private void Menu_Paint(object sender, PaintEventArgs e)
        {

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

        private void menuOpenbtn_Click_1(object sender, EventArgs e)
        {

            menuOpenbtn.Hide();
            menuOpenbtn.Visible = false;
            menubtn.Visible = true;
            Menu.Visible = false;
            Menu.Width = 200;
            this.UC_Container.Location = new Point(240, 90);
            guna2Transition1.ShowSync(Menu);
        }

        private void guna2ControlBox2_Click(object sender, EventArgs e)
        {

        }

        private void Home_Load(object sender, EventArgs e)
        {

        }

        private void UC_Container_Paint(object sender, PaintEventArgs e)
        {

        }

        private void HomeBtn_Click(object sender, EventArgs e)
        {
            UC_HomePage uc = new UC_HomePage();
            addUserControl(uc);
        }

        private void AllUser_Click(object sender, EventArgs e)
        {
            UC_AllUser uc = new UC_AllUser();
            addUserControl(uc);
        }

        private void User_Role_Privileges_Click(object sender, EventArgs e)
        {
            UC_AllRole uc = new UC_AllRole();
            addUserControl(uc);
        }

        private void Grant_Revoke_Privileges_Click(object sender, EventArgs e)
        {
            UC_GrantRevoke uc = new UC_GrantRevoke();
            addUserControl(uc);
        }
    }
}
