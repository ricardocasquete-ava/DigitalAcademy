CREATE PROCEDURE [Sales].[spOrderLineGetAll]
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Select the requested data.
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
END