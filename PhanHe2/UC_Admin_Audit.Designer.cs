namespace PhanHe2
{
    partial class UC_Admin_Audit
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
            this.FGA = new Guna.UI2.WinForms.Guna2Button();
            this.SA = new Guna.UI2.WinForms.Guna2Button();
            this.SuspendLayout();
            // 
            // FGA
            // 
            this.FGA.BorderRadius = 14;
            this.FGA.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.FGA.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.FGA.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.FGA.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.FGA.FillColor = System.Drawing.Color.MediumPurple;
            this.FGA.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.FGA.ForeColor = System.Drawing.Color.White;
            this.FGA.Location = new System.Drawing.Point(508, 239);
            this.FGA.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.FGA.Name = "FGA";
            this.FGA.Size = new System.Drawing.Size(205, 72);
            this.FGA.TabIndex = 3;
            this.FGA.Text = "Fine-grained Auditing";
            this.FGA.Click += new System.EventHandler(this.FGA_Click);
            // 
            // SA
            // 
            this.SA.BorderRadius = 14;
            this.SA.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.SA.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.SA.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.SA.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.SA.FillColor = System.Drawing.Color.MediumPurple;
            this.SA.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.SA.ForeColor = System.Drawing.Color.White;
            this.SA.Location = new System.Drawing.Point(230, 239);
            this.SA.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.SA.Name = "SA";
            this.SA.Size = new System.Drawing.Size(205, 72);
            this.SA.TabIndex = 2;
            this.SA.Text = "Standard Auditing";
            this.SA.Click += new System.EventHandler(this.SA_Click);
            // 
            // UC_Admin_Audit
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.FGA);
            this.Controls.Add(this.SA);
            this.Name = "UC_Admin_Audit";
            this.Size = new System.Drawing.Size(943, 550);
            this.ResumeLayout(false);

        }

        #endregion

        private Guna.UI2.WinForms.Guna2Button FGA;
        private Guna.UI2.WinForms.Guna2Button SA;
    }
}
