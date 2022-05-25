CREATE PROCEDURE [Sales].[spProductMetadataGetAll]
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Select the requested data.
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
END