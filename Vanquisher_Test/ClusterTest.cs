using VanquisherAPI;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;

namespace Vanquisher_Test
{


    /// <summary>
    ///這是 ClusterTest 的測試類別，應該包含
    ///所有 ClusterTest 單元測試
    ///</summary>
    [TestClass()]
    public class ClusterTest
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
        ///GetADComputerList 的測試
        ///</summary>
        [TestMethod()]
        public void GetADComputerListTest()
        {
            List<string> actual;
            actual = Cluster.GetADComputerList();
            Assert.IsTrue(actual.Count > 0);

        }

        /// <summary>
        ///CreateCluster 的測試
        ///</summary>
        [TestMethod()]
        public void CreateClusterTest()
        {
            string clusterName = "test";
            string clusterComputer = "test";
            string clusterIP = "172.16.1.1";
            string ignoreIP = string.Empty; // TODO: 初始化為適當值
            bool expected = false; // TODO: 初始化為適當值
            bool actual;
            actual = Cluster.CreateCluster(clusterName, clusterComputer, clusterIP, ignoreIP);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("驗證這個測試方法的正確性。");
        }
    }
}
