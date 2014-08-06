using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VanquisherAPI
{
    public class Utilite
    {
        public static void Reboot()
        {
            PSInvoker invoker = new PSInvoker();
            invoker.ExecuteCommand(VanScript.Reboot);
        }
    }
}
