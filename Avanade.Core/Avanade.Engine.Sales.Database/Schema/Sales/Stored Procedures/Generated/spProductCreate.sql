CREATE PROCEDURE [Sales].[spProductCreate]
  @ProductId AS INT,
  @ProductCategoryId AS INT,
  @Name AS NVARCHAR(100),
  @Description AS NVARCHAR(500),
  @Price AS INT,
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
    INSERT INTO [Sales].[Product] (
      [ProductId],
      [ProductCategoryId],
      [Name],
      [Description],
      [Price],
      [CreatedBy],
      [CreatedDate]
    )
    VALUES (
      @ProductId,
      @ProductCategoryId,
      @Name,
      @Description,
      @Price,
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
    EXEC [Sales].[spProductGet] @ProductId
  END
END