CREATE PROCEDURE [Sales].[spProductGetAll]
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Select the requested data.
  SELECT
      [p].[ProductId],
      [p].[ProductCategoryId],
      [p].[Name],
      [p].[Description],
      [p].[Price],
      [p].[RowVersion],
      [p].[CreatedBy],
      [p].[CreatedDate],
      [p].[UpdatedBy],
      [p].[UpdatedDate]
    FROM [Sales].[Product] AS [p]
END