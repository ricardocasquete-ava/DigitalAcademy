CREATE PROCEDURE [Sales].[spOrderGet]
  @OrderId AS INT
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Execute the primary select query.
  SELECT
      [o].[OrderId],
      [o].[PersonId],
      [o].[Total],
      [o].[GST],
      [o].[RowVersion],
      [o].[CreatedBy],
      [o].[CreatedDate],
      [o].[UpdatedBy],
      [o].[UpdatedDate],
      [o].[OrderStatusID]
    FROM [Sales].[Order] AS [o]
      WHERE [o].[OrderId] = @OrderId
END