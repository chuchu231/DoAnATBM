namespace PhanHe1
{
    partial class Form_Grant_Revoke_Role
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
            this.revoke = new Guna.UI2.WinForms.Guna2Button();
            this.grant_btn = new Guna.UI2.WinForms.Guna2Button();
            this.role = new Guna.UI2.WinForms.Guna2TextBox();
            this.username = new Guna.UI2.WinForms.Guna2TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
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
            this.revoke.Location = new System.Drawing.Point(284, 178);
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
            this.grant_btn.Location = new System.Drawing.Point(144, 179);
            this.grant_btn.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.grant_btn.Name = "grant_btn";
            this.grant_btn.Size = new System.Drawing.Size(123, 36);
            this.grant_btn.TabIndex = 37;
            this.grant_btn.Text = "Grant";
            this.grant_btn.Click += new System.EventHandler(this.grant_btn_Click);
            // 
            // role
            // 
            this.role.BorderRadius = 12;
            this.role.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.role.DefaultText = "";
            this.role.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.role.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.role.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.role.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.role.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.role.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.role.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.role.Location = new System.Drawing.Point(201, 109);
            this.role.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.role.Name = "role";
            this.role.PasswordChar = '\0';
            this.role.PlaceholderText = "";
            this.role.SelectedText = "";
            this.role.Size = new System.Drawing.Size(260, 39);
            this.role.TabIndex = 39;
            // 
            // username
            // 
            this.username.BorderRadius = 12;
            this.username.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.username.DefaultText = "";
            this.username.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.username.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.username.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.username.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.username.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.username.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.username.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.username.Location = new System.Drawing.Point(201, 36);
            this.username.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.username.Name = "username";
            this.username.PasswordChar = '\0';
            this.username.PlaceholderText = "";
            this.username.SelectedText = "";
            this.username.Size = new System.Drawing.Size(260, 36);
            this.username.TabIndex = 35;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.Location = new System.Drawing.Point(92, 36);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 24);
            this.label1.TabIndex = 40;
            this.label1.Text = "User";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label2.Location = new System.Drawing.Point(92, 109);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 24);
            this.label2.TabIndex = 41;
            this.label2.Text = "Role";
            // 
            // Form_Grant_Revoke_Role
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(524, 232);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.role);
            this.Controls.Add(this.revoke);
            this.Controls.Add(this.grant_btn);
            this.Controls.Add(this.username);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "Form_Grant_Revoke_Role";
            this.Text = "Grant and Revoke Role for User";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Guna.UI2.WinForms.Guna2Button revoke;
        private Guna.UI2.WinForms.Guna2Button grant_btn;
        private Guna.UI2.WinForms.Guna2TextBox role;
        private Guna.UI2.WinForms.Guna2TextBox username;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
    }
}