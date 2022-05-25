CREATE PROCEDURE [Ref].[spProductCategoryGetAll]
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Select the requested data.
  SELECT
      [pc].[ProductCategoryId],
      [pc].[Code],
      [pc].[Text],
      [pc].[IsActive],
      [pc].[SortOrder],
      [pc].[RowVersion],
      [pc].[CreatedBy],
      [pc].[CreatedDate],
      [pc].[UpdatedBy],
      [pc].[UpdatedDate]
    FROM [Ref].[ProductCategory] AS [pc]
    ORDER BY [pc].[SortOrder] ASC, [pc].[Code] ASC
END