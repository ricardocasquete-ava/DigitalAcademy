CREATE PROCEDURE [Sales].[spOrderGetAll]
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Select the requested data.
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
END