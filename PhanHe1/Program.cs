﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
// Data Source=XE;Persist Security Info=True;User ID=system;Password=***********;Unicode=True
namespace PhanHe1
{
    
    internal static class Program
    {
       
        public static string username = "adm";
        public static string password = "admin123";
        
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            //Application.Run(new Form1());
            Application.Run(new Home());
            //Application.Run(new FormGrant());
        }
    }
}
