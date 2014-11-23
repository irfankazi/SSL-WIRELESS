using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace AutomaticBalanceUpdateApp2
{
    public partial class AutomaticBalanceUpdateApp : Form
    {
        Timer RefreshFormTimer = new Timer();
        DBConnection con = new DBConnection();
        public AutomaticBalanceUpdateApp()
        {
            InitializeComponent();
            RefreshFormTimer.Interval = 1000 * 60; //60 seconds.
            RefreshFormTimer.Tick += new EventHandler(RefreshFormTimer_Tick);
            RefreshFormTimer.Enabled = true;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            UpdateBalance();
        }

        private void UpdateBalance()
        {
            showDataLabel.Text = "";
            showDbConnectionLabel.Text = con.ConnectToDatabase();
            List<string> user = new List<string>();
            List<string> pass = new List<string>();
            List<string> listId = new List<string>();
            string queryToSelect = "SELECT * FROM account_credentials";
            SqlCommand command = new SqlCommand(queryToSelect, con.conn);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    user.Add(reader["username"].ToString());
                    pass.Add(reader["password"].ToString());
                    listId.Add(reader["acc_id"].ToString());
                }
            }

            string[] username = user.ToArray();
            string[] password = pass.ToArray();
            string[] id = listId.ToArray();

            for (int i = 0; i < username.Length; i++)
            {
                using (var client = new CookieAwareWebClient())
                {
                    var values = new NameValueCollection
                    {
                        {"username", username[i]},
                        {"password", password[i]}
                    };

                    client.UploadValues("http://123.49.3.58:8081", values);
                    // If the previous call succeeded we now have a valid authentication cookie
                    // so we could download the protected page

                    string result = client.DownloadString("http://123.49.3.58:8081/corp_crd.php");
                    string amounts =
                        result.Substring(result.IndexOf("<center>"), result.IndexOf("</center>") - result.IndexOf("<center>")).Replace("<center>", "").Trim();
                    string[] number = Regex.Split(amounts, @"\D+");

                    List<int> numbersfrompage = new List<int>();
                    foreach (string value in number)
                    {
                        if (!string.IsNullOrEmpty(value))
                        {
                            int numbers = int.Parse(value);
                            numbersfrompage.Add(numbers);
                        }
                    }
                    int[] arrayOfNumbers = numbersfrompage.ToArray();
                    int amount = arrayOfNumbers[1];
                    DateTime date = DateTime.Now;

                    showDataLabel.Text += username[i] + " " + date + " " + amount + "\n";
                    Insert(username[i], date.ToString(), amount);
                }
            }
        }

        private string Insert(string user, string date, int amount)
        {
            try
            {
                using (con.conn)
                {
                    if (con.conn.State == ConnectionState.Open)
                    {
                        string queryToUpdate = "UPDATE store SET date = '" + date + "', amount= " + amount + " WHERE username = '" + user + "'; IF @@ROWCOUNT = 0 INSERT INTO store (username, date, amount) VALUES ('" + user + "', '" + date + "'," + amount + ") ";
                        con.ConnectToDatabase();
                        using (SqlCommand command = new SqlCommand(queryToUpdate, con.conn))
                        {
                            try
                            {
                                command.ExecuteNonQuery();
                                return "Success";
                            }
                            catch (Exception exception)
                            {
                                return exception.ToString();
                            }
                        }
                    }
                    else
                    {
                        return "Not connected";
                    }
                }
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return null;
        }


        private void RefreshFormTimer_Tick(object sender, EventArgs e)
        {
            UpdateBalance();
        }


    }
}
