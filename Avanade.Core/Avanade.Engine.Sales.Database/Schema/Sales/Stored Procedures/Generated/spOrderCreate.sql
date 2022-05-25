CREATE PROCEDURE [Sales].[spOrderCreate]
  @OrderId AS INT,
  @PersonId AS INT,
  @Total AS DECIMAL(18, 2),
  @GST AS DECIMAL(18, 2),
  @CreatedBy AS NVARCHAR(250) NULL = NULL,
  @CreatedDate AS DATETIME2 NULL = NULL,
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
    EXEC @CreatedDate = fnGetTimestamp @CreatedDate
    EXEC @CreatedBy = fnGetUsername @CreatedBy

    -- Create the record.
    INSERT INTO [Sales].[Order] (
      [OrderId],
      [PersonId],
      [Total],
      [GST],
      [CreatedBy],
      [CreatedDate],
      [OrderStatusID]
    )
    VALUES (
      @OrderId,
      @PersonId,
      @Total,
      @GST,
      @CreatedBy,
      @CreatedDate,
      @OrderStatusID
    )

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