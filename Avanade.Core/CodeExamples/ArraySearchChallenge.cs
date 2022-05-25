using System;
using System.Collections.Generic;
using System.Text;

namespace CodeExamples
{
    public class ArraySearchChallenge
    {
        /// <summary>
        /// For a given array with the numbers from 1..100
        /// The array is sorted
        /// An item has been removed.
        /// Find and Return that item
        /// </summary>
        /// <param name="items"></param>
        /// <returns></returns>
        public int FindMissingNumberInSortedArray(int[] items) 
        {
            var totalSumOfNumbers = 0;
            var totalSumOfNumbersInArray = 0;

            for (int i = 1; i < 100; i ++)
                totalSumOfNumbers += i;

            for (int i = 0; i < items.Length; i++)
                totalSumOfNumbersInArray += items[i];

            return totalSumOfNumbers - totalSumOfNumbersInArray;
        }

        public int FindMissingNumberInSortedArray2(int[] items)
        {
            var totalSumOfNumbersInArray = 0;

            for (int i = 0; i < items.Length; i++)
                totalSumOfNumbersInArray += items[i];

            return 5050 - totalSumOfNumbersInArray;
        }

        public int FindMissingNumberInSortedArray3(int[] items)
        {
            for (int i = 1; i < items.Length; i++)
                if (items[i - 1] + 1 != items[1])
                    return i;

            return -1;
        }


        /// <summary>
        /// For a given array with the numbers from 1..100
        /// The array is NOT sorted
        /// An item has been removed.
        /// Find and Return that item
        /// </summary>
        /// <param name="items"></param>
        /// <returns></returns>
        public int FindMissingNumberInArray(int[] items) { return 0; }


        /// <summary>
        /// For a given array with the numbers from x..y
        /// The array is NOT sorted
        /// An item has been removed.
        /// Find and Return that item
        /// </summary>
        /// <param name="items"></param>
        /// <returns></returns>
        public int FindMissingNumberInArrayUnKnownSizes(int[] items) { return 0; }
    }
}
