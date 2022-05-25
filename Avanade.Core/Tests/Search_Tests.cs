using CodeExamples;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Tests
{
    [TestClass]
    public class Search_Tests
    {
        [TestMethod]
        public void Find_InSortedArray()
        {
            var listOfNumbers = new List<int>();
            for(int i = 1; i <= 100; i++)
                listOfNumbers.Add(i);

            var itemRemoved = new Random().Next(1, 99);
            listOfNumbers.RemoveAt(itemRemoved-1);

            var searchChallenge = new ArraySearchChallenge();
            var result = searchChallenge.FindMissingNumberInSortedArray(listOfNumbers.ToArray());

            Assert.AreEqual(itemRemoved, result);
        }


        [TestMethod]
        public void Find_InNOTSortedArray()
        {
            int[] numbers = new int[] { 1, 3, 5, 2, 4, 7, 6, 10, 12, 15, 18, 11, 20, 13, 8, 9, 14, 16, 18, 17, 19 };
            var listOfNumbers = numbers.ToList();

            var itemRemoved = new Random().Next(1, 19);
            listOfNumbers.RemoveAt(itemRemoved - 1);

            var searchChallenge = new ArraySearchChallenge();
            var result = searchChallenge.FindMissingNumberInSortedArray(listOfNumbers.ToArray());

            Assert.AreEqual(itemRemoved, result);
        }


        [TestMethod]
        public void Find_InArray()
        {

        }
    }
}
