using CodeExamples;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace Tests
{
    [TestClass]
    public class Calculator_Tests
    {
        Calculator calculator;
        
        [TestInitialize]
        public void init()
        {
            calculator = new Calculator();
        }

        [TestMethod]
        public void TestSum()
        {
            var result = calculator.Sum(1, 2);
            Assert.AreEqual(3, result);

            result = calculator.Sum(10, 12);
            Assert.AreEqual(22, result);
        }

        [TestMethod]
        public void TestSubstract()
        {
            var result = calculator.Substracts(5, 2);
            Assert.AreEqual(3, result);

            result = calculator.Substracts(20, 12);
            Assert.AreEqual(8, result);
        }

        [TestMethod]
        public void TestMultiply()
        {
            var result = calculator.Multiply(5, 2);
            Assert.AreEqual(10, result);

            result = calculator.Multiply(20, 12);
            Assert.AreEqual(240, result);
        }

        [TestMethod]
        public void TestDivide_Sucess()
        {
            var result = calculator.Divide(10, 2);
            Assert.AreEqual(5, result);

            result = calculator.Divide(20, 4);
            Assert.AreEqual(5, result);
        }


        [TestMethod]
        public void TestDivide_Faile()
        {
            var result = calculator.Divide(10, 2);
            Assert.AreNotEqual(25, result);

            result = calculator.Divide(20, 4);
            Assert.AreNotEqual(25, result);
        }

        [TestMethod]
        public void TestDivide_Fail_DivdieByZero()
        {
            Assert.ThrowsException<ArithmeticException>(() => calculator.Divide(5, 0));
        }


        [TestMethod]
        public void TestDivide_Fail_DivdieByNegative()
        {
            Assert.ThrowsException<ArgumentException>(() => calculator.Divide(5, -1));
        }

        [TestMethod]
        public void Chain2_add()
        {
            var result = calculator.Chain2("5+12");
            Assert.AreEqual(17, result);
        }

        [TestMethod]
        public void Chain2_substract()
        {
            var result = calculator.Chain2("12-5");
            Assert.AreEqual(7, result);

        }

        [TestMethod]
        public void Chain2_Multiply()
        {
            var result = calculator.Chain2("4*5");
            Assert.AreEqual(20, result);

        }

        [TestMethod]
        public void Chain2_divide()
        {
            var result = calculator.Chain2("10/2");
            Assert.AreEqual(5, result);
        }
    }
}
