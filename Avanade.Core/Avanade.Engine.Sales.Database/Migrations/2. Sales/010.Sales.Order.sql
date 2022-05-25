CREATE TABLE [Sales].[Order](
   [OrderId] INT NOT NULL PRIMARY KEY,
   [PersonId] INT NOT NULL,
   [Total] decimal(18,2) NOT NULL,
   [GST] decimal(18,2) NOT NULL,
   [RowVersion] TIMESTAMP NOT NULL,
   [CreatedBy] NVARCHAR(250) NULL,
   [CreatedDate] DATETIME2 NULL,
   [UpdatedBy] NVARCHAR(250) NULL,
   [UpdatedDate] DATETIME2 NULL,
)

ALTER TABLE [Sales].[Order]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderPerson] FOREIGN KEY([PersonId])
REFERENCES [Sales].[Person] ([PersonId])
GO

ALTER TABLE [Sales].[Order] CHECK CONSTRAINT [FK_OrderPerson]
GO