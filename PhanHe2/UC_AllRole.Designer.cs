namespace PhanHe1
{
    partial class UC_AllRole
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            this.allrole = new Guna.UI2.WinForms.Guna2DataGridView();
            this.guna2Button1 = new Guna.UI2.WinForms.Guna2Button();
            this.searchtxb = new Guna.UI2.WinForms.Guna2TextBox();
            this.UC_Containers = new System.Windows.Forms.Panel();
            this.oracleDataAdapter1 = new Oracle.ManagedDataAccess.Client.OracleDataAdapter();
            this.guna2Panel1 = new Guna.UI2.WinForms.Guna2Panel();
            this.btn_Update = new Guna.UI2.WinForms.Guna2Button();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.pwtxtb = new Guna.UI2.WinForms.Guna2TextBox();
            this.usernametxtb = new Guna.UI2.WinForms.Guna2TextBox();
            this.addUser_btn = new Guna.UI2.WinForms.Guna2Button();
            ((System.ComponentModel.ISupportInitialize)(this.allrole)).BeginInit();
            this.UC_Containers.SuspendLayout();
            this.guna2Panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // allrole
            // 
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.White;
            this.allrole.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.allrole.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.allrole.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.allrole.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.allrole.DefaultCellStyle = dataGridViewCellStyle3;
            this.allrole.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.allrole.Location = new System.Drawing.Point(0, -2);
            this.allrole.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.allrole.Name = "allrole";
            this.allrole.RowHeadersVisible = false;
            this.allrole.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;
            this.allrole.RowTemplate.Height = 28;
            this.allrole.Size = new System.Drawing.Size(581, 324);
            this.allrole.TabIndex = 3;
            this.allrole.ThemeStyle.AlternatingRowsStyle.BackColor = System.Drawing.Color.White;
            this.allrole.ThemeStyle.AlternatingRowsStyle.Font = null;
            this.allrole.ThemeStyle.AlternatingRowsStyle.ForeColor = System.Drawing.Color.Empty;
            this.allrole.ThemeStyle.AlternatingRowsStyle.SelectionBackColor = System.Drawing.Color.Empty;
            this.allrole.ThemeStyle.AlternatingRowsStyle.SelectionForeColor = System.Drawing.Color.Empty;
            this.allrole.ThemeStyle.BackColor = System.Drawing.Color.White;
            this.allrole.ThemeStyle.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.allrole.ThemeStyle.HeaderStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            this.allrole.ThemeStyle.HeaderStyle.BorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.allrole.ThemeStyle.HeaderStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.allrole.ThemeStyle.HeaderStyle.ForeColor = System.Drawing.Color.White;
            this.allrole.ThemeStyle.HeaderStyle.HeaightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.allrole.ThemeStyle.HeaderStyle.Height = 4;
            this.allrole.ThemeStyle.ReadOnly = false;
            this.allrole.ThemeStyle.RowsStyle.BackColor = System.Drawing.Color.White;
            this.allrole.ThemeStyle.RowsStyle.BorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SingleHorizontal;
            this.allrole.ThemeStyle.RowsStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.allrole.ThemeStyle.RowsStyle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.allrole.ThemeStyle.RowsStyle.Height = 28;
            this.allrole.ThemeStyle.RowsStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.allrole.ThemeStyle.RowsStyle.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.allrole.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.allrole_CellContentClick);
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
            this.guna2Button1.Location = new System.Drawing.Point(692, 19);
            this.guna2Button1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.guna2Button1.Name = "guna2Button1";
            this.guna2Button1.Size = new System.Drawing.Size(94, 34);
            this.guna2Button1.TabIndex = 5;
            this.guna2Button1.Text = "Search";
            this.guna2Button1.Click += new System.EventHandler(this.guna2Button1_Click);
            // 
            // searchtxb
            // 
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
            this.searchtxb.Location = new System.Drawing.Point(495, 30);
            this.searchtxb.Margin = new System.Windows.Forms.Padding(4);
            this.searchtxb.Name = "searchtxb";
            this.searchtxb.PasswordChar = '\0';
            this.searchtxb.PlaceholderText = "";
            this.searchtxb.SelectedText = "";
            this.searchtxb.Size = new System.Drawing.Size(179, 24);
            this.searchtxb.TabIndex = 6;
            // 
            // UC_Containers
            // 
            this.UC_Containers.Controls.Add(this.allrole);
            this.UC_Containers.Location = new System.Drawing.Point(24, 67);
            this.UC_Containers.Name = "UC_Containers";
            this.UC_Containers.Size = new System.Drawing.Size(581, 324);
            this.UC_Containers.TabIndex = 7;
            // 
            // oracleDataAdapter1
            // 
            this.oracleDataAdapter1.RowUpdated += new Oracle.ManagedDataAccess.Client.OracleRowUpdatedEventHandler(this.oracleDataAdapter1_RowUpdated);
            // 
            // guna2Panel1
            // 
            this.guna2Panel1.BackColor = System.Drawing.Color.White;
            this.guna2Panel1.BorderColor = System.Drawing.Color.Transparent;
            this.guna2Panel1.BorderRadius = 16;
            this.guna2Panel1.BorderStyle = System.Drawing.Drawing2D.DashStyle.Custom;
            this.guna2Panel1.BorderThickness = 7;
            this.guna2Panel1.Controls.Add(this.btn_Update);
            this.guna2Panel1.Controls.Add(this.label2);
            this.guna2Panel1.Controls.Add(this.label1);
            this.guna2Panel1.Controls.Add(this.pwtxtb);
            this.guna2Panel1.Controls.Add(this.usernametxtb);
            this.guna2Panel1.Controls.Add(this.addUser_btn);
            this.guna2Panel1.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.guna2Panel1.Location = new System.Drawing.Point(623, 65);
            this.guna2Panel1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.guna2Panel1.Name = "guna2Panel1";
            this.guna2Panel1.Size = new System.Drawing.Size(187, 324);
            this.guna2Panel1.TabIndex = 8;
            // 
            // btn_Update
            // 
            this.btn_Update.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.btn_Update.BorderRadius = 12;
            this.btn_Update.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btn_Update.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btn_Update.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btn_Update.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btn_Update.FillColor = System.Drawing.Color.White;
            this.btn_Update.Font = new System.Drawing.Font("Segoe UI Semibold", 10F, System.Drawing.FontStyle.Bold);
            this.btn_Update.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(128)))), ((int)(((byte)(255)))));
            this.btn_Update.Location = new System.Drawing.Point(20, 264);
            this.btn_Update.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btn_Update.Name = "btn_Update";
            this.btn_Update.Size = new System.Drawing.Size(145, 30);
            this.btn_Update.TabIndex = 10;
            this.btn_Update.Text = "UPDATE";
            this.btn_Update.Click += new System.EventHandler(this.btn_Update_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.label2.Location = new System.Drawing.Point(27, 112);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(67, 16);
            this.label2.TabIndex = 9;
            this.label2.Text = "Password";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.label1.Location = new System.Drawing.Point(27, 41);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(70, 16);
            this.label1.TabIndex = 8;
            this.label1.Text = "Rolename";
            // 
            // pwtxtb
            // 
            this.pwtxtb.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.pwtxtb.BorderRadius = 12;
            this.pwtxtb.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.pwtxtb.DefaultText = "";
            this.pwtxtb.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.pwtxtb.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.pwtxtb.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.pwtxtb.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.pwtxtb.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.pwtxtb.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.pwtxtb.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.pwtxtb.Location = new System.Drawing.Point(20, 132);
            this.pwtxtb.Margin = new System.Windows.Forms.Padding(4);
            this.pwtxtb.Name = "pwtxtb";
            this.pwtxtb.PasswordChar = '\0';
            this.pwtxtb.PlaceholderText = "";
            this.pwtxtb.SelectedText = "";
            this.pwtxtb.Size = new System.Drawing.Size(145, 26);
            this.pwtxtb.TabIndex = 5;
            // 
            // usernametxtb
            // 
            this.usernametxtb.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.usernametxtb.BorderRadius = 12;
            this.usernametxtb.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.usernametxtb.DefaultText = "";
            this.usernametxtb.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.usernametxtb.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.usernametxtb.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.usernametxtb.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.usernametxtb.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.usernametxtb.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.usernametxtb.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.usernametxtb.Location = new System.Drawing.Point(20, 61);
            this.usernametxtb.Margin = new System.Windows.Forms.Padding(4);
            this.usernametxtb.Name = "usernametxtb";
            this.usernametxtb.PasswordChar = '\0';
            this.usernametxtb.PlaceholderText = "";
            this.usernametxtb.SelectedText = "";
            this.usernametxtb.Size = new System.Drawing.Size(145, 26);
            this.usernametxtb.TabIndex = 4;
            // 
            // addUser_btn
            // 
            this.addUser_btn.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.addUser_btn.BorderRadius = 12;
            this.addUser_btn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.addUser_btn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.addUser_btn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.addUser_btn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.addUser_btn.FillColor = System.Drawing.Color.White;
            this.addUser_btn.Font = new System.Drawing.Font("Segoe UI Semibold", 10F, System.Drawing.FontStyle.Bold);
            this.addUser_btn.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(128)))), ((int)(((byte)(255)))));
            this.addUser_btn.Location = new System.Drawing.Point(20, 206);
            this.addUser_btn.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.addUser_btn.Name = "addUser_btn";
            this.addUser_btn.Size = new System.Drawing.Size(145, 30);
            this.addUser_btn.TabIndex = 0;
            this.addUser_btn.Text = "ADD";
            this.addUser_btn.Click += new System.EventHandler(this.addUser_btn_Click);
            // 
            // UC_AllRole
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.guna2Panel1);
            this.Controls.Add(this.searchtxb);
            this.Controls.Add(this.guna2Button1);
            this.Controls.Add(this.UC_Containers);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "UC_AllRole";
            this.Size = new System.Drawing.Size(822, 416);
            this.Load += new System.EventHandler(this.UC_AllRole_Load);
            ((System.ComponentModel.ISupportInitialize)(this.allrole)).EndInit();
            this.UC_Containers.ResumeLayout(false);
            this.guna2Panel1.ResumeLayout(false);
            this.guna2Panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        private Guna.UI2.WinForms.Guna2DataGridView allrole;
        private Guna.UI2.WinForms.Guna2Button guna2Button1;
        private Guna.UI2.WinForms.Guna2TextBox searchtxb;
        private System.Windows.Forms.Panel UC_Containers;
        private Oracle.ManagedDataAccess.Client.OracleDataAdapter oracleDataAdapter1;
        private Guna.UI2.WinForms.Guna2Panel guna2Panel1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private Guna.UI2.WinForms.Guna2TextBox pwtxtb;
        private Guna.UI2.WinForms.Guna2TextBox usernametxtb;
        private Guna.UI2.WinForms.Guna2Button addUser_btn;
        private Guna.UI2.WinForms.Guna2Button btn_Update;
    }
}
