using CodeExamples;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace Tests
{
    [TestClass]
    public class Calculator_Tests
    {
        [TestMethod]
        public void TestSum()
        {
            var calculator = new Calculator();
            
            var result = calculator.Sum(1, 2);
            Assert.AreEqual(3, result);

            result = calculator.Sum(10, 12);
            Assert.AreEqual(22, result);
        }
    }
}
