using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;

namespace CrownCementJson
{
    public class DBConnection
    {
        public SqlConnection conn;
        public string serverAddress;
        public string databaseName;
        public string userName;
        public string password;
        public DBConnection()
        {
            //constructor
        }

        ~DBConnection()
        {
            //destructor
            conn = null;
        }

        public void Disconnect()
        {

            conn.Close();

        }

        public string ConnectToDatabase()
        {
            try
            {
                string path = System.IO.Path.GetDirectoryName(System.Windows.Forms.Application.ExecutablePath);
                FileStream file = new FileStream(path + "\\DBinfo.txt", FileMode.OpenOrCreate, FileAccess.Read);
                StreamReader sr = new StreamReader(file);
                conn = new SqlConnection();
                serverAddress = sr.ReadLine();
                userName = sr.ReadLine();
                password = sr.ReadLine();
                databaseName = sr.ReadLine();
                conn.ConnectionString = @"Server=" + serverAddress + ";Database=" + databaseName + ";User Id=" + userName + ";Password=" + password + ";connection timeout=300";
                conn.Open();
                return "Connected";
            }

            catch (SqlException e)
            {
                conn = null;
                return e.Message;
            }
        }
    }
}
