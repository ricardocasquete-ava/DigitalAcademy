CREATE TABLE [Sales].[Product](
   [ProductId] INT NOT NULL PRIMARY KEY,
   [ProductCategoryId] INT NOT NULL,
   [Name] NVARCHAR(100) NOT NULL,
   [Description] NVARCHAR(500) NOT NULL,
   [Price] INT NOT NULL,
   [RowVersion] TIMESTAMP NOT NULL,
   [CreatedBy] NVARCHAR(250) NULL,
   [CreatedDate] DATETIME2 NULL,
   [UpdatedBy] NVARCHAR(250) NULL,
   [UpdatedDate] DATETIME2 NULL,
)

ALTER TABLE [Sales].[Product]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductProductCategory] FOREIGN KEY([ProductCategoryId])
REFERENCES [Ref].[ProductCategory] ([ProductCategoryID])
GO

ALTER TABLE [Sales].[Product] CHECK CONSTRAINT [FK_ProductProductCategory]
GO
