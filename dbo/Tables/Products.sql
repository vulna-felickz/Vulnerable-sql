CREATE TABLE [dbo].[Products]
(
    [ProductId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [ProductName] NVARCHAR(100) NOT NULL,
    [Description] NVARCHAR(500) NULL,
    [Price] DECIMAL(18,2) NOT NULL,
    [StockQuantity] INT NOT NULL DEFAULT 0,
    [CategoryId] INT NULL,
    [CreatedDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [ModifiedDate] DATETIME NULL,
    [IsActive] BIT NOT NULL DEFAULT 1,
    CONSTRAINT [CK_Products_Price] CHECK ([Price] >= 0),
    CONSTRAINT [CK_Products_StockQuantity] CHECK ([StockQuantity] >= 0)
)
GO

CREATE INDEX [IX_Products_ProductName] ON [dbo].[Products] ([ProductName])
GO

CREATE INDEX [IX_Products_CategoryId] ON [dbo].[Products] ([CategoryId])
GO
