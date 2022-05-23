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
            return b - a;
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
            var opSubs = "-";
            var opMult = "*";
            var opMDiv = ".";

            if (operation.Contains(opSum.ToString()))
            {
                var divideItems = operation.Split(opSum);
                var op1 = Int32.Parse(divideItems[0]);
                var op2 = Int32.Parse(divideItems[1]);

                return this.Sum(op1, op2);
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
        public int ChainMany(string operation) { throw new NotImplementedException(); }
    }
}
