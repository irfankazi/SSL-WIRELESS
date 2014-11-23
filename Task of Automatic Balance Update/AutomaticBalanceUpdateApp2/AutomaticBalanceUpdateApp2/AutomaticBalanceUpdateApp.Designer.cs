namespace AutomaticBalanceUpdateApp2
{
    partial class AutomaticBalanceUpdateApp
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
            this.showDbConnectionLabel = new System.Windows.Forms.Label();
            this.showDataLabel = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // showDbConnectionLabel
            // 
            this.showDbConnectionLabel.AutoSize = true;
            this.showDbConnectionLabel.Location = new System.Drawing.Point(40, 266);
            this.showDbConnectionLabel.Name = "showDbConnectionLabel";
            this.showDbConnectionLabel.Size = new System.Drawing.Size(52, 13);
            this.showDbConnectionLabel.TabIndex = 3;
            this.showDbConnectionLabel.Text = "DBStatus";
            // 
            // showDataLabel
            // 
            this.showDataLabel.AutoSize = true;
            this.showDataLabel.Location = new System.Drawing.Point(40, 85);
            this.showDataLabel.Name = "showDataLabel";
            this.showDataLabel.Size = new System.Drawing.Size(60, 13);
            this.showDataLabel.TabIndex = 2;
            this.showDataLabel.Text = "Show Data";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(40, 26);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(122, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Current Balance Amount";
            // 
            // AutomaticBalanceUpdateApp
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1001, 297);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.showDbConnectionLabel);
            this.Controls.Add(this.showDataLabel);
            this.Name = "AutomaticBalanceUpdateApp";
            this.Text = "Automatic Balance Update App";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label showDbConnectionLabel;
        private System.Windows.Forms.Label showDataLabel;
        private System.Windows.Forms.Label label1;
    }
}

