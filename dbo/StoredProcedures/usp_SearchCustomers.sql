CREATE PROCEDURE [dbo].[usp_SearchCustomers]
  @LastName NVARCHAR(200)
 AS
 BEGIN
  SET NOCOUNT ON;
 DECLARE @sql NVARCHAR(MAX);
 
 SET @sql = N'SELECT CustomerID, FirstName, LastName, Email
              FROM dbo.Customers
              WHERE LastName = ''' + @LastName + N''';';
 

 EXEC(@sql);
 
 END
 GO