CREATE PROCEDURE [Sales].[spOrderTransactionGet]
  @OrderTransactionId AS UNIQUEIDENTIFIER
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Execute the primary select query.
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
      WHERE [ot].[OrderTransactionId] = @OrderTransactionId
END