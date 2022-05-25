CREATE PROCEDURE [Sales].[spOrderLineCreate]
  @OrderLineId AS UNIQUEIDENTIFIER,
  @OrderId AS INT,
  @Description AS NVARCHAR(100),
  @Qty AS INT,
  @PricePerUnit AS DECIMAL(18, 2),
  @Total AS DECIMAL(18, 2),
  @CreatedBy AS NVARCHAR(250) NULL = NULL,
  @CreatedDate AS DATETIME2 NULL = NULL,
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
    INSERT INTO [Sales].[OrderLine] (
      [OrderLineId],
      [OrderId],
      [Description],
      [Qty],
      [PricePerUnit],
      [Total],
      [CreatedBy],
      [CreatedDate]
    )
    VALUES (
      @OrderLineId,
      @OrderId,
      @Description,
      @Qty,
      @PricePerUnit,
      @Total,
      @CreatedBy,
      @CreatedDate
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
    EXEC [Sales].[spOrderLineGet] @OrderLineId
  END
END