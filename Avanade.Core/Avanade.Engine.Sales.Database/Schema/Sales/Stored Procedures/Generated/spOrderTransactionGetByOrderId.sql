CREATE PROCEDURE [Sales].[spOrderTransactionGetByOrderId]
  @OrderId AS INT NULL = NULL
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Select the requested data.
  SELECT
      [ot].[OrderTransactionId],
      [ot].[OrderId],
      [ot].[Description],
      [ot].[RowVersion],
      [ot].[CreatedBy],
      [ot].[CreatedDate],
      [ot].[UpdatedBy],
      [ot].[UpdatedDate]
    FROM [Sales].[OrderTransaction] AS [ot]
    WHERE (@OrderId IS NULL OR [ot].[OrderId] = @OrderId)
END