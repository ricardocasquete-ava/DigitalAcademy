CREATE PROCEDURE [Sales].[spProductMetadataUpdate]
  @ProductMetadataId AS UNIQUEIDENTIFIER,
  @ProductId AS INT,
  @Key AS NVARCHAR(100),
  @Value AS NVARCHAR(100),
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
    SET @PrevRowVersion = (SELECT TOP 1 [pm].[RowVersion] FROM [Sales].[ProductMetadata] AS [pm] WHERE [pm].[ProductMetadataId] = @ProductMetadataId)
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
    UPDATE [pm] SET
        [pm].[ProductId] = @ProductId,
        [pm].[Key] = @Key,
        [pm].[Value] = @Value,
        [pm].[UpdatedBy] = @UpdatedBy,
        [pm].[UpdatedDate] = @UpdatedDate
      FROM [Sales].[ProductMetadata] AS [pm]
      WHERE [pm].[ProductMetadataId] = @ProductMetadataId

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
    EXEC [Sales].[spProductMetadataGet] @ProductMetadataId
  END
END