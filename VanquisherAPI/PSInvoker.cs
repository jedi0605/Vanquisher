using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Management.Automation.Runspaces;
using System.Management.Automation;
using System.Collections.ObjectModel;
using System.Security;

/// <summary>
/// psInvoker 的摘要描述
/// </summary>
namespace VanquisherAPI
{
    public class PSInvoker
    {

        private Runspace runspace;
        private PSCredential psCredential = null;
        public PSInvoker()
        {
            runspace = RunspaceFactory.CreateRunspace();
            runspace.Open();
        }
        public PSInvoker(string account, string password)
            : this()
        {
            setPSCredential(account, password);
        }
        ~PSInvoker()
        {
            //System.Net.CredentialCache.DefaultCredentials.GetCredential()        
            runspace.Close();
            runspace.Dispose();
        }
        public void setPSCredential(string account, string password)
        {
            try
            {
                SecureString psw = new SecureString();
                foreach (char c in password)
                {
                    psw.AppendChar(c);
                }
                psCredential = new PSCredential(account, psw);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Invoke-command
        /// </summary>
        /// <param name="serverName">Computer name</param>
        /// <param name="script">Script to run</param>
        /// <param name="SSP">Use CredSSP Authentication(帶Credential到目標電腦執行,false則以powershell user執行)</param>
        /// <returns></returns>
        public Collection<PSObject> invokeCommand(string serverName, string script, bool SSP)
        {
            Pipeline p = runspace.CreatePipeline();
            Command command = new Command("invoke-command");
            command.Parameters.Add("computername", serverName);
            command.Parameters.Add("scriptblock", ScriptBlock.Create(script));
            if (psCredential != null)
                command.Parameters.Add("credential", psCredential);
            if (SSP)
                command.Parameters.Add("Authentication", "credssp");
            p.Commands.Add(command);
            try
            {
                Collection<PSObject> o = p.Invoke();
                return o;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                p.Dispose();
            }
        }

    }
    public class psInvokerException : Exception
    {
        public psInvokerException()
            : base()
        {
        }
        public psInvokerException(string message) : base(message) { }
    }
}