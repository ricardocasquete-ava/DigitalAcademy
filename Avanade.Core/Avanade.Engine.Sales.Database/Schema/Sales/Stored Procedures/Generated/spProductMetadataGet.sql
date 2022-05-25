CREATE PROCEDURE [Sales].[spProductMetadataGet]
  @ProductMetadataId AS UNIQUEIDENTIFIER
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Execute the primary select query.
  SELECT
      [pm].[ProductMetadataId],
      [pm].[ProductId],
      [pm].[Key],
      [pm].[Value],
      [pm].[RowVersion],
      [pm].[CreatedBy],
      [pm].[CreatedDate],
      [pm].[UpdatedBy],
      [pm].[UpdatedDate]
    FROM [Sales].[ProductMetadata] AS [pm]
      WHERE [pm].[ProductMetadataId] = @ProductMetadataId
END