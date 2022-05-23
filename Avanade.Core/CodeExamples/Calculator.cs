using System;

namespace Avanade.Core.Library
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
        public int Sum(int a, int b) { throw new NotImplementedException(); }

        /// <summary>
        /// Substract a Number from a given number. Fist Number has to be bigger than the second number.
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public int Substracts(int a, int b) { throw new NotImplementedException(); }

        /// <summary>
        /// Multiply two numbers
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public int Multiply(int a, int b) { throw new NotImplementedException(); }

        /// <summary>
        /// Divide a Number from a given number. First Number has to be bigger than the second number
        /// The result will be an integer number.
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public int Divide(int a, int b) { throw new NotImplementedException(); }

        /// <summary>
        /// Perform Operations in the Chain of 2 elements
        /// 2+2 will return 4
        /// 4*2 will return 8
        /// ...
        /// </summary>
        /// <param name="operation"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public int Chain2(string operation) { throw new NotImplementedException(); }

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
