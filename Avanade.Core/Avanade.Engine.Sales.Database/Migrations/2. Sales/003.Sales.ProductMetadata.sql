CREATE TABLE [Sales].[ProductMetadata](
   [ProductMetadataId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
   [ProductId] INT NOT NULL,
   [Key] NVARCHAR(100) NOT NULL,
   [Value] NVARCHAR(100) NOT NULL,
   [RowVersion] TIMESTAMP NOT NULL,
   [CreatedBy] NVARCHAR(250) NULL,
   [CreatedDate] DATETIME2 NULL,
   [UpdatedBy] NVARCHAR(250) NULL,
   [UpdatedDate] DATETIME2 NULL,
)

ALTER TABLE [Sales].[ProductMetadata]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductMetadataProduct] FOREIGN KEY([ProductId])
REFERENCES [Sales].[Product] ([ProductID])
GO

ALTER TABLE [Sales].[ProductMetadata] CHECK CONSTRAINT [FK_ProductMetadataProduct]
GO