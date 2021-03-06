USE [master]
GO
/****** Object:  Database [LiveMeetingSystemDB]    Script Date: 5/25/2018 1:12:31 PM ******/
CREATE DATABASE [LiveMeetingSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LiveMeetingSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LiveMeetingSystemDB.mdf' , SIZE = 263168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LiveMeetingSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LiveMeetingSystemDB_log.ldf' , SIZE = 219264KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LiveMeetingSystemDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LiveMeetingSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LiveMeetingSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LiveMeetingSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LiveMeetingSystemDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LiveMeetingSystemDB]
GO
/****** Object:  User [YYY]    Script Date: 5/25/2018 1:12:32 PM ******/
CREATE USER [YYY] FOR LOGIN [YYY] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[CandidateResult]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateResult](
	[VoteID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[VoterID] [nvarchar](50) NOT NULL,
	[CandidateID] [int] NOT NULL,
	[Sounds] [int] NOT NULL,
 CONSTRAINT [PK_CandidateResult] PRIMARY KEY CLUSTERED 
(
	[VoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Candidates]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidates](
	[CandidateID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[DeptCode] [int] NOT NULL,
	[FacultyCode] [int] NOT NULL,
 CONSTRAINT [PK_Candidates] PRIMARY KEY CLUSTERED 
(
	[CandidateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[DeptCode] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [nvarchar](200) NOT NULL,
	[DeptPhone] [varchar](50) NULL,
	[DeptFax] [varchar](50) NULL,
	[DeptEmail] [varchar](100) NULL,
	[DeptWebsite] [varchar](100) NULL,
	[DeptFacultyCode] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DeptCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Faculty](
	[FacultyCode] [int] IDENTITY(1,1) NOT NULL,
	[FacultyName] [nvarchar](200) NOT NULL,
	[FacultyPhone] [varchar](50) NULL,
	[FacultyFax] [varchar](50) NULL,
	[FacultyEmail] [varchar](100) NULL,
	[FacultyWebsite] [varchar](100) NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[FacultyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Issue]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Issue] [nvarchar](max) NOT NULL,
	[FacultyCode] [int] NOT NULL,
	[DeptCode] [int] NOT NULL,
 CONSTRAINT [PK_Issue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IssueResult]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueResult](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[IssueID] [int] NOT NULL,
	[VoterID] [nvarchar](50) NOT NULL,
	[FacultyCode] [int] NOT NULL,
	[DeptCode] [int] NOT NULL,
	[Result] [int] NOT NULL,
 CONSTRAINT [PK_IssueResult] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MeetingGroup]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeetingGroup](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](max) NOT NULL,
	[PlenaryID] [nvarchar](50) NOT NULL,
	[LeaderID] [nvarchar](50) NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[DeptCode] [int] NOT NULL,
	[FacultyCode] [int] NOT NULL,
 CONSTRAINT [PK_LogoutTime_1] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Minutes]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Minutes](
	[MenutesId] [int] IDENTITY(1,1) NOT NULL,
	[Minutes] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[DeptCode] [int] NOT NULL,
	[FacultyCode] [int] NOT NULL,
 CONSTRAINT [PK_Minutes] PRIMARY KEY CLUSTERED 
(
	[MenutesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](60) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Month] [nvarchar](50) NOT NULL,
	[Agenda] [nvarchar](max) NOT NULL,
	[DeptCode] [int] NOT NULL,
	[FacultyCode] [int] NOT NULL,
 CONSTRAINT [PK_AnualSchedule_1] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Files]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Files](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ContentType] [nvarchar](200) NOT NULL,
	[Data] [varbinary](max) NOT NULL,
	[FileSize] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblFiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_UserLoginHistory]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserLoginHistory](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[LoginDate] [datetime] NULL,
	[DeptCode] [int] NOT NULL,
	[FacultyCode] [int] NOT NULL,
 CONSTRAINT [PK_tbl_UserLoginHistory] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_UserLogoutHistory]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserLogoutHistory](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[LogoutDate] [datetime] NULL,
	[DeptCode] [int] NOT NULL,
	[FacultyCode] [int] NOT NULL,
 CONSTRAINT [PK_tbl_UserLogoutHistory] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Turn]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turn](
	[TurnID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Turn] PRIMARY KEY CLUSTERED 
(
	[TurnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Turn] UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Sex] [char](10) NOT NULL,
	[Email] [nvarchar](200) NULL,
	[Phone] [nvarchar](16) NULL,
	[DeptCode] [int] NOT NULL,
	[FacultyCode] [int] NOT NULL,
 CONSTRAINT [PK_Usertable] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccount](
	[UserId] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
	[Status] [smallint] NOT NULL,
	[Question] [nvarchar](max) NULL,
	[Answer] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
	[Status] [smallint] NOT NULL,
	[AssignedOnDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ViewAttendance]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewAttendance]
AS
SELECT        dbo.[User].UserId, dbo.[User].FirstName, dbo.[User].LastName, dbo.[User].Sex, dbo.Faculty.FacultyName, dbo.Department.DeptName, dbo.tbl_UserLoginHistory.LoginDate, dbo.tbl_UserLogoutHistory.LogoutDate
FROM            dbo.[User] INNER JOIN
                         dbo.Faculty ON dbo.[User].FacultyCode = dbo.Faculty.FacultyCode INNER JOIN
                         dbo.tbl_UserLoginHistory ON dbo.Faculty.FacultyCode = dbo.tbl_UserLoginHistory.FacultyCode INNER JOIN
                         dbo.tbl_UserLogoutHistory ON dbo.Faculty.FacultyCode = dbo.tbl_UserLogoutHistory.FacultyCode INNER JOIN
                         dbo.Department ON dbo.[User].DeptCode = dbo.Department.DeptCode AND dbo.Faculty.FacultyCode = dbo.Department.DeptFacultyCode AND dbo.tbl_UserLoginHistory.DeptCode = dbo.Department.DeptCode AND 
                         dbo.tbl_UserLogoutHistory.DeptCode = dbo.Department.DeptCode

GO
/****** Object:  View [dbo].[ViewUserAccount]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewUserAccount]
AS
SELECT        dbo.[User].UserId, dbo.[User].FirstName, dbo.[User].LastName, dbo.UserAccount.UserName, dbo.UserAccount.Password
FROM            dbo.[User] INNER JOIN
                         dbo.UserAccount ON dbo.[User].UserId = dbo.UserAccount.UserId

GO
/****** Object:  View [dbo].[ViewUserInformation]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewUserInformation]
AS
SELECT        dbo.UserAccount.UserId, dbo.[User].FirstName, dbo.[User].LastName, dbo.[User].DeptCode, dbo.[User].FacultyCode, dbo.Faculty.FacultyName, dbo.Department.DeptName, dbo.UserAccount.UserName, 
                         dbo.UserAccount.Password
FROM            dbo.[User] INNER JOIN
                         dbo.UserAccount ON dbo.[User].UserId = dbo.UserAccount.UserId INNER JOIN
                         dbo.Faculty ON dbo.[User].FacultyCode = dbo.Faculty.FacultyCode INNER JOIN
                         dbo.Department ON dbo.[User].DeptCode = dbo.Department.DeptCode AND dbo.Faculty.FacultyCode = dbo.Department.DeptFacultyCode

GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]

GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]

GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]

GO
/****** Object:  View [dbo].[vw_Minutes]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Minutes]
AS
SELECT        dbo.Minutes.Minutes, dbo.Minutes.UserId, dbo.Minutes.Date, dbo.[User].FirstName, dbo.[User].LastName, dbo.Faculty.FacultyName, dbo.Department.DeptName
FROM            dbo.Minutes INNER JOIN
                         dbo.[User] ON dbo.Minutes.UserId = dbo.[User].UserId INNER JOIN
                         dbo.Faculty ON dbo.Minutes.FacultyCode = dbo.Faculty.FacultyCode AND dbo.[User].FacultyCode = dbo.Faculty.FacultyCode INNER JOIN
                         dbo.Department ON dbo.Minutes.DeptCode = dbo.Department.DeptCode AND dbo.[User].DeptCode = dbo.Department.DeptCode AND dbo.Faculty.FacultyCode = dbo.Department.DeptFacultyCode

GO
ALTER TABLE [dbo].[CandidateResult]  WITH CHECK ADD  CONSTRAINT [FK_CandidateResult_Candidates] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[Candidates] ([CandidateID])
GO
ALTER TABLE [dbo].[CandidateResult] CHECK CONSTRAINT [FK_CandidateResult_Candidates]
GO
ALTER TABLE [dbo].[CandidateResult]  WITH CHECK ADD  CONSTRAINT [FK_CandidateResult_User] FOREIGN KEY([VoterID])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[CandidateResult] CHECK CONSTRAINT [FK_CandidateResult_User]
GO
ALTER TABLE [dbo].[CandidateResult]  WITH CHECK ADD  CONSTRAINT [FK_CandidateResult_UserAccount] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserAccount] ([UserId])
GO
ALTER TABLE [dbo].[CandidateResult] CHECK CONSTRAINT [FK_CandidateResult_UserAccount]
GO
ALTER TABLE [dbo].[Candidates]  WITH CHECK ADD  CONSTRAINT [FK_Candidates_Department] FOREIGN KEY([DeptCode])
REFERENCES [dbo].[Department] ([DeptCode])
GO
ALTER TABLE [dbo].[Candidates] CHECK CONSTRAINT [FK_Candidates_Department]
GO
ALTER TABLE [dbo].[Candidates]  WITH CHECK ADD  CONSTRAINT [FK_Candidates_Faculty] FOREIGN KEY([FacultyCode])
REFERENCES [dbo].[Faculty] ([FacultyCode])
GO
ALTER TABLE [dbo].[Candidates] CHECK CONSTRAINT [FK_Candidates_Faculty]
GO
ALTER TABLE [dbo].[Candidates]  WITH CHECK ADD  CONSTRAINT [FK_Candidates_UserAccount] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserAccount] ([UserId])
GO
ALTER TABLE [dbo].[Candidates] CHECK CONSTRAINT [FK_Candidates_UserAccount]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Faculty] FOREIGN KEY([DeptFacultyCode])
REFERENCES [dbo].[Faculty] ([FacultyCode])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Faculty]
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Department] FOREIGN KEY([DeptCode])
REFERENCES [dbo].[Department] ([DeptCode])
GO
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Department]
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Faculty] FOREIGN KEY([FacultyCode])
REFERENCES [dbo].[Faculty] ([FacultyCode])
GO
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Faculty]
GO
ALTER TABLE [dbo].[IssueResult]  WITH CHECK ADD  CONSTRAINT [FK_IssueResult_Department] FOREIGN KEY([DeptCode])
REFERENCES [dbo].[Department] ([DeptCode])
GO
ALTER TABLE [dbo].[IssueResult] CHECK CONSTRAINT [FK_IssueResult_Department]
GO
ALTER TABLE [dbo].[IssueResult]  WITH CHECK ADD  CONSTRAINT [FK_IssueResult_Faculty] FOREIGN KEY([FacultyCode])
REFERENCES [dbo].[Faculty] ([FacultyCode])
GO
ALTER TABLE [dbo].[IssueResult] CHECK CONSTRAINT [FK_IssueResult_Faculty]
GO
ALTER TABLE [dbo].[IssueResult]  WITH CHECK ADD  CONSTRAINT [FK_IssueResult_Issue] FOREIGN KEY([IssueID])
REFERENCES [dbo].[Issue] ([ID])
GO
ALTER TABLE [dbo].[IssueResult] CHECK CONSTRAINT [FK_IssueResult_Issue]
GO
ALTER TABLE [dbo].[IssueResult]  WITH CHECK ADD  CONSTRAINT [FK_IssueResult_IssueResult] FOREIGN KEY([VoterID])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[IssueResult] CHECK CONSTRAINT [FK_IssueResult_IssueResult]
GO
ALTER TABLE [dbo].[MeetingGroup]  WITH CHECK ADD  CONSTRAINT [FK_MeetingGroup_Department] FOREIGN KEY([DeptCode])
REFERENCES [dbo].[Department] ([DeptCode])
GO
ALTER TABLE [dbo].[MeetingGroup] CHECK CONSTRAINT [FK_MeetingGroup_Department]
GO
ALTER TABLE [dbo].[MeetingGroup]  WITH CHECK ADD  CONSTRAINT [FK_MeetingGroup_Faculty] FOREIGN KEY([FacultyCode])
REFERENCES [dbo].[Faculty] ([FacultyCode])
GO
ALTER TABLE [dbo].[MeetingGroup] CHECK CONSTRAINT [FK_MeetingGroup_Faculty]
GO
ALTER TABLE [dbo].[MeetingGroup]  WITH CHECK ADD  CONSTRAINT [FK_MeetingGroup_Schedule] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedule] ([ScheduleID])
GO
ALTER TABLE [dbo].[MeetingGroup] CHECK CONSTRAINT [FK_MeetingGroup_Schedule]
GO
ALTER TABLE [dbo].[MeetingGroup]  WITH CHECK ADD  CONSTRAINT [FK_MeetingGroup_UserAccount] FOREIGN KEY([PlenaryID])
REFERENCES [dbo].[UserAccount] ([UserId])
GO
ALTER TABLE [dbo].[MeetingGroup] CHECK CONSTRAINT [FK_MeetingGroup_UserAccount]
GO
ALTER TABLE [dbo].[Minutes]  WITH CHECK ADD  CONSTRAINT [FK_Minutes_Department] FOREIGN KEY([DeptCode])
REFERENCES [dbo].[Department] ([DeptCode])
GO
ALTER TABLE [dbo].[Minutes] CHECK CONSTRAINT [FK_Minutes_Department]
GO
ALTER TABLE [dbo].[Minutes]  WITH CHECK ADD  CONSTRAINT [FK_Minutes_Faculty] FOREIGN KEY([FacultyCode])
REFERENCES [dbo].[Faculty] ([FacultyCode])
GO
ALTER TABLE [dbo].[Minutes] CHECK CONSTRAINT [FK_Minutes_Faculty]
GO
ALTER TABLE [dbo].[Minutes]  WITH CHECK ADD  CONSTRAINT [FK_Minutes_UserAccount] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([UserId])
GO
ALTER TABLE [dbo].[Minutes] CHECK CONSTRAINT [FK_Minutes_UserAccount]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Department] FOREIGN KEY([DeptCode])
REFERENCES [dbo].[Department] ([DeptCode])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Department]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Faculty] FOREIGN KEY([FacultyCode])
REFERENCES [dbo].[Faculty] ([FacultyCode])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Faculty]
GO
ALTER TABLE [dbo].[tbl_Files]  WITH CHECK ADD  CONSTRAINT [FK_tblFiles_UserAccount] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([UserId])
GO
ALTER TABLE [dbo].[tbl_Files] CHECK CONSTRAINT [FK_tblFiles_UserAccount]
GO
ALTER TABLE [dbo].[tbl_UserLoginHistory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserLoginHistory_Department] FOREIGN KEY([DeptCode])
REFERENCES [dbo].[Department] ([DeptCode])
GO
ALTER TABLE [dbo].[tbl_UserLoginHistory] CHECK CONSTRAINT [FK_tbl_UserLoginHistory_Department]
GO
ALTER TABLE [dbo].[tbl_UserLoginHistory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserLoginHistory_Faculty] FOREIGN KEY([FacultyCode])
REFERENCES [dbo].[Faculty] ([FacultyCode])
GO
ALTER TABLE [dbo].[tbl_UserLoginHistory] CHECK CONSTRAINT [FK_tbl_UserLoginHistory_Faculty]
GO
ALTER TABLE [dbo].[tbl_UserLoginHistory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserLoginHistory_UserAccount] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([UserId])
GO
ALTER TABLE [dbo].[tbl_UserLoginHistory] CHECK CONSTRAINT [FK_tbl_UserLoginHistory_UserAccount]
GO
ALTER TABLE [dbo].[tbl_UserLogoutHistory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserLogoutHistory_Department] FOREIGN KEY([DeptCode])
REFERENCES [dbo].[Department] ([DeptCode])
GO
ALTER TABLE [dbo].[tbl_UserLogoutHistory] CHECK CONSTRAINT [FK_tbl_UserLogoutHistory_Department]
GO
ALTER TABLE [dbo].[tbl_UserLogoutHistory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserLogoutHistory_Faculty] FOREIGN KEY([FacultyCode])
REFERENCES [dbo].[Faculty] ([FacultyCode])
GO
ALTER TABLE [dbo].[tbl_UserLogoutHistory] CHECK CONSTRAINT [FK_tbl_UserLogoutHistory_Faculty]
GO
ALTER TABLE [dbo].[tbl_UserLogoutHistory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserLogoutHistory_UserAccount] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([UserId])
GO
ALTER TABLE [dbo].[tbl_UserLogoutHistory] CHECK CONSTRAINT [FK_tbl_UserLogoutHistory_UserAccount]
GO
ALTER TABLE [dbo].[Turn]  WITH CHECK ADD  CONSTRAINT [FK_Turn_UserAccount] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([UserId])
GO
ALTER TABLE [dbo].[Turn] CHECK CONSTRAINT [FK_Turn_UserAccount]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([DeptCode])
REFERENCES [dbo].[Department] ([DeptCode])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Faculty] FOREIGN KEY([FacultyCode])
REFERENCES [dbo].[Faculty] ([FacultyCode])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Faculty]
GO
ALTER TABLE [dbo].[UserAccount]  WITH CHECK ADD  CONSTRAINT [FK_UserAccount_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserAccount] CHECK CONSTRAINT [FK_UserAccount_User]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_UserAccount] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([UserId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_UserAccount]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Delete]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Delete]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */ 
	RETURN



GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAccount]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteAccount] 
	-- Add the parameters for the stored procedure here
	@UserId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from UserRole where UserId=@UserId
	delete from UserAccount where UserId=@UserId
	
END




GO
/****** Object:  StoredProcedure [dbo].[Sp_StoreFile]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_StoreFile] 
	-- Add the parameters for the stored procedure here
	@userid nvarchar(50), 
	@filename nvarchar(50),
	@filetype nvarchar(50),
	@size nvarchar(50),
	@data varbinary(MAX)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [tbl_Files](UserId,[Name],ContentType,FileSize,[Data]) values(@userid,@filename,@filetype,@size,@data)
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_Update_Password]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Update_Password] 
	
	(
	@LoginName varchar(50),
	@Password varchar(50) OUTPUT
	)
	
AS
	/* SET NOCOUNT ON */ 
	UPDATE    tbl_User_LoginAccount
	SET              Password =@Password where LoginName=@LoginName
	RETURN



GO
/****** Object:  StoredProcedure [dbo].[spAssignUserToRole]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAssignUserToRole]
	@UserId nvarchar(50),
	@RoleId int,
	@EffectiveDate datetime,
	@ExpiryDate datetime,
	@Status int
AS
BEGIN
	Insert into UserRole(UserId, RoleId, EffectiveDate, [ExpiryDate], [Status], AssignedOnDate)
		values(@UserId, @RoleId, @EffectiveDate, @ExpiryDate, @Status, GETDATE());
END




GO
/****** Object:  StoredProcedure [dbo].[spCreateAccount]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCreateAccount] 
	-- Add the parameters for the stored procedure here
	@UserId nvarchar(50),
	@Username nvarchar(50),
	@Password nvarchar(16),
	@Status smallint null
AS
BEGIN
	declare 
	@userExist nvarchar(50), @usernameExist nvarchar(50) 
    -- check user exist in Employee table
	Select @userExist = UserId from [User] where UserId = @UserId;
	-- User not Registered
	IF @userExist IS Null
		BEGIN
			Select -2 [Account];
		END
	ELSE
		BEGIN
			-- Check Username/Account already exist or not
			Select @usernameExist = Username from UserAccount where Username = @Username OR UserId=@UserId
			-- Username already exist
			IF @usernameExist IS NOT Null
				BEGIN
					Select -1 [Account];
				END
			ELSE
				BEGIN
					-- create user account /insert user account data
					Insert into UserAccount(UserId, Username, [Password], [Status]) Values (@UserId, @Username, @Password, @Status)
					Select 1 [Account];
				END
		END
END



GO
/****** Object:  StoredProcedure [dbo].[SpGetAllUserAccounts]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SpGetAllUserAccounts]
AS
BEGIN
	SELECT * from UserAccount
END







GO
/****** Object:  StoredProcedure [dbo].[spGetUnAssignedRole]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetUnAssignedRole]
	@UserId nvarchar(50)
AS
BEGIN
	SELECT  r.[RoleId], r.[RoleName], r.[Description] from [Role] r
	where r.[RoleId] NOT In (Select ur.[RoleId] from [UserRole] ur where  ur.[UserId]= @UserId  AND (ur.[Status] = 1 OR DATEDIFF(day, Getdate(),ur.[ExpiryDate]) > 0))
END





GO
/****** Object:  StoredProcedure [dbo].[spGetUnAssignedUserToGroup]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetUnAssignedUserToGroup]
AS
BEGIN
	SELECT  [UserId],[UserName] from [UserAccount] 
	where [UserId] NOT In (Select [UserId] from [MeetingGroup])
END







GO
/****** Object:  StoredProcedure [dbo].[spGetUnsiggnedUser]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetUnsiggnedUser]
AS
BEGIN
 SELECT        RoleId
                              FROM            UserRole
                              WHERE        RoleId = 2
	SELECT        UserId, UserName
FROM            UserAccount
WHERE        UserId NOT IN
                             (
							 SELECT        UserId
                               FROM            MeetingGroup 
							  
							  )
                             
END







GO
/****** Object:  StoredProcedure [dbo].[spGetUserRole]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetUserRole]
	@Username varchar(100)
AS
BEGIN
declare @userid nvarchar(50)
	SELECT @userid = UserId from UserAccount where Username = @Username
	SELECT UserRole.UserRoleId, UserRole.UserId, UserRole.RoleId, UserRole.EffectiveDate, UserRole.ExpiryDate, UserRole.Status, UserRole.AssignedOnDate, Role.RoleName
	FROM   UserRole INNER JOIN
           Role ON UserRole.RoleId = Role.RoleId Where UserRole.UserId = @userid AND
		   UserRole.Status = 1 AND DATEDIFF(day, Getdate(),UserRole.ExpiryDate) > 0
END






GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 5/25/2018 1:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spLogin] 
	@username nvarchar (100),
	@password nvarchar(20)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE 
		@userExist varchar (100),
		@status int
	SELECT @userExist=[Username], @status=[Status] FROM UserAccount WHERE Username = @Username AND [Password] = @Password;
    IF @userExist is not NULL
	BEGIN
		IF @status = 1
			BEGIN
				Select 1 [Login];-- Account exist.
			END
		ELSE if @status = 0
			BEGIN
				Select 0 [Login]; -- Account not activated.
			END
		ELSE if @status = 2
			BEGIN
				Select 2 [Login]; -- Account marked as disabled.
			END
		ELSE
			BEGIN
				Select 3 [Login]; -- Account marked as deleted.
			END
	END
	ELSE
		BEGIN
			Select -1 [Login]; -- Account no exist.
		END
END


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[21] 4[14] 2[34] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_UserLoginHistory"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tbl_UserLogoutHistory"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 268
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Faculty"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 842
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Widt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAttendance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'h = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAttendance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAttendance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[5] 2[18] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserAccount"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "UserAccount"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Faculty"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 842
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserInformation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewUserInformation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[21] 4[5] 2[27] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Minutes"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Faculty"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 842
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Minutes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Minutes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Minutes'
GO
USE [master]
GO
ALTER DATABASE [LiveMeetingSystemDB] SET  READ_WRITE 
GO
