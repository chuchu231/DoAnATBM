namespace PhanHe2
{
    partial class UC_TBM_CHOICE
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
            this.hp = new Guna.UI2.WinForms.Guna2Button();
            this.gv = new Guna.UI2.WinForms.Guna2Button();
            this.SuspendLayout();
            // 
            // hp
            // 
            this.hp.BorderRadius = 14;
            this.hp.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.hp.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.hp.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.hp.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.hp.FillColor = System.Drawing.Color.MediumPurple;
            this.hp.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.hp.ForeColor = System.Drawing.Color.White;
            this.hp.Location = new System.Drawing.Point(182, 156);
            this.hp.Name = "hp";
            this.hp.Size = new System.Drawing.Size(193, 90);
            this.hp.TabIndex = 0;
            this.hp.Text = "Quản lý học phần";
            this.hp.Click += new System.EventHandler(this.hp_Click);
            // 
            // gv
            // 
            this.gv.BorderRadius = 14;
            this.gv.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.gv.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.gv.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.gv.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.gv.FillColor = System.Drawing.Color.MediumPurple;
            this.gv.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.gv.ForeColor = System.Drawing.Color.White;
            this.gv.Location = new System.Drawing.Point(495, 156);
            this.gv.Name = "gv";
            this.gv.Size = new System.Drawing.Size(193, 90);
            this.gv.TabIndex = 1;
            this.gv.Text = "Quản lý giảng viên";
            this.gv.Click += new System.EventHandler(this.gv_Click);
            // 
            // UC_TBM_CHOICE
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.gv);
            this.Controls.Add(this.hp);
            this.Name = "UC_TBM_CHOICE";
            this.Size = new System.Drawing.Size(925, 550);
            this.ResumeLayout(false);

        }

        #endregion

        private Guna.UI2.WinForms.Guna2Button hp;
        private Guna.UI2.WinForms.Guna2Button gv;
    }
}
