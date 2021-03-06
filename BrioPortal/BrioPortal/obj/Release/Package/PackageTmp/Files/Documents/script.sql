USE [master]
GO
/****** Object:  Database [actual98_brioDb]    Script Date: 24.11.2014 10:22:59 ******/
CREATE DATABASE [actual98_brioDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'actual98_brioDb', FILENAME = N'D:\DataBase\MSSQL\actual98_brioDb.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'actual98_brioDb_log', FILENAME = N'D:\DataBase\MSSQL\Log\actual98_brioDb_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [actual98_brioDb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [actual98_brioDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [actual98_brioDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [actual98_brioDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [actual98_brioDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [actual98_brioDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [actual98_brioDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [actual98_brioDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [actual98_brioDb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [actual98_brioDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [actual98_brioDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [actual98_brioDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [actual98_brioDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [actual98_brioDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [actual98_brioDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [actual98_brioDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [actual98_brioDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [actual98_brioDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [actual98_brioDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [actual98_brioDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [actual98_brioDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [actual98_brioDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [actual98_brioDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [actual98_brioDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [actual98_brioDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [actual98_brioDb] SET RECOVERY FULL 
GO
ALTER DATABASE [actual98_brioDb] SET  MULTI_USER 
GO
ALTER DATABASE [actual98_brioDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [actual98_brioDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [actual98_brioDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [actual98_brioDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [actual98_brioDb]
GO
/****** Object:  User [actua_brio_user]    Script Date: 24.11.2014 10:23:00 ******/
CREATE USER [actua_brio_user] FOR LOGIN [actua_brio_user] WITH DEFAULT_SCHEMA=[actua_brio_user]
GO
ALTER ROLE [db_owner] ADD MEMBER [actua_brio_user]
GO
/****** Object:  Schema [actua_brio_user]    Script Date: 24.11.2014 10:23:01 ******/
CREATE SCHEMA [actua_brio_user]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 24.11.2014 10:23:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articles](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](127) NOT NULL,
	[Text] [varchar](max) NOT NULL,
	[Author] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[PageId] [int] NOT NULL,
 CONSTRAINT [PK_Articles] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 24.11.2014 10:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](127) NOT NULL,
	[Adress] [varchar](255) NOT NULL,
	[Phone] [varchar](127) NOT NULL,
	[Phone2] [varchar](127) NULL,
	[Email] [varchar](127) NULL,
	[Postcode] [varchar](127) NULL,
	[POBox] [int] NULL,
	[Phone3] [varchar](127) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Divisions]    Script Date: 24.11.2014 10:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Divisions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Head] [varchar](255) NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Divisions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 24.11.2014 10:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Documents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[DocumentPath] [varchar](127) NOT NULL,
	[DocumentTitle] [varchar](255) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[PageId] [int] NOT NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 24.11.2014 10:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](127) NOT NULL,
	[Email] [varchar](127) NOT NULL,
	[Phone] [varchar](127) NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InfoCards]    Script Date: 24.11.2014 10:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InfoCards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Post] [varchar](255) NULL,
	[GetJobDate] [datetime] NULL,
	[BirthDay] [datetime] NULL,
	[Name] [varchar](255) NOT NULL,
	[Surname] [varchar](255) NOT NULL,
	[Patronymic] [varchar](255) NOT NULL,
	[Adress] [varchar](255) NULL,
	[Phone] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
 CONSTRAINT [PK_InfoCards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[News]    Script Date: 24.11.2014 10:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[DivisionId] [int] NOT NULL,
	[AuthorUserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Tile] [varchar](255) NOT NULL,
	[Text] [varchar](max) NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 24.11.2014 10:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [varchar](127) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PriceLists]    Script Date: 24.11.2014 10:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PriceLists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Path] [varchar](255) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PriceLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 24.11.2014 10:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[Description] [text] NULL,
	[CompanyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 24.11.2014 10:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Tile] [varchar](255) NOT NULL,
	[ResponsibleUserId] [int] NULL,
	[Description] [varchar](511) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 24.11.2014 10:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[ReviewMessage] [varchar](max) NOT NULL,
	[AutorPosition] [varchar](127) NOT NULL,
	[AuthorCompany] [varchar](255) NOT NULL,
	[AuthorPhoto] [varchar](255) NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 24.11.2014 10:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](127) NOT NULL,
	[CyrillicName] [varchar](127) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24.11.2014 10:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](127) NOT NULL,
	[Password] [varchar](127) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_FK__Articles__Author__1ED998B2]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__Articles__Author__1ED998B2] ON [dbo].[Articles]
(
	[Author] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__Articles__Compan__412EB0B6]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__Articles__Compan__412EB0B6] ON [dbo].[Articles]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__Divisions__Compa__5CD6CB2B]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__Divisions__Compa__5CD6CB2B] ON [dbo].[Divisions]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__Documents__Compa__3F466844]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__Documents__Compa__3F466844] ON [dbo].[Documents]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__Feedbacks__Compa__440B1D61]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__Feedbacks__Compa__440B1D61] ON [dbo].[Feedbacks]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__InfoCards__Divis__6383C8BA]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__InfoCards__Divis__6383C8BA] ON [dbo].[InfoCards]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__InfoCards__UserI__628FA481]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__InfoCards__UserI__628FA481] ON [dbo].[InfoCards]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__News__AuthorUser__68487DD7]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__News__AuthorUser__68487DD7] ON [dbo].[News]
(
	[AuthorUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__News__CompanyId__66603565]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__News__CompanyId__66603565] ON [dbo].[News]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__News__DivisionId__6754599E]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__News__DivisionId__6754599E] ON [dbo].[News]
(
	[DivisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__PriceList__Compa__5441852A]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__PriceList__Compa__5441852A] ON [dbo].[PriceLists]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__Projects__Compan__6B24EA82]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__Projects__Compan__6B24EA82] ON [dbo].[Projects]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__Projects__Respon__6C190EBB]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__Projects__Respon__6C190EBB] ON [dbo].[Projects]
(
	[ResponsibleUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__Reviews__Company__46E78A0C]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__Reviews__Company__46E78A0C] ON [dbo].[Reviews]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK__Users__RoleId__1BFD2C07]    Script Date: 24.11.2014 10:23:02 ******/
CREATE NONCLUSTERED INDEX [IX_FK__Users__RoleId__1BFD2C07] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articles] ADD  DEFAULT ((3)) FOR [PageId]
GO
ALTER TABLE [dbo].[Documents] ADD  DEFAULT ((1)) FOR [PageId]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK__Articles__Author__1ED998B2] FOREIGN KEY([Author])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK__Articles__Author__1ED998B2]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK__Articles__Compan__412EB0B6] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK__Articles__Compan__412EB0B6]
GO
ALTER TABLE [dbo].[Divisions]  WITH CHECK ADD  CONSTRAINT [FK__Divisions__Compa__5CD6CB2B] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Divisions] CHECK CONSTRAINT [FK__Divisions__Compa__5CD6CB2B]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK__Documents__Compa__3F466844] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK__Documents__Compa__3F466844]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD FOREIGN KEY([PageId])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK__Feedbacks__Compa__440B1D61] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK__Feedbacks__Compa__440B1D61]
GO
ALTER TABLE [dbo].[InfoCards]  WITH CHECK ADD  CONSTRAINT [FK__InfoCards__Divis__6383C8BA] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[InfoCards] CHECK CONSTRAINT [FK__InfoCards__Divis__6383C8BA]
GO
ALTER TABLE [dbo].[InfoCards]  WITH CHECK ADD  CONSTRAINT [FK__InfoCards__UserI__628FA481] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[InfoCards] CHECK CONSTRAINT [FK__InfoCards__UserI__628FA481]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK__News__AuthorUser__68487DD7] FOREIGN KEY([AuthorUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK__News__AuthorUser__68487DD7]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK__News__CompanyId__66603565] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK__News__CompanyId__66603565]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK__News__DivisionId__6754599E] FOREIGN KEY([DivisionId])
REFERENCES [dbo].[Divisions] ([Id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK__News__DivisionId__6754599E]
GO
ALTER TABLE [dbo].[PriceLists]  WITH CHECK ADD  CONSTRAINT [FK__PriceList__Compa__5441852A] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[PriceLists] CHECK CONSTRAINT [FK__PriceList__Compa__5441852A]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK__Projects__Compan__6B24EA82] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK__Projects__Compan__6B24EA82]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK__Projects__Respon__6C190EBB] FOREIGN KEY([ResponsibleUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK__Projects__Respon__6C190EBB]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK__Reviews__Company__46E78A0C] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK__Reviews__Company__46E78A0C]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK__Users__RoleId__1BFD2C07] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK__Users__RoleId__1BFD2C07]
GO
USE [master]
GO
ALTER DATABASE [actual98_brioDb] SET  READ_WRITE 
GO
