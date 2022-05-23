using CodeExamples;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Launcher
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnLaunch_Click(object sender, EventArgs e)
        {
            var calculator = new Calculator();
            this.txbResult.Text = calculator.Sum(1, 2).ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var calculator = new Calculator();
            this.txbResult.Text = calculator.Substracts(5, 2).ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var calculator = new Calculator();
            this.txbResult.Text = calculator.Multiply(5, 4).ToString();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var calculator = new Calculator();
            this.txbResult.Text = calculator.Divide(10, 2).ToString();
        }
    }
}
