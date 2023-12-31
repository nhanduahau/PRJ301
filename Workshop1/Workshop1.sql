USE [master]
GO
/****** Object:  Database [WorkShop1]    Script Date: 12/3/2023 11:00:18 PM ******/
CREATE DATABASE [WorkShop1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WorkShop1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HNHANTO\MSSQL\DATA\WorkShop1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WorkShop1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HNHANTO\MSSQL\DATA\WorkShop1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WorkShop1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorkShop1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorkShop1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorkShop1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorkShop1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorkShop1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorkShop1] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorkShop1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorkShop1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorkShop1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorkShop1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorkShop1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorkShop1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorkShop1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorkShop1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorkShop1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorkShop1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorkShop1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorkShop1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorkShop1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorkShop1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorkShop1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorkShop1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorkShop1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorkShop1] SET RECOVERY FULL 
GO
ALTER DATABASE [WorkShop1] SET  MULTI_USER 
GO
ALTER DATABASE [WorkShop1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorkShop1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WorkShop1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WorkShop1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WorkShop1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WorkShop1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WorkShop1', N'ON'
GO
ALTER DATABASE [WorkShop1] SET QUERY_STORE = ON
GO
ALTER DATABASE [WorkShop1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WorkShop1]
GO
/****** Object:  Table [dbo].[tbl_Mobile]    Script Date: 12/3/2023 11:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Mobile](
	[mobileId] [varchar](10) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[price] [float] NULL,
	[mobileName] [varchar](20) NOT NULL,
	[yearOfProduction] [int] NULL,
	[quantity] [int] NULL,
	[notSale] [bit] NULL,
 CONSTRAINT [PK_tbl_Mobile] PRIMARY KEY CLUSTERED 
(
	[mobileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 12/3/2023 11:00:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[userId] [varchar](20) NOT NULL,
	[password] [int] NULL,
	[fullName] [varchar](50) NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0001', N'Samsung Galaxy Fold 4', 179999, N'Galaxy Fold 4', 2022, 82, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0002', N'Samsung Galaxy Z Flip 4', 99999, N'Galaxy Z Flip 4', 2022, 58, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0003', N'Samsung Galaxy S22 Ultra', 118800, N'Galaxy S22 Ultra', 2022, 4, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0004', N'Samsung Galaxy S22+', 99999, N'Galaxy S22+', 2022, 30, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0005', N'Samsung Galaxy S22', 79999, N'Galaxy S22', 2022, 59, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0006', N'Samsung Galaxy A53 5G', 44999, N'Galaxy A53 5G', 2022, 35, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0007', N'Samsung Galaxy A33 5G', 37999, N'Galaxy A33 5G', 2022, 69, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0008', N'Samsung Galaxy Z Fold 3', 179999, N'Galaxy Z Fold 3', 2021, 10, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0009', N'Samsung Galaxy Z Flip 3', 99999, N'Galaxy Z Flip 3', 2021, 49, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0010', N'Samsung Galaxy S21 Ultra', 109999, N'Galaxy S21 Ultra', 2021, 6, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0011', N'Samsung Galaxy S21+', 89999, N'Galaxy S21+', 2021, 68, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0012', N'Samsung Galaxy S21', 79999, N'Galaxy S21', 2021, 26, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0013', N'Samsung Galaxy A72', 57999, N'Galaxy A72', 2021, 98, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0014', N'Samsung Galaxy A52 5G', 49999, N'Galaxy A52 5G', 2021, 91, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0015', N'Samsung Galaxy A32 5G', 44999, N'Galaxy A32 5G', 2021, 41, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0016', N'Samsung Galaxy Note 20 Ultra', 129999, N'Galaxy Note 20 Ultra', 2020, 99, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0017', N'Samsung Galaxy Note 20', 99999, N'Galaxy Note 20', 2020, 33, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0018', N'Samsung Galaxy S20 Ultra', 139999, N'Galaxy S20 Ultra', 2020, 57, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0019', N'Samsung Galaxy S20+', 119999, N'Galaxy S20+', 2020, 59, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0020', N'Samsung Galaxy S20', 99999, N'Galaxy S20', 2020, 75, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0021', N'Samsung Galaxy A71', 39999, N'Galaxy A71', 2020, 57, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0022', N'Samsung Galaxy A51', 39999, N'Galaxy A51', 2020, 87, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0023', N'Samsung Galaxy A31', 29999, N'Galaxy A31', 2020, 28, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0024', N'Samsung Galaxy Fold 2', 199999, N'Galaxy Fold 2', 2020, 55, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0025', N'Samsung Galaxy Z Flip', 138000, N'Galaxy Z Flip', 2020, 63, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0026', N'Samsung Galaxy Note 10+', 109999, N'Galaxy Note 10+', 2019, 36, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0027', N'Samsung Galaxy Note 10', 94999, N'Galaxy Note 10', 2019, 75, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0028', N'Samsung Galaxy S10 5G', 129999, N'Galaxy S10 5G', 2019, 14, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0029', N'Samsung Galaxy S10+', 99999, N'Galaxy S10+', 2019, 26, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0030', N'Samsung Galaxy S10e', 74999, N'Galaxy S10e', 2019, 45, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0031', N'Samsung Galaxy A90 5G', 69999, N'Galaxy A90 5G', 2019, 69, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0032', N'Samsung Galaxy A80', 64999, N'Galaxy A80', 2019, 8, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0033', N'Samsung Galaxy A70', 39999, N'Galaxy A70', 2019, 14, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0034', N'Samsung Galaxy A50', 34999, N'Galaxy A50', 2019, 1, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0035', N'Samsung Galaxy A30', 27999, N'Galaxy A30', 2019, 80, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0036', N'Samsung Galaxy Fold', 198000, N'Galaxy Fold', 2019, 58, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0037', N'Samsung Galaxy Note 9', 99999, N'Galaxy Note 9', 2018, 66, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0038', N'Samsung Galaxy S9+', 83999, N'Galaxy S9+', 2018, 43, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0039', N'Samsung Galaxy S9', 73999, N'Galaxy S9', 2018, 10, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0040', N'Samsung Galaxy Note 8', 95000, N'Galaxy Note 8', 2017, 82, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0041', N'Samsung Galaxy S8+', 75000, N'Galaxy S8+', 2017, 11, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'MOB_0042', N'Samsung Galaxy S8', 72000, N'Galaxy S8', 2017, 45, 0)
GO
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'manager', 1, N'manager', 1)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'staff', 1, N'staff', 2)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'user', 1, N'user', 0)
GO
USE [master]
GO
ALTER DATABASE [WorkShop1] SET  READ_WRITE 
GO
