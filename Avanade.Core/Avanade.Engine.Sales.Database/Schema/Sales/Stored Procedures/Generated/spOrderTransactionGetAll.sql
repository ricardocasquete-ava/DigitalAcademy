CREATE PROCEDURE [Sales].[spOrderTransactionGetAll]
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
END