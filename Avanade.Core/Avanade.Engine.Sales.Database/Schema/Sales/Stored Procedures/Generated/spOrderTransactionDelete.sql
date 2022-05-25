CREATE PROCEDURE [Sales].[spOrderTransactionDelete]
  @OrderTransactionId AS UNIQUEIDENTIFIER
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  BEGIN TRY
    -- Wrap in a transaction.
    BEGIN TRANSACTION

    -- Delete the record.
    DELETE [ot] FROM [Sales].[OrderTransaction] AS [ot]
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
END