CREATE PROCEDURE [Sales].[spProductReviewGet]
  @ProductReviewId AS INT
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Execute the primary select query.
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
      WHERE [pr].[ProductReviewId] = @ProductReviewId
END