CREATE TABLE [Sales].[ProductReview](
   [ProductReviewId] int NOT NULL PRIMARY KEY,
   [ProductId] INT NOT NULL,
   [Description] NVARCHAR(500) NULL,
   [RowVersion] TIMESTAMP NOT NULL,
   [CreatedBy] NVARCHAR(250) NULL,
   [CreatedDate] DATETIME2 NULL,
   [UpdatedBy] NVARCHAR(250) NULL,
   [UpdatedDate] DATETIME2 NULL,
)

ALTER TABLE [Sales].[ProductReview]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductReviewProduct] FOREIGN KEY([ProductId])
REFERENCES [Sales].[Product] ([ProductID])
GO

ALTER TABLE [Sales].[ProductReview] CHECK CONSTRAINT [FK_ProductReviewProduct]
GO