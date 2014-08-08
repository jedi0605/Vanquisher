using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Management.Automation;
using System.Collections.ObjectModel;
using NLog;

namespace VanquisherAPI
{
    public class Utilite
    {
        static Logger logger = LogManager.GetCurrentClassLogger();

        public static void Reboot()
        {
            PSInvoker invoker = new PSInvoker();
            invoker.ExecuteCommand(VanScript.Reboot);
        }

        public static void Shutdown()
        {
            PSInvoker invoker = new PSInvoker();
            invoker.ExecuteCommand(VanScript.Shutdown);
        }

        public static bool EnablePsRemoting()
        {
            try
            {
                PSInvoker invoker = new PSInvoker();
                Collection<PSObject> result = invoker.ExecuteCommand(VanScript.EnablePsRemoting);
                return true;
            }
            catch (Exception ex)
            {
                logger.Debug("SetDiskOnline " + ex.ToString());
                return false;
            }
        }
    }
}
