namespace PhanHe2
{
    partial class UC_TK_CHOICE_DK
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
            this.own = new Guna.UI2.WinForms.Guna2Button();
            this.dk = new Guna.UI2.WinForms.Guna2Button();
            this.SuspendLayout();
            // 
            // own
            // 
            this.own.BorderRadius = 14;
            this.own.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.own.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.own.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.own.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.own.FillColor = System.Drawing.Color.MediumPurple;
            this.own.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.own.ForeColor = System.Drawing.Color.White;
            this.own.Location = new System.Drawing.Point(508, 239);
            this.own.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.own.Name = "own";
            this.own.Size = new System.Drawing.Size(205, 72);
            this.own.TabIndex = 3;
            this.own.Text = "Quản lý học phần giảng dạy";
            this.own.Click += new System.EventHandler(this.own_Click);
            // 
            // dk
            // 
            this.dk.BorderRadius = 14;
            this.dk.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.dk.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.dk.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.dk.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.dk.FillColor = System.Drawing.Color.MediumPurple;
            this.dk.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dk.ForeColor = System.Drawing.Color.White;
            this.dk.Location = new System.Drawing.Point(230, 239);
            this.dk.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dk.Name = "dk";
            this.dk.Size = new System.Drawing.Size(205, 72);
            this.dk.TabIndex = 2;
            this.dk.Text = "Quản lý đăng ký";
            this.dk.Click += new System.EventHandler(this.dk_Click);
            // 
            // UC_TK_CHOICE_DK
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.own);
            this.Controls.Add(this.dk);
            this.Name = "UC_TK_CHOICE_DK";
            this.Size = new System.Drawing.Size(943, 550);
            this.ResumeLayout(false);

        }

        #endregion

        private Guna.UI2.WinForms.Guna2Button own;
        private Guna.UI2.WinForms.Guna2Button dk;
    }
}
