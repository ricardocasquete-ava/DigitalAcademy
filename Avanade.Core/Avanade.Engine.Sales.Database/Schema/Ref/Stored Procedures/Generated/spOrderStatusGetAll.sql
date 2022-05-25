CREATE PROCEDURE [Ref].[spOrderStatusGetAll]
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Select the requested data.
  SELECT
      [os].[OrderStatusId],
      [os].[Code],
      [os].[Text],
      [os].[IsActive],
      [os].[SortOrder],
      [os].[RowVersion],
      [os].[CreatedBy],
      [os].[CreatedDate],
      [os].[UpdatedBy],
      [os].[UpdatedDate]
    FROM [Ref].[OrderStatus] AS [os]
    ORDER BY [os].[SortOrder] ASC, [os].[Code] ASC
END