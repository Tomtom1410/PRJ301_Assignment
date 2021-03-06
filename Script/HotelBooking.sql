USE [master]
GO
/****** Object:  Database [Hotel_Booking]    Script Date: 11/21/2021 11:29:34 AM ******/
CREATE DATABASE [Hotel_Booking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hotel_Booking', FILENAME = N'E:\Learning\MySQL\DATA\Hotel_Booking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hotel_Booking_log', FILENAME = N'E:\Learning\MySQL\DATA\Hotel_Booking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hotel_Booking] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hotel_Booking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hotel_Booking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hotel_Booking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hotel_Booking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hotel_Booking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hotel_Booking] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hotel_Booking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hotel_Booking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hotel_Booking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hotel_Booking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hotel_Booking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hotel_Booking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hotel_Booking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hotel_Booking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hotel_Booking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hotel_Booking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hotel_Booking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hotel_Booking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hotel_Booking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hotel_Booking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hotel_Booking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hotel_Booking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hotel_Booking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hotel_Booking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hotel_Booking] SET  MULTI_USER 
GO
ALTER DATABASE [Hotel_Booking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hotel_Booking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hotel_Booking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hotel_Booking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hotel_Booking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hotel_Booking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Hotel_Booking] SET QUERY_STORE = OFF
GO
USE [Hotel_Booking]
GO
/****** Object:  Table [dbo].[Booking_Detail]    Script Date: 11/21/2021 11:29:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking_Detail](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[orderWaitID] [int] NULL,
	[cancel] [bit] NOT NULL,
	[deptID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Booking_Detail_1] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/21/2021 11:29:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](150) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[Address] [varchar](150) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/21/2021 11:29:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[deptID] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[roomType] [varchar](50) NOT NULL,
	[deptName] [varchar](50) NOT NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[deptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 11/21/2021 11:29:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[FeedBack] [text] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Feedback_1] PRIMARY KEY CLUSTERED 
(
	[feedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 11/21/2021 11:29:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[invoiceID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[totalPrice] [int] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderWait]    Script Date: 11/21/2021 11:29:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderWait](
	[orderWaitID] [int] IDENTITY(1,1) NOT NULL,
	[deptName] [nvarchar](50) NULL,
	[CustomerID] [int] NULL,
	[CheckIn] [date] NULL,
	[CheckOut] [date] NULL,
	[noOfRooms] [int] NULL,
	[Rented] [bit] NULL,
 CONSTRAINT [PK_OrderWait] PRIMARY KEY CLUSTERED 
(
	[orderWaitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomTypeAndUrl]    Script Date: 11/21/2021 11:29:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypeAndUrl](
	[roomType] [varchar](50) NOT NULL,
	[url_image] [varchar](200) NULL,
	[url_1] [varchar](200) NULL,
	[url_2] [varchar](200) NULL,
	[url_3] [varchar](200) NOT NULL,
 CONSTRAINT [PK_RoomTypeAndPrice] PRIMARY KEY CLUSTERED 
(
	[roomType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[systemAdministrator]    Script Date: 11/21/2021 11:29:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[systemAdministrator](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_systemAdministrator] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking_Detail] ON 

INSERT [dbo].[Booking_Detail] ([BookingID], [orderWaitID], [cancel], [deptID]) VALUES (7, 1, 1, NULL)
INSERT [dbo].[Booking_Detail] ([BookingID], [orderWaitID], [cancel], [deptID]) VALUES (8, 1, 1, NULL)
INSERT [dbo].[Booking_Detail] ([BookingID], [orderWaitID], [cancel], [deptID]) VALUES (9, 4, 0, N'107')
INSERT [dbo].[Booking_Detail] ([BookingID], [orderWaitID], [cancel], [deptID]) VALUES (10, 4, 0, N'307')
INSERT [dbo].[Booking_Detail] ([BookingID], [orderWaitID], [cancel], [deptID]) VALUES (11, 3, 0, N'105')
INSERT [dbo].[Booking_Detail] ([BookingID], [orderWaitID], [cancel], [deptID]) VALUES (12, 3, 0, N'305')
INSERT [dbo].[Booking_Detail] ([BookingID], [orderWaitID], [cancel], [deptID]) VALUES (13, 3, 0, N'405')
INSERT [dbo].[Booking_Detail] ([BookingID], [orderWaitID], [cancel], [deptID]) VALUES (14, 5, 0, N'110')
INSERT [dbo].[Booking_Detail] ([BookingID], [orderWaitID], [cancel], [deptID]) VALUES (15, 5, 0, N'210')
INSERT [dbo].[Booking_Detail] ([BookingID], [orderWaitID], [cancel], [deptID]) VALUES (16, 2, 0, N'203')
INSERT [dbo].[Booking_Detail] ([BookingID], [orderWaitID], [cancel], [deptID]) VALUES (17, 2, 0, N'303')
INSERT [dbo].[Booking_Detail] ([BookingID], [orderWaitID], [cancel], [deptID]) VALUES (19, 10, 0, N'105')
INSERT [dbo].[Booking_Detail] ([BookingID], [orderWaitID], [cancel], [deptID]) VALUES (20, 10, 0, N'205')
SET IDENTITY_INSERT [dbo].[Booking_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [Email], [Address]) VALUES (1, N'Ms X ', N'13698756431', N'msX@gmail.com', N'')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [Email], [Address]) VALUES (2, N'Mr C', N'0369874561', N'mrtep@gmail.com', N'')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [Email], [Address]) VALUES (3, N'Alex D', N'6549873216', N'alexd@gmail.com', N'')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [Email], [Address]) VALUES (4, N'Banana', N'3698746412', N'Banana123@gmail.com', NULL)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [Email], [Address]) VALUES (5, N'Mr A', N'0373057527', N'mra@mail.com', NULL)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [Email], [Address]) VALUES (6, N'Vu Duc Tien', N'0369785649', N'TienVD@gmail.com', NULL)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [Email], [Address]) VALUES (7, N'Tran Duy Dang', N'0965846523', N'DangTD@gmail.com', NULL)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [Email], [Address]) VALUES (8, N'Tran Duc Ky', N'0698745698', N'KyTD@gmail.com', NULL)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [Email], [Address]) VALUES (9, N'Mr Alex', N'0963598745', N'mrAlex@mail.com', NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'101', 0, N'SILVER ROOM', N'SILVER SINGLE ROOM', 40)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'102', 0, N'SILVER ROOM', N'SILVER DOUBLE ROOM', 50)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'103', 0, N'SILVER ROOM', N'SILVER FAMILY ROOM', 75)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'104', 0, N'GOLD ROOM', N'GOLD SINGLE ROOM', 65)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'105', 1, N'GOLD ROOM', N'GOLD DOUBLE ROOM', 80)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'106', 0, N'GOLD ROOM', N'GOLD FAMILY ROOM', 100)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'107', 0, N'PLATINUM ROOM', N'PLATINUM SINGLE ROOM', 150)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'108', 0, N'PLATINUM ROOM', N'PLATINUM DOUBLE ROOM', 180)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'109', 0, N'PLATINUM ROOM', N'PLATINUM FAMILY ROOM', 200)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'110', 1, N'LUXURY ROOM', N'LUXURY SINGLE ROOM', 250)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'111', 0, N'LUXURY ROOM', N'LUXURY DOUBLE ROOM', 370)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'112', 0, N'LUXURY ROOM', N'LUXURY FAMILY ROOM', 500)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'201', 0, N'SILVER ROOM', N'SILVER SINGLE ROOM', 40)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'202', 0, N'SILVER ROOM', N'SILVER DOUBLE ROOM', 50)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'203', 1, N'SILVER ROOM', N'SILVER FAMILY ROOM', 75)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'204', 0, N'GOLD ROOM', N'GOLD SINGLE ROOM', 65)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'205', 1, N'GOLD ROOM', N'GOLD DOUBLE ROOM', 80)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'206', 0, N'GOLD ROOM', N'GOLD FAMILY ROOM', 100)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'207', 0, N'PLATINUM ROOM', N'PLATINUM SINGLE ROOM', 150)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'208', 0, N'PLATINUM ROOM', N'PLATINUM DOUBLE ROOM', 180)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'209', 0, N'PLATINUM ROOM', N'PLATINUM FAMILY ROOM', 200)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'210', 1, N'LUXURY ROOM', N'LUXURY SINGLE ROOM', 250)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'211', 0, N'LUXURY ROOM', N'LUXURY DOUBLE ROOM', 370)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'212', 0, N'LUXURY ROOM', N'LUXURY FAMILY ROOM', 500)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'301', 0, N'SILVER ROOM', N'SILVER SINGLE ROOM', 40)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'302', 0, N'SILVER ROOM', N'SILVER DOUBLE ROOM', 50)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'303', 1, N'SILVER ROOM', N'SILVER FAMILY ROOM', 75)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'304', 0, N'GOLD ROOM', N'GOLD SINGLE ROOM', 65)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'305', 0, N'GOLD ROOM', N'GOLD DOUBLE ROOM', 80)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'306', 0, N'GOLD ROOM', N'GOLD FAMILY ROOM', 100)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'307', 0, N'PLATINUM ROOM', N'PLATINUM SINGLE ROOM', 150)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'308', 0, N'PLATINUM ROOM', N'PLATINUM DOUBLE ROOM', 180)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'309', 0, N'PLATINUM ROOM', N'PLATINUM FAMILY ROOM', 200)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'310', 0, N'LUXURY ROOM', N'LUXURY SINGLE ROOM', 250)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'311', 0, N'LUXURY ROOM', N'LUXURY DOUBLE ROOM', 370)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'312', 0, N'LUXURY ROOM', N'LUXURY FAMILY ROOM', 500)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'401', 0, N'SILVER ROOM', N'SILVER SINGLE ROOM', 40)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'402', 0, N'SILVER ROOM', N'SILVER DOUBLE ROOM', 50)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'403', 0, N'SILVER ROOM', N'SILVER FAMILY ROOM', 75)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'404', 0, N'GOLD ROOM', N'GOLD SINGLE ROOM', 65)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'405', 0, N'GOLD ROOM', N'GOLD DOUBLE ROOM', 80)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'406', 0, N'GOLD ROOM', N'GOLD FAMILY ROOM', 100)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'407', 0, N'PLATINUM ROOM', N'PLATINUM SINGLE ROOM', 150)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'408', 0, N'PLATINUM ROOM', N'PLATINUM DOUBLE ROOM', 180)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'409', 0, N'PLATINUM ROOM', N'PLATINUM FAMILY ROOM', 200)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'410', 0, N'LUXURY ROOM', N'LUXURY SINGLE ROOM', 250)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'411', 0, N'LUXURY ROOM', N'LUXURY DOUBLE ROOM', 370)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'412', 0, N'LUXURY ROOM', N'LUXURY FAMILY ROOM', 500)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'501', 0, N'SILVER ROOM', N'SILVER SINGLE ROOM', 40)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'502', 0, N'SILVER ROOM', N'SILVER DOUBLE ROOM', 50)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'503', 0, N'SILVER ROOM', N'SILVER FAMILY ROOM', 75)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'504', 0, N'GOLD ROOM', N'GOLD SINGLE ROOM', 65)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'505', 0, N'GOLD ROOM', N'GOLD DOUBLE ROOM', 80)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'506', 0, N'GOLD ROOM', N'GOLD FAMILY ROOM', 100)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'507', 0, N'PLATINUM ROOM', N'PLATINUM SINGLE ROOM', 150)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'508', 0, N'PLATINUM ROOM', N'PLATINUM DOUBLE ROOM', 180)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'509', 0, N'PLATINUM ROOM', N'PLATINUM FAMILY ROOM', 200)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'511', 0, N'LUXURY ROOM', N'LUXURY SINGLE ROOM', 250)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'512', 0, N'LUXURY ROOM', N'LUXURY DOUBLE ROOM', 370)
INSERT [dbo].[Department] ([deptID], [Status], [roomType], [deptName], [price]) VALUES (N'513', 0, N'LUXURY ROOM', N'LUXURY FAMILY ROOM', 500)
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([feedID], [CustomerID], [FeedBack], [Date]) VALUES (1, 3, N'I really like your service. Very good service, very attentive service ', CAST(N'2021-10-27' AS Date))
INSERT [dbo].[Feedback] ([feedID], [CustomerID], [FeedBack], [Date]) VALUES (2, 1, N'I care about your service!', CAST(N'2021-11-05' AS Date))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([invoiceID], [CustomerID], [totalPrice]) VALUES (1, 1, 160)
INSERT [dbo].[Invoice] ([invoiceID], [CustomerID], [totalPrice]) VALUES (2, 2, 450)
INSERT [dbo].[Invoice] ([invoiceID], [CustomerID], [totalPrice]) VALUES (3, 3, 240)
INSERT [dbo].[Invoice] ([invoiceID], [CustomerID], [totalPrice]) VALUES (4, 4, 1200)
INSERT [dbo].[Invoice] ([invoiceID], [CustomerID], [totalPrice]) VALUES (5, 5, 500)
INSERT [dbo].[Invoice] ([invoiceID], [CustomerID], [totalPrice]) VALUES (6, 1, 160)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderWait] ON 

INSERT [dbo].[OrderWait] ([orderWaitID], [deptName], [CustomerID], [CheckIn], [CheckOut], [noOfRooms], [Rented]) VALUES (1, N'GOLD SINGLE ROOM', 1, CAST(N'2021-10-04' AS Date), CAST(N'2021-11-04' AS Date), 2, 1)
INSERT [dbo].[OrderWait] ([orderWaitID], [deptName], [CustomerID], [CheckIn], [CheckOut], [noOfRooms], [Rented]) VALUES (2, N'SILVER FAMILY ROOM', 2, CAST(N'2021-11-01' AS Date), CAST(N'2021-11-04' AS Date), 2, 1)
INSERT [dbo].[OrderWait] ([orderWaitID], [deptName], [CustomerID], [CheckIn], [CheckOut], [noOfRooms], [Rented]) VALUES (3, N'GOLD DOUBLE ROOM', 3, CAST(N'2021-11-04' AS Date), CAST(N'2021-11-04' AS Date), 3, 1)
INSERT [dbo].[OrderWait] ([orderWaitID], [deptName], [CustomerID], [CheckIn], [CheckOut], [noOfRooms], [Rented]) VALUES (4, N'PLATINUM SINGLE ROOM', 4, CAST(N'2021-10-27' AS Date), CAST(N'2021-10-31' AS Date), 2, 1)
INSERT [dbo].[OrderWait] ([orderWaitID], [deptName], [CustomerID], [CheckIn], [CheckOut], [noOfRooms], [Rented]) VALUES (5, N'LUXURY SINGLE ROOM', 5, CAST(N'2021-11-11' AS Date), CAST(N'2021-11-12' AS Date), 2, 1)
INSERT [dbo].[OrderWait] ([orderWaitID], [deptName], [CustomerID], [CheckIn], [CheckOut], [noOfRooms], [Rented]) VALUES (6, N'SILVER SINGLE ROOM', 6, CAST(N'2021-11-09' AS Date), CAST(N'2021-11-12' AS Date), 2, 0)
INSERT [dbo].[OrderWait] ([orderWaitID], [deptName], [CustomerID], [CheckIn], [CheckOut], [noOfRooms], [Rented]) VALUES (7, N'PLATINUM DOUBLE ROOM', 7, CAST(N'2021-11-07' AS Date), CAST(N'2021-11-11' AS Date), 1, 0)
INSERT [dbo].[OrderWait] ([orderWaitID], [deptName], [CustomerID], [CheckIn], [CheckOut], [noOfRooms], [Rented]) VALUES (8, N'PLATINUM SINGLE ROOM', 8, CAST(N'2021-11-13' AS Date), CAST(N'2021-11-15' AS Date), 2, 0)
INSERT [dbo].[OrderWait] ([orderWaitID], [deptName], [CustomerID], [CheckIn], [CheckOut], [noOfRooms], [Rented]) VALUES (9, N'SILVER SINGLE ROOM', 9, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-12' AS Date), 1, 0)
INSERT [dbo].[OrderWait] ([orderWaitID], [deptName], [CustomerID], [CheckIn], [CheckOut], [noOfRooms], [Rented]) VALUES (10, N'GOLD DOUBLE ROOM', 1, CAST(N'2021-11-08' AS Date), CAST(N'2021-11-09' AS Date), 2, 1)
SET IDENTITY_INSERT [dbo].[OrderWait] OFF
GO
INSERT [dbo].[RoomTypeAndUrl] ([roomType], [url_image], [url_1], [url_2], [url_3]) VALUES (N'GOLD ROOM', N'https://quynhontourist.com/wp-content/uploads/2020/07/VIETNAM-6.jpg', N'https://dichoisapa.com/wp-content/uploads/2018/11/kh%C3%A1ch-s%E1%BA%A1n-%E1%BB%9F-sapa-c%C3%B3-view-%C4%91%E1%BA%B9p-min.jpg', N'https://annambooking.com/wp-content/uploads/2020/08/kk-sapa-hotel-an-nam-booking-2.jpg', N'https://toplisthanoi.com/wp-content/uploads/2020/09/khach-san-4-sao-trung-tam-ha-noi-13-1.jpg')
INSERT [dbo].[RoomTypeAndUrl] ([roomType], [url_image], [url_1], [url_2], [url_3]) VALUES (N'LUXURY ROOM', N'https://pystravel.vn/wp-content/uploads/2018/06/28071000_1606481882721429_8147843716531251685_o.jpg', N'https://kientrucnamcuong.com/admin/webroot/upload/image/images/phong-ngu-khach-san-4-sao-15.jpg', N'https://vcdn-dulich.vnecdn.net/2021/04/23/677-1619081882-4507-1619171892.png', N'https://statics.vntrip.vn/data-v2/hotels/11141/img_max/11141_1507018107_havana_executive_suite_(2).jpg')
INSERT [dbo].[RoomTypeAndUrl] ([roomType], [url_image], [url_1], [url_2], [url_3]) VALUES (N'PLATINUM ROOM', N'https://efly.vn/uploads/images/files/top-nhung-khach-san-gia-re-view-dep-o-vung-tau-5.jpg', N'https://vietnamtoursm.com/wp-content/uploads/2014/12/top-nhung-khach-san-co-view-dep-nhat-o-da-nang-1.jpg', N'https://inhat.vn/hcm/wp-content/uploads/2020/09/homestay-sai-gon-co-bon-tam-22.jpg', N'https://pix8.agoda.net/hotelImages/6903724/-1/1e3d0d0c26290115f1b51056c2f6aa9c.jpg')
INSERT [dbo].[RoomTypeAndUrl] ([roomType], [url_image], [url_1], [url_2], [url_3]) VALUES (N'SILVER ROOM', N'https://www.arttravel.vn/upload/hinhthem/superior660x365-muong-thanh-6777.png', N'https://pix10.agoda.net/hotelImages/364/3645976/3645976_18081913120067536076.png?s=1024x768', N'https://opdaichien.com/single-room-la-gi/imager_1_5727_700.jpg', N'https://media-cdn.tripadvisor.com/media/photo-m/1280/1a/57/0b/06/kha-ch-sa-n-sapaly-la.jpg')
GO
SET IDENTITY_INSERT [dbo].[systemAdministrator] ON 

INSERT [dbo].[systemAdministrator] ([userID], [username], [password]) VALUES (1, N'TomTom14', N'123456')
SET IDENTITY_INSERT [dbo].[systemAdministrator] OFF
GO
ALTER TABLE [dbo].[Booking_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Detail_Department1] FOREIGN KEY([deptID])
REFERENCES [dbo].[Department] ([deptID])
GO
ALTER TABLE [dbo].[Booking_Detail] CHECK CONSTRAINT [FK_Booking_Detail_Department1]
GO
ALTER TABLE [dbo].[Booking_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Detail_OrderWait] FOREIGN KEY([orderWaitID])
REFERENCES [dbo].[OrderWait] ([orderWaitID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Booking_Detail] CHECK CONSTRAINT [FK_Booking_Detail_OrderWait]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_RoomTypeAndUrl] FOREIGN KEY([roomType])
REFERENCES [dbo].[RoomTypeAndUrl] ([roomType])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_RoomTypeAndUrl]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Customer]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Customer]
GO
ALTER TABLE [dbo].[OrderWait]  WITH CHECK ADD  CONSTRAINT [FK_OrderWait_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderWait] CHECK CONSTRAINT [FK_OrderWait_Customer]
GO
USE [master]
GO
ALTER DATABASE [Hotel_Booking] SET  READ_WRITE 
GO
