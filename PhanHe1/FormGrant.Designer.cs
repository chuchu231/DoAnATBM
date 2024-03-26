namespace PhanHe1
{
    partial class FormGrant
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.guna2HtmlLabel2 = new Guna.UI2.WinForms.Guna2HtmlLabel();
            this.guna2HtmlLabel3 = new Guna.UI2.WinForms.Guna2HtmlLabel();
            this.guna2HtmlLabel4 = new Guna.UI2.WinForms.Guna2HtmlLabel();
            this.guna2HtmlLabel5 = new Guna.UI2.WinForms.Guna2HtmlLabel();
            this.table = new Guna.UI2.WinForms.Guna2ComboBox();
            this.username_role = new Guna.UI2.WinForms.Guna2TextBox();
            this.privileges = new Guna.UI2.WinForms.Guna2ComboBox();
            this.att_list = new System.Windows.Forms.CheckedListBox();
            this.grant_btn = new Guna.UI2.WinForms.Guna2Button();
            this.revoke = new Guna.UI2.WinForms.Guna2Button();
            this.check_grantopt = new Guna.UI2.WinForms.Guna2CheckBox();
            this.SuspendLayout();
            // 
            // guna2HtmlLabel2
            // 
            this.guna2HtmlLabel2.BackColor = System.Drawing.Color.Transparent;
            this.guna2HtmlLabel2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.guna2HtmlLabel2.Location = new System.Drawing.Point(14, 24);
            this.guna2HtmlLabel2.Name = "guna2HtmlLabel2";
            this.guna2HtmlLabel2.Size = new System.Drawing.Size(140, 24);
            this.guna2HtmlLabel2.TabIndex = 18;
            this.guna2HtmlLabel2.Text = "Username/Role";
            // 
            // guna2HtmlLabel3
            // 
            this.guna2HtmlLabel3.BackColor = System.Drawing.Color.Transparent;
            this.guna2HtmlLabel3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.guna2HtmlLabel3.Location = new System.Drawing.Point(14, 130);
            this.guna2HtmlLabel3.Name = "guna2HtmlLabel3";
            this.guna2HtmlLabel3.Size = new System.Drawing.Size(61, 24);
            this.guna2HtmlLabel3.TabIndex = 19;
            this.guna2HtmlLabel3.Text = "Quyền";
            // 
            // guna2HtmlLabel4
            // 
            this.guna2HtmlLabel4.BackColor = System.Drawing.Color.Transparent;
            this.guna2HtmlLabel4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold);
            this.guna2HtmlLabel4.Location = new System.Drawing.Point(338, 24);
            this.guna2HtmlLabel4.Name = "guna2HtmlLabel4";
            this.guna2HtmlLabel4.Size = new System.Drawing.Size(49, 24);
            this.guna2HtmlLabel4.TabIndex = 20;
            this.guna2HtmlLabel4.Text = "Bảng";
            // 
            // guna2HtmlLabel5
            // 
            this.guna2HtmlLabel5.BackColor = System.Drawing.Color.Transparent;
            this.guna2HtmlLabel5.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold);
            this.guna2HtmlLabel5.Location = new System.Drawing.Point(338, 130);
            this.guna2HtmlLabel5.Name = "guna2HtmlLabel5";
            this.guna2HtmlLabel5.Size = new System.Drawing.Size(98, 24);
            this.guna2HtmlLabel5.TabIndex = 21;
            this.guna2HtmlLabel5.Text = "Thuộc tính";
            // 
            // table
            // 
            this.table.BackColor = System.Drawing.Color.Transparent;
            this.table.BorderRadius = 12;
            this.table.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.table.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.table.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.table.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.table.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.table.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.table.ItemHeight = 30;
            this.table.Location = new System.Drawing.Point(408, 24);
            this.table.Name = "table";
            this.table.Size = new System.Drawing.Size(159, 36);
            this.table.TabIndex = 22;
            // 
            // username_role
            // 
            this.username_role.BorderRadius = 12;
            this.username_role.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.username_role.DefaultText = "";
            this.username_role.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.username_role.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.username_role.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.username_role.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.username_role.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.username_role.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.username_role.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.username_role.Location = new System.Drawing.Point(137, 24);
            this.username_role.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.username_role.Name = "username_role";
            this.username_role.PasswordChar = '\0';
            this.username_role.PlaceholderText = "";
            this.username_role.SelectedText = "";
            this.username_role.Size = new System.Drawing.Size(180, 24);
            this.username_role.TabIndex = 23;
            this.username_role.TextChanged += new System.EventHandler(this.guna2TextBox1_TextChanged);
            // 
            // privileges
            // 
            this.privileges.BackColor = System.Drawing.Color.Transparent;
            this.privileges.BorderRadius = 12;
            this.privileges.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.privileges.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.privileges.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.privileges.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.privileges.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.privileges.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.privileges.ItemHeight = 30;
            this.privileges.Location = new System.Drawing.Point(137, 130);
            this.privileges.Name = "privileges";
            this.privileges.Size = new System.Drawing.Size(180, 36);
            this.privileges.TabIndex = 23;
            // 
            // att_list
            // 
            this.att_list.BackColor = System.Drawing.Color.White;
            this.att_list.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.att_list.FormattingEnabled = true;
            this.att_list.Location = new System.Drawing.Point(419, 130);
            this.att_list.Name = "att_list";
            this.att_list.Size = new System.Drawing.Size(139, 140);
            this.att_list.TabIndex = 25;
            // 
            // grant_btn
            // 
            this.grant_btn.BorderRadius = 12;
            this.grant_btn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.grant_btn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.grant_btn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.grant_btn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.grant_btn.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.grant_btn.Font = new System.Drawing.Font("Yu Gothic UI Semibold", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grant_btn.ForeColor = System.Drawing.Color.White;
            this.grant_btn.Location = new System.Drawing.Point(22, 227);
            this.grant_btn.Name = "grant_btn";
            this.grant_btn.Size = new System.Drawing.Size(138, 45);
            this.grant_btn.TabIndex = 26;
            this.grant_btn.Text = "Grant";
            // 
            // revoke
            // 
            this.revoke.BorderRadius = 12;
            this.revoke.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.revoke.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.revoke.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.revoke.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.revoke.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(128)))));
            this.revoke.Font = new System.Drawing.Font("Yu Gothic UI Semibold", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.revoke.ForeColor = System.Drawing.Color.White;
            this.revoke.Location = new System.Drawing.Point(179, 225);
            this.revoke.Name = "revoke";
            this.revoke.Size = new System.Drawing.Size(138, 47);
            this.revoke.TabIndex = 27;
            this.revoke.Text = "Revoke";
            // 
            // check_grantopt
            // 
            this.check_grantopt.AutoSize = true;
            this.check_grantopt.CheckedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.check_grantopt.CheckedState.BorderRadius = 0;
            this.check_grantopt.CheckedState.BorderThickness = 0;
            this.check_grantopt.CheckedState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.check_grantopt.Font = new System.Drawing.Font("Yu Gothic UI", 7F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.check_grantopt.Location = new System.Drawing.Point(419, 79);
            this.check_grantopt.Name = "check_grantopt";
            this.check_grantopt.Size = new System.Drawing.Size(172, 23);
            this.check_grantopt.TabIndex = 28;
            this.check_grantopt.Text = "WITH GRANT OPTION";
            this.check_grantopt.UncheckedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(125)))), ((int)(((byte)(137)))), ((int)(((byte)(149)))));
            this.check_grantopt.UncheckedState.BorderRadius = 0;
            this.check_grantopt.UncheckedState.BorderThickness = 0;
            this.check_grantopt.UncheckedState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(125)))), ((int)(((byte)(137)))), ((int)(((byte)(149)))));
            // 
            // FormGrant
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Inherit;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(601, 288);
            this.Controls.Add(this.check_grantopt);
            this.Controls.Add(this.revoke);
            this.Controls.Add(this.grant_btn);
            this.Controls.Add(this.att_list);
            this.Controls.Add(this.privileges);
            this.Controls.Add(this.username_role);
            this.Controls.Add(this.table);
            this.Controls.Add(this.guna2HtmlLabel5);
            this.Controls.Add(this.guna2HtmlLabel4);
            this.Controls.Add(this.guna2HtmlLabel3);
            this.Controls.Add(this.guna2HtmlLabel2);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Name = "FormGrant";
            this.Text = "Grant and revoke user/role";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private Guna.UI2.WinForms.Guna2HtmlLabel guna2HtmlLabel2;
        private Guna.UI2.WinForms.Guna2HtmlLabel guna2HtmlLabel3;
        private Guna.UI2.WinForms.Guna2HtmlLabel guna2HtmlLabel4;
        private Guna.UI2.WinForms.Guna2HtmlLabel guna2HtmlLabel5;
        private Guna.UI2.WinForms.Guna2ComboBox table;
        private Guna.UI2.WinForms.Guna2TextBox username_role;
        private Guna.UI2.WinForms.Guna2ComboBox privileges;
        private System.Windows.Forms.CheckedListBox att_list;
        private Guna.UI2.WinForms.Guna2Button grant_btn;
        private Guna.UI2.WinForms.Guna2Button revoke;
        private Guna.UI2.WinForms.Guna2CheckBox check_grantopt;
    }
}