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
    public partial class HomeLEC : Form
    {
        public HomeLEC()
        {
            InitializeComponent();
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
        private void Nhansu_Click(object sender, EventArgs e)
        {
            UC_NHANSU uc= new UC_NHANSU();
            addUserControl(uc);
        }

        private void Sinhvien_Click(object sender, EventArgs e)
        {
            UC_SINHVIEN uc = new UC_SINHVIEN();
            addUserControl(uc);
        }

        private void Donvi_Click(object sender, EventArgs e)
        {
            UC_DONVI uc = new UC_DONVI();
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

        private void Phancong_Click(object sender, EventArgs e)
        {
            UC_PHANCONG uc = new UC_PHANCONG();
            addUserControl(uc);
        }

        private void DangKy_Click(object sender, EventArgs e)
        {
            UC_DANGKY uc = new UC_DANGKY();
            addUserControl(uc);
        }
    }
}
