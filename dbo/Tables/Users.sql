CREATE TABLE [dbo].[Users]
(
    [UserId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [Username] NVARCHAR(50) NOT NULL,
    [Email] NVARCHAR(100) NOT NULL,
    [FirstName] NVARCHAR(50) NULL,
    [LastName] NVARCHAR(50) NULL,
    [CreatedDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [IsActive] BIT NOT NULL DEFAULT 1,
    CONSTRAINT [UQ_Users_Username] UNIQUE ([Username]),
    CONSTRAINT [UQ_Users_Email] UNIQUE ([Email])
)
GO

CREATE INDEX [IX_Users_Email] ON [dbo].[Users] ([Email])
GO

CREATE INDEX [IX_Users_CreatedDate] ON [dbo].[Users] ([CreatedDate])
GO
