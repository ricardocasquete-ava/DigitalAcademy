CREATE PROCEDURE [Sales].[spPersonUpdate]
  @PersonId AS INT,
  @FirstName AS NVARCHAR(100) NULL = NULL,
  @LastName AS NVARCHAR(100) NULL = NULL,
  @GenderCode AS NVARCHAR(50) NULL = NULL,
  @Birthday AS DATE NULL = NULL,
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
    SET @PrevRowVersion = (SELECT TOP 1 [p].[RowVersion] FROM [Sales].[Person] AS [p] WHERE [p].[PersonId] = @PersonId)
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
    UPDATE [p] SET
        [p].[FirstName] = @FirstName,
        [p].[LastName] = @LastName,
        [p].[GenderCode] = @GenderCode,
        [p].[Birthday] = @Birthday,
        [p].[UpdatedBy] = @UpdatedBy,
        [p].[UpdatedDate] = @UpdatedDate
      FROM [Sales].[Person] AS [p]
      WHERE [p].[PersonId] = @PersonId

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
    EXEC [Sales].[spPersonGet] @PersonId
  END
END