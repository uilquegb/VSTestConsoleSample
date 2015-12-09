using System;
using Microsoft.VisualStudio.TestPlatform.UnitTestFramework;
using VSTestConsoleSample.WP.App;

namespace VSTestConsoleSample.WP.Tests
{
    [TestClass]
    public class BankAccountTests
    {
        [TestMethod]
        public void Debit_WithValidAmount_UpdatesBalance_App()
        {
            // arrange
            double beginningBalance = 11.99;
            double debitAmount = 4.55;
            double expected = 7.44;

            BankAccount account = new BankAccount("New Customer", beginningBalance);

            // act
            account.Debit(debitAmount);

            //assert
            double actual = account.Balance;
            Assert.AreEqual(expected, actual, 0.001, "Account not debited corrected");
        }
    }
}
