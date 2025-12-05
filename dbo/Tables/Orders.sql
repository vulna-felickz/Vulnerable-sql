CREATE TABLE [dbo].[Orders]
(
    [OrderId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [UserId] INT NOT NULL,
    [OrderDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [TotalAmount] DECIMAL(18,2) NOT NULL,
    [OrderStatus] NVARCHAR(20) NOT NULL DEFAULT 'Pending',
    [ShippingAddress] NVARCHAR(200) NULL,
    [PaymentMethod] NVARCHAR(50) NULL,
    [CreatedDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [ModifiedDate] DATETIME NULL,
    CONSTRAINT [FK_Orders_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users]([UserId]),
    CONSTRAINT [CK_Orders_TotalAmount] CHECK ([TotalAmount] >= 0),
    CONSTRAINT [CK_Orders_OrderStatus] CHECK ([OrderStatus] IN ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled'))
)
GO

CREATE INDEX [IX_Orders_UserId] ON [dbo].[Orders] ([UserId])
GO

CREATE INDEX [IX_Orders_OrderDate] ON [dbo].[Orders] ([OrderDate])
GO

CREATE INDEX [IX_Orders_OrderStatus] ON [dbo].[Orders] ([OrderStatus])
GO
