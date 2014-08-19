using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Management.Automation;
using System.Collections.ObjectModel;
using NLog;
using System.Management;
using System.DirectoryServices;

namespace VanquisherAPI
{
    public class Cluster
    {
        static Logger logger = LogManager.GetCurrentClassLogger();

        public static List<string> GetADComputerList()
        {
            string domain = string.Empty;
            SelectQuery query = new SelectQuery("Win32_ComputerSystem");
            using (ManagementObjectSearcher searcher = new ManagementObjectSearcher(query))
            {
                foreach (ManagementObject mo in searcher.Get())
                {
                    if ((bool)mo["partofdomain"])
                    {
                        domain = mo["domain"].ToString();
                        break;
                    }
                }
            }

            List<string> ComputerNames = new List<string>();

            DirectoryEntry entry = new DirectoryEntry("LDAP://" + domain + "");
            DirectorySearcher mySearcher = new DirectorySearcher(entry);
            mySearcher.Filter = ("(objectClass=computer)");
            mySearcher.SizeLimit = int.MaxValue;
            mySearcher.PageSize = int.MaxValue;

            foreach (SearchResult resEnt in mySearcher.FindAll())
            {
                //"CN=SGSVG007DC"
                string ComputerName = resEnt.GetDirectoryEntry().Name;
                if (ComputerName.StartsWith("CN="))
                    ComputerName = ComputerName.Remove(0, "CN=".Length);
                ComputerNames.Add(ComputerName);
            }

            mySearcher.Dispose();
            entry.Dispose();

            return ComputerNames;
        }

        public static bool CreateCluster(string clusterName, string clusterComputer, string clusterIP, string ignoreIP = "")
        {
            PSInvoker invoker = new PSInvoker();
            string createCluster = string.Empty;

            if (string.IsNullOrEmpty(ignoreIP))
            {
                createCluster = VanScript.CreateClusterNoIgnore(clusterName, clusterComputer, clusterIP);
            }

            try
            {
                Collection<PSObject> result = invoker.ExecuteCommand(createCluster);
            }
            catch (psInvokerException ex)
            {
                // logger.Debug("ex string : " + ex.);
                //logger.Debug("ex Message " + ex.Message);
                // logger.Debug("ex errorRecords " + (ex.errorRecords == null ? "false" : ex.errorRecords));
                logger.Debug("ex Data count: " + ex.Data.Count ?? "false");
                foreach (KeyValuePair<object, object> item in ex.Data)
                {
                    logger.Debug("ex data key: " + item.Key.ToString() + " ex.value " + item.Value.ToString());
                }


                //foreach (ErrorRecord item in ex.errorRecords)
                //{
                //    // Console.WriteLine(item.ToString());
                //    logger.Debug("psInvokerException : " + item.ToString());
                //}
                return false;
            }

            return false;
        }
    }
}
