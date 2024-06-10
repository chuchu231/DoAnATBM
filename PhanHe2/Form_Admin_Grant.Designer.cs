namespace PhanHe2
{
    partial class Form_Admin_Grant
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
            this.check_grantopt = new Guna.UI2.WinForms.Guna2CheckBox();
            this.revoke = new Guna.UI2.WinForms.Guna2Button();
            this.grant_btn = new Guna.UI2.WinForms.Guna2Button();
            this.att_list = new System.Windows.Forms.CheckedListBox();
            this.privileges = new Guna.UI2.WinForms.Guna2ComboBox();
            this.table = new Guna.UI2.WinForms.Guna2ComboBox();
            this.guna2HtmlLabel5 = new Guna.UI2.WinForms.Guna2HtmlLabel();
            this.guna2HtmlLabel4 = new Guna.UI2.WinForms.Guna2HtmlLabel();
            this.guna2HtmlLabel3 = new Guna.UI2.WinForms.Guna2HtmlLabel();
            this.guna2HtmlLabel2 = new Guna.UI2.WinForms.Guna2HtmlLabel();
            this.username_role = new Guna.UI2.WinForms.Guna2TextBox();
            this.SuspendLayout();
            // 
            // check_grantopt
            // 
            this.check_grantopt.AutoSize = true;
            this.check_grantopt.CheckedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.check_grantopt.CheckedState.BorderRadius = 0;
            this.check_grantopt.CheckedState.BorderThickness = 0;
            this.check_grantopt.CheckedState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.check_grantopt.Font = new System.Drawing.Font("Yu Gothic UI", 7F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.check_grantopt.Location = new System.Drawing.Point(371, 65);
            this.check_grantopt.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.check_grantopt.Name = "check_grantopt";
            this.check_grantopt.Size = new System.Drawing.Size(145, 19);
            this.check_grantopt.TabIndex = 39;
            this.check_grantopt.Text = "WITH GRANT OPTION";
            this.check_grantopt.UncheckedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(125)))), ((int)(((byte)(137)))), ((int)(((byte)(149)))));
            this.check_grantopt.UncheckedState.BorderRadius = 0;
            this.check_grantopt.UncheckedState.BorderThickness = 0;
            this.check_grantopt.UncheckedState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(125)))), ((int)(((byte)(137)))), ((int)(((byte)(149)))));
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
            this.revoke.Location = new System.Drawing.Point(157, 177);
            this.revoke.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.revoke.Name = "revoke";
            this.revoke.Size = new System.Drawing.Size(123, 38);
            this.revoke.TabIndex = 38;
            this.revoke.Text = "Revoke";
            this.revoke.Click += new System.EventHandler(this.revoke_Click);
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
            this.grant_btn.Location = new System.Drawing.Point(18, 178);
            this.grant_btn.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.grant_btn.Name = "grant_btn";
            this.grant_btn.Size = new System.Drawing.Size(123, 36);
            this.grant_btn.TabIndex = 37;
            this.grant_btn.Text = "Grant";
            this.grant_btn.Click += new System.EventHandler(this.grant_btn_Click);
            // 
            // att_list
            // 
            this.att_list.BackColor = System.Drawing.Color.White;
            this.att_list.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.att_list.FormattingEnabled = true;
            this.att_list.Location = new System.Drawing.Point(387, 101);
            this.att_list.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.att_list.Name = "att_list";
            this.att_list.Size = new System.Drawing.Size(124, 87);
            this.att_list.TabIndex = 36;
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
            this.privileges.Items.AddRange(new object[] {
            "SELECT",
            "INSERT",
            "UPDATE",
            "DELETE"});
            this.privileges.Location = new System.Drawing.Point(120, 101);
            this.privileges.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.privileges.Name = "privileges";
            this.privileges.Size = new System.Drawing.Size(160, 36);
            this.privileges.TabIndex = 34;
            this.privileges.SelectedValueChanged += new System.EventHandler(this.privileges_SelectedValueChanged);
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
            this.table.Location = new System.Drawing.Point(374, 11);
            this.table.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.table.Name = "table";
            this.table.Size = new System.Drawing.Size(142, 36);
            this.table.TabIndex = 33;
            this.table.SelectedValueChanged += new System.EventHandler(this.table_SelectedValueChanged);
            // 
            // guna2HtmlLabel5
            // 
            this.guna2HtmlLabel5.BackColor = System.Drawing.Color.Transparent;
            this.guna2HtmlLabel5.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold);
            this.guna2HtmlLabel5.Location = new System.Drawing.Point(299, 101);
            this.guna2HtmlLabel5.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.guna2HtmlLabel5.Name = "guna2HtmlLabel5";
            this.guna2HtmlLabel5.Size = new System.Drawing.Size(82, 20);
            this.guna2HtmlLabel5.TabIndex = 32;
            this.guna2HtmlLabel5.Text = "Thuộc tính";
            // 
            // guna2HtmlLabel4
            // 
            this.guna2HtmlLabel4.BackColor = System.Drawing.Color.Transparent;
            this.guna2HtmlLabel4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold);
            this.guna2HtmlLabel4.Location = new System.Drawing.Point(325, 16);
            this.guna2HtmlLabel4.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.guna2HtmlLabel4.Name = "guna2HtmlLabel4";
            this.guna2HtmlLabel4.Size = new System.Drawing.Size(41, 20);
            this.guna2HtmlLabel4.TabIndex = 31;
            this.guna2HtmlLabel4.Text = "Bảng";
            // 
            // guna2HtmlLabel3
            // 
            this.guna2HtmlLabel3.BackColor = System.Drawing.Color.Transparent;
            this.guna2HtmlLabel3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.guna2HtmlLabel3.Location = new System.Drawing.Point(11, 101);
            this.guna2HtmlLabel3.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.guna2HtmlLabel3.Name = "guna2HtmlLabel3";
            this.guna2HtmlLabel3.Size = new System.Drawing.Size(51, 20);
            this.guna2HtmlLabel3.TabIndex = 30;
            this.guna2HtmlLabel3.Text = "Quyền";
            // 
            // guna2HtmlLabel2
            // 
            this.guna2HtmlLabel2.BackColor = System.Drawing.Color.Transparent;
            this.guna2HtmlLabel2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.guna2HtmlLabel2.Location = new System.Drawing.Point(11, 16);
            this.guna2HtmlLabel2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.guna2HtmlLabel2.Name = "guna2HtmlLabel2";
            this.guna2HtmlLabel2.Size = new System.Drawing.Size(120, 20);
            this.guna2HtmlLabel2.TabIndex = 29;
            this.guna2HtmlLabel2.Text = "Username/Role";
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
            this.username_role.Location = new System.Drawing.Point(138, 16);
            this.username_role.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.username_role.Name = "username_role";
            this.username_role.PasswordChar = '\0';
            this.username_role.PlaceholderText = "";
            this.username_role.SelectedText = "";
            this.username_role.Size = new System.Drawing.Size(168, 24);
            this.username_role.TabIndex = 40;
            // 
            // Form_Admin_Grant
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(534, 230);
            this.Controls.Add(this.username_role);
            this.Controls.Add(this.check_grantopt);
            this.Controls.Add(this.revoke);
            this.Controls.Add(this.grant_btn);
            this.Controls.Add(this.att_list);
            this.Controls.Add(this.privileges);
            this.Controls.Add(this.table);
            this.Controls.Add(this.guna2HtmlLabel5);
            this.Controls.Add(this.guna2HtmlLabel4);
            this.Controls.Add(this.guna2HtmlLabel3);
            this.Controls.Add(this.guna2HtmlLabel2);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "Form_Admin_Grant";
            this.Text = "Grant and revoke user/role";
            this.Load += new System.EventHandler(this.Form_Admin_Grant_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Guna.UI2.WinForms.Guna2CheckBox check_grantopt;
        private Guna.UI2.WinForms.Guna2Button revoke;
        private Guna.UI2.WinForms.Guna2Button grant_btn;
        private System.Windows.Forms.CheckedListBox att_list;
        private Guna.UI2.WinForms.Guna2ComboBox privileges;
        private Guna.UI2.WinForms.Guna2ComboBox table;
        private Guna.UI2.WinForms.Guna2HtmlLabel guna2HtmlLabel5;
        private Guna.UI2.WinForms.Guna2HtmlLabel guna2HtmlLabel4;
        private Guna.UI2.WinForms.Guna2HtmlLabel guna2HtmlLabel3;
        private Guna.UI2.WinForms.Guna2HtmlLabel guna2HtmlLabel2;
        private Guna.UI2.WinForms.Guna2TextBox username_role;
    }
}