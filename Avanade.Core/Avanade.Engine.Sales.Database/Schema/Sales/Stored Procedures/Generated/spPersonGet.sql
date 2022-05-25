CREATE PROCEDURE [Sales].[spPersonGet]
  @PersonId AS INT
AS
BEGIN
  /*
   * This is automatically generated; any changes will be lost. 
   */

  SET NOCOUNT ON;

  -- Execute the primary select query.
  SELECT
      [p].[PersonId],
      [p].[FirstName],
      [p].[LastName],
      [p].[GenderCode],
      [p].[Birthday],
      [p].[RowVersion],
      [p].[CreatedBy],
      [p].[CreatedDate],
      [p].[UpdatedBy],
      [p].[UpdatedDate]
    FROM [Sales].[Person] AS [p]
      WHERE [p].[PersonId] = @PersonId
END