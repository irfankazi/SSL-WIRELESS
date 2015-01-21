using BulkInitRechargeSystem.com.sslwireless.vrapi;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BulkInitRechargeSystem
{
    public partial class InitRechargeForm : Form
    {
        virtualrechargeService proxy;
        bulktopupEntities db;
        string appflag;
        public string appPath = "";
        string location;
        string Msg = "";
        string total_exe;
        string limit = "";
        public InitRechargeForm()
        {
            InitializeComponent();
            proxy = new virtualrechargeService();
        }

        private void InitRechargeForm_Load(object sender, EventArgs e)
        {

            GetFileInfo();

            checkedListBox1.Visible = false;
            listBox1.Visible = false;


            timer1.Start();
            Msg = "Timer1 is Started";
            label1.Text = Msg;
            this.Text = "InitRechargeApp" + appflag;
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

        
        private void timer1_Tick_1(object sender, EventArgs e)
        {
            
            timer1.Stop();
            CreateLog("Timer1 Stopped");
            Msg = "Timer1 is Stopped";
            label1.Text = Msg;
            
                int TryToConnect = 0;
                while (TryToConnect < 5)
                {
                    try
                    {
                        db = new bulktopupEntities();

                        var ProcessingData = db.RechargeInfoTbls.AsEnumerable().Where(g => g.create_recharge_Status == "Success" && g.vr_guid != null && g.init_recharge_status != "Success" && g.Init_try < 1 && g.id % Convert.ToInt32(total_exe) == Convert.ToInt32(appflag)).OrderByDescending(f => f.id).Take(Convert.ToInt32(limit)).ToList();

                            if (ProcessingData.Count() != 0)
                            {
                                listBox1.Visible = true;
                                Msg = ProcessingData.Count().ToString() + " Data Found to be processed  ";
                                CreateLog(Msg);
                                label1.Text = Msg;
                             
                                foreach (var i in ProcessingData)
                                {
                                       var InitRecharge = proxy.InitRecharge(i.client_id, i.client_pass, i.guid, i.vr_guid, "http://192.168.69.210/VR_Success/", "00");
                                        var FindOrginal = db.RechargeInfoTbls.First(g => g.id == i.id);

                                        if (InitRecharge.recharge_status == 200)
                                        {
                                            FindOrginal.init_recharge_status = "Success";
                                            FindOrginal.Init_Status_Code = InitRecharge.recharge_status.ToString();
                                            FindOrginal.Init_try = FindOrginal.Init_try + 100;
                                            FindOrginal.ResponseDateTime = DateTime.Now;
                                            db.SaveChanges();
                                            CreateLog("Recharge Request id: " + i.id + " Mobile No: " + i.recepient_msisdn + " Processed");
                                            listBox1.Items.Add("Recharge Request id: " + i.id + " Mobile No: " + i.recepient_msisdn + " Processed");
                                        }


                                        else
                                        {
                                            FindOrginal.init_recharge_status = "Error: " + InitRecharge.message;
                                            FindOrginal.Init_Status_Code = InitRecharge.recharge_status.ToString(); 
                                            FindOrginal.Init_try = FindOrginal.Init_try + 1;
                                            FindOrginal.ResponseDateTime = DateTime.Now;
                                            db.SaveChanges();
                                            listBox1.Items.Add("Recharge Request id: " + i.id + " Can't Be recharged" + InitRecharge.message);
                                            // listBox1.ForeColor = Color.Red;                                           
                                          CreateErrorLog("Recharge Request id: " + i.id + " Can't Be recharged" + InitRecharge.message);

                                        }
                                  
                                
                                }
                            }
                            else
                            {
                                CreateLog("No data Found to be processed");
                                Msg = "No data Found to be processed So far";
                                label1.Text = Msg;                                                            
                            }
                      
                        TryToConnect = 0;
                    }
                    catch (Exception ex)
                    {
                        if (ex.InnerException != null)
                        {
                            Msg = ex.InnerException.ToString();
                            label1.Text = Msg;
                            CreateErrorLog(ex.Message + ex.InnerException + ex.Source);
                        }
                        else
                        {                           
                            Msg = ex.Message;
                            label1.Text = Msg;
                            CreateErrorLog(ex.Message);
                        }
                        if (db.Database.Connection.State != ConnectionState.Open)
                        {
                            CreateErrorLog("Database Connection is not Open and Tried  for " + TryToConnect + " Times");
                            TryToConnect++;
                            Thread.Sleep(2000); 

                        }
                        else
                        {
                            TryToConnect = 0;
                        }
                    }

                    if (TryToConnect == 0)
                        break;
                }


            timer1.Interval = 10000;
            timer1.Start();



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
