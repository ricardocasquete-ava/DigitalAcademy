using System;

namespace ReactWebsite.Model
{
    public class ProductModel
    {
        public int ProductId { get; set; }
        public int ProductCategoryId { get; set; }

        public string Name { get; set; }
        public string Description { get; set; }
        public int Price { get; set; }

        public string RowVersion { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }
}
