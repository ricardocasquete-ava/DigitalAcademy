using System;
using System.Collections.Generic;
using System.Text;

namespace CodeExamples.Paterns
{
    public interface IBankAccount
    {
        void CreateAccount(string accountName, int balance);
        int GetBalance(string accountName);
        void UpdateBalance(string accountName, int balance);
    }


}
