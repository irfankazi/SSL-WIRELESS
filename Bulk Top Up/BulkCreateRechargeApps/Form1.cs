using BulkCreateRechargeApps.com.sslwireless.vrapi;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BulkCreateRechargeApps
{
    public partial class CreateRechargeApp1 : Form
    {
        virtualrechargeService proxy;
        bulktopupEntities db;
        string appflag="";
        public string limit = "";
        public string appPath = "";
        string location;
        string Msg ="";
        string total_exe;
        string RechargeStatusMsg = "";
        string RechargeStatusCode = "";
        List<int> ProcessdIndex;
        List<int> FailedIndex;
        public CreateRechargeApp1()
        {
            InitializeComponent();
            
        }

        private void CreateRechargeApp1_Load(object sender, EventArgs e)
        {
            GetFileInfo();
            proxy = new virtualrechargeService();
            checkedListBox1.Visible = false;
            listBox1.Visible = false;                
            timer1.Start();
            Msg = "Timer1 is Started";
            this.Text = "CreateRechargeApp" + appflag;
            ProcessdIndex = new List<int>();
            FailedIndex = new List<int>();
        }

        private void GetFileInfo()
        {
            try
            {
                location = System.IO.Path.GetDirectoryName(System.Windows.Forms.Application.ExecutablePath);
                FileStream file = new FileStream(location + "\\info.txt", FileMode.OpenOrCreate, FileAccess.Read);
                StreamReader sr = new StreamReader(file);
                total_exe = sr.ReadLine();
                appflag = sr.ReadLine();
                limit = sr.ReadLine();
                sr.Close();
                file.Close();
            }
            catch (Exception err)
            {
                MessageBox.Show(err.ToString());
            }
        }


        private void CreateLog(String msg)
        {
            FileStream fp = new FileStream(AppDomain.CurrentDomain.BaseDirectory + "//Log.txt", FileMode.Append, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fp);
            sw.WriteLine(DateTime.Now.ToString() + " ==> " + msg);
            sw.Close();
            fp.Close();
        }
        private void CreateErrorLog(String msg)
        {
            FileStream fp = new FileStream(AppDomain.CurrentDomain.BaseDirectory + "//ErrorLog/Log.txt", FileMode.Append, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fp);
            sw.WriteLine(DateTime.Now.ToString() + " ==> " + msg);
            sw.Close();
            fp.Close();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            
            timer1.Stop();
            CreateLog("Timer1 Stopped");
            Msg = "Timer1 is Stopped";
            label1.Text = Msg;     
            
                int TryToConnect = 0;             
                while (TryToConnect <5)
                {                   
                    try
                    {
                        db = new bulktopupEntities();
                        
                        var ProcessingData = db.RechargeInfoTbls.AsEnumerable().Where(g => g.create_recharge_Status == "processing" && g.id % Convert.ToInt32(total_exe) == Convert.ToInt32(appflag)).OrderByDescending(f => f.id).Take(Convert.ToInt32(limit)).ToList();

                        if (ProcessingData.Count() != 0)
                            {
                                Msg = ProcessingData.Count().ToString() + " Data Found to be processed  ";
                                CreateLog(Msg);
                                label1.Text = Msg;
                                //label1.ForeColor = Color.DarkTurquoise;
                                listBox1.Visible = true;
                                
                                foreach (var i in ProcessingData)
                                {
                                    var FindOrginal = db.RechargeInfoTbls.First(g => g.id == i.id);
                                  
                                    if (CheckMobileNo(i) == "Valid")
                                    {

                                        if (i.Create_Try < 5)
                                        {

                                            var CreateRecharge = proxy.CreateRecharge(i.client_id, i.client_pass, i.guid, i.operator_id, i.recepient_msisdn, i.amount, i.connection_type, "1", 1, "00", "00");

                                            if (CreateRecharge.recharge_status == 100)
                                            {
                                                FindOrginal.create_recharge_Status = "Success";
                                                FindOrginal.Create_Status_Code = CreateRecharge.recharge_status.ToString();
                                                FindOrginal.Create_Try = FindOrginal.Create_Try + 100;
                                                FindOrginal.SentDateTime = DateTime.Now;
                                                FindOrginal.vr_guid = CreateRecharge.vr_guid;
                                                db.SaveChanges();
                                                CreateLog("Recharge Request  id: " + i.id + " Mobile No:" + i.recepient_msisdn + " has been Processed ");
                                                listBox1.Items.Add("Recharge Request id: " + i.id + " Mobile No:" + i.recepient_msisdn + " has been Processed");
                                                
                                            }
                                            else if (CreateRecharge.recharge_status == 300 || CreateRecharge.recharge_status == 301 || CreateRecharge.recharge_status == 308 || CreateRecharge.recharge_status == 331 || CreateRecharge.recharge_status == 332 || CreateRecharge.recharge_status == 333 || CreateRecharge.recharge_status == 339 || CreateRecharge.recharge_status == 399)
                                            {
                                                try
                                                {
                                                    if (i.Create_Try < 1)
                                                    {
                                                        RechargeStatusMsg = "Error" + ":" + CreateRecharge.message;
                                                        FindOrginal.SentDateTime = DateTime.Now;
                                                        FindOrginal.Create_Status_Code = CreateRecharge.recharge_status.ToString();
                                                        FindOrginal.Create_Try = FindOrginal.Create_Try + 1;
                                                        db.SaveChanges();
                                                        CreateErrorLog("Recharge Response of id: " + i.id + RechargeStatusMsg + "..Tried For " + FindOrginal.Create_Try + " Times");
                                                    }  
                                                    else
                                                    {
                                                        FindOrginal.Create_Try = FindOrginal.Create_Try + 1;
                                                        db.SaveChanges();
                                                        CreateErrorLog("Recharge Response of id: " + i.id + RechargeStatusMsg + "..Tried For " + FindOrginal.Create_Try + " Times");
                                                    
                                                    }
                                                                                                  
                                                }
                                                #region EntityValidationErrorHandler
                                                catch (System.Data.Entity.Validation.DbEntityValidationException dbEx)
                                                {
                                                    Exception raise = dbEx;
                                                    foreach (var validationErrors in dbEx.EntityValidationErrors)
                                                    {
                                                        foreach (var validationError in validationErrors.ValidationErrors)
                                                        {
                                                            Msg = string.Format("{0}:{1} {2}", i.id,
                                                                validationErrors.Entry.Entity.ToString(),
                                                                validationError.ErrorMessage);
                                                            label1.Text = Msg;
                                                            // raise a new exception nesting  
                                                            // the current instance as InnerException  
                                                            // raise = new InvalidOperationException(Msg, raise);
                                                        }
                                                    }
                                                    //  throw raise;

                                                }

                                                #endregion
                                            }
                                            else
                                            {
                                                try
                                                {
                                                    FindOrginal.Create_Status_Code = CreateRecharge.recharge_status.ToString();
                                                    FindOrginal.create_recharge_Status = proxy.GetStatusCodeMeaning(i.client_id, i.Create_Status_Code);
                                                    FindOrginal.Create_Try = FindOrginal.Create_Try + 1;
                                                    FindOrginal.SentDateTime = DateTime.Now;
                                                    db.SaveChanges();
                                                    CreateErrorLog("Recharge Response of id: " + i.id + RechargeStatusMsg + " Tried For " + FindOrginal.Create_Try + " Times");
                                                    listBox1.Items.Add("Recharge Request id: " + i.id + "  Can't Be recharged." + RechargeStatusMsg);
                                                }
                                                    #region EntityValidationErrorHandler
                                                catch (System.Data.Entity.Validation.DbEntityValidationException dbEx)
                                                {
                                                    Exception raise = dbEx;
                                                    foreach (var validationErrors in dbEx.EntityValidationErrors)
                                                    {
                                                        foreach (var validationError in validationErrors.ValidationErrors)
                                                        {
                                                            Msg = string.Format("{0}:{1} {2}", i.id,
                                                                validationErrors.Entry.Entity.ToString(),
                                                                validationError.ErrorMessage);
                                                            label1.Text = Msg;
                                                            CreateErrorLog("Recharge Response of id: " + i.id + "Can't b recharged and "+Msg);
                                                   
                                                            // raise a new exception nesting  
                                                            // the current instance as InnerException  
                                                            // raise = new InvalidOperationException(Msg, raise);
                                                        }
                                                    }
                                                    //  throw raise;

                                                }

                                                #endregion
                                            }
                                        }
                                        else
                                        {
                                            FindOrginal.create_recharge_Status = proxy.GetStatusCodeMeaning(i.client_id, i.Create_Status_Code);                  
                                            FindOrginal.SentDateTime = DateTime.Now;
                                            db.SaveChanges();
                                            CreateErrorLog("Recharge Request id: " + i.id + " Can't Be recharged.." + RechargeStatusMsg);
                                            listBox1.Items.Add("Recharge Request id: " + i.id + " Can't Be recharged." + RechargeStatusMsg);
                                        }
                                    }
                                    else
                                    {
                                        FindOrginal.create_recharge_Status = "Invalid Mobile No Or Operator";
                                        FindOrginal.Create_Status_Code = "";
                                        FindOrginal.SentDateTime = DateTime.Now;                                          
                                        FindOrginal.Create_Try = 500;
                                        db.SaveChanges();
                                        CreateErrorLog("Recharge id: " + i.id + " Can't Be recharged due to Invalid Mobile No Or Operator");
                                        listBox1.Items.Add("Recharge id: " + i.id + " Can't Be recharged due to Invalid Mobile No Or Operator");
                                    }
                                }
                            }
                            else
                            {
                                CreateLog("No data Found to be processed");
                                Msg = "No data Found to be processed So far";
                                label1.Text = Msg;
                                //label1.ForeColor = Color.DarkTurquoise;
                            }
                        TryToConnect = 0;
                    }

                    catch (Exception ex)
                    {
                        if (ex.InnerException != null)
                        {
                            Msg = ex.InnerException.ToString();
                            label1.Text = Msg;
                            //label1.ForeColor = Color.DarkTurquoise;
                            CreateErrorLog(ex.Message + ex.InnerException + ex.Source);
                        }
                        else
                        {
                            Msg = ex.Message;
                            label1.Text = Msg;
                            //label1.ForeColor = Color.DarkTurquoise;
                            CreateErrorLog(ex.Message);
                        }
                        if (db.Database.Connection.State != ConnectionState.Open)
                        {
                            CreateErrorLog("Database Connection is not Open and Tried for "+TryToConnect +" Times");
                            TryToConnect++;
                            Thread.Sleep(2000); 
                        }
                        else
                        {
                            TryToConnect = 0;
                        }
                    }
                    #region EntityValidationErrorHandler
                    //catch (System.Data.Entity.Validation.DbEntityValidationException dbEx)
                    //{
                    //    Exception raise = dbEx;
                    //    foreach (var validationErrors in dbEx.EntityValidationErrors)
                    //    {
                    //        foreach (var validationError in validationErrors.ValidationErrors)
                    //        {
                    //            string message = string.Format("{0}:{1}",
                    //                validationErrors.Entry.Entity.ToString(),
                    //                validationError.ErrorMessage);
                    //            // raise a new exception nesting  
                    //            // the current instance as InnerException  
                    //            raise = new InvalidOperationException(message, raise);
                    //        }
                    //    }
                    //    throw raise;
                    //}
                    
                    #endregion
                   
                    if (TryToConnect == 0)
                        break;
                }



            timer1.Interval = 10000;
            timer1.Start();
          


        }

        private string  CheckMobileNo(RechargeInfoTbl singleRow)
        {
            string reply = "";
            int  s ;
            if (singleRow.operator_id >= 1 && singleRow.operator_id <= 6 && ((singleRow.recepient_msisdn.StartsWith("88")? singleRow.recepient_msisdn.Length == 13 : singleRow.recepient_msisdn.Length == 11)))
            {
                if (singleRow.operator_id == 1)
                {
                    if (singleRow.recepient_msisdn.StartsWith("88"))
                    {
                        if (singleRow.recepient_msisdn.Substring(0, 5) == "88017")
                        {
                            reply = "Valid";
                        }
                        else
                        {
                            reply = "INVALID MOBILE NO";
                        }
                    }
                    else
                    {
                        if (singleRow.recepient_msisdn.Substring(0, 3) == "017")
                        {
                            reply = "Valid";
                        }
                        else
                        {
                            reply = "INVALID MOBILE NO";
                        }

                    }
                }
                else if (singleRow.operator_id == 2)
                {
                    if (singleRow.recepient_msisdn.StartsWith("88"))
                    {
                        if (singleRow.recepient_msisdn.Substring(0,5) == "88019")
                        {
                            reply = "Valid";
                        }
                        else
                        {
                            reply = "INVALID MOBILE NO";
                        }
                    }
                    else
                    {
                        if (singleRow.recepient_msisdn.Substring(0,3) == "019")
                        {
                            reply = "Valid";
                        }
                        else
                        {
                            reply = "INVALID MOBILE NO";
                        }

                    }
                }
                else if (singleRow.operator_id == 3)
                {
                    if (singleRow.recepient_msisdn.StartsWith("88"))
                    {
                        if (singleRow.recepient_msisdn.Substring(0,5) == "88018")
                        {
                            reply = "Valid";
                        }
                        else
                        {
                            reply = "INVALID MOBILE NO";
                        }
                    }
                    else
                    {
                        if (singleRow.recepient_msisdn.Substring(0,3) == "018")
                        {
                            reply = "Valid";
                        }
                        else
                        {
                            reply = "INVALID MOBILE NO";
                        }

                    }
                }
                else if (singleRow.operator_id == 4)
                {
                    if (singleRow.recepient_msisdn.StartsWith("88"))
                    {
                        if (singleRow.recepient_msisdn.Substring(0,5) == "88011")
                        {
                            reply = "Valid";
                        }
                        else
                        {
                            reply = "INVALID MOBILE NO";
                        }
                    }
                    else
                    {
                        if (singleRow.recepient_msisdn.Substring(0,3) == "011")
                        {
                            reply = "Valid";
                        }
                        else
                        {
                            reply = "INVALID MOBILE NO";
                        }

                    }
                }
                else if (singleRow.operator_id == 5)
                {
                    if (singleRow.recepient_msisdn.StartsWith("88"))
                    {
                        if (singleRow.recepient_msisdn.Substring(0,5) == "88015")
                        {
                            reply = "Valid";
                        }
                        else
                        {
                            reply = "INVALID MOBILE NO";
                        }
                    }
                    else
                    {
                        if (singleRow.recepient_msisdn.Substring(0, 3) == "015")
                        {
                            reply = "Valid";
                        }
                        else
                        {
                            reply = "INVALID MOBILE NO";
                        }

                    }
                }
                else if (singleRow.operator_id == 6)
                {
                    if (singleRow.recepient_msisdn.StartsWith("88"))
                    {
                        if (singleRow.recepient_msisdn.Substring(0, 5) == "88016")
                        {
                            reply = "Valid";
                        }
                        else
                        {
                            reply = "INVALID MOBILE NO";
                        }
                    }
                    else
                    {
                        if (singleRow.recepient_msisdn.Substring(0, 3) == "016")
                        {
                            reply = "Valid";
                        }
                        else
                        {
                            reply = "INVALID MOBILE NO";
                        }

                    }

                }
                else
                {
                    reply = "Invalid Operator";
                }
            }
            else
            {
                reply = "Invalid Operator Or Mobile No";
            }
            return reply;

        }

        private void SaveIdToFile(int CurrrentId)
        {
            FileStream fp = new FileStream(AppDomain.CurrentDomain.BaseDirectory + "//ErrorIds.txt", FileMode.Append, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fp);
            sw.WriteLine(CurrrentId);
            sw.Close();
            fp.Close();
        }
        private int CheckIdFromFile(int Id)
        {
            try
            {
                int FoundId = 0;
                string line;
                using (StreamReader file = new StreamReader(AppDomain.CurrentDomain.BaseDirectory + "//ErrorIds.txt"))
                {
                    while ((line = file.ReadLine()) != null)
                    {
                        if (line.Contains(Id.ToString()))
                        {
                             FoundId = Convert.ToInt32(line);
                             
                        }
                    }
                }
                return FoundId;

            }
            catch (Exception err)
            {
                MessageBox.Show(err.ToString());
                return 0;
            }
        }
        private void RemoveIdFrmFile(int Id)
        {
            try
            {
                
                string line;
                List<string> Lines = new List<string>();
                using (StreamReader file = new StreamReader(AppDomain.CurrentDomain.BaseDirectory + "//ErrorIds.txt"))
                {
                    while ((line = file.ReadLine()) != null)
                    {

                        if (line.Contains(Id.ToString()))
                        {
                           // Lines.Add(line);
                            StreamWriter sw = new StreamWriter(AppDomain.CurrentDomain.BaseDirectory + "//" + line + ".txt");
                            sw.Close();

                        }
                    }
                    
                }
                

            }
            catch (Exception err)
            {
                MessageBox.Show(err.ToString());
            
            }
            
        }

        private void SaveFileWithId(int Id)
        {
            string filepath = AppDomain.CurrentDomain.BaseDirectory + "//ErrorIds//" + Id + ".txt";
       
            StreamWriter sw = new StreamWriter(filepath);
            sw.Close();
        }



        private bool RemoveFileWithId(int id)
        {

            string filepath = AppDomain.CurrentDomain.BaseDirectory + "//ErrorIds//" + id + ".txt";
            if (File.Exists(filepath))
            {
                File.Delete(filepath);
                return true;
            }
            else
            {
                return false;
            }
        }


        public String[] loadinformation()
        {
            string filePath = AppDomain.CurrentDomain.BaseDirectory + "//ErrorIds.txt";
            string[] data;
            List<string> myList = new List<string>();
            if (File.Exists(filePath))
            {
                StreamReader file = null;
                try
                {
                    file = new StreamReader(filePath);

                    String line;
                    while ((line = file.ReadLine()) != null)
                    {
                        myList.Add(line);
                    }
                }

                catch (Exception ex) { MessageBox.Show(ex.ToString()); }
            }
            else
            {
                MessageBox.Show("File not exixts");
            }
            data = myList.ToArray();
            return data;

        }

       

        public void CheckIPAccess()
        {
            Ping pingSender = new Ping();
            PingOptions options = new PingOptions();

            // Use the default Ttl value which is 128, 
            // but change the fragmentation behavior.
            options.DontFragment = true;

            // Create a buffer of 32 bytes of data to be transmitted. 
            string data = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
            byte[] buffer = Encoding.ASCII.GetBytes(data);
            int timeout = 120;
            PingReply reply = pingSender.Send("192.168.92.140", timeout, buffer, options);
            if (reply.Status == IPStatus.Success)
            {
                label1.Text += reply.Address.ToString() +"\n";
                label1.Text += reply.RoundtripTime + "\n";
                label1.Text += reply.Options.Ttl + "\n";
                label1.Text += reply.Options.DontFragment + "\n";
                label1.Text += reply.Buffer.Length + "\n";
               
            }
            else
            {
                label1.Text += reply.Status.ToString();

            }
        }

        public bool CheckServiceAccess(string ServiceUrl)
        {
          
            bool Response;
            try
            {
                var myRequest = (HttpWebRequest)WebRequest.Create(ServiceUrl);

                var response = (HttpWebResponse)myRequest.GetResponse();

                if (response.StatusCode == HttpStatusCode.OK)
                {
                    //  it's at least in some way responsive
                    //  but may be internally broken
                    //  as you could find out if you called one of the methods for real
                  // Response = string.Format("{0} is  Available", ServiceUrl);
                    Response = true;
                    
                }
                else
                {
                    Response = false;
                    //  well, at least it returned...
                   // Response = string.Format("{0} Returned, but with status: {1}", ServiceUrl, response.StatusDescription);
                }
                
            }
            catch (Exception ex)
            {
                //  not available at all, for some reason
               // Response = string.Format("{0}  is unavailable: {1}", ServiceUrl, ex.Message);
                Response = false;
            }
            return Response;
        }
    }
}
