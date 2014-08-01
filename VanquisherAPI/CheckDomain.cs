using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.ObjectModel;
using System.Management.Automation;

namespace VanquisherAPI
{
    public class CheckDomain
    {
        public static bool IsJoinDomain()
        {
            PSInvoker invoker = new PSInvoker();
            Collection<PSObject> result = invoker.ExecuteCommand( PowershellScript.GetDomain);
            string domainInfo = result[0].ToString();
            if (string.Compare(domainInfo, "WORKGROUP", true) == 0)
                return false;
            else
                return true;
        }
    }
}
