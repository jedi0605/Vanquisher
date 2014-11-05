using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.ObjectModel;
using System.Management.Automation;
using NLog;

namespace VanquisherAPI
{
    public class VirtualSwitch
    {
        static Logger logger = LogManager.GetCurrentClassLogger();
        public static bool VirtualSwitchExist()
        {
            PSInvoker invoker = new PSInvoker();
            Collection<PSObject> serviceResult = invoker.ExecuteCommand(VanScript.GetVirtualSwitchInfo);
            string switchInfo = string.Empty;

            foreach (PSObject item in serviceResult)
            {
                switchInfo += item.ToString();
            }

            return switchInfo.ToLower().Contains(VanScript.VirtaulSwitchName) ? true : false;
        }

        public static bool CreateVSwitch(string adapterName)
        {
            PSInvoker invoker = new PSInvoker();
            logger.Debug("init Script :" + VanScript.CreateVirtualSwitch(adapterName));
            Collection<PSObject> serviceResult = invoker.ExecuteCommand(VanScript.CreateVirtualSwitch(adapterName));
            return true;
        }
    }
}
