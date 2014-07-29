using VanquisherAPI;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;

namespace Vanquisher_Test
{


    /// <summary>
    ///這是 ModuleCheckerTest 的測試類別，應該包含
    ///所有 ModuleCheckerTest 單元測試
    ///</summary>
    [TestClass()]
    public class ModuleCheckerTest
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
        ///CheckHyperVModule 的測試
        ///</summary>
        [TestMethod()]
        public void CheckHyperVModuleTest()
        {
            Dictionary<int, string> result;
            result = ModuleChecker.GetInstallModule();
            Assert.IsTrue(result.Count > 0);
        }

        /// <summary>
        ///CheckModuleInstall 的測試 before testing, should install
        ///</summary>
        [TestMethod()]
        public void CheckModuleInstallTest()
        {
            WindownsFeature[] checkModule = { WindownsFeature.WindowsPowerShell, WindownsFeature.Error };
            Dictionary<string, bool> actual;

            actual = ModuleChecker.CheckModuleInstall(checkModule);
            Assert.IsTrue(actual[checkModule[0].ToString()]);
            Assert.IsFalse(actual[checkModule[1].ToString()]);
        }

    }
}
