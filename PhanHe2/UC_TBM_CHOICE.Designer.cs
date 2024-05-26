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
            this.lbTrDV = new Guna.UI2.WinForms.Guna2HtmlLabel();
            this.lbDV = new Guna.UI2.WinForms.Guna2HtmlLabel();
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
            this.hp.Location = new System.Drawing.Point(162, 125);
            this.hp.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.hp.Name = "hp";
            this.hp.Size = new System.Drawing.Size(205, 72);
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
            this.gv.Location = new System.Drawing.Point(440, 125);
            this.gv.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.gv.Name = "gv";
            this.gv.Size = new System.Drawing.Size(205, 72);
            this.gv.TabIndex = 1;
            this.gv.Text = "Quản lý giảng viên";
            this.gv.Click += new System.EventHandler(this.gv_Click);
            // 
            // lbTrDV
            // 
            this.lbTrDV.AutoSize = false;
            this.lbTrDV.AutoSizeHeightOnly = true;
            this.lbTrDV.AvoidGeometryAntialias = true;
            this.lbTrDV.BackColor = System.Drawing.Color.Transparent;
            this.lbTrDV.Font = new System.Drawing.Font("Segoe UI", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lbTrDV.ForeColor = System.Drawing.Color.MediumPurple;
            this.lbTrDV.Location = new System.Drawing.Point(32, 20);
            this.lbTrDV.Name = "lbTrDV";
            this.lbTrDV.Size = new System.Drawing.Size(185, 39);
            this.lbTrDV.TabIndex = 2;
            this.lbTrDV.Text = "Trưởng đơn vị";
            // 
            // lbDV
            // 
            this.lbDV.BackColor = System.Drawing.Color.Transparent;
            this.lbDV.Font = new System.Drawing.Font("Segoe UI", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lbDV.ForeColor = System.Drawing.Color.MediumPurple;
            this.lbDV.Location = new System.Drawing.Point(306, 62);
            this.lbDV.Name = "lbDV";
            this.lbDV.Size = new System.Drawing.Size(185, 39);
            this.lbDV.TabIndex = 3;
            this.lbDV.Text = "Trưởng đơn vị";
            // 
            // UC_TBM_CHOICE
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.lbDV);
            this.Controls.Add(this.lbTrDV);
            this.Controls.Add(this.gv);
            this.Controls.Add(this.hp);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "UC_TBM_CHOICE";
            this.Size = new System.Drawing.Size(822, 440);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Guna.UI2.WinForms.Guna2Button hp;
        private Guna.UI2.WinForms.Guna2Button gv;
        private Guna.UI2.WinForms.Guna2HtmlLabel lbTrDV;
        public Guna.UI2.WinForms.Guna2HtmlLabel lbDV;
    }
}
