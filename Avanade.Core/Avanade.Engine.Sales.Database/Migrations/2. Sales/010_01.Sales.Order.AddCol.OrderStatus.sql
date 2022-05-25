ALTER TABLE [Sales].[Order]
ADD OrderStatusID INT NOT NULL;

ALTER TABLE [Sales].[Order]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderOrderStatus] FOREIGN KEY(OrderStatusID)
REFERENCES Ref.OrderStatus (OrderStatusID)
GO

ALTER TABLE [Sales].[Order] CHECK CONSTRAINT [FK_OrderOrderStatus]
GO