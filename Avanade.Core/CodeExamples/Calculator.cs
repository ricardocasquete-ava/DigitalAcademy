using System;

namespace CodeExamples
{
    public class Calculator
    {
        /// <summary>
        /// Sums Two Numbers
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public int Sum(int a, int b)
        {
            return a + b;
        }

        /// <summary>
        /// Substract a Number from a given number. Fist Number has to be bigger than the second number.
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public int Substracts(int a, int b)
        {
            return a-b;
        }

        /// <summary>
        /// Multiply two numbers
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public int Multiply(int a, int b) { return  a*b; }

        /// <summary>
        /// Divide a Number from a given number. First Number has to be bigger than the second number
        /// The result will be an integer number.
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public int Divide(int a, int b) 
        {
            if (b == 0)
                throw new ArithmeticException("A value cannot be divided by 0");

            if (b <= 0)
                throw new ArgumentException("This calculator ony deals with positive numbers");

            return a / b;
        }

        /// <summary>
        /// Perform Operations in the Chain of 2 elements
        /// 2+2 will return 4
        /// 4*2 will return 8
        /// ...
        /// </summary>
        /// <param name="operation"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public int Chain2(string operation) 
        {
            var opSum = '+';
            var opSubs = '-';
            var opMult = '*';
            var opMDiv = '/';

            if (operation.Contains(opSum.ToString()))
            {
                var divideItems = operation.Split(opSum);
                var op1 = Int32.Parse(divideItems[0]);
                var op2 = Int32.Parse(divideItems[1]);

                return this.Sum(op1, op2);
            }

            if (operation.Contains(opSubs.ToString()))
            {
                var divideItems = operation.Split(opSubs);
                var op1 = Int32.Parse(divideItems[0]);
                var op2 = Int32.Parse(divideItems[1]);

                return this.Substracts(op1, op2);
            }

            if (operation.Contains(opMult.ToString()))
            {
                var divideItems = operation.Split(opMult);
                var op1 = Int32.Parse(divideItems[0]);
                var op2 = Int32.Parse(divideItems[1]);

                return this.Multiply(op1, op2);
            }

            if (operation.Contains(opMDiv.ToString()))
            {
                var divideItems = operation.Split(opMDiv);
                var op1 = Int32.Parse(divideItems[0]);
                var op2 = Int32.Parse(divideItems[1]);

                return this.Divide(op1, op2);
            }

            return 0;
        }

        /// <summary>
        /// Perform Operations in the Chain of many elements
        /// 2+2-1 will return 3
        /// 4*2-1 will return 7
        /// 10-1-2*2 will return 5
        /// </summary>
        /// <param name="operation"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        //public int ChainMany(string operation)
        //{
        //    if (string.IsNullOrEmpty(operation))
        //        return 1;

        //    var left = this.getLeft(operation);
        //    var right = this.getRight(operation.Substring(operation.Length + 1));

        //    var operationIndex = operation.IndexOfAny(new char[] { '+', '-', '*', '/');
        //    if (operationIndex >= 0)
        //    {
        //        var left = operation.Substring(0,operationIndex);
        //        var right = operation.Substring(operationIndex+1);
        //    }

        //    return 0;
        //}

        //private string getLeft(string operation)
        //{
        //    var operationIndex = operation.IndexOfAny(new char[] { '+', '-', '*', '/');
        //    if (operationIndex >= 0)
        //    {
        //        return operation.Substring(0,operationIndex);
        //    }

        //    return string.Empty;
        //}

        //private string getRight(string operation, int index)
        //{
        //    var operand = this.getLeft(operation.Substring(index +1));
        //    return operand;
        //}

    }
}
