CREATE PROCEDURE [Sales].[spOrderTransactionUpdate]
  @OrderTransactionId AS UNIQUEIDENTIFIER,
  @OrderId AS INT,
  @Description AS NVARCHAR(100),
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
    SET @PrevRowVersion = (SELECT TOP 1 [ot].[RowVersion] FROM [Sales].[OrderTransaction] AS [ot] WHERE [ot].[OrderTransactionId] = @OrderTransactionId)
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
    UPDATE [ot] SET
        [ot].[OrderId] = @OrderId,
        [ot].[Description] = @Description,
        [ot].[UpdatedBy] = @UpdatedBy,
        [ot].[UpdatedDate] = @UpdatedDate
      FROM [Sales].[OrderTransaction] AS [ot]
      WHERE [ot].[OrderTransactionId] = @OrderTransactionId

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
    EXEC [Sales].[spOrderTransactionGet] @OrderTransactionId
  END
END