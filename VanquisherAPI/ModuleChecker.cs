using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Management;

namespace VanquisherAPI
{
    public class ModuleChecker
    {
        /// <summary>
        /// iSCSI module 6, 435.
        /// </summary>
        /// <param name="moduleId"></param>
        /// <returns></returns>
        public static bool CheckModuleInstall(int[] moduleId, out int noneInstall)
        {
            Dictionary<string, string> installedModul = GetInstallModule();
            noneInstall = 0;
            foreach (int item in moduleId)
            {
                if (!installedModul.ContainsKey(item.ToString()))
                {
                    noneInstall = item;
                    return false;
                }
            }
            return true;
        }

        public static Dictionary<string, string> GetInstallModule()
        {
            Dictionary<string, string> moduleIDName = new Dictionary<string, string>();
            ManagementClass objMC = new ManagementClass("Win32_ServerFeature");

            ManagementObjectCollection objMOC = objMC.GetInstances();
            foreach (ManagementObject objMO in objMOC)
            {
                string featureID = objMO.Properties["ID"].Value.ToString();
                string featureName = (string)objMO.Properties["Name"].Value;
                moduleIDName.Add(featureID, featureName);
                Console.WriteLine(featureID + " :" + featureName);
            }
            return moduleIDName;
        }
    }
}
