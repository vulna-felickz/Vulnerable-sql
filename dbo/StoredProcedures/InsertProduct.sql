CREATE PROCEDURE [dbo].[InsertProduct]
    @ProductName NVARCHAR(100),
    @Description NVARCHAR(500) = NULL,
    @Price DECIMAL(18,2),
    @StockQuantity INT = 0,
    @CategoryId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Products]
    (
        [ProductName],
        [Description],
        [Price],
        [StockQuantity],
        [CategoryId],
        [CreatedDate],
        [IsActive]
    )
    VALUES
    (
        @ProductName,
        @Description,
        @Price,
        @StockQuantity,
        @CategoryId,
        GETDATE(),
        1
    );

    -- Return the newly created ProductId
    SELECT SCOPE_IDENTITY() AS NewProductId;
END
GO
