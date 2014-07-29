using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Management;
using NLog;

namespace VanquisherAPI
{
    public class ModuleChecker
    {
        /// <summary>
        /// iSCSI need install module 6 , 435
        /// Hyper-V 20
        /// Cluster ??
        /// </summary>
        /// <param name="moduleId"></param>
        /// <returns></returns>
        static Logger logger = LogManager.GetCurrentClassLogger();

        public static Dictionary<string, bool> CheckModuleInstall(WindownsFeature[] featureName)
        {
            Dictionary<int, string> installedModul = GetInstallModule();
            Dictionary<string, bool> installResult = new Dictionary<string, bool>();

            //init result
            foreach (WindownsFeature item in featureName)
            {
                bool moduleInstalled = false;
                if (installedModul.ContainsKey((int)item))
                {
                    moduleInstalled = true;                    
                }
                installResult.Add(item.ToString(), moduleInstalled);
            }
            return installResult;
        }

        /// <summary>
        /// get installed module
        /// </summary>
        /// <returns></returns>
        public static Dictionary<int, string> GetInstallModule()
        {
            Dictionary<int, string> moduleIDName = new Dictionary<int, string>();
            ManagementClass objMC = new ManagementClass("Win32_ServerFeature");

            ManagementObjectCollection objMOC = objMC.GetInstances();
            foreach (ManagementObject objMO in objMOC)
            {
                string featureID = objMO.Properties["ID"].Value.ToString();
                string featureName = (string)objMO.Properties["Name"].Value;
                moduleIDName.Add(int.Parse(featureID), featureName);
                Console.WriteLine(featureID + " :" + featureName);
                logger.Debug(featureID + " :" + featureName);
            }
            return moduleIDName;
        }
    }
}
