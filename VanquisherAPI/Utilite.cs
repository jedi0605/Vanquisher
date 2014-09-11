using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Management.Automation;
using System.Collections.ObjectModel;
using NLog;

namespace VanquisherAPI
{
    public class InstallResult
    {
        public bool Success = false;
        public bool RestartNeeded = false;
        public WindownsFeature FeatureName = WindownsFeature.Error;
        public InstallResult(WindownsFeature FeatureName, bool Success, bool RestartNeeded)
        {
            this.FeatureName = FeatureName;
            this.Success = Success;
            this.RestartNeeded = RestartNeeded;
        }

        public string GetResult()
        {
            string output = "FeatureName:" + this.FeatureName.ToString() + ". Success:" + this.Success.ToString() + ". RestartNeeded:" + this.RestartNeeded.ToString();
            return output;
        }
    }

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
                Collection<PSObject> result;
                try
                {
                    result = invoker.ExecuteCommand(VanScript.ChangeNetworkToPrivate);
                }
                catch (Exception ex) { logger.Debug("EnablePsRemoting  ChangeNetworkToPrivate error:" + ex.ToString()); }

                result = invoker.ExecuteCommand(VanScript.EnablePsRemoting);
                result = invoker.ExecuteCommand(VanScript.FirewallPsRemoting);
                return true;
            }
            catch (Exception ex)
            {
                logger.Debug("EnablePsRemoting " + ex.ToString());
                return false;
            }
        }

        public static bool EnableRemoteControle()
        {
            try
            {
                PSInvoker invoker = new PSInvoker();
                Collection<PSObject> result = invoker.ExecuteCommand(VanScript.FirewallRemoteManagement);
                result = invoker.ExecuteCommand(VanScript.FirewallRemoteDisk);
                result = invoker.ExecuteCommand(VanScript.FirewallPing);
                return true;
            }
            catch (psInvokerException ex)
            {
                string exceptionString = string.Empty;
                foreach (PSObject item in ex.errorRecords)
                {
                    exceptionString = item.ToString();
                    logger.Error("Enable Remote Controle psInvokerException : " + item.ToString());
                    break;
                }
                throw new Exception(exceptionString);
            }
            catch (Exception ex)
            {
                logger.Error("Enable Remote Controle fail : " + ex.ToString());
                throw new Exception(ex.ToString());
            }
        }

        public static List<InstallResult> InstallGPUFeature()
        {
            List<InstallResult> installResult = new List<InstallResult>();
            try
            {
                PSInvoker invoker = new PSInvoker();
                Collection<PSObject> result = invoker.ExecuteCommand(VanScript.InstallRemoteDesktopServices);
                bool success = Convert.ToBoolean(result[0].Members["Success"].Value);
                bool RestartNeeded = result[0].Members["RestartNeeded"].Value.ToString().ToLower().Contains("yes") ? true : false;
                installResult.Add(new InstallResult(WindownsFeature.RemoteDesktopServices, success, RestartNeeded));


                result = invoker.ExecuteCommand(VanScript.InstallRDSFeature);
                success = Convert.ToBoolean(result[0].Members["Success"].Value);
                RestartNeeded = result[0].Members["RestartNeeded"].Value.ToString().ToLower().Contains("yes") ? true : false;
                installResult.Add(new InstallResult(WindownsFeature.RemoteDesktopServices, success, RestartNeeded));

                logger.Debug("install result:" + installResult[0].GetResult());
                logger.Debug("install result:" + installResult[1].GetResult());
                return installResult;
            }
            catch (psInvokerException ex)
            {
                string exceptionString = string.Empty;
                foreach (PSObject item in ex.errorRecords)
                {
                    exceptionString = item.ToString();
                    logger.Error("Install GPU feature fail psInvokerException : " + item.ToString());
                    break;
                }
                throw new Exception(exceptionString);
            }
            catch (Exception ex)
            {
                logger.Error("Install GPU feature fail : " + ex.ToString());
                throw new Exception(ex.ToString());
            }
        }
    }
}
