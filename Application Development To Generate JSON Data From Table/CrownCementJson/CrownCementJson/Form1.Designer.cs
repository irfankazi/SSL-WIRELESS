namespace CrownCementJson
{
    partial class Form1
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
            this.dealerTableButton = new System.Windows.Forms.Button();
            this.corporateTableButton = new System.Windows.Forms.Button();
            this.showStatusListView = new System.Windows.Forms.ListView();
            this.tablename = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.status = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.transactionTableButton = new System.Windows.Forms.Button();
            this.distributorTableButton = new System.Windows.Forms.Button();
            this.retailerTableButton = new System.Windows.Forms.Button();
            this.influencerTableButton = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.startAllButton = new System.Windows.Forms.Button();
            this.stopAllButton = new System.Windows.Forms.Button();
            this.showJsonData = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.showDbStatus = new System.Windows.Forms.Label();
            this.groupBox2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dealerTableButton
            // 
            this.dealerTableButton.Location = new System.Drawing.Point(35, 40);
            this.dealerTableButton.Name = "dealerTableButton";
            this.dealerTableButton.Size = new System.Drawing.Size(178, 23);
            this.dealerTableButton.TabIndex = 5;
            this.dealerTableButton.Text = "Dealer Table";
            this.dealerTableButton.UseVisualStyleBackColor = true;
            this.dealerTableButton.Click += new System.EventHandler(this.dealerTableButton_Click);
            // 
            // corporateTableButton
            // 
            this.corporateTableButton.Location = new System.Drawing.Point(285, 40);
            this.corporateTableButton.Name = "corporateTableButton";
            this.corporateTableButton.Size = new System.Drawing.Size(184, 23);
            this.corporateTableButton.TabIndex = 6;
            this.corporateTableButton.Text = "Corporate Table";
            this.corporateTableButton.UseVisualStyleBackColor = true;
            this.corporateTableButton.Click += new System.EventHandler(this.corporateTableButton_Click);
            // 
            // showStatusListView
            // 
            this.showStatusListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.tablename,
            this.status});
            this.showStatusListView.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            this.showStatusListView.Location = new System.Drawing.Point(156, 418);
            this.showStatusListView.Name = "showStatusListView";
            this.showStatusListView.Size = new System.Drawing.Size(508, 198);
            this.showStatusListView.TabIndex = 19;
            this.showStatusListView.UseCompatibleStateImageBehavior = false;
            this.showStatusListView.View = System.Windows.Forms.View.Details;
            // 
            // tablename
            // 
            this.tablename.Text = "tablename";
            this.tablename.Width = 248;
            // 
            // status
            // 
            this.status.Text = "status";
            this.status.Width = 256;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.dealerTableButton);
            this.groupBox2.Controls.Add(this.corporateTableButton);
            this.groupBox2.Controls.Add(this.transactionTableButton);
            this.groupBox2.Controls.Add(this.distributorTableButton);
            this.groupBox2.Controls.Add(this.retailerTableButton);
            this.groupBox2.Controls.Add(this.influencerTableButton);
            this.groupBox2.Font = new System.Drawing.Font("MS Reference Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.Location = new System.Drawing.Point(156, 199);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(508, 199);
            this.groupBox2.TabIndex = 18;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Click Button To Create JSON Data For Table";
            // 
            // transactionTableButton
            // 
            this.transactionTableButton.Location = new System.Drawing.Point(285, 153);
            this.transactionTableButton.Name = "transactionTableButton";
            this.transactionTableButton.Size = new System.Drawing.Size(184, 23);
            this.transactionTableButton.TabIndex = 10;
            this.transactionTableButton.Text = "Transaction Table";
            this.transactionTableButton.UseVisualStyleBackColor = true;
            this.transactionTableButton.Click += new System.EventHandler(this.transactionTableButton_Click);
            // 
            // distributorTableButton
            // 
            this.distributorTableButton.Location = new System.Drawing.Point(35, 94);
            this.distributorTableButton.Name = "distributorTableButton";
            this.distributorTableButton.Size = new System.Drawing.Size(178, 23);
            this.distributorTableButton.TabIndex = 7;
            this.distributorTableButton.Text = "Distributor Table";
            this.distributorTableButton.UseVisualStyleBackColor = true;
            this.distributorTableButton.Click += new System.EventHandler(this.distributorTableButton_Click);
            // 
            // retailerTableButton
            // 
            this.retailerTableButton.Location = new System.Drawing.Point(35, 153);
            this.retailerTableButton.Name = "retailerTableButton";
            this.retailerTableButton.Size = new System.Drawing.Size(178, 23);
            this.retailerTableButton.TabIndex = 9;
            this.retailerTableButton.Text = "Retailer Table";
            this.retailerTableButton.UseVisualStyleBackColor = true;
            this.retailerTableButton.Click += new System.EventHandler(this.retailerTableButton_Click);
            // 
            // influencerTableButton
            // 
            this.influencerTableButton.Location = new System.Drawing.Point(285, 94);
            this.influencerTableButton.Name = "influencerTableButton";
            this.influencerTableButton.Size = new System.Drawing.Size(184, 23);
            this.influencerTableButton.TabIndex = 8;
            this.influencerTableButton.Text = "Influencer Table";
            this.influencerTableButton.UseVisualStyleBackColor = true;
            this.influencerTableButton.Click += new System.EventHandler(this.influencerTableButton_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.startAllButton);
            this.groupBox1.Controls.Add(this.stopAllButton);
            this.groupBox1.Font = new System.Drawing.Font("MS Reference Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(156, 62);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(508, 100);
            this.groupBox1.TabIndex = 17;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Click Button To Start Or Stop All JSON Data Services";
            // 
            // startAllButton
            // 
            this.startAllButton.Location = new System.Drawing.Point(47, 31);
            this.startAllButton.Name = "startAllButton";
            this.startAllButton.Size = new System.Drawing.Size(124, 49);
            this.startAllButton.TabIndex = 3;
            this.startAllButton.Text = "Start All";
            this.startAllButton.UseVisualStyleBackColor = true;
            this.startAllButton.Click += new System.EventHandler(this.startAllButton_Click);
            // 
            // stopAllButton
            // 
            this.stopAllButton.Location = new System.Drawing.Point(333, 31);
            this.stopAllButton.Name = "stopAllButton";
            this.stopAllButton.Size = new System.Drawing.Size(124, 49);
            this.stopAllButton.TabIndex = 4;
            this.stopAllButton.Text = "Stop All";
            this.stopAllButton.UseVisualStyleBackColor = true;
            this.stopAllButton.Click += new System.EventHandler(this.stopAllButton_Click);
            // 
            // showJsonData
            // 
            this.showJsonData.AutoSize = true;
            this.showJsonData.Location = new System.Drawing.Point(69, 662);
            this.showJsonData.Name = "showJsonData";
            this.showJsonData.Size = new System.Drawing.Size(91, 13);
            this.showJsonData.TabIndex = 14;
            this.showJsonData.Text = "Show JSON Data";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("MS Reference Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(265, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(249, 26);
            this.label1.TabIndex = 16;
            this.label1.Text = "Generate JSON Data";
            // 
            // showDbStatus
            // 
            this.showDbStatus.AutoSize = true;
            this.showDbStatus.Font = new System.Drawing.Font("MS Reference Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.showDbStatus.Location = new System.Drawing.Point(69, 635);
            this.showDbStatus.Name = "showDbStatus";
            this.showDbStatus.Size = new System.Drawing.Size(74, 16);
            this.showDbStatus.TabIndex = 15;
            this.showDbStatus.Text = "DB Status";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(830, 715);
            this.Controls.Add(this.showStatusListView);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.showJsonData);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.showDbStatus);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox2.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button dealerTableButton;
        private System.Windows.Forms.Button corporateTableButton;
        private System.Windows.Forms.ListView showStatusListView;
        private System.Windows.Forms.ColumnHeader tablename;
        private System.Windows.Forms.ColumnHeader status;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button transactionTableButton;
        private System.Windows.Forms.Button distributorTableButton;
        private System.Windows.Forms.Button retailerTableButton;
        private System.Windows.Forms.Button influencerTableButton;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button startAllButton;
        private System.Windows.Forms.Button stopAllButton;
        private System.Windows.Forms.Label showJsonData;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label showDbStatus;
    }
}

