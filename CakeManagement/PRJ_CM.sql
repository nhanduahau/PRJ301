USE [master]
GO
/****** Object:  Database [CakeManagement]    Script Date: 12/10/2023 6:31:49 AM ******/
CREATE DATABASE [CakeManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CakeManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HNHANTO\MSSQL\DATA\CakeManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CakeManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HNHANTO\MSSQL\DATA\CakeManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CakeManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CakeManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CakeManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CakeManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CakeManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CakeManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CakeManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [CakeManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CakeManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CakeManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CakeManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CakeManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CakeManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CakeManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CakeManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CakeManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CakeManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CakeManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CakeManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CakeManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CakeManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CakeManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CakeManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CakeManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CakeManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [CakeManagement] SET  MULTI_USER 
GO
ALTER DATABASE [CakeManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CakeManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CakeManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CakeManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CakeManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CakeManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CakeManagement', N'ON'
GO
ALTER DATABASE [CakeManagement] SET QUERY_STORE = OFF
GO
USE [CakeManagement]
GO
/****** Object:  Table [dbo].[tblCakes]    Script Date: 12/10/2023 6:31:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCakes](
	[cakeID] [varchar](50) NOT NULL,
	[cakeName] [nvarchar](250) NOT NULL,
	[description] [nvarchar](250) NULL,
	[price] [float] NOT NULL,
	[image] [nvarchar](1000) NULL,
 CONSTRAINT [PK_tblCakes] PRIMARY KEY CLUSTERED 
(
	[cakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 12/10/2023 6:31:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailsID] [int] NOT NULL,
	[cakeID] [varchar](50) NOT NULL,
	[orderID] [int] NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 12/10/2023 6:31:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] NOT NULL,
	[dateBuy] [datetime] NULL,
	[total] [float] NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](1000) NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 12/10/2023 6:31:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NOT NULL,
	[fullName] [nvarchar](250) NOT NULL,
	[password] [nvarchar](250) NOT NULL,
	[roleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCakes] ([cakeID], [cakeName], [description], [price], [image]) VALUES (N'CAKE_001', N'Cheesecake', N'Cheesecake', 284, N'https://static.wikia.nocookie.net/hayday/images/2/2d/Cheesecake.png')
INSERT [dbo].[tblCakes] ([cakeID], [cakeName], [description], [price], [image]) VALUES (N'CAKE_002', N'Strawberry Cake', N'Strawberry Cake', 316, N'https://static.wikia.nocookie.net/hayday/images/1/1a/Strawberry_Cake.png')
INSERT [dbo].[tblCakes] ([cakeID], [cakeName], [description], [price], [image]) VALUES (N'CAKE_003', N'Chocolate Cake', N'Chocolate Cake', 320, N'https://static.wikia.nocookie.net/hayday/images/8/87/Chocolate_Cake.png')
INSERT [dbo].[tblCakes] ([cakeID], [cakeName], [description], [price], [image]) VALUES (N'CAKE_004', N'Potato Feta Cake', N'Potato Feta Cake', 309, N'https://static.wikia.nocookie.net/hayday/images/7/7c/Potato_Feta_Cake.png')
INSERT [dbo].[tblCakes] ([cakeID], [cakeName], [description], [price], [image]) VALUES (N'CAKE_005', N'Honey Apple Cake', N'Honey Apple Cake', 482, N'https://static.wikia.nocookie.net/hayday/images/1/16/Honey_Apple_Cake.png')
INSERT [dbo].[tblCakes] ([cakeID], [cakeName], [description], [price], [image]) VALUES (N'CAKE_006', N'Cookie', N'Cookie', 104, N'https://static.wikia.nocookie.net/hayday/images/7/70/Cookie.png')
INSERT [dbo].[tblCakes] ([cakeID], [cakeName], [description], [price], [image]) VALUES (N'CAKE_007', N'Pancake
', N'Pancake
', 108, N'https://static.wikia.nocookie.net/hayday/images/6/62/Pancake.png')
INSERT [dbo].[tblCakes] ([cakeID], [cakeName], [description], [price], [image]) VALUES (N'CAKE_008', N'Carrot Pie
', N'Carrot Pie
', 82, N'https://static.wikia.nocookie.net/hayday/images/0/0b/Carrot_Pie.png')
INSERT [dbo].[tblCakes] ([cakeID], [cakeName], [description], [price], [image]) VALUES (N'CAKE_009', N'Pumpkin Pie
', N'Pumpkin Pie
', 158, N'https://static.wikia.nocookie.net/hayday/images/7/7d/Pumpkin_Pie.png')
INSERT [dbo].[tblCakes] ([cakeID], [cakeName], [description], [price], [image]) VALUES (N'CAKE_010', N'Bacon Pie
', N'Bacon Pie
', 219, N'https://static.wikia.nocookie.net/hayday/images/b/b4/Bacon_Pie.png')
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (1, N'CAKE_001', 1, 284, 9, 2556)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (2, N'CAKE_002', 2, 316, 5, 1580)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (3, N'CAKE_003', 3, 320, 19, 6080)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (4, N'CAKE_004', 4, 309, 6, 1854)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (5, N'CAKE_005', 5, 482, 19, 9158)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (6, N'CAKE_001', 5, 284, 12, 3408)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (7, N'CAKE_006', 6, 450, 2, 900)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (8, N'CAKE_007', 7, 604, 11, 6644)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (9, N'CAKE_003', 8, 320, 5, 1600)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (10, N'CAKE_004', 9, 309, 2, 618)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (11, N'CAKE_005', 9, 482, 1, 482)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (12, N'CAKE_004', 10, 309, 7, 2163)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (13, N'CAKE_005', 11, 482, 7, 3374)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (14, N'CAKE_001', 12, 284, 5, 1420)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (15, N'CAKE_006', 13, 450, 4, 1800)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (16, N'CAKE_007', 14, 604, 1, 604)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (17, N'CAKE_003', 15, 320, 7, 2240)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (18, N'CAKE_004', 16, 309, 8, 2472)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (19, N'CAKE_005', 17, 482, 6, 2892)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (20, N'CAKE_001', 18, 284, 13, 3692)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (21, N'CAKE_006', 19, 450, 7, 3150)
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [cakeID], [orderID], [price], [quantity], [total]) VALUES (22, N'CAKE_007', 20, 604, 8, 4832)
GO
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (1, CAST(N'2023-12-05T00:00:00.000' AS DateTime), 2556, N'US_001', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (2, CAST(N'2023-12-01T00:00:00.000' AS DateTime), 1580, N'US_002', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (3, CAST(N'2023-12-04T00:00:00.000' AS DateTime), 6080, N'US_003', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (4, CAST(N'2022-11-05T00:00:00.000' AS DateTime), 1854, N'US_004', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (5, CAST(N'2022-11-02T00:00:00.000' AS DateTime), 4308, N'US_001', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (6, CAST(N'2022-11-30T00:00:00.000' AS DateTime), 900, N'US_002', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (7, CAST(N'2022-11-22T00:00:00.000' AS DateTime), 6644, N'US_003', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (8, CAST(N'2022-11-07T00:00:00.000' AS DateTime), 1600, N'US_004', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (9, CAST(N'2023-04-02T00:00:00.000' AS DateTime), 1100, N'US_001', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (10, CAST(N'2023-04-06T00:00:00.000' AS DateTime), 2163, N'US_002', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (11, CAST(N'2023-04-14T00:00:00.000' AS DateTime), 3374, N'US_003', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (12, CAST(N'2023-04-09T00:00:00.000' AS DateTime), 1420, N'US_004', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (13, CAST(N'2023-04-18T00:00:00.000' AS DateTime), 1800, N'US_001', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (14, CAST(N'2023-10-31T00:00:00.000' AS DateTime), 604, N'US_002', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (15, CAST(N'2023-10-31T00:00:00.000' AS DateTime), 2240, N'US_003', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (16, CAST(N'2023-10-31T00:00:00.000' AS DateTime), 2472, N'US_004', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (17, CAST(N'2023-10-11T00:00:00.000' AS DateTime), 2892, N'US_001', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (18, CAST(N'2023-10-11T00:00:00.000' AS DateTime), 3692, N'US_002', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (19, CAST(N'2023-10-11T00:00:00.000' AS DateTime), 3150, N'US_003', N'0934153618', N'HCM')
INSERT [dbo].[tblOrders] ([orderID], [dateBuy], [total], [userID], [phone], [address]) VALUES (20, CAST(N'2023-10-05T00:00:00.000' AS DateTime), 4832, N'US_004', N'0934153618', N'HCM')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID]) VALUES (N'AD_001', N'Admin', N'1', N'AD')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID]) VALUES (N'US_001', N'User 1', N'1', N'US')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID]) VALUES (N'US_002', N'User 2', N'1', N'US')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID]) VALUES (N'US_003', N'User 3', N'1', N'US')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID]) VALUES (N'US_004', N'User 4', N'1', N'US')
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblCakes] FOREIGN KEY([cakeID])
REFERENCES [dbo].[tblCakes] ([cakeID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblCakes]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
USE [master]
GO
ALTER DATABASE [CakeManagement] SET  READ_WRITE 
GO
