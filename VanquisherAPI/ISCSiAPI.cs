using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.ObjectModel;
using System.Management.Automation;
using NLog;

namespace VanquisherAPI
{
    public class ISCSiAPI
    {
        static Logger logger = LogManager.GetCurrentClassLogger();

        public static bool IsIscsiConneted()
        {
            PSInvoker invoker = new PSInvoker();
            Collection<PSObject> result = invoker.ExecuteCommand(PowershellScript.IsIscsiConnected);
            return result.Count == 0 ? false : true;
        }

        public static bool IsPersistentConnetionType()
        {
            PSInvoker invoker = new PSInvoker();
            Collection<PSObject> result = invoker.ExecuteCommand(PowershellScript.GetIscsiSession);
            if (result.Count > 0 && (bool)result[0].Properties["IsPersistent"].Value == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static List<ISCSiInfo> GetVolumeInfo()
        {
            List<ISCSiInfo> info = new List<ISCSiInfo>();
            PSInvoker invoker = new PSInvoker();
            Collection<PSObject> result = invoker.ExecuteCommand(PowershellScript.GetIscsiInfo);

            if (result.Count == 0)
            {
                throw new Exception("No ISCSi connection.");
            }

            foreach (PSObject item in result)
            {
                int nubmer = int.Parse(item.Properties["Number"].Value.ToString());
                string friendlyName = Convert.ToString(item.Properties["FriendlyName"].Value);
                string operationalStatus = Convert.ToString(item.Properties["OperationalStatus"].Value);
                double partitionSize = double.Parse(item.Properties["Size"].Value.ToString()) / Math.Pow(1024, 3);
                info.Add(new ISCSiInfo(nubmer, friendlyName, operationalStatus, partitionSize));
            }
            return info;
        }

        public static bool InitializeDisk(int diskNumber)
        {
            PSInvoker invoker = new PSInvoker();
            try
            {
                Collection<PSObject> result = invoker.ExecuteCommand(PowershellScript.InitializeDisk(diskNumber));
                return result.Count == 1 ? true : false;
            }
            catch (psInvokerException ex)
            {
                foreach (ErrorRecord item in ex.errorRecords)
                {
                    Console.WriteLine(item.ToString());
                    logger.Debug("psInvokerException : " + item.ToString());
                }
                return false;
            }
            catch (Exception ex)
            {
                logger.Debug(ex.Message);
                return false;
            }
        }

        public static bool SetDiskOnline(int diskNumber)
        {
            PSInvoker invoker = new PSInvoker();

            try
            {
                Collection<PSObject> result = invoker.ExecuteCommand(PowershellScript.SetDiskOnline(diskNumber));
                return true;
            }
            catch (Exception ex)
            {
                logger.Debug("SetDiskOnline " + ex.ToString());
                return false;
            }
        }

        public static bool DiskAlready()
        {
            List<ISCSiInfo> info = GetVolumeInfo();
            foreach (ISCSiInfo item in info)
            {
                if (item.OperationalStatus != "1")
                {
                    return false;
                }
            }
            return true;
        }

    }

    public class ISCSiInfo
    {
        public int Number = 0;
        public string FriendlyName = string.Empty;
        public string OperationalStatus = string.Empty;
        public double PartitionSizeInGb = 0;
        public ISCSiInfo(int number, string friendlyName, string operationalStatus, double partitionSize)
        {
            this.Number = number;
            this.FriendlyName = friendlyName;
            this.OperationalStatus = operationalStatus;
            this.PartitionSizeInGb = partitionSize;
        }
    };
}
