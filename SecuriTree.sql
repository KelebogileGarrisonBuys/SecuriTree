USE [master]
GO
/****** Object:  Database [SecuriTree]    Script Date: 2021/09/02 00:36:51 ******/
CREATE DATABASE [SecuriTree]
 CONTAINMENT = NONE
ALTER DATABASE [SecuriTree] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SecuriTree].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SecuriTree] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SecuriTree] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SecuriTree] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SecuriTree] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SecuriTree] SET ARITHABORT OFF 
GO
ALTER DATABASE [SecuriTree] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SecuriTree] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SecuriTree] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SecuriTree] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SecuriTree] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SecuriTree] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SecuriTree] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SecuriTree] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SecuriTree] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SecuriTree] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SecuriTree] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SecuriTree] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SecuriTree] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SecuriTree] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SecuriTree] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SecuriTree] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SecuriTree] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SecuriTree] SET RECOVERY FULL 
GO
ALTER DATABASE [SecuriTree] SET  MULTI_USER 
GO
ALTER DATABASE [SecuriTree] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SecuriTree] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SecuriTree] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SecuriTree] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SecuriTree] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SecuriTree', N'ON'
GO
USE [SecuriTree]
GO
/****** Object:  Table [dbo].[AccessRule]    Script Date: 2021/09/02 00:36:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccessRule](
	[AccessRuleID] [varchar](50) NOT NULL,
	[AccessRuleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AccessRule] PRIMARY KEY CLUSTERED 
(
	[AccessRuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Area]    Script Date: 2021/09/02 00:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Area](
	[AreaID] [varchar](50) NOT NULL,
	[AreaName] [varchar](50) NOT NULL,
	[ParentAreaID] [varchar](50) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[AreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChildArea]    Script Date: 2021/09/02 00:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChildArea](
	[ChildAreaID] [varchar](50) NOT NULL,
	[ChildAreaName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ChildArea] PRIMARY KEY CLUSTERED 
(
	[ChildAreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Door]    Script Date: 2021/09/02 00:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Door](
	[DoorID] [varchar](50) NOT NULL,
	[DoorName] [varchar](50) NOT NULL,
	[ParentAreaID] [varchar](50) NOT NULL,
	[DoorStatusID] [int] NOT NULL,
 CONSTRAINT [PK_Door] PRIMARY KEY CLUSTERED 
(
	[DoorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DoorAccessRule]    Script Date: 2021/09/02 00:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DoorAccessRule](
	[DoorAccessRuleID] [int] IDENTITY(1,1) NOT NULL,
	[DoorID] [varchar](50) NOT NULL,
	[AccessRuleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DoorAccessRule] PRIMARY KEY CLUSTERED 
(
	[DoorAccessRuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DoorStatus]    Script Date: 2021/09/02 00:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DoorStatus](
	[DoorStatusID] [int] IDENTITY(1,1) NOT NULL,
	[DoorStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DoorStatus] PRIMARY KEY CLUSTERED 
(
	[DoorStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ParentChildArea]    Script Date: 2021/09/02 00:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParentChildArea](
	[ParentChildAreaID] [int] IDENTITY(1,1) NOT NULL,
	[AreaID] [varchar](50) NOT NULL,
	[ChildAreaID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ParentChildArea] PRIMARY KEY CLUSTERED 
(
	[ParentChildAreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 2021/09/02 00:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPassword] [varchar](max) NOT NULL,
	[UserFirstName] [varchar](50) NOT NULL,
	[UserSurname] [varchar](50) NOT NULL,
	[UserSession] [varchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLog]    Script Date: 2021/09/02 00:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLog](
	[UserLogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserLog] [varchar](max) NOT NULL,
	[UserLogDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_UserLog] PRIMARY KEY CLUSTERED 
(
	[UserLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Area]  WITH CHECK ADD  CONSTRAINT [FK_Area_Area1] FOREIGN KEY([ParentAreaID])
REFERENCES [dbo].[Area] ([AreaID])
GO
ALTER TABLE [dbo].[Area] CHECK CONSTRAINT [FK_Area_Area1]
GO
ALTER TABLE [dbo].[Door]  WITH CHECK ADD  CONSTRAINT [FK_Door_Area] FOREIGN KEY([ParentAreaID])
REFERENCES [dbo].[Area] ([AreaID])
GO
ALTER TABLE [dbo].[Door] CHECK CONSTRAINT [FK_Door_Area]
GO
ALTER TABLE [dbo].[Door]  WITH CHECK ADD  CONSTRAINT [FK_Door_DoorStatus] FOREIGN KEY([DoorStatusID])
REFERENCES [dbo].[DoorStatus] ([DoorStatusID])
GO
ALTER TABLE [dbo].[Door] CHECK CONSTRAINT [FK_Door_DoorStatus]
GO
ALTER TABLE [dbo].[DoorAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_DoorAccessRule_AccessRule] FOREIGN KEY([AccessRuleID])
REFERENCES [dbo].[AccessRule] ([AccessRuleID])
GO
ALTER TABLE [dbo].[DoorAccessRule] CHECK CONSTRAINT [FK_DoorAccessRule_AccessRule]
GO
ALTER TABLE [dbo].[DoorAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_DoorAccessRule_Door] FOREIGN KEY([DoorID])
REFERENCES [dbo].[Door] ([DoorID])
GO
ALTER TABLE [dbo].[DoorAccessRule] CHECK CONSTRAINT [FK_DoorAccessRule_Door]
GO
ALTER TABLE [dbo].[ParentChildArea]  WITH CHECK ADD  CONSTRAINT [FK_ParentChildArea_Area] FOREIGN KEY([AreaID])
REFERENCES [dbo].[Area] ([AreaID])
GO
ALTER TABLE [dbo].[ParentChildArea] CHECK CONSTRAINT [FK_ParentChildArea_Area]
GO
ALTER TABLE [dbo].[ParentChildArea]  WITH CHECK ADD  CONSTRAINT [FK_ParentChildArea_ChildArea] FOREIGN KEY([ChildAreaID])
REFERENCES [dbo].[ChildArea] ([ChildAreaID])
GO
ALTER TABLE [dbo].[ParentChildArea] CHECK CONSTRAINT [FK_ParentChildArea_ChildArea]
GO
ALTER TABLE [dbo].[UserLog]  WITH CHECK ADD  CONSTRAINT [FK_UserLog_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserLog] CHECK CONSTRAINT [FK_UserLog_User]
GO
USE [master]
GO
ALTER DATABASE [SecuriTree] SET  READ_WRITE 
GO
