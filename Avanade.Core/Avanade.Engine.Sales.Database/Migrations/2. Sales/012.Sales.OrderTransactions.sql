CREATE TABLE [Sales].[OrderTransaction](
   [OrderTransactionId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
   [OrderId] INT NOT NULL,
   [Description] NVARCHAR(100) NOT NULL,
   [RowVersion] TIMESTAMP NOT NULL,
   [CreatedBy] NVARCHAR(250) NULL,
   [CreatedDate] DATETIME2 NULL,
   [UpdatedBy] NVARCHAR(250) NULL,
   [UpdatedDate] DATETIME2 NULL,
)
	
ALTER TABLE [Sales].[OrderTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderTransactionOrder] FOREIGN KEY([OrderId])
REFERENCES [Sales].[Order] ([OrderId])
GO

ALTER TABLE [Sales].[OrderTransaction] CHECK CONSTRAINT [FK_OrderTransactionOrder]
GO