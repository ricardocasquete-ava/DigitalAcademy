CREATE PROCEDURE [Sales].[spProductReviewUpdate]
  @ProductReviewId AS INT,
  @ProductId AS INT,
  @Description AS NVARCHAR(500) NULL = NULL,
  @RowVersion AS TIMESTAMP,
  @UpdatedBy AS NVARCHAR(250) NULL = NULL,
  @UpdatedDate AS DATETIME2 NULL = NULL,
  @ReselectRecord AS BIT = 0
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost.
   */

  SET NOCOUNT ON;

  BEGIN TRY
    -- Wrap in a transaction.
    BEGIN TRANSACTION

    -- Set audit details.
    EXEC @UpdatedDate = fnGetTimestamp @UpdatedDate
    EXEC @UpdatedBy = fnGetUsername @UpdatedBy

    -- Check exists.
    DECLARE @PrevRowVersion BINARY(8)
    SET @PrevRowVersion = (SELECT TOP 1 [pr].[RowVersion] FROM [Sales].[ProductReview] AS [pr] WHERE [pr].[ProductReviewId] = @ProductReviewId)
    IF @PrevRowVersion IS NULL
    BEGIN
      EXEC spThrowNotFoundException
    END

    -- Check concurrency (where provided).
    IF @RowVersion IS NULL OR @PrevRowVersion <> @RowVersion
    BEGIN
      EXEC spThrowConcurrencyException
    END

    -- Update the record.
    UPDATE [pr] SET
        [pr].[ProductId] = @ProductId,
        [pr].[Description] = @Description,
        [pr].[UpdatedBy] = @UpdatedBy,
        [pr].[UpdatedDate] = @UpdatedDate
      FROM [Sales].[ProductReview] AS [pr]
      WHERE [pr].[ProductReviewId] = @ProductReviewId

    -- Commit the transaction.
    COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
    -- Rollback transaction and rethrow error.
    IF @@TRANCOUNT > 0
      ROLLBACK TRANSACTION;

    THROW;
  END CATCH

  -- Reselect record.
  IF @ReselectRecord = 1
  BEGIN
    EXEC [Sales].[spProductReviewGet] @ProductReviewId
  END
END