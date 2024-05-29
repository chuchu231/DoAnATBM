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
    public partial class HomeStudent : Form
    {
        public HomeStudent()
        {
            InitializeComponent();
        }

        private void HomeStudent_Load(object sender, EventArgs e)
        {

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
           
        }

        private void menubtn_Click_1(object sender, EventArgs e)
        {
            menubtn.Visible = false;
            menuOpenbtn.Visible = true;
            Menu.Visible = true;
            Menu.Width = 8;
            this.UC_Container.Location = new Point(100, 90);
            guna2Transition1.ShowSync(Menu);
        }
        
        private void LogOutBtn_Click(object sender, EventArgs e)
        {
            this.Hide();
            LogIn form = new LogIn();
            form.Show();
        }

        private void addUserControl(UserControl uc)
        {
            uc.Dock = DockStyle.Fill;
            UC_Container.Controls.Clear();
            UC_Container.Controls.Add(uc);
            uc.BringToFront();

        }
        private void Sinhvien_Click(object sender, EventArgs e)
        {
            UC_SV_THONGTIN uc = new UC_SV_THONGTIN();
            addUserControl(uc);
        }

        private void HP_Click(object sender, EventArgs e)
        {
            UC_HOCPHAN uc = new UC_HOCPHAN();
            addUserControl(uc);
        }

        private void KHMO_Click(object sender, EventArgs e)
        {
            UC_KHMO uc = new UC_KHMO();
            addUserControl(uc);
        }

        private void DangKy_Click(object sender, EventArgs e)
        {
            UC_DANGKY uc = new UC_DANGKY();
            addUserControl(uc);
        }

        private void Result_DK_Click(object sender, EventArgs e)
        {
            UC_SV_KETQUADK uc = new UC_SV_KETQUADK();
            addUserControl(uc);
        }

        private void Result_Click(object sender, EventArgs e)
        {
            UC_SV_KETQUAHT uc = new UC_SV_KETQUAHT();
            addUserControl(uc);
        }

        private void Alertbtn_Click(object sender, EventArgs e)
        {
            UC_THONGBAO uc = new UC_THONGBAO();
            addUserControl(uc);
        }
    }
}
