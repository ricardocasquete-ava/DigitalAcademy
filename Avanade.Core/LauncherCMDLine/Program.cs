using CodeExamples;
using System;

namespace LauncherCMDLine
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var pyramidHeigh = new Random().Next(2, 10);
            var pyramid = new Pyramids();

            Console.WriteLine("Half Pymraid");
            pyramid.WriteHalfPiramid(pyramidHeigh);

            Console.WriteLine("Full Pymraid");
            pyramid.WritePiramid(pyramidHeigh);

            Console.WriteLine("Full Numeric Pymraid");
            pyramid.WriteNumericPiramid(pyramidHeigh);

            Console.ReadLine();
        }
    }
}
