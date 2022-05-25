CREATE TABLE [Sales].[OrderLine](
   [OrderLineId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
   [OrderId] INT NOT NULL,
   [Description] NVARCHAR(100) NOT NULL,
   [Qty] INT NOT NULL,
   [PricePerUnit] Decimal(18,2) NOT NULL,
   [Total] Decimal(18,2) NOT NULL,
   [RowVersion] TIMESTAMP NOT NULL,
   [CreatedBy] NVARCHAR(250) NULL,
   [CreatedDate] DATETIME2 NULL,
   [UpdatedBy] NVARCHAR(250) NULL,
   [UpdatedDate] DATETIME2 NULL,
)
	
ALTER TABLE [Sales].[OrderLine]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderLineOrder] FOREIGN KEY([OrderId])
REFERENCES [Sales].[Order] ([OrderId])
GO

ALTER TABLE [Sales].[OrderLine] CHECK CONSTRAINT [FK_OrderLineOrder]
GO