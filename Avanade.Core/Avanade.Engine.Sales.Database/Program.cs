using Beef.Database.Core;
using System.Threading.Tasks;

namespace Avanade.Engine.Sales.Database
{
    /// <summary>
    /// Represents the <b>database utilities</b> program (capability).
    /// </summary>
    public static class Program
    {
        /// <summary>
        /// Main startup.
        /// </summary>
        /// <param name="args">The startup arguments.</param>
        /// <returns>The status code whereby zero indicates success.</returns>
        public static Task<int> Main(string[] args) => DatabaseConsole.Create("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Avanade.Engine.Sales;Integrated Security=True;TrustServerCertificate=true", "Avanade.Engine", "Sales", useBeefDbo: true).RunAsync(args);
    }
}