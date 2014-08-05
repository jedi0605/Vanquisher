using VanquisherAPI;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;

namespace Vanquisher_Test
{


    /// <summary>
    ///這是 ISCSiAPITest 的測試類別，應該包含
    ///所有 ISCSiAPITest 單元測試
    ///</summary>
    [TestClass()]
    public class ISCSiAPITest
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
        ///IsIscsiConneted 的測試
        ///</summary>
        [TestMethod()]
        public void IsIscsiConnetedTest()
        {
            bool expected = true; // TODO: 初始化為適當值
            bool actual;
            actual = ISCSiAPI.IsIscsiConneted();
            Assert.AreEqual(expected, actual);
        }

        /// <summary>
        ///IsPersistentConnetionType 的測試
        ///</summary>
        [TestMethod()]
        public void IsPersistentConnetionTypeTest()
        {
            bool expected = true; // TODO: 初始化為適當值
            bool actual;
            actual = ISCSiAPI.IsPersistentConnetionType();
            Assert.AreEqual(expected, actual);
        }

        /// <summary>
        ///GetVolumeInfo 的測試
        ///</summary>
        [TestMethod()]
        public void GetVolumeInfoTest()
        {
            List<ISCSiInfo> actual;
            actual = ISCSiAPI.GetVolumeInfo();
            Assert.IsTrue(actual.Count > 0);
        }

        /// <summary>
        ///InitializeDisk 的測試
        ///</summary>
        [TestMethod()]
        public void InitializeDiskTest()
        {
            int diskNumber = 0; // TODO: 初始化為適當值
            bool expected = false; // TODO: 初始化為適當值
            bool actual;
            actual = ISCSiAPI.InitializeDisk(diskNumber);
            Assert.AreEqual(expected, actual);
        }

        /// <summary>
        ///SetDiskOnline 的測試
        ///</summary>
        [TestMethod()]
        public void SetDiskOnlineTest()
        {
            int diskNumber = 2; // TODO: 初始化為適當值
            bool expected = true; // TODO: 初始化為適當值
            bool actual;
            actual = ISCSiAPI.SetDiskOnline(diskNumber);
            Assert.AreEqual(expected, actual);
        }

        /// <summary>
        ///DiskAlready 的測試
        ///</summary>
        [TestMethod()]
        public void DiskAlreadyTest()
        {
            bool expected = false; // TODO: 初始化為適當值
            bool actual;
            actual = ISCSiAPI.DisksAlready();
            Assert.AreEqual(expected, actual);
        }
    }
}
