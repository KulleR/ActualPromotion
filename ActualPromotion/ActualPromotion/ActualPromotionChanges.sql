CREATE TABLE [dbo].[Bids]
(
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] VARCHAR(127) NOT NULL,
	[Email] VARCHAR(127) NOT NULL,
	[Message] VARCHAR(127) NOT NULL,
	[TermPath] VARCHAR(255) NOT NULL,
	[Phone] VARCHAR(127) NOT NULL,
	[Date] DATETIME NOT NULL
)