using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace VanquisherAPI
{
    public class ProcessCaller
    {
        public static void ProcessToOpenPowershell(string powershellPath)
        {
            Process p = new Process();
            p.StartInfo.UseShellExecute = false;
            p.StartInfo.CreateNoWindow = true;
            p.StartInfo.FileName = "Powershell.exe";
            p.StartInfo.Arguments = powershellPath;
            p.Start();
        }
    }
}
