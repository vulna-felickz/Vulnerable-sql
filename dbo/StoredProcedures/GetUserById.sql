CREATE PROCEDURE [dbo].[GetUserById]
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        [UserId],
        [Username],
        [Email],
        [FirstName],
        [LastName],
        [CreatedDate],
        [IsActive]
    FROM 
        [dbo].[Users]
    WHERE 
        [UserId] = @UserId
        AND [IsActive] = 1;
END
GO
