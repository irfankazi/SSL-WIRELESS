using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BulkCreateRechargeApps
{
    static class Program
    {
        /// <summary>
        /// The main enCreate_Try point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new CreateRechargeApp1());
        }
    }
}
