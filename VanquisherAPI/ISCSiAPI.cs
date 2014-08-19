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
            Collection<PSObject> result = invoker.ExecuteCommand(VanScript.IsIscsiConnected);
            return result.Count == 0 ? false : true;
        }

        /// <summary>
        /// one iscsi fit  QQ.
        /// </summary>
        /// <returns></returns>
        public static bool IsPersistentConnetionType()
        {
            PSInvoker invoker = new PSInvoker();
            Collection<PSObject> result = invoker.ExecuteCommand(VanScript.GetIscsiSession);
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
            Collection<PSObject> result = invoker.ExecuteCommand(VanScript.GetIscsiInfo);

            if (result.Count == 0)
            {
                throw new Exception("No ISCSi connection.");
            }

            foreach (PSObject item in result)
            {
                int nubmer = int.Parse(item.Properties["Number"].Value.ToString());
                string friendlyName = Convert.ToString(item.Properties["FriendlyName"].Value);
                bool isOffline = bool.Parse(item.Properties["Isoffline"].Value.ToString());
                double partitionSize = double.Parse(item.Properties["Size"].Value.ToString()) / Math.Pow(1024, 3);
                info.Add(new ISCSiInfo(nubmer, friendlyName, isOffline, partitionSize));
            }
            return info;
        }

        public static bool InitializeDisk(int diskNumber)
        {
            PSInvoker invoker = new PSInvoker();
            try
            {
                string initScript = VanScript.InitializeDisk(diskNumber);
                logger.Debug("init Script :" + initScript);
                Collection<PSObject> result = invoker.ExecuteCommand(initScript);
                // return result.Count == 1 ? true : false;
                return true;
            }
            catch (psInvokerException ex)
            {
                //foreach (ErrorRecord item in ex.errorRecords)
                //{
                //    Console.WriteLine(item.ToString());
                //    logger.Debug("psInvokerException : " + item.ToString());
                //}
                return true;
            }
            catch (Exception ex)
            {
                logger.Debug("InitializeDisk fail : " + ex.Message);
                return true;
            }
        }

        public static bool SetDiskStatus(int diskNumber, bool online)
        {
            PSInvoker invoker = new PSInvoker();

            try
            {
                if (online)
                {
                    Collection<PSObject> result = invoker.ExecuteCommand(VanScript.SetDiskOnline(diskNumber));
                }
                else
                {
                    Collection<PSObject> result = invoker.ExecuteCommand(VanScript.SetDiskOffline(diskNumber));
                }
                return true;
            }
            catch (Exception ex)
            {
                logger.Debug("SetDiskOnline " + ex.ToString());
                return false;
            }
        }

        public static bool DisksAlready()
        {
            try
            {
                List<ISCSiInfo> info = GetVolumeInfo();
                foreach (ISCSiInfo item in info)
                {
                    if (item.IsOffline)
                    {
                        return false;
                    }
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

    }

    public class ISCSiInfo
    {
        public int Number = 0;
        public string FriendlyName = string.Empty;
        public bool IsOffline = true;
        public double PartitionSizeInGb = 0;
        public ISCSiInfo(int number, string friendlyName, bool isOffline, double partitionSize)
        {
            this.Number = number;
            this.FriendlyName = friendlyName;
            this.IsOffline = isOffline;
            this.PartitionSizeInGb = partitionSize;
        }
    };
}
