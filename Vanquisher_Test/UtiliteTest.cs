using VanquisherAPI;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Management.Automation;
using System.Collections.ObjectModel;
using System.Management.Automation.Runspaces;

namespace Vanquisher_Test
{


    /// <summary>
    ///這是 UtiliteTest 的測試類別，應該包含
    ///所有 UtiliteTest 單元測試
    ///</summary>
    [TestClass()]
    public class UtiliteTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///取得或設定提供目前測試回合的相關資訊與功能
        ///的測試內容。
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region 其他測試屬性
        // 
        //您可以在撰寫測試時，使用下列的其他屬性:
        //
        //在執行類別中的第一項測試之前，先使用 ClassInitialize 執行程式碼
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //在執行類別中的所有測試之後，使用 ClassCleanup 執行程式碼
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //在執行每一項測試之前，先使用 TestInitialize 執行程式碼
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //在執行每一項測試之後，使用 TestCleanup 執行程式碼
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion



        /// <summary>
        ///AddPathToRegistry 的測試
        ///</summary>
        [TestMethod()]
        public void AddPathToRegistryTest()
        {
            string programName = "5nine Manager for Hyper-V";
            string path = "c:\\";
            Utilite.AddPathToRegistry(programName, path);
        }


        [TestMethod()]
        public void GetVirtualSwitchTest()
        {

            RunspaceInvoke invoker = new RunspaceInvoke();
            invoker.Invoke("Set-ExecutionPolicy Unrestricted");
            string mainScript = VanScript.CreateVirtualSwitch("乙太網路","vAccess");
            string password = "Passw0rd";
            string VMIP = "172.16.93.51";
            invoker.Invoke("Set-Item WSMan:\\localhost\\Client\\TrustedHosts " + VMIP + " -Concatenate -force");
            string injectScript = @"$username = ""User""
                                            $account = ""administrator""
                                            $password = ConvertTO-SecureString """ + password + @""" -asplaintext -Force
                                            $cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $account, $password
                                            Invoke-Command -ComputerName " + VMIP + @" -Authentication default" +
                            @" -credential $cred " +
                            @" -ScriptBlock {" + mainScript + "}";


            string output = "";
            Runspace runspace = RunspaceFactory.CreateRunspace();
            runspace.Open();
            Pipeline pipeline = runspace.CreatePipeline();
            pipeline.Commands.AddScript(injectScript);
            pipeline.Commands.Add("Out-String");
            try
            {
                Collection<PSObject> result = pipeline.Invoke();
                string test = result.ToString();
                foreach (PSObject item in result)
                {
                    Console.WriteLine(item.Properties["Name"]);
                }


            }
            catch (Exception ex)
            {
                throw ex;
            }
            runspace.Close();
        }

        [TestMethod()]
        public void ISCSITest()
        {

            RunspaceInvoke invoker = new RunspaceInvoke();
            invoker.Invoke("Set-ExecutionPolicy Unrestricted");
            string mainScript = VanScript.GetIscsiInfo;
            string password = "Passw0rd";
            string VMIP = "172.16.93.51";
            invoker.Invoke("Set-Item WSMan:\\localhost\\Client\\TrustedHosts " + VMIP + " -Concatenate -force");
            string injectScript = @"$username = ""User""
                                            $account = ""administrator""
                                            $password = ConvertTO-SecureString """ + password + @""" -asplaintext -Force
                                            $cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $account, $password
                                            Invoke-Command -ComputerName " + VMIP + @" -Authentication default" +
                            @" -credential $cred " +
                            @" -ScriptBlock {" + mainScript + "}";


            string output = "";
            Runspace runspace = RunspaceFactory.CreateRunspace();
            runspace.Open();
            Pipeline pipeline = runspace.CreatePipeline();
            pipeline.Commands.AddScript(injectScript);
            pipeline.Commands.Add("Out-String");
            try
            {
                Collection<PSObject> result = pipeline.Invoke();
                string test = result.ToString();
                foreach (PSObject item in result)
                {
                    Console.WriteLine(item.Properties["Name"]);
                }


            }
            catch (Exception ex)
            {
                throw ex;
            }
            runspace.Close();
        }
    }
}
