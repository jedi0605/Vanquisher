using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Management.Automation;
using NLog;

namespace VanquisherAPI
{
    public class CheckServiceEnable
    {
        static Logger logger = LogManager.GetCurrentClassLogger();
        public static bool CheckRDPServiceIsEnable()
        {
            PSInvoker invoker = new PSInvoker();
            Collection<PSObject> result = invoker.ExecuteCommand(VanScript.CheckRDPfDeny);
            string rdpfDeny = result[0].ToString();
            result = invoker.ExecuteCommand(VanScript.RDPAuthentication);
            string rdpAuthentication = result[0].ToString();

            if (string.Equals("0", rdpfDeny) && string.Equals("0", rdpAuthentication))
            {
                logger.Debug("RDP in success.");
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool CheckWinRMServiceIsEnable()
        {
            PSInvoker invoker = new PSInvoker();
            Collection<PSObject> serviceResult = invoker.ExecuteCommand(VanScript.GetWinRMStatus);
            Collection<PSObject> isListening = invoker.ExecuteCommand(VanScript.CheckWinRMIsListening);

            if (serviceResult.Count == 0 || isListening.Count == 0)
            {
                return false;
            }

            string status = serviceResult[0].Properties["status"].Value.ToString();
            if (string.Equals(status, "Running"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        // less firewall check
        public static bool CheckRemoteControleEnable()
        {
            return NetworkInPrivate() && CheckPsRemote() && GetPsRemotingFirewallStatus();
        }

        public static bool NetworkInPrivate()
        {
            PSInvoker invoker = new PSInvoker();
            Collection<PSObject> serviceResult = invoker.ExecuteCommand(VanScript.GetNetworkType);
            int networkCount = serviceResult.Where(s => int.Parse(s.ToString()) != 0).Count();
            logger.Debug("Network count : " + networkCount);
            return networkCount > 0 ? true : false;
        }

        private static bool CheckPsRemote()
        {
            PSInvoker invoker = new PSInvoker();
            try
            {
                Collection<PSObject> serviceResult = invoker.InvokeCommand("localhost", "1", false);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool GetPsRemotingFirewallStatus()
        {
            PSInvoker invoker = new PSInvoker();
            Collection<PSObject> serviceResults = invoker.ExecuteCommand(VanScript.FirewallPsRemotingStatus);
            foreach (PSObject item in serviceResults)
            {
                if (!bool.Parse(item.Properties["Enabled"].Value.ToString()))
                {
                    return false;
                }

            }
            return true;
        }
    }
}
