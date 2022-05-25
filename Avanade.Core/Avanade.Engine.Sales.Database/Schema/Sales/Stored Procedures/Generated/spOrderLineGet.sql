CREATE PROCEDURE [Sales].[spOrderLineGet]
  @OrderLineId AS UNIQUEIDENTIFIER
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Execute the primary select query.
  SELECT
      [ol].[OrderLineId],
      [ol].[OrderId],
      [ol].[Description],
      [ol].[Qty],
      [ol].[PricePerUnit],
      [ol].[Total],
      [ol].[RowVersion],
      [ol].[CreatedBy],
      [ol].[CreatedDate],
      [ol].[UpdatedBy],
      [ol].[UpdatedDate]
    FROM [Sales].[OrderLine] AS [ol]
      WHERE [ol].[OrderLineId] = @OrderLineId
END