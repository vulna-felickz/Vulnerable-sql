CREATE PROCEDURE [dbo].[GetOrders]
    @UserId INT = NULL,
    @OrderStatus NVARCHAR(20) = NULL,
    @StartDate DATETIME = NULL,
    @EndDate DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        o.[OrderId],
        o.[UserId],
        u.[Username],
        u.[Email],
        o.[OrderDate],
        o.[TotalAmount],
        o.[OrderStatus],
        o.[ShippingAddress],
        o.[PaymentMethod],
        o.[CreatedDate],
        o.[ModifiedDate]
    FROM 
        [dbo].[Orders] o
        INNER JOIN [dbo].[Users] u ON o.[UserId] = u.[UserId]
    WHERE 
        (@UserId IS NULL OR o.[UserId] = @UserId)
        AND (@OrderStatus IS NULL OR o.[OrderStatus] = @OrderStatus)
        AND (@StartDate IS NULL OR o.[OrderDate] >= @StartDate)
        AND (@EndDate IS NULL OR o.[OrderDate] <= @EndDate)
    ORDER BY 
        o.[OrderDate] DESC;
END
GO
