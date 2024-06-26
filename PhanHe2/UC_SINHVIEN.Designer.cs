using System;

namespace PhanHe2
{
    partial class UC_SINHVIEN
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle12 = new System.Windows.Forms.DataGridViewCellStyle();
            this.guna2Panel1 = new Guna.UI2.WinForms.Guna2Panel();
            this.Gioitinh = new Guna.UI2.WinForms.Guna2ComboBox();
            this.gender = new System.Windows.Forms.Label();
            this.manganh = new Guna.UI2.WinForms.Guna2ComboBox();
            this.label7 = new System.Windows.Forms.Label();
            this.mact = new Guna.UI2.WinForms.Guna2ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.mssv = new Guna.UI2.WinForms.Guna2TextBox();
            this.PhoneNumbertxb = new Guna.UI2.WinForms.Guna2TextBox();
            this.DOB = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.addresstxb = new Guna.UI2.WinForms.Guna2TextBox();
            this.nametxtb = new Guna.UI2.WinForms.Guna2TextBox();
            this.delbtn = new Guna.UI2.WinForms.Guna2Button();
            this.addUser_btn = new Guna.UI2.WinForms.Guna2Button();
            this.DetailStaff = new Guna.UI2.WinForms.Guna2DataGridView();
            this.searchtxb = new Guna.UI2.WinForms.Guna2TextBox();
            this.guna2Button1 = new Guna.UI2.WinForms.Guna2Button();
            this.UC_Containers = new System.Windows.Forms.Panel();
            this.btn_Update = new Guna.UI2.WinForms.Guna2Button();
            this.guna2Panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DetailStaff)).BeginInit();
            this.UC_Containers.SuspendLayout();
            this.SuspendLayout();
            // 
            // guna2Panel1
            // 
            this.guna2Panel1.BackColor = System.Drawing.Color.White;
            this.guna2Panel1.BorderColor = System.Drawing.Color.Transparent;
            this.guna2Panel1.BorderRadius = 16;
            this.guna2Panel1.BorderStyle = System.Drawing.Drawing2D.DashStyle.Custom;
            this.guna2Panel1.BorderThickness = 7;
            this.guna2Panel1.Controls.Add(this.Gioitinh);
            this.guna2Panel1.Controls.Add(this.gender);
            this.guna2Panel1.Controls.Add(this.manganh);
            this.guna2Panel1.Controls.Add(this.label7);
            this.guna2Panel1.Controls.Add(this.mact);
            this.guna2Panel1.Controls.Add(this.label6);
            this.guna2Panel1.Controls.Add(this.label4);
            this.guna2Panel1.Controls.Add(this.label5);
            this.guna2Panel1.Controls.Add(this.label3);
            this.guna2Panel1.Controls.Add(this.mssv);
            this.guna2Panel1.Controls.Add(this.PhoneNumbertxb);
            this.guna2Panel1.Controls.Add(this.DOB);
            this.guna2Panel1.Controls.Add(this.label2);
            this.guna2Panel1.Controls.Add(this.label1);
            this.guna2Panel1.Controls.Add(this.addresstxb);
            this.guna2Panel1.Controls.Add(this.nametxtb);
            this.guna2Panel1.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.guna2Panel1.Location = new System.Drawing.Point(708, 46);
            this.guna2Panel1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.guna2Panel1.Name = "guna2Panel1";
            this.guna2Panel1.Size = new System.Drawing.Size(187, 479);
            this.guna2Panel1.TabIndex = 16;
            // 
            // Gioitinh
            // 
            this.Gioitinh.BackColor = System.Drawing.Color.Transparent;
            this.Gioitinh.BorderRadius = 12;
            this.Gioitinh.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.Gioitinh.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.Gioitinh.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.Gioitinh.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.Gioitinh.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.Gioitinh.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.Gioitinh.ItemHeight = 30;
            this.Gioitinh.Items.AddRange(new object[] {
            "Nam",
            "Nu"});
            this.Gioitinh.Location = new System.Drawing.Point(20, 178);
            this.Gioitinh.Name = "Gioitinh";
            this.Gioitinh.Size = new System.Drawing.Size(145, 36);
            this.Gioitinh.TabIndex = 24;
            // 
            // gender
            // 
            this.gender.AutoSize = true;
            this.gender.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.gender.Location = new System.Drawing.Point(26, 159);
            this.gender.Name = "gender";
            this.gender.Size = new System.Drawing.Size(54, 16);
            this.gender.TabIndex = 23;
            this.gender.Text = "Giới tính";
            // 
            // manganh
            // 
            this.manganh.BackColor = System.Drawing.Color.Transparent;
            this.manganh.BorderRadius = 12;
            this.manganh.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.manganh.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.manganh.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.manganh.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.manganh.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.manganh.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.manganh.ItemHeight = 30;
            this.manganh.Items.AddRange(new object[] {
            "KHMT",
            "CNPM",
            "HTTT",
            "CNTT",
            "TGMT",
            "MMT"});
            this.manganh.Location = new System.Drawing.Point(20, 418);
            this.manganh.Name = "manganh";
            this.manganh.Size = new System.Drawing.Size(145, 36);
            this.manganh.TabIndex = 21;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.label7.Location = new System.Drawing.Point(29, 399);
            this.label7.Name = "label7";
            this.label7.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.label7.Size = new System.Drawing.Size(76, 16);
            this.label7.TabIndex = 20;
            this.label7.Text = "MANGANH";
            // 
            // mact
            // 
            this.mact.BackColor = System.Drawing.Color.Transparent;
            this.mact.BorderRadius = 12;
            this.mact.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.mact.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.mact.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.mact.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.mact.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.mact.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.mact.ItemHeight = 30;
            this.mact.Items.AddRange(new object[] {
            "CLC",
            "VP",
            "CQ"});
            this.mact.Location = new System.Drawing.Point(20, 347);
            this.mact.Name = "mact";
            this.mact.Size = new System.Drawing.Size(145, 36);
            this.mact.TabIndex = 19;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.label6.Location = new System.Drawing.Point(29, 328);
            this.label6.Name = "label6";
            this.label6.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.label6.Size = new System.Drawing.Size(45, 16);
            this.label6.TabIndex = 18;
            this.label6.Text = "MACT";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.label4.Location = new System.Drawing.Point(26, 9);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(45, 16);
            this.label4.TabIndex = 17;
            this.label4.Text = "MASV";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.label5.Location = new System.Drawing.Point(26, 270);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(85, 16);
            this.label5.TabIndex = 15;
            this.label5.Text = "Số điện thoại";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.label3.Location = new System.Drawing.Point(26, 220);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(47, 16);
            this.label3.TabIndex = 13;
            this.label3.Text = "Địa chỉ";
            // 
            // mssv
            // 
            this.mssv.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.mssv.BorderRadius = 12;
            this.mssv.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.mssv.DefaultText = "";
            this.mssv.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.mssv.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.mssv.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.mssv.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.mssv.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.mssv.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.mssv.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.mssv.Location = new System.Drawing.Point(20, 29);
            this.mssv.Margin = new System.Windows.Forms.Padding(4);
            this.mssv.Name = "mssv";
            this.mssv.PasswordChar = '\0';
            this.mssv.PlaceholderText = "";
            this.mssv.SelectedText = "";
            this.mssv.Size = new System.Drawing.Size(145, 26);
            this.mssv.TabIndex = 16;
            // 
            // PhoneNumbertxb
            // 
            this.PhoneNumbertxb.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.PhoneNumbertxb.BorderRadius = 12;
            this.PhoneNumbertxb.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.PhoneNumbertxb.DefaultText = "";
            this.PhoneNumbertxb.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.PhoneNumbertxb.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.PhoneNumbertxb.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.PhoneNumbertxb.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.PhoneNumbertxb.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.PhoneNumbertxb.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.PhoneNumbertxb.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.PhoneNumbertxb.Location = new System.Drawing.Point(20, 290);
            this.PhoneNumbertxb.Margin = new System.Windows.Forms.Padding(4);
            this.PhoneNumbertxb.Name = "PhoneNumbertxb";
            this.PhoneNumbertxb.PasswordChar = '\0';
            this.PhoneNumbertxb.PlaceholderText = "";
            this.PhoneNumbertxb.SelectedText = "";
            this.PhoneNumbertxb.Size = new System.Drawing.Size(145, 26);
            this.PhoneNumbertxb.TabIndex = 14;
            // 
            // DOB
            // 
            this.DOB.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.DOB.BorderRadius = 12;
            this.DOB.Checked = true;
            this.DOB.FillColor = System.Drawing.Color.MediumPurple;
            this.DOB.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.DOB.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.DOB.Location = new System.Drawing.Point(20, 127);
            this.DOB.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.DOB.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.DOB.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.DOB.Name = "DOB";
            this.DOB.Size = new System.Drawing.Size(145, 25);
            this.DOB.TabIndex = 11;
            this.DOB.Value = new System.DateTime(2003, 4, 28, 0, 0, 0, 0);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.label2.Location = new System.Drawing.Point(28, 109);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(67, 16);
            this.label2.TabIndex = 9;
            this.label2.Text = "Ngày sinh";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.label1.Location = new System.Drawing.Point(28, 59);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(64, 16);
            this.label1.TabIndex = 8;
            this.label1.Text = "Họ và tên";
            // 
            // addresstxb
            // 
            this.addresstxb.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.addresstxb.BorderRadius = 12;
            this.addresstxb.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.addresstxb.DefaultText = "";
            this.addresstxb.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.addresstxb.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.addresstxb.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.addresstxb.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.addresstxb.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.addresstxb.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.addresstxb.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.addresstxb.Location = new System.Drawing.Point(20, 240);
            this.addresstxb.Margin = new System.Windows.Forms.Padding(4);
            this.addresstxb.Name = "addresstxb";
            this.addresstxb.PasswordChar = '\0';
            this.addresstxb.PlaceholderText = "";
            this.addresstxb.SelectedText = "";
            this.addresstxb.Size = new System.Drawing.Size(145, 26);
            this.addresstxb.TabIndex = 5;
            // 
            // nametxtb
            // 
            this.nametxtb.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.nametxtb.BorderRadius = 12;
            this.nametxtb.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.nametxtb.DefaultText = "";
            this.nametxtb.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.nametxtb.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.nametxtb.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.nametxtb.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.nametxtb.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.nametxtb.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.nametxtb.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.nametxtb.Location = new System.Drawing.Point(20, 79);
            this.nametxtb.Margin = new System.Windows.Forms.Padding(4);
            this.nametxtb.Name = "nametxtb";
            this.nametxtb.PasswordChar = '\0';
            this.nametxtb.PlaceholderText = "";
            this.nametxtb.SelectedText = "";
            this.nametxtb.Size = new System.Drawing.Size(145, 26);
            this.nametxtb.TabIndex = 4;
            // 
            // delbtn
            // 
            this.delbtn.BackColor = System.Drawing.Color.White;
            this.delbtn.BorderRadius = 12;
            this.delbtn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.delbtn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.delbtn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.delbtn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.delbtn.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.delbtn.Font = new System.Drawing.Font("Segoe UI Semibold", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.delbtn.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(128)))), ((int)(((byte)(255)))));
            this.delbtn.Location = new System.Drawing.Point(249, 434);
            this.delbtn.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.delbtn.Name = "delbtn";
            this.delbtn.Size = new System.Drawing.Size(145, 30);
            this.delbtn.TabIndex = 12;
            this.delbtn.Text = "DELETE";
            this.delbtn.Click += new System.EventHandler(this.delbtn_Click);
            // 
            // addUser_btn
            // 
            this.addUser_btn.BackColor = System.Drawing.Color.White;
            this.addUser_btn.BorderRadius = 12;
            this.addUser_btn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.addUser_btn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.addUser_btn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.addUser_btn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.addUser_btn.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.addUser_btn.FocusedColor = System.Drawing.Color.Black;
            this.addUser_btn.Font = new System.Drawing.Font("Segoe UI Semibold", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.addUser_btn.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(128)))), ((int)(((byte)(255)))));
            this.addUser_btn.Location = new System.Drawing.Point(12, 434);
            this.addUser_btn.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.addUser_btn.Name = "addUser_btn";
            this.addUser_btn.Size = new System.Drawing.Size(145, 30);
            this.addUser_btn.TabIndex = 0;
            this.addUser_btn.Text = "INSERT";
            this.addUser_btn.Click += new System.EventHandler(this.addUser_btn_Click);
            // 
            // DetailStaff
            // 
            dataGridViewCellStyle10.BackColor = System.Drawing.Color.White;
            this.DetailStaff.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle10;
            this.DetailStaff.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            dataGridViewCellStyle11.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle11.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle11.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            dataGridViewCellStyle11.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle11.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle11.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle11.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.DetailStaff.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle11;
            this.DetailStaff.ColumnHeadersHeight = 4;
            this.DetailStaff.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            dataGridViewCellStyle12.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle12.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle12.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            dataGridViewCellStyle12.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle12.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle12.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle12.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.DetailStaff.DefaultCellStyle = dataGridViewCellStyle12;
            this.DetailStaff.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.DetailStaff.Location = new System.Drawing.Point(0, 2);
            this.DetailStaff.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.DetailStaff.Name = "DetailStaff";
            this.DetailStaff.RowHeadersVisible = false;
            this.DetailStaff.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;
            this.DetailStaff.RowTemplate.Height = 28;
            this.DetailStaff.Size = new System.Drawing.Size(636, 381);
            this.DetailStaff.TabIndex = 19;
            this.DetailStaff.ThemeStyle.AlternatingRowsStyle.BackColor = System.Drawing.Color.White;
            this.DetailStaff.ThemeStyle.AlternatingRowsStyle.Font = null;
            this.DetailStaff.ThemeStyle.AlternatingRowsStyle.ForeColor = System.Drawing.Color.Empty;
            this.DetailStaff.ThemeStyle.AlternatingRowsStyle.SelectionBackColor = System.Drawing.Color.Empty;
            this.DetailStaff.ThemeStyle.AlternatingRowsStyle.SelectionForeColor = System.Drawing.Color.Empty;
            this.DetailStaff.ThemeStyle.BackColor = System.Drawing.Color.White;
            this.DetailStaff.ThemeStyle.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.DetailStaff.ThemeStyle.HeaderStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            this.DetailStaff.ThemeStyle.HeaderStyle.BorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.DetailStaff.ThemeStyle.HeaderStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.DetailStaff.ThemeStyle.HeaderStyle.ForeColor = System.Drawing.Color.White;
            this.DetailStaff.ThemeStyle.HeaderStyle.HeaightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            this.DetailStaff.ThemeStyle.HeaderStyle.Height = 4;
            this.DetailStaff.ThemeStyle.ReadOnly = false;
            this.DetailStaff.ThemeStyle.RowsStyle.BackColor = System.Drawing.Color.White;
            this.DetailStaff.ThemeStyle.RowsStyle.BorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SingleHorizontal;
            this.DetailStaff.ThemeStyle.RowsStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.DetailStaff.ThemeStyle.RowsStyle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.DetailStaff.ThemeStyle.RowsStyle.Height = 28;
            this.DetailStaff.ThemeStyle.RowsStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.DetailStaff.ThemeStyle.RowsStyle.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.DetailStaff.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.DetailStaff_CellClick);
            // 
            // searchtxb
            // 
            this.searchtxb.BorderRadius = 8;
            this.searchtxb.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.searchtxb.DefaultText = "";
            this.searchtxb.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.searchtxb.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.searchtxb.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.searchtxb.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.searchtxb.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.searchtxb.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.searchtxb.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.searchtxb.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.searchtxb.Location = new System.Drawing.Point(552, 4);
            this.searchtxb.Margin = new System.Windows.Forms.Padding(4);
            this.searchtxb.Name = "searchtxb";
            this.searchtxb.PasswordChar = '\0';
            this.searchtxb.PlaceholderText = "";
            this.searchtxb.SelectedText = "";
            this.searchtxb.Size = new System.Drawing.Size(179, 24);
            this.searchtxb.TabIndex = 18;
            // 
            // guna2Button1
            // 
            this.guna2Button1.BorderColor = System.Drawing.Color.Transparent;
            this.guna2Button1.BorderRadius = 12;
            this.guna2Button1.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.guna2Button1.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.guna2Button1.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.guna2Button1.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.guna2Button1.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.guna2Button1.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.guna2Button1.ForeColor = System.Drawing.Color.White;
            this.guna2Button1.Location = new System.Drawing.Point(738, 0);
            this.guna2Button1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.guna2Button1.Name = "guna2Button1";
            this.guna2Button1.Size = new System.Drawing.Size(95, 34);
            this.guna2Button1.TabIndex = 17;
            this.guna2Button1.Text = "Search";
            // 
            // UC_Containers
            // 
            this.UC_Containers.Controls.Add(this.btn_Update);
            this.UC_Containers.Controls.Add(this.DetailStaff);
            this.UC_Containers.Controls.Add(this.addUser_btn);
            this.UC_Containers.Controls.Add(this.delbtn);
            this.UC_Containers.Location = new System.Drawing.Point(23, 46);
            this.UC_Containers.Name = "UC_Containers";
            this.UC_Containers.Size = new System.Drawing.Size(639, 479);
            this.UC_Containers.TabIndex = 20;
            // 
            // btn_Update
            // 
            this.btn_Update.BackColor = System.Drawing.Color.White;
            this.btn_Update.BorderRadius = 12;
            this.btn_Update.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btn_Update.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btn_Update.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btn_Update.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btn_Update.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.btn_Update.Font = new System.Drawing.Font("Segoe UI Semibold", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.btn_Update.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(128)))), ((int)(((byte)(255)))));
            this.btn_Update.Location = new System.Drawing.Point(472, 434);
            this.btn_Update.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btn_Update.Name = "btn_Update";
            this.btn_Update.Size = new System.Drawing.Size(145, 30);
            this.btn_Update.TabIndex = 20;
            this.btn_Update.Text = "UPDATE";
            this.btn_Update.Click += new System.EventHandler(this.btn_Update_Click);
            // 
            // UC_SINHVIEN
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.guna2Panel1);
            this.Controls.Add(this.searchtxb);
            this.Controls.Add(this.guna2Button1);
            this.Controls.Add(this.UC_Containers);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "UC_SINHVIEN";
            this.Size = new System.Drawing.Size(943, 550);
            this.Load += new System.EventHandler(this.UC_SINHVIEN_Load);
            this.guna2Panel1.ResumeLayout(false);
            this.guna2Panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DetailStaff)).EndInit();
            this.UC_Containers.ResumeLayout(false);
            this.ResumeLayout(false);

        }



        #endregion

        private Guna.UI2.WinForms.Guna2Panel guna2Panel1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label3;
        private Guna.UI2.WinForms.Guna2Button delbtn;
        public Guna.UI2.WinForms.Guna2TextBox PhoneNumbertxb;
        private Guna.UI2.WinForms.Guna2DateTimePicker DOB;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        public Guna.UI2.WinForms.Guna2TextBox addresstxb;
        public Guna.UI2.WinForms.Guna2TextBox nametxtb;
        private Guna.UI2.WinForms.Guna2Button addUser_btn;
        public Guna.UI2.WinForms.Guna2DataGridView DetailStaff;
        private Guna.UI2.WinForms.Guna2TextBox searchtxb;
        private Guna.UI2.WinForms.Guna2Button guna2Button1;
        public System.Windows.Forms.Panel UC_Containers;
        private System.Windows.Forms.Label label4;
        public Guna.UI2.WinForms.Guna2TextBox mssv;
        private Guna.UI2.WinForms.Guna2Button btn_Update;
        private Guna.UI2.WinForms.Guna2ComboBox manganh;
        private System.Windows.Forms.Label label7;
        private Guna.UI2.WinForms.Guna2ComboBox mact;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label gender;
        private Guna.UI2.WinForms.Guna2ComboBox Gioitinh;
    }
}
