USE [master]
GO
/****** Object:  Database [Workshop2]    Script Date: 12/10/2023 6:38:23 AM ******/
CREATE DATABASE [Workshop2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Workshop2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HNHANTO\MSSQL\DATA\Workshop2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Workshop2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HNHANTO\MSSQL\DATA\Workshop2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Workshop2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Workshop2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Workshop2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Workshop2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Workshop2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Workshop2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Workshop2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Workshop2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Workshop2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Workshop2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Workshop2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Workshop2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Workshop2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Workshop2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Workshop2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Workshop2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Workshop2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Workshop2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Workshop2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Workshop2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Workshop2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Workshop2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Workshop2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Workshop2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Workshop2] SET RECOVERY FULL 
GO
ALTER DATABASE [Workshop2] SET  MULTI_USER 
GO
ALTER DATABASE [Workshop2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Workshop2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Workshop2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Workshop2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Workshop2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Workshop2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Workshop2', N'ON'
GO
ALTER DATABASE [Workshop2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Workshop2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Workshop2]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/10/2023 6:38:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[fullName] [nvarchar](255) NULL,
	[wallet] [float] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 12/10/2023 6:38:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [varchar](50) NOT NULL,
	[BookTitle] [varchar](255) NULL,
	[BookAuthor] [varchar](255) NULL,
	[YearOfPublished] [int] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song]    Script Date: 12/10/2023 6:38:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song](
	[SongID] [varchar](50) NOT NULL,
	[SongTitle] [nvarchar](255) NULL,
	[SongArtist] [nvarchar](255) NULL,
	[SongDuration] [varchar](10) NULL,
	[url] [nvarchar](255) NULL,
 CONSTRAINT [PK_Song] PRIMARY KEY CLUSTERED 
(
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([userName], [password], [fullName], [wallet]) VALUES (N'US_001', N'1', N'US_001', 10000)
INSERT [dbo].[Account] ([userName], [password], [fullName], [wallet]) VALUES (N'US_002', N'1', N'US_002', 1000)
INSERT [dbo].[Account] ([userName], [password], [fullName], [wallet]) VALUES (N'US_003', N'1', N'US_003', 100000)
GO
INSERT [dbo].[Book] ([BookID], [BookTitle], [BookAuthor], [YearOfPublished]) VALUES (N'8934980770344', N'Discrete mathematics and its applications', N'Kenneth.H Rosen', 2007)
INSERT [dbo].[Book] ([BookID], [BookTitle], [BookAuthor], [YearOfPublished]) VALUES (N'9780230431973 ', N'Skillful listening & speaking: Student''s book. Level 4', N'McLindsay Clandfield, Mark McKinnon', 2013)
INSERT [dbo].[Book] ([BookID], [BookTitle], [BookAuthor], [YearOfPublished]) VALUES (N'9780273778868 ', N'Key strategy tools: The 80+ tools for every manager to build a winning strategy', N'Vaughan Evans', 2013)
INSERT [dbo].[Book] ([BookID], [BookTitle], [BookAuthor], [YearOfPublished]) VALUES (N'9781492032649', N'Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow: Concepts, Tools, and Techniques to Build Intelligent Systems (2nd ed)', N'AurÃ©lien GÃ©ron', 2019)
INSERT [dbo].[Book] ([BookID], [BookTitle], [BookAuthor], [YearOfPublished]) VALUES (N'9787040389753 ', N'Official Examination Papers of HSK 2014 : Level 1', N'Xu Lin', 2014)
GO
INSERT [dbo].[Song] ([SongID], [SongTitle], [SongArtist], [SongDuration], [url]) VALUES (N'SONG_001', N'Khu Tao Song', N'Wowy Karik', N'4:04', N'https://www.youtube.com/watch?v=es0e6GA-EIw')
INSERT [dbo].[Song] ([SongID], [SongTitle], [SongArtist], [SongDuration], [url]) VALUES (N'SONG_002', N'Biên Giới Long Bình', N'Obito', N'2:57', N'https://www.youtube.com/watch?v=HXCB75dcxAE')
INSERT [dbo].[Song] ([SongID], [SongTitle], [SongArtist], [SongDuration], [url]) VALUES (N'SONG_003', N'BẠN CỦA TAO', N'YoungH x Binz x SO x Pjpo', N'5:08', N'https://www.youtube.com/watch?v=mRGH4a4U74Y')
INSERT [dbo].[Song] ([SongID], [SongTitle], [SongArtist], [SongDuration], [url]) VALUES (N'SONG_004', N'Exit Sign', N'HIEUTHUHAI', N'3:21', N'https://www.youtube.com/watch?v=sJt_i0hOugA')
GO
USE [master]
GO
ALTER DATABASE [Workshop2] SET  READ_WRITE 
GO
