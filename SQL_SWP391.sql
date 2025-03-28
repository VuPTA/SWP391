USE [master]
GO
/****** Object:  Database [SWP391_Re1]    Script Date: 3/29/2025 5:43:17 PM ******/
CREATE DATABASE [SWP391_Re1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391_Re1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.THACHNK\MSSQL\DATA\SWP391_Re1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_Re1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.THACHNK\MSSQL\DATA\SWP391_Re1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SWP391_Re1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_Re1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_Re1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_Re1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_Re1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_Re1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_Re1] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_Re1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP391_Re1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_Re1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_Re1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_Re1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_Re1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_Re1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_Re1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_Re1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_Re1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391_Re1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_Re1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_Re1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_Re1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_Re1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_Re1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_Re1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_Re1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP391_Re1] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_Re1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_Re1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_Re1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_Re1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391_Re1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391_Re1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWP391_Re1', N'ON'
GO
ALTER DATABASE [SWP391_Re1] SET QUERY_STORE = OFF
GO
USE [SWP391_Re1]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] NOT NULL,
	[PersonID] [int] NULL,
	[RoleID] [int] NULL,
	[UserName] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Phone] [nchar](10) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinProduct]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinProduct](
	[BinProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductVariantID] [nvarchar](50) NULL,
	[StorageBinID] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK__BinProdu__6015D46F259185C5] PRIMARY KEY CLUSTERED 
(
	[BinProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinTransfer]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinTransfer](
	[BinTransferID] [nvarchar](50) NOT NULL,
	[TransferDate] [int] NULL,
	[Receiver] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Note] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BinTransferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinTransferDetail]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinTransferDetail](
	[BinTransferDetailID] [nvarchar](50) NOT NULL,
	[TransportID] [nvarchar](50) NULL,
	[BinProductID] [int] NULL,
	[ProductVariantID] [nvarchar](50) NULL,
	[bin_from_id] [int] NULL,
	[bin_to_id] [int] NULL,
	[Quantity] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BinTransferDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinType]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinType](
	[BinType_ID] [int] NOT NULL,
	[Name_Type] [nvarchar](50) NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_BinType] PRIMARY KEY CLUSTERED 
(
	[BinType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [nvarchar](50) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ColorProduct]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColorProduct](
	[Color_ID] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ColorProduct] PRIMARY KEY CLUSTERED 
(
	[Color_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delivery_item]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delivery_item](
	[delivery_item_ID] [int] IDENTITY(1,1) NOT NULL,
	[DO_ID] [nvarchar](50) NULL,
	[ProductVariantID] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__delivery__083046CF29CE1737] PRIMARY KEY CLUSTERED 
(
	[delivery_item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delivery_orders]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delivery_orders](
	[DO_ID] [nvarchar](50) NOT NULL,
	[PO_ID] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Expected_date] [date] NULL,
	[total_amount] [decimal](18, 2) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__delivery__213DCAC5ACAC553D] PRIMARY KEY CLUSTERED 
(
	[DO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ContactRole] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [nvarchar](50) NOT NULL,
	[CategoryID] [nvarchar](50) NULL,
	[ProductName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVariant]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariant](
	[ProductVariantID] [nvarchar](50) NOT NULL,
	[ProductID] [nvarchar](50) NULL,
	[PVName] [nvarchar](255) NULL,
	[Image] [nvarchar](500) NULL,
	[Color_ID] [int] NULL,
	[Size_ID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__ProductV__E4D66725A4EFED5C] PRIMARY KEY CLUSTERED 
(
	[ProductVariantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase_item]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase_item](
	[purchase_item_ID] [int] IDENTITY(1,1) NOT NULL,
	[PO_ID] [nvarchar](50) NULL,
	[ProductVariantID] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__purchase__77536FB2B9944B46] PRIMARY KEY CLUSTERED 
(
	[purchase_item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase_orders]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase_orders](
	[PO_ID] [nvarchar](50) NOT NULL,
	[Supplier] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Expected_date] [date] NULL,
	[TOTALAMOUNT] [decimal](18, 2) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__purchase__5ECDB69D192264E0] PRIMARY KEY CLUSTERED 
(
	[PO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[receive_items]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receive_items](
	[receiving_items_ID] [int] IDENTITY(1,1) NOT NULL,
	[RO_ID] [nvarchar](50) NULL,
	[ProductVariantID] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__receivin__5920C8DED12941F1] PRIMARY KEY CLUSTERED 
(
	[receiving_items_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[receive_orders]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receive_orders](
	[RO_ID] [nvarchar](50) NOT NULL,
	[DO_ID] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Expected_date] [date] NULL,
	[total_amount] [decimal](18, 2) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__receivin__9D6D81660AFD9CD3] PRIMARY KEY CLUSTERED 
(
	[RO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SizeProduct]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SizeProduct](
	[Size_ID] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SizeProduct] PRIMARY KEY CLUSTERED 
(
	[Size_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorageBin]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageBin](
	[StorageBinID] [nvarchar](50) NOT NULL,
	[WarehouseID] [nvarchar](50) NULL,
	[BinName] [nvarchar](50) NULL,
	[BinType_ID] [int] NULL,
	[Capacity] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__StorageB__F41A7F269D13D562] PRIMARY KEY CLUSTERED 
(
	[StorageBinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorageCheck]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageCheck](
	[StorageCheckID] [int] IDENTITY(1,1) NOT NULL,
	[StorageBinID] [nvarchar](50) NOT NULL,
	[CheckCounter] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StorageCheckID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorageCheckDetail]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageCheckDetail](
	[StorageCheckDetailID] [int] IDENTITY(1,1) NOT NULL,
	[StorageCheckID] [int] NOT NULL,
	[BinProductID] [int] NOT NULL,
	[ProductVariantID] [nvarchar](50) NOT NULL,
	[ActualQuantity] [int] NOT NULL,
	[ExpectedQuantity] [int] NOT NULL,
	[CheckPeriod] [int] NOT NULL,
	[Note] [nvarchar](255) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StorageCheckDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [nvarchar](50) NOT NULL,
	[SupplierName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Tax_number] [varchar](13) NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 3/29/2025 5:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[WarehouseID] [nvarchar](50) NOT NULL,
	[WarehouseName] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
	[Note] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([AccountID], [PersonID], [RoleID], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Name], [Gender], [Phone], [Email]) VALUES (1, 1, 1, N'admin1', N'Admin@123', N'Active', 1, CAST(N'2025-03-01T13:58:49.773' AS DateTime), 1, CAST(N'2025-03-01T13:58:49.773' AS DateTime), N'Nguyen Van a', N'Male', N'0123456789', N'anhndhe160131@fpt.edu.vn')
INSERT [dbo].[Account] ([AccountID], [PersonID], [RoleID], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Name], [Gender], [Phone], [Email]) VALUES (2, 2, 2, N'manager1', N'Manager@123', N'Active', 2, CAST(N'2025-03-01T13:58:49.773' AS DateTime), 2, CAST(N'2025-03-01T13:58:49.773' AS DateTime), N'Nguyen Van b', N'Nữ', N'0981122334', N'nguyenducanhflm@gmail.com')
INSERT [dbo].[Account] ([AccountID], [PersonID], [RoleID], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Name], [Gender], [Phone], [Email]) VALUES (3, 3, 3, N'staff1', N'Staff@123', N'Active', 3, CAST(N'2025-03-01T13:58:49.773' AS DateTime), 3, CAST(N'2025-03-01T13:58:49.773' AS DateTime), N'Tran Duc Huy', N'Nam', N'0934567890', N'btf@example.com')
GO
SET IDENTITY_INSERT [dbo].[BinProduct] ON 

INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (1, N'VAR001', N'BIN001', 0)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (2, N'VAR002', N'BIN002', 10)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (3, N'VAR003', N'BIN001', 50)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (4, N'VAR004', N'BIN002', 5)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (5, N'VAR005', N'BIN001', 10)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (6, N'VAR001', N'BIN005', 50)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (7, N'VAR002', N'BIN005', 50)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (8, N'VAR002', N'BIN008', 10)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (9, N'VAR004', N'BIN008', 15)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (10, N'VAR005', N'BIN008', 12)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (11, N'VAR003', N'BIN008', 170)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (12, N'VAR001', N'BIN008', 10)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (13, N'VAR001', N'BIN007', 5)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (14, N'VAR003', N'BIN007', 10)
SET IDENTITY_INSERT [dbo].[BinProduct] OFF
GO
INSERT [dbo].[BinType] ([BinType_ID], [Name_Type], [Quantity]) VALUES (1, N'Small', 100)
INSERT [dbo].[BinType] ([BinType_ID], [Name_Type], [Quantity]) VALUES (2, N'Standard', 200)
INSERT [dbo].[BinType] ([BinType_ID], [Name_Type], [Quantity]) VALUES (3, N'Large', 300)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT001', N'Sneakers', N'Casual shoes for everyday wear', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT002', N'Formal Shoes', N'Shoes for office and formal occasions', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT003', N'Boots', N'Stylish boots for various occasions', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT004', N'Sandals', N'Comfortable sandals for summer', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT005', N'Loafers', N'Easy slip-on shoes', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT006', N'oxford', N'kín đáo lịch lãm', N'Active', 1, CAST(N'2025-03-24T11:34:37.140' AS DateTime), 1, CAST(N'2025-03-29T15:07:16.817' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ColorProduct] ON 

INSERT [dbo].[ColorProduct] ([Color_ID], [ColorName]) VALUES (1, N'Đen')
INSERT [dbo].[ColorProduct] ([Color_ID], [ColorName]) VALUES (2, N'Trắng')
INSERT [dbo].[ColorProduct] ([Color_ID], [ColorName]) VALUES (3, N'Nâu')
INSERT [dbo].[ColorProduct] ([Color_ID], [ColorName]) VALUES (4, N'Xám')
INSERT [dbo].[ColorProduct] ([Color_ID], [ColorName]) VALUES (5, N'Đỏ')
INSERT [dbo].[ColorProduct] ([Color_ID], [ColorName]) VALUES (6, N'Kem')
SET IDENTITY_INSERT [dbo].[ColorProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[delivery_item] ON 

INSERT [dbo].[delivery_item] ([delivery_item_ID], [DO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (42, N'DO001', N'VAR003', 20, CAST(200000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:15:55.450' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_item] ([delivery_item_ID], [DO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (43, N'DO001', N'VAR001', 10, CAST(120000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:15:55.450' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_item] ([delivery_item_ID], [DO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (44, N'DO001', N'VAR004', 5, CAST(140000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:15:55.450' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_item] ([delivery_item_ID], [DO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (45, N'DO002', N'VAR003', 10, CAST(200000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:16:56.780' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[delivery_item] OFF
GO
INSERT [dbo].[delivery_orders] ([DO_ID], [PO_ID], [Supplier], [Status], [Expected_date], [total_amount], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'DO001', N'PO002', N'SUP001', N'Received', CAST(N'2025-04-02' AS Date), CAST(5900000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:15:55.450' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_orders] ([DO_ID], [PO_ID], [Supplier], [Status], [Expected_date], [total_amount], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'DO002', N'PO005', N'SUP001', N'Received', CAST(N'2025-04-03' AS Date), CAST(2000000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:16:56.780' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD001', N'CAT001', N'Nike Air Force 1', N'Classic sneakers', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD002', N'CAT002', N'Oxford Leather Shoes', N'Elegant formal shoes', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD003', N'CAT003', N'Timberland Boots', N'Durable outdoor boots', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD004', N'CAT004', N'Adidas Slides', N'Comfortable casual sandals', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD005', N'CAT002', N'Penny Loafers', N'Classic leather loafers', N'Available', 1, CAST(N'2025-03-25T22:55:01.080' AS DateTime), 2, CAST(N'2025-03-29T16:47:36.607' AS DateTime))
GO
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color_ID], [Size_ID], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR001', N'PROD001', N'Nike AF1 White', N'image1.jpg', 1, 2, NULL, CAST(120000.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color_ID], [Size_ID], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR002', N'PROD001', N'Nike AF1 Black', N'image2.jpg', 2, 1, NULL, CAST(110000.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color_ID], [Size_ID], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR003', N'PROD002', N'Oxford Brown', N'image3.jpg', 3, 2, NULL, CAST(200000.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color_ID], [Size_ID], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR004', N'PROD003', N'Timberland Yellow', N'image4.jpg', 3, 1, NULL, CAST(140000.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color_ID], [Size_ID], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR005', N'PROD004', N'Adidas Slides Blue', N'image5.jpg', 1, 1, NULL, CAST(100000.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color_ID], [Size_ID], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR009', N'PROD005', N'Penny Loafers', N'images/1.jpg', 2, 5, NULL, CAST(100000.00 AS Decimal(18, 2)), 0, NULL, 2, CAST(N'2025-03-29T16:47:36.607' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color_ID], [Size_ID], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR010', N'PROD005', N'Penny Loafers 1', N'images/1.jpg', 2, 5, NULL, CAST(150000.00 AS Decimal(18, 2)), 0, NULL, 2, CAST(N'2025-03-29T16:47:36.607' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[purchase_item] ON 

INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (75, N'PO001', N'VAR005', 50, CAST(100000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:01:52.757' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (76, N'PO001', N'VAR001', 40, CAST(120000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:01:52.757' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (77, N'PO001', N'VAR003', 20, CAST(200000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:01:52.757' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (78, N'PO002', N'VAR003', 20, CAST(200000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:02:15.343' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (79, N'PO002', N'VAR001', 10, CAST(120000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:02:15.343' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (80, N'PO002', N'VAR004', 5, CAST(140000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:02:15.343' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (81, N'PO003', N'VAR001', 5, CAST(120000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:04:39.577' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (82, N'PO003', N'VAR003', 25, CAST(200000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:04:39.577' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (83, N'PO003', N'VAR005', 35, CAST(100000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:04:39.577' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (84, N'PO004', N'VAR009', 10, CAST(100000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:05:02.927' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (85, N'PO005', N'VAR003', 10, CAST(200000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:16:47.107' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (86, N'PO006', N'VAR001', 10, CAST(120000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:17:45.150' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[purchase_item] OFF
GO
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [TOTALAMOUNT], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO001', N'SUP003', N'Pending', CAST(N'2025-04-03' AS Date), CAST(13800000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:01:52.757' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [TOTALAMOUNT], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO002', N'SUP001', N'Received', CAST(N'2025-04-02' AS Date), CAST(5900000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:02:15.343' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [TOTALAMOUNT], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO003', N'SUP003', N'Pending', CAST(N'2025-04-03' AS Date), CAST(9100000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:04:39.577' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [TOTALAMOUNT], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO004', N'SUP001', N'Cancelled', CAST(N'2025-04-03' AS Date), CAST(1000000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:05:02.927' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [TOTALAMOUNT], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO005', N'SUP001', N'Received', CAST(N'2025-04-03' AS Date), CAST(2000000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:16:47.107' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [TOTALAMOUNT], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO006', N'SUP001', N'Pending', CAST(N'2025-04-02' AS Date), CAST(1200000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:17:45.150' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[receive_items] ON 

INSERT [dbo].[receive_items] ([receiving_items_ID], [RO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (48, N'RO001', N'VAR003', 20, CAST(200000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:16:03.670' AS DateTime), NULL, NULL)
INSERT [dbo].[receive_items] ([receiving_items_ID], [RO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (49, N'RO001', N'VAR001', 10, CAST(120000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:16:03.670' AS DateTime), NULL, NULL)
INSERT [dbo].[receive_items] ([receiving_items_ID], [RO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (50, N'RO001', N'VAR004', 5, CAST(140000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:16:03.670' AS DateTime), NULL, NULL)
INSERT [dbo].[receive_items] ([receiving_items_ID], [RO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (51, N'RO002', N'VAR003', 10, CAST(200000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:17:07.630' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[receive_items] OFF
GO
INSERT [dbo].[receive_orders] ([RO_ID], [DO_ID], [Supplier], [Status], [Expected_date], [total_amount], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'RO001', N'DO001', N'SUP001', N'Đã giao đủ.  ', CAST(N'2025-03-29' AS Date), CAST(5900000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:16:03.670' AS DateTime), NULL, NULL)
INSERT [dbo].[receive_orders] ([RO_ID], [DO_ID], [Supplier], [Status], [Expected_date], [total_amount], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'RO002', N'DO002', N'SUP001', N'Đã giao đủ.  ', CAST(N'2025-03-29' AS Date), CAST(2000000.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-29T17:17:07.630' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Admin', N'Chủ', N'Active', 1, CAST(N'2025-03-01T13:58:35.900' AS DateTime), 1, CAST(N'2025-03-01T13:58:35.900' AS DateTime))
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Manager', N'Quản lý', N'Active', 2, CAST(N'2025-03-01T13:58:35.900' AS DateTime), 2, CAST(N'2025-03-01T13:58:35.900' AS DateTime))
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Staff', N'Nhân viên', N'Active', 3, CAST(N'2025-03-01T13:58:35.900' AS DateTime), 3, CAST(N'2025-03-01T13:58:35.900' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[SizeProduct] ON 

INSERT [dbo].[SizeProduct] ([Size_ID], [SizeName]) VALUES (1, N'35')
INSERT [dbo].[SizeProduct] ([Size_ID], [SizeName]) VALUES (2, N'36')
INSERT [dbo].[SizeProduct] ([Size_ID], [SizeName]) VALUES (3, N'37')
INSERT [dbo].[SizeProduct] ([Size_ID], [SizeName]) VALUES (4, N'38')
INSERT [dbo].[SizeProduct] ([Size_ID], [SizeName]) VALUES (5, N'39')
INSERT [dbo].[SizeProduct] ([Size_ID], [SizeName]) VALUES (6, N'40')
INSERT [dbo].[SizeProduct] ([Size_ID], [SizeName]) VALUES (7, N'41')
INSERT [dbo].[SizeProduct] ([Size_ID], [SizeName]) VALUES (8, N'42')
SET IDENTITY_INSERT [dbo].[SizeProduct] OFF
GO
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType_ID], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN001', N'WH001', N'Bin A1', 1, 200, N'Lock for check', 2, CAST(N'2025-03-01T13:47:54.693' AS DateTime), 2, CAST(N'2025-03-24T03:01:44.580' AS DateTime))
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType_ID], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN002', N'WH001', N'Bin A2', 2, 200, N'Lock for check', 2, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 2, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType_ID], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN003', N'WH002', N'Bin B2', 3, 300, N'Active', 2, CAST(N'2025-03-23T17:26:48.790' AS DateTime), 2, CAST(N'2025-03-24T03:07:37.493' AS DateTime))
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType_ID], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN004', N'WH001', N'Bin C3', 1, 200, N'Active', 2, CAST(N'2025-03-24T02:48:06.937' AS DateTime), 2, CAST(N'2025-03-24T02:49:16.713' AS DateTime))
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType_ID], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN005', N'WH001', N'Bin Nike1', 3, 300, N'Lock for check', 2, CAST(N'2025-03-26T00:33:06.413' AS DateTime), 2, CAST(N'2025-03-26T00:49:14.463' AS DateTime))
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType_ID], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN006', N'WH003', N'Bin F1', 3, 300, N'Active', 2, CAST(N'2025-03-27T02:02:43.730' AS DateTime), NULL, NULL)
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType_ID], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN007', N'WH002', N'BIn C4', 1, 100, N'Active', 2, CAST(N'2025-03-27T10:07:19.077' AS DateTime), 2, CAST(N'2025-03-27T10:08:21.123' AS DateTime))
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType_ID], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN008', N'WH002', N'Bin T1', 3, 300, N'Active', 2, CAST(N'2025-03-29T14:21:42.900' AS DateTime), NULL, NULL)
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType_ID], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN009', N'WH003', N'Bin T2', 1, 100, N'Lock', 2, CAST(N'2025-03-29T16:36:18.953' AS DateTime), 2, CAST(N'2025-03-29T16:36:27.617' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[StorageCheck] ON 

INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (35, N'1', 0, N'Pending', NULL, 2, CAST(N'2025-03-29T15:51:28.017' AS DateTime), NULL, NULL)
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (36, N'WH001', 0, N'Pending', NULL, 2, CAST(N'2025-03-29T15:51:46.023' AS DateTime), NULL, NULL)
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (37, N'BIN001', 0, N'Cancel', NULL, 2, CAST(N'2025-03-29T15:51:53.680' AS DateTime), NULL, NULL)
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (38, N'BIN005', 0, N'Cancel', N'', 2, CAST(N'2025-03-29T15:52:40.380' AS DateTime), NULL, NULL)
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (39, N'BIN002', 0, N'Cancel', N'', 2, CAST(N'2025-03-29T15:52:41.280' AS DateTime), NULL, NULL)
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (40, N'BIN001', 1, N'Cleared', N'', 2, CAST(N'2025-03-29T15:53:00.320' AS DateTime), 1, CAST(N'2025-03-29T15:53:47.260' AS DateTime))
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (41, N'BIN002', 1, N'Recount', N'', 2, CAST(N'2025-03-29T15:53:01.610' AS DateTime), 1, CAST(N'2025-03-29T15:53:59.467' AS DateTime))
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (42, N'BIN005', 0, N'Pending', N'', 2, CAST(N'2025-03-29T15:53:02.220' AS DateTime), NULL, NULL)
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (43, N'BIN001', 0, N'Pending', N'', 2, CAST(N'2025-03-29T15:55:18.670' AS DateTime), NULL, NULL)
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (44, N'BIN008', 1, N'Cleared', N'', 2, CAST(N'2025-03-29T17:18:40.480' AS DateTime), 1, CAST(N'2025-03-29T17:19:47.913' AS DateTime))
SET IDENTITY_INSERT [dbo].[StorageCheck] OFF
GO
SET IDENTITY_INSERT [dbo].[StorageCheckDetail] ON 

INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (33, 40, 1, N'VAR001', 0, 5, 1, N'', 1, CAST(N'2025-03-29T15:53:47.270' AS DateTime), NULL, CAST(N'2025-03-29T15:53:47.270' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (34, 40, 3, N'VAR003', 50, 10, 1, N'', 1, CAST(N'2025-03-29T15:53:47.310' AS DateTime), NULL, CAST(N'2025-03-29T15:53:47.310' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (35, 40, 5, N'VAR005', 100, 100, 1, N'', 1, CAST(N'2025-03-29T15:53:47.343' AS DateTime), NULL, CAST(N'2025-03-29T15:53:47.343' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (36, 41, 2, N'VAR002', 20, 10, 1, N'', 1, CAST(N'2025-03-29T15:53:59.473' AS DateTime), NULL, CAST(N'2025-03-29T15:53:59.473' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (37, 41, 4, N'VAR004', 10, 5, 1, N'', 1, CAST(N'2025-03-29T15:53:59.507' AS DateTime), NULL, CAST(N'2025-03-29T15:53:59.507' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (38, 44, 8, N'VAR002', 10, 10, 1, N'', 1, CAST(N'2025-03-29T17:19:47.923' AS DateTime), NULL, CAST(N'2025-03-29T17:19:47.923' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (39, 44, 9, N'VAR004', 15, 20, 1, N'', 1, CAST(N'2025-03-29T17:19:47.960' AS DateTime), NULL, CAST(N'2025-03-29T17:19:47.960' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (40, 44, 10, N'VAR005', 12, 10, 1, N'', 1, CAST(N'2025-03-29T17:19:48.037' AS DateTime), NULL, CAST(N'2025-03-29T17:19:48.037' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (41, 44, 11, N'VAR003', 170, 170, 1, N'', 1, CAST(N'2025-03-29T17:19:48.120' AS DateTime), NULL, CAST(N'2025-03-29T17:19:48.120' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (42, 44, 12, N'VAR001', 10, 16, 1, N'', 1, CAST(N'2025-03-29T17:19:48.150' AS DateTime), NULL, CAST(N'2025-03-29T17:19:48.150' AS DateTime))
SET IDENTITY_INSERT [dbo].[StorageCheckDetail] OFF
GO
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Tax_number], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'SUP001', N'Nhà cung cấp Việt Anh', N'Hanoi', N'0123456789', N'1234567891231', N'Active', 2, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 2, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Tax_number], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'SUP002', N'Nhà cung cấp Long An', N'Ho Chi Minh', N'0987654321', N'9876543216325', N'Inactive', 2, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 2, CAST(N'2025-03-27T10:06:40.970' AS DateTime))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Tax_number], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'SUP003', N'Nhà cung cấp Vũ', N'Hanoi', N'0123489812', N'0712342686482', N'Active', 2, CAST(N'2025-03-29T15:04:45.407' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Warehouse] ([WarehouseID], [WarehouseName], [Location], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'WH001', N'Main Warehouse', N'so 123, Xã Lạc Nông, Huyện Bắc Mê, Tỉnh Hà Giang', N'Main storage facility', 1, CAST(N'2025-03-01T13:47:54.693' AS DateTime), 1, CAST(N'2025-03-24T04:09:25.327' AS DateTime))
INSERT [dbo].[Warehouse] ([WarehouseID], [WarehouseName], [Location], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'WH002', N'Backup Warehouse', N'so 841, Xã Chiềng Công, Huyện Mường La, Tỉnh Sơn La', N'Secondary storage facility', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-24T04:09:42.240' AS DateTime))
INSERT [dbo].[Warehouse] ([WarehouseID], [WarehouseName], [Location], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'WH003', N'wh long biên', N'số nhà 46, Phường Giang Biên, Quận Long Biên, Thành phố Hà Nội', N'  ', 1, CAST(N'2025-03-24T11:33:27.857' AS DateTime), 1, CAST(N'2025-03-29T15:07:51.440' AS DateTime))
GO
ALTER TABLE [dbo].[BinType] ADD  CONSTRAINT [DF_BinType_BinType_ID]  DEFAULT ((0)) FOR [BinType_ID]
GO
ALTER TABLE [dbo].[StorageCheck] ADD  DEFAULT ((0)) FOR [CheckCounter]
GO
ALTER TABLE [dbo].[StorageCheck] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[StorageCheck] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[StorageCheckDetail] ADD  DEFAULT ((0)) FOR [ActualQuantity]
GO
ALTER TABLE [dbo].[StorageCheckDetail] ADD  DEFAULT ((0)) FOR [ExpectedQuantity]
GO
ALTER TABLE [dbo].[StorageCheckDetail] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[StorageCheckDetail] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[BinProduct]  WITH CHECK ADD  CONSTRAINT [FK__BinProduc__Produ__4BAC3F29] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductVariant] ([ProductVariantID])
GO
ALTER TABLE [dbo].[BinProduct] CHECK CONSTRAINT [FK__BinProduc__Produ__4BAC3F29]
GO
ALTER TABLE [dbo].[BinProduct]  WITH CHECK ADD  CONSTRAINT [FK__BinProduc__Stora__5BE2A6F2] FOREIGN KEY([StorageBinID])
REFERENCES [dbo].[StorageBin] ([StorageBinID])
GO
ALTER TABLE [dbo].[BinProduct] CHECK CONSTRAINT [FK__BinProduc__Stora__5BE2A6F2]
GO
ALTER TABLE [dbo].[BinTransfer]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[BinTransfer]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[BinTransferDetail]  WITH CHECK ADD  CONSTRAINT [FK__BinTransf__BinPr__6EF57B66] FOREIGN KEY([BinProductID])
REFERENCES [dbo].[BinProduct] ([BinProductID])
GO
ALTER TABLE [dbo].[BinTransferDetail] CHECK CONSTRAINT [FK__BinTransf__BinPr__6EF57B66]
GO
ALTER TABLE [dbo].[BinTransferDetail]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[BinTransferDetail]  WITH CHECK ADD  CONSTRAINT [FK__BinTransf__Produ__5165187F] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductVariant] ([ProductVariantID])
GO
ALTER TABLE [dbo].[BinTransferDetail] CHECK CONSTRAINT [FK__BinTransf__Produ__5165187F]
GO
ALTER TABLE [dbo].[BinTransferDetail]  WITH CHECK ADD FOREIGN KEY([TransportID])
REFERENCES [dbo].[BinTransfer] ([BinTransferID])
GO
ALTER TABLE [dbo].[BinTransferDetail]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[delivery_item]  WITH CHECK ADD  CONSTRAINT [FK__delivery___Creat__5629CD9C] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[delivery_item] CHECK CONSTRAINT [FK__delivery___Creat__5629CD9C]
GO
ALTER TABLE [dbo].[delivery_item]  WITH CHECK ADD  CONSTRAINT [FK__delivery___DO_ID__571DF1D5] FOREIGN KEY([DO_ID])
REFERENCES [dbo].[delivery_orders] ([DO_ID])
GO
ALTER TABLE [dbo].[delivery_item] CHECK CONSTRAINT [FK__delivery___DO_ID__571DF1D5]
GO
ALTER TABLE [dbo].[delivery_item]  WITH CHECK ADD  CONSTRAINT [FK__delivery___Produ__5812160E] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductVariant] ([ProductVariantID])
GO
ALTER TABLE [dbo].[delivery_item] CHECK CONSTRAINT [FK__delivery___Produ__5812160E]
GO
ALTER TABLE [dbo].[delivery_item]  WITH CHECK ADD  CONSTRAINT [FK__delivery___Updat__59063A47] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[delivery_item] CHECK CONSTRAINT [FK__delivery___Updat__59063A47]
GO
ALTER TABLE [dbo].[delivery_orders]  WITH CHECK ADD  CONSTRAINT [FK__delivery___Creat__59FA5E80] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[delivery_orders] CHECK CONSTRAINT [FK__delivery___Creat__59FA5E80]
GO
ALTER TABLE [dbo].[delivery_orders]  WITH CHECK ADD  CONSTRAINT [FK__delivery___PO_ID__5AEE82B9] FOREIGN KEY([PO_ID])
REFERENCES [dbo].[purchase_orders] ([PO_ID])
GO
ALTER TABLE [dbo].[delivery_orders] CHECK CONSTRAINT [FK__delivery___PO_ID__5AEE82B9]
GO
ALTER TABLE [dbo].[delivery_orders]  WITH CHECK ADD  CONSTRAINT [FK__delivery___Suppl__5BE2A6F2] FOREIGN KEY([Supplier])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[delivery_orders] CHECK CONSTRAINT [FK__delivery___Suppl__5BE2A6F2]
GO
ALTER TABLE [dbo].[delivery_orders]  WITH CHECK ADD  CONSTRAINT [FK__delivery___Updat__5CD6CB2B] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[delivery_orders] CHECK CONSTRAINT [FK__delivery___Updat__5CD6CB2B]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariant_ColorProduct] FOREIGN KEY([Color_ID])
REFERENCES [dbo].[ColorProduct] ([Color_ID])
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [FK_ProductVariant_ColorProduct]
GO
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariant_SizeProduct] FOREIGN KEY([Size_ID])
REFERENCES [dbo].[SizeProduct] ([Size_ID])
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [FK_ProductVariant_SizeProduct]
GO
ALTER TABLE [dbo].[purchase_item]  WITH CHECK ADD  CONSTRAINT [FK__purchase___Creat__603D47BB] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[purchase_item] CHECK CONSTRAINT [FK__purchase___Creat__603D47BB]
GO
ALTER TABLE [dbo].[purchase_item]  WITH CHECK ADD  CONSTRAINT [FK__purchase___PO_ID__5E54FF49] FOREIGN KEY([PO_ID])
REFERENCES [dbo].[purchase_orders] ([PO_ID])
GO
ALTER TABLE [dbo].[purchase_item] CHECK CONSTRAINT [FK__purchase___PO_ID__5E54FF49]
GO
ALTER TABLE [dbo].[purchase_item]  WITH CHECK ADD  CONSTRAINT [FK__purchase___Produ__5F492382] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductVariant] ([ProductVariantID])
GO
ALTER TABLE [dbo].[purchase_item] CHECK CONSTRAINT [FK__purchase___Produ__5F492382]
GO
ALTER TABLE [dbo].[purchase_item]  WITH CHECK ADD  CONSTRAINT [FK__purchase___Updat__61316BF4] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[purchase_item] CHECK CONSTRAINT [FK__purchase___Updat__61316BF4]
GO
ALTER TABLE [dbo].[purchase_orders]  WITH CHECK ADD  CONSTRAINT [FK__purchase___Creat__6754599E] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[purchase_orders] CHECK CONSTRAINT [FK__purchase___Creat__6754599E]
GO
ALTER TABLE [dbo].[purchase_orders]  WITH CHECK ADD  CONSTRAINT [FK__purchase___Suppl__68487DD7] FOREIGN KEY([Supplier])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[purchase_orders] CHECK CONSTRAINT [FK__purchase___Suppl__68487DD7]
GO
ALTER TABLE [dbo].[purchase_orders]  WITH CHECK ADD  CONSTRAINT [FK__purchase___Updat__693CA210] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[purchase_orders] CHECK CONSTRAINT [FK__purchase___Updat__693CA210]
GO
ALTER TABLE [dbo].[receive_items]  WITH CHECK ADD  CONSTRAINT [FK__receiving__Creat__08B54D69] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[receive_items] CHECK CONSTRAINT [FK__receiving__Creat__08B54D69]
GO
ALTER TABLE [dbo].[receive_items]  WITH CHECK ADD  CONSTRAINT [FK__receiving__Produ__6B24EA82] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductVariant] ([ProductVariantID])
GO
ALTER TABLE [dbo].[receive_items] CHECK CONSTRAINT [FK__receiving__Produ__6B24EA82]
GO
ALTER TABLE [dbo].[receive_items]  WITH CHECK ADD  CONSTRAINT [FK__receiving__RO_ID__0A9D95DB] FOREIGN KEY([RO_ID])
REFERENCES [dbo].[receive_orders] ([RO_ID])
GO
ALTER TABLE [dbo].[receive_items] CHECK CONSTRAINT [FK__receiving__RO_ID__0A9D95DB]
GO
ALTER TABLE [dbo].[receive_items]  WITH CHECK ADD  CONSTRAINT [FK__receiving__Updat__0B91BA14] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[receive_items] CHECK CONSTRAINT [FK__receiving__Updat__0B91BA14]
GO
ALTER TABLE [dbo].[receive_orders]  WITH CHECK ADD  CONSTRAINT [FK__receiving__Creat__0C85DE4D] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[receive_orders] CHECK CONSTRAINT [FK__receiving__Creat__0C85DE4D]
GO
ALTER TABLE [dbo].[receive_orders]  WITH CHECK ADD  CONSTRAINT [FK__receiving__DO_ID__6EF57B66] FOREIGN KEY([DO_ID])
REFERENCES [dbo].[delivery_orders] ([DO_ID])
GO
ALTER TABLE [dbo].[receive_orders] CHECK CONSTRAINT [FK__receiving__DO_ID__6EF57B66]
GO
ALTER TABLE [dbo].[receive_orders]  WITH CHECK ADD  CONSTRAINT [FK__receiving__Updat__0E6E26BF] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[receive_orders] CHECK CONSTRAINT [FK__receiving__Updat__0E6E26BF]
GO
ALTER TABLE [dbo].[StorageBin]  WITH CHECK ADD  CONSTRAINT [FK_StorageBin_BinType] FOREIGN KEY([BinType_ID])
REFERENCES [dbo].[BinType] ([BinType_ID])
GO
ALTER TABLE [dbo].[StorageBin] CHECK CONSTRAINT [FK_StorageBin_BinType]
GO
ALTER TABLE [dbo].[StorageBin]  WITH CHECK ADD  CONSTRAINT [FK_StorageBin_Warehouse] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouse] ([WarehouseID])
GO
ALTER TABLE [dbo].[StorageBin] CHECK CONSTRAINT [FK_StorageBin_Warehouse]
GO
ALTER TABLE [dbo].[StorageCheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_StorageCheckDetail_BinProduct] FOREIGN KEY([BinProductID])
REFERENCES [dbo].[BinProduct] ([BinProductID])
GO
ALTER TABLE [dbo].[StorageCheckDetail] CHECK CONSTRAINT [FK_StorageCheckDetail_BinProduct]
GO
ALTER TABLE [dbo].[StorageCheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_StorageCheckDetail_ProductVariant] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductVariant] ([ProductVariantID])
GO
ALTER TABLE [dbo].[StorageCheckDetail] CHECK CONSTRAINT [FK_StorageCheckDetail_ProductVariant]
GO
ALTER TABLE [dbo].[StorageCheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_StorageCheckDetail_StorageCheck] FOREIGN KEY([StorageCheckID])
REFERENCES [dbo].[StorageCheck] ([StorageCheckID])
GO
ALTER TABLE [dbo].[StorageCheckDetail] CHECK CONSTRAINT [FK_StorageCheckDetail_StorageCheck]
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Warehouse]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Warehouse]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
USE [master]
GO
ALTER DATABASE [SWP391_Re1] SET  READ_WRITE 
GO
