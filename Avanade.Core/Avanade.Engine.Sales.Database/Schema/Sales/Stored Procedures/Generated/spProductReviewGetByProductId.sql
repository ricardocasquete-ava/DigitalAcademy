CREATE PROCEDURE [Sales].[spProductReviewGetByProductId]
  @ProductId AS INT NULL = NULL
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Select the requested data.
  SELECT
      [pr].[ProductReviewId],
      [pr].[ProductId],
      [pr].[Description],
      [pr].[RowVersion],
      [pr].[CreatedBy],
      [pr].[CreatedDate],
      [pr].[UpdatedBy],
      [pr].[UpdatedDate]
    FROM [Sales].[ProductReview] AS [pr]
    WHERE (@ProductId IS NULL OR [pr].[ProductId] = @ProductId)
END