using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.Security;
using System.IO;
using System.Reflection;

namespace VanquisherAPI
{
    public class ProcessCaller
    {
        public static void ProcessOpenPowershell(string powershellPath)
        {
            Process p = new Process();
            p.StartInfo.UseShellExecute = false;
            p.StartInfo.CreateNoWindow = true;
            p.StartInfo.FileName = @"powershell.exe";
            p.StartInfo.Arguments = powershellPath;
            p.StartInfo.WorkingDirectory = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            p.StartInfo.Verb = "runas";
            p.Start();
        }
        public static void ProcessOpen(string path)
        {
            Process p = new Process();
            //p.StartInfo.UseShellExecute = false;
            //p.StartInfo.CreateNoWindow = true;
            p.StartInfo.FileName = path;
            p.StartInfo.WorkingDirectory = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            p.StartInfo.Verb = "runas";
            p.Start();
        }
    }
}
