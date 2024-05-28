using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
// Data Source=XE;Persist Security Info=True;User ID=system;Password=***********;Unicode=True
namespace PhanHe2
{
    
    internal static class Program
    {
        
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
     
            Application.Run(new LogIn());
        }
    }
}
