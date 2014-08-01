﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Management.Automation;

namespace VanquisherAPI
{
    public class CheckServiceEnable
    {
        public static bool CheckRDPServiceIsEnable()
        {
            PSInvoker invoker = new PSInvoker();
            Collection<PSObject> result = invoker.ExecuteCommand(PowershellScript.CheckRDPfDeny);
            string rdpfDeny = result[0].ToString();
            result = invoker.InvokeCommand("localhost", PowershellScript.RDPAuthentication, false);
            string rdpAuthentication = result[0].ToString();

            if (string.Equals("0", rdpfDeny) && string.Equals("0", rdpAuthentication))
            {
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
            Collection<PSObject> serviceResult = invoker.ExecuteCommand(PowershellScript.GetWinRMStatus);
            Collection<PSObject> isListening = invoker.ExecuteCommand(PowershellScript.CheckWinRMIsListening);

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
    }
}
