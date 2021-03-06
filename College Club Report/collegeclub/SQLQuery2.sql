USE [master]
GO
/****** Object:  Database [dbcollegeclub]    Script Date: 8/15/2017 1:42:24 PM ******/
CREATE DATABASE [dbcollegeclub]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbcollegeclub', FILENAME = N'E:\New folder\dbcollegeclub.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbcollegeclub_log', FILENAME = N'E:\New folder\dbcollegeclub_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbcollegeclub] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbcollegeclub].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbcollegeclub] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbcollegeclub] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbcollegeclub] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbcollegeclub] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbcollegeclub] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbcollegeclub] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbcollegeclub] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dbcollegeclub] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbcollegeclub] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbcollegeclub] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbcollegeclub] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbcollegeclub] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbcollegeclub] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbcollegeclub] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbcollegeclub] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbcollegeclub] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbcollegeclub] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbcollegeclub] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbcollegeclub] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbcollegeclub] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbcollegeclub] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbcollegeclub] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbcollegeclub] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbcollegeclub] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbcollegeclub] SET  MULTI_USER 
GO
ALTER DATABASE [dbcollegeclub] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbcollegeclub] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbcollegeclub] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbcollegeclub] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [dbcollegeclub]
GO
/****** Object:  StoredProcedure [dbo].[prcInsertClub]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcInsertClub]
@clubname varchar(50),
@startdate date,
@studentincharge varchar(50),
@contactnumber varchar(50),
@email varchar(50),
@teacherincharge varchar(50),
@membershipfee money
as
 begin
 if not exists(select * from tbclub where clubname=@clubname)
 insert into tbclub values(
 @clubname,
 @startdate,
 @studentincharge,
 @contactnumber,
 @email,
 @teacherincharge,
 @membershipfee)
 end


GO
/****** Object:  StoredProcedure [dbo].[prcInsertEvent]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcInsertEvent]
@clubid bigint,
@name varchar(50),
@type varchar(50),
@proposaldate date,
@closingdate date,
@eventdate date,
@venue varchar(50),
@participationfee money,
@time varchar(50),
@chiefguest varchar(50),
@prize1 varchar(50),
@prize2 varchar(50),
@prize3 varchar(50)
as
 begin
 if not exists(select * from tbevent where clubid=@clubid and name=@name)
 insert into tbevent values(
 @clubid,
 @name,
 @type,
 @proposaldate,
 @closingdate,
 @eventdate,
 @venue,
 @participationfee,
 @time,
 @chiefguest,
 @prize1,
 @prize2,
 @prize3,
 'ACTIVE')
 end

	
GO
/****** Object:  StoredProcedure [dbo].[prcInsertLogin]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcInsertLogin]
@username varchar(50),
@password varchar(50)
as
begin
if not exists(select * from tblogin where username=@username)
insert into tblogin values(
@username,
@password)
end
GO
/****** Object:  StoredProcedure [dbo].[prcInsertMember]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcInsertMember]
@clubid bigint,
@member_name varchar(50),
@rollnumber varchar(50),
@coursename varchar(50),
@yearsession bigint,
@email varchar(50),
@contactnumber varchar(50),
@registrationdate date,
@paidamount money,
@pendingamount money 
as
begin
if not exists(Select * from tbmembership where clubid=@clubid and [roll number]= @rollnumber)
insert into tbmembership values(
@clubid,
@member_name,
@rollnumber,
@coursename,
@yearsession,
@email,
@contactnumber,
@registrationdate,
@paidamount,
@pendingamount)
end

GO
/****** Object:  StoredProcedure [dbo].[prcInsertParticipant]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcInsertParticipant]
@eventid bigint,
@name varchar(50),
@fathersname varchar(50),
@rollnumber varchar(50),
@coursename varchar(50),
@yearsemester varchar(50),
@email varchar(50),
@contactnumber varchar(50),
@enrollmentdate date,
@paidamount money,
@pendingamount money, 
@result varchar(50)

as
begin
if not exists(select * from tbparticipant where eventid=@eventid and [roll number]=@rollnumber) 
insert into tbparticipant values(
@eventid,
@name,
@fathersname,
@rollnumber,
@coursename,
@yearsemester,
@email,
@contactnumber,
@enrollmentdate,
@paidamount,
@pendingamount,
@result)
end

GO
/****** Object:  StoredProcedure [dbo].[prcINsertResult]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcINsertResult]
@eventid bigint,
@participantid1 bigint,
@participantid2 bigint,
@participantid3 bigint,
@resultdate date
as
begin
if not exists (select * from tbresult where eventid=@eventid and participantid1=@participantid1 and participantid2=@participantid2 and participantid3=@participantid3)
insert into tbresult values(
@eventid,
@participantid1,
@participantid2,
@participantid3,
@resultdate)
end
GO
/****** Object:  StoredProcedure [dbo].[prcInsertVolunteer]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcInsertVolunteer]
@clubid bigint,
@membershipid bigint,
@designation varchar(50)

as
begin
if not exists(select *  from tbvolunteer where membershipid=@membershipid and clubid=@clubid)
insert into tbvolunteer values(
@clubid,
@membershipid,
@designation,
'ACTIVE')
end
GO
/****** Object:  StoredProcedure [dbo].[prcupdateclub]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcupdateclub]
@clubid bigint,
@clubname varchar(50),
@startdate date,
@studentincharge varchar(50),
@contactnumber varchar(50),
@email varchar(50),
@teacherincharge varchar(50),
@membershipfee money
as
begin
if not exists(select * from tbclub where clubname=@clubname and clubid<>@clubid)
update tbclub set
clubname=@clubname,
startdate=@startdate,
[student incharge]=@studentincharge,
[contact number]=@contactnumber,
email=@email,
[teacher incharge]=@teacherincharge,
[membership fee]=@membershipfee
where clubid=@clubid
end

GO
/****** Object:  StoredProcedure [dbo].[prcUpdateLogin]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcUpdateLogin]
@loginid bigint,
@username varchar(50),
@password varchar(50)
as
begin
if not exists(select * from tblogin where username=@username and loginid<>@loginid)
update tblogin set
username=@username,
password=@password
where username=@username
end

GO
/****** Object:  StoredProcedure [dbo].[prcUpdateMember]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcUpdateMember]
@membershipid bigint,
@clubid bigint,
@member_name varchar(50),
@rollnumber varchar(50),
@coursename varchar(50),
@yearsession varchar(50),
@email varchar(50),
@contactnumber varchar(50),
@registrationdate date,
@paidamount money,
@pendingamount money
as
begin
if not exists(Select * from tbmembership where clubid=@clubid and [roll number]= @rollnumber and [membership id]<>@membershipid)
update tbmembership set
clubid=@clubid,
member_name=@member_name,
[roll number]=@rollnumber,
[course name]=@coursename,
[year/ session]=@yearsession,
email=@email,
[contact number]=@contactnumber,
[registration date]=@registrationdate,
[paid amount]=@paidamount,
[pending amount]=@pendingamount
where [membership id]=@membershipid
end

GO
/****** Object:  StoredProcedure [dbo].[prcUpdateParticipant]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcUpdateParticipant]
@participantid bigint,
@eventid bigint,
@name varchar(50),
@fathersname varchar(50),
@rollnumber varchar(50),
@coursename varchar(50),
@yearsemester varchar(50),
@email varchar(50),
@contactnumber varchar(50),
@enrollmentdate date,
@paidamount money,
@pendingamount money,
@result varchar(50)
as
begin
if not exists(Select * from tbparticipant where eventid=@eventid and [roll number]= @rollnumber and participantid<>@participantid)
update tbparticipant set
eventid=@eventid,
name=@name,
[fathers name]=@fathersname,
[roll number]=@rollnumber,
[course name]=@coursename,
[year/semester]=@yearsemester,
email=@email,
[contact number]=@contactnumber,
[enrollment date]=@enrollmentdate,
[paid amount]=@paidamount,
[pending amount]=@pendingamount,
result=@result
where participantid=@participantid
end

GO
/****** Object:  StoredProcedure [dbo].[prcUpdateResult]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcUpdateResult]
@resultid bigint,
@eventid bigint,
@participantid1 bigint,
@participantid2 bigint,
@participantid3 bigint,
@resultdate date
as
 begin
 if not exists (select * from tbresult where eventid=@eventid and participantid1=@participantid1 and participantid2=@participantid2 and participantid3=@participantid3 and resultid<>@resultid)
 update tbresult set
 eventid=@eventid,
 participantid1=@participantid1,
 participantid2=@participantid2,
 participantid3=@participantid3,
 resultdate =@resultdate
 where
 resultid=@resultid
 end


GO
/****** Object:  StoredProcedure [dbo].[prcupdatevent]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcupdatevent]
@eventid bigint,
@clubid bigint,
@name varchar(50),
@type varchar(50),
@proposaldate date,
@closingdate date,
@eventdate date,
@venue varchar(50),
@participationfee money,
@time varchar(50),
@chiefguest varchar(50),
@prize1 varchar(50),
@prize2 varchar(50),
@prize3 varchar(50)
as
begin
if not exists(select * from tbevent where name=@name and eventid<>@eventid)
update tbevent set
clubid=@clubid,
name=@name,
type=@type,
[proposal date]=@proposaldate,
[closing date]=@closingdate,
[event date]=@eventdate,
venue=@venue,
[participation fee]=@participationfee,
time=@time,
[chief guest]=@chiefguest,
prize1=@prize1,
prize2=@prize2,
prize3=@prize3
where eventid=@eventid
end
GO
/****** Object:  StoredProcedure [dbo].[prcUpdateVolunteer]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcUpdateVolunteer]
@volunteerid bigint,
@clubid bigint,
@membershipid bigint,
@designation varchar(50)

as
begin
if not exists(select *  from tbvolunteer where membershipid=@membershipid and volunteerid<>@volunteerid)
update tbvolunteer set
clubid=@clubid,
membershipid=@membershipid,
designation=@designation
where volunteerid=@volunteerid
end
GO
/****** Object:  Table [dbo].[tbclub]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbclub](
	[Clubid] [bigint] IDENTITY(1,1) NOT NULL,
	[clubname] [varchar](50) NOT NULL,
	[startdate] [date] NOT NULL,
	[student incharge] [varchar](50) NOT NULL,
	[contact number] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[teacher incharge] [varchar](50) NOT NULL,
	[membership fee] [money] NOT NULL,
 CONSTRAINT [PK_tbclub] PRIMARY KEY CLUSTERED 
(
	[Clubid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbevent]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbevent](
	[eventid] [bigint] IDENTITY(1,1) NOT NULL,
	[clubid] [bigint] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[type] [varchar](50) NULL,
	[proposal date] [date] NOT NULL,
	[closing date] [date] NOT NULL,
	[event date] [date] NOT NULL,
	[venue] [varchar](50) NOT NULL,
	[participation fee] [money] NOT NULL,
	[time] [varchar](50) NOT NULL,
	[chief guest] [varchar](50) NOT NULL,
	[prize1] [varchar](50) NOT NULL,
	[prize2] [varchar](50) NOT NULL,
	[prize3] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbevent] PRIMARY KEY CLUSTERED 
(
	[eventid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblogin]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblogin](
	[Loginid] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblogin] PRIMARY KEY CLUSTERED 
(
	[Loginid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbmembership]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbmembership](
	[membership id] [bigint] IDENTITY(1,1) NOT NULL,
	[clubid] [bigint] NOT NULL,
	[member_name] [varchar](50) NOT NULL,
	[roll number] [varchar](50) NOT NULL,
	[course name] [varchar](50) NOT NULL,
	[year/ session] [bigint] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[contact number] [varchar](50) NOT NULL,
	[registration date] [date] NOT NULL,
	[paid amount] [money] NOT NULL,
	[pending amount] [money] NOT NULL,
 CONSTRAINT [PK_tbmembership] PRIMARY KEY CLUSTERED 
(
	[membership id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbparticipant]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbparticipant](
	[participantid] [bigint] IDENTITY(1,1) NOT NULL,
	[eventid] [bigint] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[fathers name] [varchar](50) NOT NULL,
	[roll number] [varchar](50) NOT NULL,
	[course name] [varchar](50) NOT NULL,
	[year/semester] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[contact number] [varchar](50) NOT NULL,
	[enrollment date] [date] NOT NULL,
	[paid amount] [money] NOT NULL,
	[pending amount] [money] NOT NULL,
	[result] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbparticipant] PRIMARY KEY CLUSTERED 
(
	[participantid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbresult]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbresult](
	[resultid] [bigint] IDENTITY(1,1) NOT NULL,
	[eventid] [bigint] NOT NULL,
	[participantid1] [bigint] NOT NULL,
	[participantid2] [bigint] NOT NULL,
	[participantid3] [bigint] NOT NULL,
	[resultdate] [date] NULL,
 CONSTRAINT [PK_tbresult] PRIMARY KEY CLUSTERED 
(
	[resultid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbvolunteer]    Script Date: 8/15/2017 1:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbvolunteer](
	[volunteerid] [bigint] IDENTITY(1,1) NOT NULL,
	[clubid] [bigint] NOT NULL,
	[membershipid] [bigint] NOT NULL,
	[designation] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbvolunteer] PRIMARY KEY CLUSTERED 
(
	[volunteerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbclub] ON 

GO
INSERT [dbo].[tbclub] ([Clubid], [clubname], [startdate], [student incharge], [contact number], [email], [teacher incharge], [membership fee]) VALUES (1, N'csi', CAST(0x22250B00 AS Date), N'deepika', N'12345', N'abc', N'def', 20.0000)
GO
INSERT [dbo].[tbclub] ([Clubid], [clubname], [startdate], [student incharge], [contact number], [email], [teacher incharge], [membership fee]) VALUES (4, N'ncc', CAST(0x71260B00 AS Date), N'aman', N'123456', N'abcd', N'bcd', 30.0000)
GO
INSERT [dbo].[tbclub] ([Clubid], [clubname], [startdate], [student incharge], [contact number], [email], [teacher incharge], [membership fee]) VALUES (5, N'nss', CAST(0xA2330B00 AS Date), N'ashu', N'10000', N'def', N'pqr', 20.0000)
GO
INSERT [dbo].[tbclub] ([Clubid], [clubname], [startdate], [student incharge], [contact number], [email], [teacher incharge], [membership fee]) VALUES (6, N'computers                                         ', CAST(0x633D0B00 AS Date), N'ashish      ', N'111                                               ', N'abc                                               ', N'abcd                                              ', 10.0000)
GO
INSERT [dbo].[tbclub] ([Clubid], [clubname], [startdate], [student incharge], [contact number], [email], [teacher incharge], [membership fee]) VALUES (8, N'freaky', CAST(0x883A0B00 AS Date), N'mehak', N'00999', N'def', N'poo', 20.0000)
GO
INSERT [dbo].[tbclub] ([Clubid], [clubname], [startdate], [student incharge], [contact number], [email], [teacher incharge], [membership fee]) VALUES (9, N'rose', CAST(0xFD380B00 AS Date), N'priya', N'222', N'fds', N'ttt', 30.0000)
GO
INSERT [dbo].[tbclub] ([Clubid], [clubname], [startdate], [student incharge], [contact number], [email], [teacher incharge], [membership fee]) VALUES (10, N'girlies', CAST(0xC63C0B00 AS Date), N'rahul', N'22233', N'avc4', N'ppp', 20.0000)
GO
INSERT [dbo].[tbclub] ([Clubid], [clubname], [startdate], [student incharge], [contact number], [email], [teacher incharge], [membership fee]) VALUES (11, N'drawing', CAST(0xE53C0B00 AS Date), N'tina', N'266', N'oiuy', N'abc', 10.0000)
GO
SET IDENTITY_INSERT [dbo].[tbclub] OFF
GO
SET IDENTITY_INSERT [dbo].[tbevent] ON 

GO
INSERT [dbo].[tbevent] ([eventid], [clubid], [name], [type], [proposal date], [closing date], [event date], [venue], [participation fee], [time], [chief guest], [prize1], [prize2], [prize3], [status]) VALUES (6, 1, N'flies                                             ', N'quiz                                              ', CAST(0xEE3B0B00 AS Date), CAST(0xF03B0B00 AS Date), CAST(0xF23B0B00 AS Date), N'audi1                                             ', 20.0000, N'1:00                                              ', N'hod                                               ', N'a                                                 ', N'b                                                 ', N'c                                                 ', N'A')
GO
INSERT [dbo].[tbevent] ([eventid], [clubid], [name], [type], [proposal date], [closing date], [event date], [venue], [participation fee], [time], [chief guest], [prize1], [prize2], [prize3], [status]) VALUES (9, 4, N'space', N'dance', CAST(0x103C0B00 AS Date), CAST(0x133C0B00 AS Date), CAST(0x153C0B00 AS Date), N'audi2', 10.0000, N'12', N'hod', N'a', N'b', N'c', N'a')
GO
INSERT [dbo].[tbevent] ([eventid], [clubid], [name], [type], [proposal date], [closing date], [event date], [venue], [participation fee], [time], [chief guest], [prize1], [prize2], [prize3], [status]) VALUES (10, 1, N'fashion', N'walk', CAST(0x5B950A00 AS Date), CAST(0x5B950A00 AS Date), CAST(0x5B950A00 AS Date), N'ss                                                ', 20.0000, N'2:40                                              ', N'ss                                                ', N'a                                                 ', N'b                                                 ', N'c                                                 ', N'ACTIVE')
GO
INSERT [dbo].[tbevent] ([eventid], [clubid], [name], [type], [proposal date], [closing date], [event date], [venue], [participation fee], [time], [chief guest], [prize1], [prize2], [prize3], [status]) VALUES (11, 1, N'health', N'abc                                               ', CAST(0x5B950A00 AS Date), CAST(0x5B950A00 AS Date), CAST(0x5B950A00 AS Date), N'audi1                                             ', 10.0000, N'1:00                                              ', N'hodd                                              ', N'a                                                 ', N'b                                                 ', N'c                                                 ', N'ACTIVE')
GO
INSERT [dbo].[tbevent] ([eventid], [clubid], [name], [type], [proposal date], [closing date], [event date], [venue], [participation fee], [time], [chief guest], [prize1], [prize2], [prize3], [status]) VALUES (12, 5, N'walkers                                           ', N'dance                                             ', CAST(0x6C3C0B00 AS Date), CAST(0x6E3C0B00 AS Date), CAST(0x713C0B00 AS Date), N'open theatre                                      ', 20.0000, N'12:00                                             ', N'dir                                               ', N'd                                                 ', N'e                                                 ', N'f                                                 ', N'ACTIVE')
GO
INSERT [dbo].[tbevent] ([eventid], [clubid], [name], [type], [proposal date], [closing date], [event date], [venue], [participation fee], [time], [chief guest], [prize1], [prize2], [prize3], [status]) VALUES (13, 8, N'draggers                                          ', N'free                                              ', CAST(0xC73C0B00 AS Date), CAST(0xCA3C0B00 AS Date), CAST(0xCC3C0B00 AS Date), N'hall1                                             ', 10.0000, N'10:00                                             ', N'hod2                                              ', N'r                                                 ', N'q                                                 ', N'e                                                 ', N'ACTIVE')
GO
INSERT [dbo].[tbevent] ([eventid], [clubid], [name], [type], [proposal date], [closing date], [event date], [venue], [participation fee], [time], [chief guest], [prize1], [prize2], [prize3], [status]) VALUES (14, 10, N'makeover                                          ', N'beauty                                            ', CAST(0x033D0B00 AS Date), CAST(0x053D0B00 AS Date), CAST(0x083D0B00 AS Date), N'new audi                                          ', 10.0000, N'11:00                                             ', N'hod cse                                           ', N'u                                                 ', N'b                                                 ', N'k                                                 ', N'ACTIVE')
GO
INSERT [dbo].[tbevent] ([eventid], [clubid], [name], [type], [proposal date], [closing date], [event date], [venue], [participation fee], [time], [chief guest], [prize1], [prize2], [prize3], [status]) VALUES (15, 11, N'free drawing                                      ', N'potrait                                           ', CAST(0x3D3D0B00 AS Date), CAST(0x403D0B00 AS Date), CAST(0x413D0B00 AS Date), N'e block                                           ', 20.0000, N'11:00                                             ', N'hod4                                              ', N'r                                                 ', N't                                                 ', N'y                                                 ', N'ACTIVE')
GO
SET IDENTITY_INSERT [dbo].[tbevent] OFF
GO
SET IDENTITY_INSERT [dbo].[tblogin] ON 

GO
INSERT [dbo].[tblogin] ([Loginid], [Username], [Password]) VALUES (1, N'deepika', N'deepika12')
GO
INSERT [dbo].[tblogin] ([Loginid], [Username], [Password]) VALUES (2, N'deeps', N'deepika')
GO
SET IDENTITY_INSERT [dbo].[tblogin] OFF
GO
SET IDENTITY_INSERT [dbo].[tbmembership] ON 

GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (1, 1, N'sanju                                             ', N'12                                                ', N'btech                                             ', 3, N'abc                                               ', N'10000                                             ', CAST(0x333C0B00 AS Date), 20.0000, 0.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (2, 4, N'amni                                              ', N'13                                                ', N'mtech                                             ', 1, N'def6                                              ', N'1999                                              ', CAST(0x683C0B00 AS Date), 20.0000, 0.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (3, 1, N'tina', N'1                                                 ', N'bca', 2, N'q                                                 ', N'1                                                 ', CAST(0x4A3C0B00 AS Date), 10.0000, 0.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (4, 1, N'ashish                                            ', N'18                                                ', N'bba                                               ', 1, N'abc                                               ', N'1111                                              ', CAST(0xF63B0B00 AS Date), 1.0000, 1.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (5, 1, N'likhit                                            ', N'20                                                ', N'btech                                             ', 2017, N'abcd                                              ', N'11110                                             ', CAST(0x633D0B00 AS Date), 10.0000, 10.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (9, 5, N'meena', N'22', N'mba', 2, N'adc', N'111', CAST(0x593B0B00 AS Date), 20.0000, 0.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (10, 11, N'deeps                                             ', N'20                                                ', N'btech                                             ', 2015, N'bcs                                               ', N'22211                                             ', CAST(0x883A0B00 AS Date), 2000.0000, 0.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (11, 10, N'suman                                             ', N'21                                                ', N'mba                                               ', 2017, N'sac                                               ', N'7654                                              ', CAST(0xE43C0B00 AS Date), 3330.0000, 20.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (12, 9, N'mahima                                            ', N'22                                                ', N'bca                                               ', 2016, N'poiu                                              ', N'546710                                            ', CAST(0xF23B0B00 AS Date), 4000.0000, 200.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (13, 8, N'reema                                             ', N'23                                                ', N'mba                                               ', 2017, N'tre                                               ', N'5422                                              ', CAST(0x033D0B00 AS Date), 6000.0000, 400.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (14, 4, N'pooja                                             ', N'98                                                ', N'bba                                               ', 1, N'fsaffas                                           ', N'38611                                             ', CAST(0x403D0B00 AS Date), 20000.0000, 0.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (15, 5, N'priyanka                                          ', N'100                                               ', N'bba                                               ', 2015, N'iefhkfh                                           ', N'9871190                                           ', CAST(0x673A0B00 AS Date), 10000.0000, 1000.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (16, 6, N'priya                                             ', N'101                                               ', N'bca                                               ', 2017, N'jakhiqu                                           ', N'71084326                                          ', CAST(0xE63C0B00 AS Date), 20000.0000, 1000.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (17, 8, N'pankam                                            ', N'102                                               ', N'mtech                                             ', 2016, N'fasg                                              ', N'12324214                                          ', CAST(0x943B0B00 AS Date), 23000.0000, 2000.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (18, 9, N'sanchita                                          ', N'23                                                ', N'bca                                               ', 2017, N'djhf                                              ', N'14543753                                          ', CAST(0x233D0B00 AS Date), 30000.0000, 2000.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (19, 11, N'ishita                                            ', N'1000                                              ', N'bba                                               ', 2015, N'fsaf                                              ', N'98371202                                          ', CAST(0xAE390B00 AS Date), 40000.0000, 1000.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (20, 10, N'tanu                                              ', N'43                                                ', N'btech                                             ', 2017, N'ddffew                                            ', N'873610                                            ', CAST(0xE93C0B00 AS Date), 30000.0000, 1110.0000)
GO
INSERT [dbo].[tbmembership] ([membership id], [clubid], [member_name], [roll number], [course name], [year/ session], [email], [contact number], [registration date], [paid amount], [pending amount]) VALUES (21, 6, N'shiv                                              ', N'23                                                ', N'bca                                               ', 2015, N'wqef                                              ', N'142326                                            ', CAST(0x273A0B00 AS Date), 2000.0000, 0.0000)
GO
SET IDENTITY_INSERT [dbo].[tbmembership] OFF
GO
SET IDENTITY_INSERT [dbo].[tbparticipant] ON 

GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (33, 6, N'deepika                                           ', N'aa                                                ', N'1', N'btech', N'3', N'aa                                                ', N'11776', CAST(0x493C0B00 AS Date), 100.0000, 0.0000, N'pending                                           ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (34, 6, N'aman', N'qq                                                ', N'2', N'bba', N'1                                                 ', N'aaaa', N'1122', CAST(0xEE3B0B00 AS Date), 20.0000, 10.0000, N'1                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (35, 9, N'sanju', N'w                                                 ', N'3', N'bca', N'3', N'dd                                                ', N'0975', CAST(0x983D0B00 AS Date), 10.0000, 20.0000, N'2                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (36, 10, N'ashu', N'ffe                                               ', N'4', N'mba', N'2                                                 ', N'dw                                                ', N'4357', CAST(0x5B3D0B00 AS Date), 10.0000, 20.0000, N'2                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10033, 6, N'ashish', N'bcd', N'5', N'mtech', N'2', N'wwee', N'566', CAST(0x613D0B00 AS Date), 10.0000, 0.0000, N'pending')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10034, 15, N'mona                                              ', N'bvc                                               ', N'12                                                ', N'btech                                             ', N'2                                                 ', N'poiuy                                             ', N'4356                                              ', CAST(0xF13B0B00 AS Date), 1000.0000, 0.0000, N'1                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10035, 14, N'hema                                              ', N'poikj                                             ', N'25                                                ', N'mba                                               ', N'1                                                 ', N'pokdd                                             ', N'456789                                            ', CAST(0xD73B0B00 AS Date), 2000.0000, 100.0000, N'2                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10036, 10, N'susan                                             ', N'polkj                                             ', N'09                                                ', N'bba                                               ', N'2016                                              ', N'ytre                                              ', N'22213                                             ', CAST(0xF63B0B00 AS Date), 3000.0000, 100.0000, N'3                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10037, 11, N'ruhi                                              ', N'polkjg                                            ', N'10                                                ', N'bba                                               ', N'1                                                 ', N'ewsd                                              ', N'1234567                                           ', CAST(0x403D0B00 AS Date), 4000.0000, 200.0000, N'1                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10038, 11, N'pihu                                              ', N'ythjik                                            ', N'30                                                ', N'mca                                               ', N'1                                                 ', N'polkmnb                                           ', N'432455                                            ', CAST(0x233D0B00 AS Date), 10000.0000, 0.0000, N'3                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10039, 13, N'isha                                              ', N'qasd                                              ', N'100                                               ', N'mca                                               ', N'1                                                 ', N'freddds                                           ', N'987652                                            ', CAST(0x403D0B00 AS Date), 11000.0000, 100.0000, N'2                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10040, 10, N'priya                                             ', N'dfs                                               ', N'231                                               ', N'bba                                               ', N'2016                                              ', N'fag                                               ', N'3134                                              ', CAST(0xF23B0B00 AS Date), 1000.0000, 0.0000, N'1                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10041, 11, N'srv                                               ', N'rew                                               ', N'321                                               ', N'btech                                             ', N'2                                                 ', N'eefw                                              ', N'8317                                              ', CAST(0xD63B0B00 AS Date), 22000.0000, 2000.0000, N'2                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10042, 11, N'riyu                                              ', N'dffw                                              ', N'124                                               ', N'btech                                             ', N'2                                                 ', N'ergg                                              ', N'31986                                             ', CAST(0x593B0B00 AS Date), 3000.0000, 100.0000, N'2                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10043, 12, N'sanchi                                            ', N'sdqdrrrrr                                         ', N'58                                                ', N'bca                                               ', N'2                                                 ', N'ergg                                              ', N'6421                                              ', CAST(0x593B0B00 AS Date), 3000.0000, 30.0000, N'2                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10044, 6, N'sanchu                                            ', N'wefwg                                             ', N'43                                                ', N'mca                                               ', N'2                                                 ', N'qr                                                ', N'5437123                                           ', CAST(0x3C3B0B00 AS Date), 40000.0000, 200.0000, N'3                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10045, 13, N'himani                                            ', N'ffe                                               ', N'122                                               ', N'mca                                               ', N'3                                                 ', N'reG                                               ', N'325146                                            ', CAST(0xD63B0B00 AS Date), 30000.0000, 19.0000, N'2                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10046, 13, N'himi                                              ', N'eWG                                               ', N'34                                                ', N'bca                                               ', N'2                                                 ', N'gew                                               ', N'53723                                             ', CAST(0xA83C0B00 AS Date), 38000.0000, 3000.0000, N'3                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10047, 14, N'prerna                                            ', N'rqh                                               ', N'233                                               ', N'bca                                               ', N'2                                                 ', N'gs                                                ', N'124364                                            ', CAST(0x6A3C0B00 AS Date), 7000.0000, 300.0000, N'2                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10048, 14, N'garuu                                             ', N'efg                                               ', N'87                                                ', N'btech                                             ', N'5                                                 ', N'gagf                                              ', N'435216                                            ', CAST(0xAE390B00 AS Date), 33000.0000, 4000.0000, N'3                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10049, 14, N'garima                                            ', N'wgrthjh                                           ', N'423                                               ', N'btch                                              ', N'2                                                 ', N'afdh                                              ', N'2437                                              ', CAST(0xD43B0B00 AS Date), 4000.0000, 200.0000, N'3                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10050, 15, N'ripuu                                             ', N'fggerg                                            ', N'223                                               ', N'mca                                               ', N'2                                                 ', N'rgeg                                              ', N'231547                                            ', CAST(0x1A3B0B00 AS Date), 5000.0000, 0.0000, N'2                                                 ')
GO
INSERT [dbo].[tbparticipant] ([participantid], [eventid], [name], [fathers name], [roll number], [course name], [year/semester], [email], [contact number], [enrollment date], [paid amount], [pending amount], [result]) VALUES (10051, 15, N'nishu                                             ', N'ef                                                ', N'311                                               ', N'mca                                               ', N'3                                                 ', N'gqr                                               ', N'537245                                            ', CAST(0x093A0B00 AS Date), 6000.0000, 444.0000, N'3                                                 ')
GO
SET IDENTITY_INSERT [dbo].[tbparticipant] OFF
GO
SET IDENTITY_INSERT [dbo].[tbresult] ON 

GO
INSERT [dbo].[tbresult] ([resultid], [eventid], [participantid1], [participantid2], [participantid3], [resultdate]) VALUES (1, 9, 35, 35, 35, NULL)
GO
INSERT [dbo].[tbresult] ([resultid], [eventid], [participantid1], [participantid2], [participantid3], [resultdate]) VALUES (2, 6, 33, 34, 34, CAST(0x453D0B00 AS Date))
GO
INSERT [dbo].[tbresult] ([resultid], [eventid], [participantid1], [participantid2], [participantid3], [resultdate]) VALUES (3, 14, 10047, 10049, 10035, CAST(0x5F3D0B00 AS Date))
GO
INSERT [dbo].[tbresult] ([resultid], [eventid], [participantid1], [participantid2], [participantid3], [resultdate]) VALUES (4, 10, 10036, 10040, 36, CAST(0x593B0B00 AS Date))
GO
INSERT [dbo].[tbresult] ([resultid], [eventid], [participantid1], [participantid2], [participantid3], [resultdate]) VALUES (5, 15, 10050, 10051, 10034, CAST(0xF63B0B00 AS Date))
GO
INSERT [dbo].[tbresult] ([resultid], [eventid], [participantid1], [participantid2], [participantid3], [resultdate]) VALUES (6, 10, 10036, 36, 10040, CAST(0x883A0B00 AS Date))
GO
SET IDENTITY_INSERT [dbo].[tbresult] OFF
GO
SET IDENTITY_INSERT [dbo].[tbvolunteer] ON 

GO
INSERT [dbo].[tbvolunteer] ([volunteerid], [clubid], [membershipid], [designation], [status]) VALUES (3, 1, 4, N'head                                              ', N'ACTIVE')
GO
INSERT [dbo].[tbvolunteer] ([volunteerid], [clubid], [membershipid], [designation], [status]) VALUES (4, 4, 2, N'student secretary                                 ', N'ACTIVE')
GO
INSERT [dbo].[tbvolunteer] ([volunteerid], [clubid], [membershipid], [designation], [status]) VALUES (5, 1, 1, N'coordinator                                       ', N'ACTIVE')
GO
INSERT [dbo].[tbvolunteer] ([volunteerid], [clubid], [membershipid], [designation], [status]) VALUES (6, 8, 17, N'head girl                                         ', N'ACTIVE')
GO
INSERT [dbo].[tbvolunteer] ([volunteerid], [clubid], [membershipid], [designation], [status]) VALUES (7, 11, 19, N'coordinator head                                  ', N'ACTIVE')
GO
INSERT [dbo].[tbvolunteer] ([volunteerid], [clubid], [membershipid], [designation], [status]) VALUES (8, 10, 20, N'captain                                           ', N'ACTIVE')
GO
INSERT [dbo].[tbvolunteer] ([volunteerid], [clubid], [membershipid], [designation], [status]) VALUES (9, 6, 16, N'student head                                      ', N'ACTIVE')
GO
INSERT [dbo].[tbvolunteer] ([volunteerid], [clubid], [membershipid], [designation], [status]) VALUES (10, 6, 21, N'head boy                                          ', N'ACTIVE')
GO
SET IDENTITY_INSERT [dbo].[tbvolunteer] OFF
GO
ALTER TABLE [dbo].[tbevent]  WITH CHECK ADD  CONSTRAINT [FK_tbevent_tbclub] FOREIGN KEY([clubid])
REFERENCES [dbo].[tbclub] ([Clubid])
GO
ALTER TABLE [dbo].[tbevent] CHECK CONSTRAINT [FK_tbevent_tbclub]
GO
ALTER TABLE [dbo].[tbmembership]  WITH CHECK ADD  CONSTRAINT [FK_tbmembership_tbclub1] FOREIGN KEY([clubid])
REFERENCES [dbo].[tbclub] ([Clubid])
GO
ALTER TABLE [dbo].[tbmembership] CHECK CONSTRAINT [FK_tbmembership_tbclub1]
GO
ALTER TABLE [dbo].[tbparticipant]  WITH CHECK ADD  CONSTRAINT [FK_tbparticipant_tbevent2] FOREIGN KEY([eventid])
REFERENCES [dbo].[tbevent] ([eventid])
GO
ALTER TABLE [dbo].[tbparticipant] CHECK CONSTRAINT [FK_tbparticipant_tbevent2]
GO
ALTER TABLE [dbo].[tbresult]  WITH CHECK ADD  CONSTRAINT [FK_tbresult_tbevent] FOREIGN KEY([eventid])
REFERENCES [dbo].[tbevent] ([eventid])
GO
ALTER TABLE [dbo].[tbresult] CHECK CONSTRAINT [FK_tbresult_tbevent]
GO
ALTER TABLE [dbo].[tbresult]  WITH CHECK ADD  CONSTRAINT [FK_tbresult_tbparticipant] FOREIGN KEY([participantid1])
REFERENCES [dbo].[tbparticipant] ([participantid])
GO
ALTER TABLE [dbo].[tbresult] CHECK CONSTRAINT [FK_tbresult_tbparticipant]
GO
ALTER TABLE [dbo].[tbresult]  WITH CHECK ADD  CONSTRAINT [FK_tbresult_tbparticipant1] FOREIGN KEY([participantid2])
REFERENCES [dbo].[tbparticipant] ([participantid])
GO
ALTER TABLE [dbo].[tbresult] CHECK CONSTRAINT [FK_tbresult_tbparticipant1]
GO
ALTER TABLE [dbo].[tbresult]  WITH CHECK ADD  CONSTRAINT [FK_tbresult_tbparticipant2] FOREIGN KEY([participantid3])
REFERENCES [dbo].[tbparticipant] ([participantid])
GO
ALTER TABLE [dbo].[tbresult] CHECK CONSTRAINT [FK_tbresult_tbparticipant2]
GO
ALTER TABLE [dbo].[tbvolunteer]  WITH CHECK ADD  CONSTRAINT [FK_tbvolunteer_tbclub] FOREIGN KEY([clubid])
REFERENCES [dbo].[tbclub] ([Clubid])
GO
ALTER TABLE [dbo].[tbvolunteer] CHECK CONSTRAINT [FK_tbvolunteer_tbclub]
GO
USE [master]
GO
ALTER DATABASE [dbcollegeclub] SET  READ_WRITE 
GO
