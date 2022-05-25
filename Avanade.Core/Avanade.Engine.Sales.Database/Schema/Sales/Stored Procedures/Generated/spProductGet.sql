CREATE PROCEDURE [Sales].[spProductGet]
  @ProductId AS INT
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Execute the primary select query.
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
      WHERE [p].[ProductId] = @ProductId
END