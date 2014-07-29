﻿using System;
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
                Console.WriteLine(p.Error.ToString());

                if (p.Error.Count > 0)
                {
                    ICollection<ErrorRecord> erCollection= new ErrorRecord[p.Error.Count];
                    erCollection.Concat(p.Error.ReadToEnd());
                    throw new psInvokerException(erCollection);
                }
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
        public ICollection<ErrorRecord> errorRecords { get; private set; }

        public psInvokerException(ICollection<ErrorRecord> errorRecords,string exMessage)
            : base(exMessage)
        {
            this.errorRecords = errorRecords;
        }

        public psInvokerException(ICollection<ErrorRecord> message) : base() 
        {
            this.errorRecords = errorRecords;
        }
    }
}