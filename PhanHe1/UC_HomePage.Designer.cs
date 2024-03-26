namespace PhanHe1
{
    partial class UC_HomePage
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
            this.homepagePic = new Guna.UI2.WinForms.Guna2PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.homepagePic)).BeginInit();
            this.SuspendLayout();
            // 
            // homepagePic
            // 
            this.homepagePic.BackColor = System.Drawing.Color.Transparent;
            this.homepagePic.Image = global::PhanHe1.Properties.Resources.HomePage;
            this.homepagePic.ImageRotate = 0F;
            this.homepagePic.Location = new System.Drawing.Point(67, 64);
            this.homepagePic.Name = "homepagePic";
            this.homepagePic.Size = new System.Drawing.Size(790, 393);
            this.homepagePic.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.homepagePic.TabIndex = 2;
            this.homepagePic.TabStop = false;
            // 
            // UC_HomePage
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.homepagePic);
            this.Name = "UC_HomePage";
            this.Size = new System.Drawing.Size(925, 520);
            ((System.ComponentModel.ISupportInitialize)(this.homepagePic)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Guna.UI2.WinForms.Guna2PictureBox homepagePic;
    }
}
