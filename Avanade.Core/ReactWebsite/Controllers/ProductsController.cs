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
    public class ProductsController : ControllerBase
    {
        private readonly string connectionString = "Data Source =.; Initial Catalog = Avanade.Engine.Sales; Integrated Security = True; TrustServerCertificate = true";

        [HttpPost]
        [Route("API/Products/GetAll")]
        public ApiResponse<IEnumerable<ProductModel>> GetAll()
        {
            var connection = new SqlConnection(connectionString);
            var readProductsCommand = new SqlCommand("Select ProductId, ProductCategoryId, Name, Description, Price, RowVersion, CreatedBy, UpdatedBy, CreatedDate, UpdatedDate from Sales.Product", connection);

            var products = new List<ProductModel>();
            try
            {
                connection.Open();
                var dataReader = readProductsCommand.ExecuteReader();
                while (dataReader.Read())
                {
                    products.Add(new ProductModel
                    {
                        ProductId = dataReader.GetInt32(0),
                        ProductCategoryId = dataReader.GetInt32(1),

                        Name = dataReader.GetString(2),
                        Description = dataReader.GetString(3),
                        Price = dataReader.GetInt32(4),

                        CreatedBy = (!dataReader.IsDBNull(6))? dataReader.GetString(6):String.Empty,
                        UpdatedBy = (!dataReader.IsDBNull(7))? dataReader.GetString(7):String.Empty,
                        CreatedDate = (!dataReader.IsDBNull(8))? dataReader.GetDateTime(8):DateTime.MinValue,
                        UpdatedDate = (!dataReader.IsDBNull(9))? dataReader.GetDateTime(9): DateTime.MinValue,
                    });
                }
                dataReader.Close();
                connection.Close();

                return new ApiResponse<IEnumerable<ProductModel>>
                {
                    Success = true,
                    Value = products
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                connection.Close();

                return new ApiResponse<IEnumerable<ProductModel>>
                {
                    Success = false,
                    Error = ex.Message
                };
            }
        }

        [HttpPost]
        [Route("API/Products/Delete")]
        public ApiResponse<int> Delete(ProductModel product)
        {
            var connection = new SqlConnection(connectionString);
            var deletedProductsCommand = new SqlCommand("delete Sales.Product where ProductId = @productId", connection);
            deletedProductsCommand.Parameters.AddWithValue("@productId", product.ProductId);

            try
            {
                connection.Open();
                var affectedRecords = deletedProductsCommand.ExecuteNonQuery();
                connection.Close();

                return new ApiResponse<int>
                {
                    Success = true,
                    Value = affectedRecords
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                connection.Close();

                return new ApiResponse<int>
                {
                    Success = false,
                    Error = ex.Message
                };
            }
        }

        [HttpPost]
        [Route("API/Products/AddNew")]
        public ApiResponse<int> AddNew(ProductModel product)
        {
            var connection = new SqlConnection(connectionString);
            var insertProductsCommand = new SqlCommand("INSERT INTO [Sales].[Product] ([ProductId] ,[ProductCategoryId] ,[Name] ,[Description] ,[Price]) VALUES (@productId, 1, @name, @description, @price)", connection);
            insertProductsCommand.Parameters.AddWithValue("@productId", product.ProductId);
            insertProductsCommand.Parameters.AddWithValue("@name", product.Name);
            insertProductsCommand.Parameters.AddWithValue("@description", product.Description);
            insertProductsCommand.Parameters.AddWithValue("@price", product.Price);

            try
            {
                connection.Open();
                var affectedRecords = insertProductsCommand.ExecuteNonQuery();
                connection.Close();

                return new ApiResponse<int>
                {
                    Success = true,
                    Value = affectedRecords
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                connection.Close();

                return new ApiResponse<int>
                {
                    Success = false,
                    Error = ex.Message
                };
            }
        }

    }
}
