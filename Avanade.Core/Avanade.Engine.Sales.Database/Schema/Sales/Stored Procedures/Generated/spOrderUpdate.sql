CREATE PROCEDURE [Sales].[spOrderUpdate]
  @OrderId AS INT,
  @PersonId AS INT,
  @Total AS DECIMAL(18, 2),
  @GST AS DECIMAL(18, 2),
  @RowVersion AS TIMESTAMP,
  @UpdatedBy AS NVARCHAR(250) NULL = NULL,
  @UpdatedDate AS DATETIME2 NULL = NULL,
  @OrderStatusID AS INT,
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
    SET @PrevRowVersion = (SELECT TOP 1 [o].[RowVersion] FROM [Sales].[Order] AS [o] WHERE [o].[OrderId] = @OrderId)
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
    UPDATE [o] SET
        [o].[PersonId] = @PersonId,
        [o].[Total] = @Total,
        [o].[GST] = @GST,
        [o].[UpdatedBy] = @UpdatedBy,
        [o].[UpdatedDate] = @UpdatedDate,
        [o].[OrderStatusID] = @OrderStatusID
      FROM [Sales].[Order] AS [o]
      WHERE [o].[OrderId] = @OrderId

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
    EXEC [Sales].[spOrderGet] @OrderId
  END
END