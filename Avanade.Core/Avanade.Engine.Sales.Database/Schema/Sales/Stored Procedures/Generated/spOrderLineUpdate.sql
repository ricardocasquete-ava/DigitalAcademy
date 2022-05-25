CREATE PROCEDURE [Sales].[spOrderLineUpdate]
  @OrderLineId AS UNIQUEIDENTIFIER,
  @OrderId AS INT,
  @Description AS NVARCHAR(100),
  @Qty AS INT,
  @PricePerUnit AS DECIMAL(18, 2),
  @Total AS DECIMAL(18, 2),
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
    SET @PrevRowVersion = (SELECT TOP 1 [ol].[RowVersion] FROM [Sales].[OrderLine] AS [ol] WHERE [ol].[OrderLineId] = @OrderLineId)
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
    UPDATE [ol] SET
        [ol].[OrderId] = @OrderId,
        [ol].[Description] = @Description,
        [ol].[Qty] = @Qty,
        [ol].[PricePerUnit] = @PricePerUnit,
        [ol].[Total] = @Total,
        [ol].[UpdatedBy] = @UpdatedBy,
        [ol].[UpdatedDate] = @UpdatedDate
      FROM [Sales].[OrderLine] AS [ol]
      WHERE [ol].[OrderLineId] = @OrderLineId

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
    EXEC [Sales].[spOrderLineGet] @OrderLineId
  END
END