using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Logging;
using ReactWebsite.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ReactWebsite.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SalesController : ControllerBase
    {
        //[HttpGet]
        //public ApiResponse<IEnumerable<ProductModel>> Get()
        //{

        //    var products = new List<ProductModel>();
        //    products.Add(new ProductModel
        //    {
        //        ProductId = 1,
        //        Name = "Pencil",
        //        Description = "To Write",
        //        Price = 10
        //    });
        //    products.Add(new ProductModel
        //    {
        //        ProductId = 2,
        //        Name = "Eraser",
        //        Description = "To Correct Mistakes",
        //        Price = 15
        //    });

        //    return products;
        //}


        //[HttpGet]
        //public IEnumerable<ProductModel> GetFromDb()
        //{
        //    var connectionString = "Data Source =.; Initial Catalog = Avanade.Engine.Sales; Integrated Security = True; TrustServerCertificate = true";
        //    var connection = new SqlConnection(connectionString);
        //    var readProductsCommand = new SqlCommand("Select ProductId, Name, Description, Price from Sales.Product", connection);

        //    var products = new List<ProductModel>();
        //    try
        //    {
        //        connection.Open();
        //        var dataReader = readProductsCommand.ExecuteReader();
        //        while (dataReader.Read())
        //        {
        //            products.Add(new ProductModel
        //            {
        //                ProductId =dataReader.GetInt32(0),
        //                Name = dataReader.GetString(1), 
        //                Description = dataReader.GetString(2),  
        //                Price = dataReader.GetInt32(3),
        //            });
        //        }
        //        dataReader.Close();
        //        connection.Close();
        //    }
        //    catch
        //    {
        //        connection.Close();
        //    }

        //    return products;
        //}
    }
}
