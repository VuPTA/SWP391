USE [SWP391_Re1]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[BinProduct]    Script Date: 3/25/2025 11:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinProduct](
	[BinProductID] [int] NOT NULL,
	[ProductVariantID] [nvarchar](50) NULL,
	[StorageBinID] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BinProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinTransfer]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[BinTransferDetail]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[BinType]    Script Date: 3/25/2025 11:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinType](
	[BinType_ID] [int] NOT NULL,
	[Name_Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BinType] PRIMARY KEY CLUSTERED 
(
	[BinType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[ColorProduct]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[delivery_item]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[delivery_orders]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[Person]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[ProductVariant]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[purchase_item]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[purchase_orders]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[receiving_items]    Script Date: 3/25/2025 11:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receiving_items](
	[receiving_items_ID] [nvarchar](50) NOT NULL,
	[RO_ID] [nvarchar](50) NULL,
	[ProductVariantID] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[note] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[receiving_items_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[receiving_orders]    Script Date: 3/25/2025 11:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receiving_orders](
	[RO_ID] [nvarchar](50) NOT NULL,
	[DO_ID] [nvarchar](50) NULL,
	[supplier_id] [int] NULL,
	[Expected_date] [datetime] NULL,
	[received_date] [datetime] NULL,
	[status] [nvarchar](50) NULL,
	[Note] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[SizeProduct]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[StorageBin]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[StorageCheck]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[StorageCheckDetail]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[Suppliers]    Script Date: 3/25/2025 11:17:55 PM ******/
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
/****** Object:  Table [dbo].[Warehouse]    Script Date: 3/25/2025 11:17:55 PM ******/
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
INSERT [dbo].[Account] ([AccountID], [PersonID], [RoleID], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Name], [Gender], [Phone], [Email]) VALUES (1, 1, 1, N'admin1', N'Admin@123', N'Active', 1, CAST(N'2025-03-01T13:58:49.773' AS DateTime), 1, CAST(N'2025-03-01T13:58:49.773' AS DateTime), N'Nguyen Van a', N'Nam', N'0123456789', N'nvdda1@xample.com')
INSERT [dbo].[Account] ([AccountID], [PersonID], [RoleID], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Name], [Gender], [Phone], [Email]) VALUES (2, 2, 2, N'manager1', N'Manager@123', N'Active', 2, CAST(N'2025-03-01T13:58:49.773' AS DateTime), 2, CAST(N'2025-03-01T13:58:49.773' AS DateTime), N'Nguyen Van b', N'Nữ', N'0981122334', N'ptd@example.com')
INSERT [dbo].[Account] ([AccountID], [PersonID], [RoleID], [UserName], [Password], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Name], [Gender], [Phone], [Email]) VALUES (3, 3, 3, N'staff1', N'Staff@123', N'Active', 3, CAST(N'2025-03-01T13:58:49.773' AS DateTime), 3, CAST(N'2025-03-01T13:58:49.773' AS DateTime), N'Tran Duc Huy', N'Nam', N'0934567890', N'btf@example.com')
GO
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (1, N'VAR001', N'BIN001', 18)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (2, N'VAR002', N'BIN002', 5)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (3, N'VAR003', N'BIN001', 10)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (4, N'VAR004', N'BIN002', 5)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (5, N'VAR005', N'BIN001', 0)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT001', N'Sneakers', N'Casual shoes for everyday wear', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT002', N'Formal Shoes', N'Shoes for office and formal occasions', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT003', N'Boots', N'Stylish boots for various occasions', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT004', N'Sandals', N'Comfortable sandals for summer', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT005', N'Loafers', N'Easy slip-on shoes', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT006', N'cg4', N'abc', N'Inactive', 1, CAST(N'2025-03-24T11:34:37.140' AS DateTime), 1, CAST(N'2025-03-24T11:35:00.980' AS DateTime))
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

INSERT [dbo].[delivery_item] ([delivery_item_ID], [DO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'DO001', N'VAR001', 2, CAST(50.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-24T02:01:07.977' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_item] ([delivery_item_ID], [DO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'DO001', N'VAR003', 1, CAST(30.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-24T02:01:07.977' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_item] ([delivery_item_ID], [DO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, N'DO002', N'VAR003', 1, CAST(30.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-24T02:01:51.677' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_item] ([delivery_item_ID], [DO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, N'DO002', N'VAR004', 1, CAST(20.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-24T02:01:51.677' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_item] ([delivery_item_ID], [DO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (12, N'DO003', N'VAR004', 4, CAST(20.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-24T02:02:12.327' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_item] ([delivery_item_ID], [DO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, N'DO004', N'VAR001', 10, CAST(50.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-24T11:28:52.907' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_item] ([delivery_item_ID], [DO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (14, N'DO004', N'VAR002', 1, CAST(40.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-24T11:28:52.907' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_item] ([delivery_item_ID], [DO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (15, N'DO005', N'VAR001', 5, CAST(50.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-24T11:29:12.083' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[delivery_item] OFF
GO
INSERT [dbo].[delivery_orders] ([DO_ID], [PO_ID], [Supplier], [Status], [Expected_date], [total_amount], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'DO001', N'PO001', N'SUP001', N'Pending', CAST(N'2025-04-02' AS Date), CAST(130.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-24T02:01:07.977' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_orders] ([DO_ID], [PO_ID], [Supplier], [Status], [Expected_date], [total_amount], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'DO002', N'PO001', N'SUP001', N'Pending', CAST(N'2025-04-04' AS Date), CAST(50.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-24T02:01:51.677' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_orders] ([DO_ID], [PO_ID], [Supplier], [Status], [Expected_date], [total_amount], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'DO003', N'PO001', N'SUP001', N'Pending', CAST(N'2025-04-06' AS Date), CAST(80.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-24T02:02:12.327' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_orders] ([DO_ID], [PO_ID], [Supplier], [Status], [Expected_date], [total_amount], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'DO004', N'PO003', N'SUP002', N'Pending', CAST(N'2025-03-28' AS Date), CAST(540.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-24T11:28:52.907' AS DateTime), NULL, NULL)
INSERT [dbo].[delivery_orders] ([DO_ID], [PO_ID], [Supplier], [Status], [Expected_date], [total_amount], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'DO005', N'PO003', N'SUP002', N'Pending', CAST(N'2025-03-28' AS Date), CAST(250.00 AS Decimal(18, 2)), 2, CAST(N'2025-03-24T11:29:12.083' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD001', N'CAT001', N'Nike Air Force 1', N'Classic sneakers', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD002', N'CAT002', N'Oxford Leather Shoes', N'Elegant formal shoes', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD003', N'CAT003', N'Timberland Boots', N'Durable outdoor boots', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD004', N'CAT004', N'Adidas Slides', N'Comfortable casual sandals', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD005', N'CAT002', N'Penny Loafers', N'Classic leather loafers', N'Available', 1, CAST(N'2025-03-25T22:55:01.080' AS DateTime), 1, CAST(N'2025-03-25T23:17:25.623' AS DateTime))
GO
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color_ID], [Size_ID], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR001', N'PROD001', N'Nike AF1 White', N'image1.jpg', 1, 2, NULL, CAST(50.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color_ID], [Size_ID], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR002', N'PROD001', N'Nike AF1 Black', N'image2.jpg', 2, 1, NULL, CAST(40.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color_ID], [Size_ID], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR003', N'PROD002', N'Oxford Brown', N'image3.jpg', 3, 2, NULL, CAST(30.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color_ID], [Size_ID], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR004', N'PROD003', N'Timberland Yellow', N'image4.jpg', 3, 1, NULL, CAST(20.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color_ID], [Size_ID], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR005', N'PROD004', N'Adidas Slides Blue', N'image5.jpg', 1, 1, NULL, CAST(25.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color_ID], [Size_ID], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR006', N'PROD005', N'Penny Loafers', N'images/K14.jpg', 2, 5, NULL, CAST(100000.00 AS Decimal(18, 2)), 0, NULL, 1, CAST(N'2025-03-25T23:17:25.623' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[purchase_item] ON 

INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (17, N'PO001', N'VAR001', 2, CAST(50.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-24T01:15:09.853' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (18, N'PO001', N'VAR003', 2, CAST(30.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-24T01:15:09.853' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (19, N'PO001', N'VAR004', 5, CAST(20.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-24T01:15:09.853' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20, N'PO002', N'VAR001', 2, CAST(50.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-24T01:15:49.973' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (21, N'PO002', N'VAR004', 10, CAST(20.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-24T01:15:49.973' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (22, N'PO002', N'VAR005', 6, CAST(25.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-24T01:15:49.973' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (25, N'PO003', N'VAR001', 15, CAST(50.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-24T11:25:21.000' AS DateTime), 1, CAST(N'2025-03-24T11:26:27.913' AS DateTime))
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (26, N'PO003', N'VAR002', 1, CAST(40.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-24T11:25:21.000' AS DateTime), 1, CAST(N'2025-03-24T11:26:27.913' AS DateTime))
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (29, N'PO004', N'VAR001', 2, CAST(50.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-24T12:22:25.000' AS DateTime), 1, CAST(N'2025-03-24T12:22:54.303' AS DateTime))
SET IDENTITY_INSERT [dbo].[purchase_item] OFF
GO
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [TOTALAMOUNT], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO001', N'SUP001', N'Received', CAST(N'2025-04-01' AS Date), CAST(260.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-24T01:15:09.853' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [TOTALAMOUNT], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO002', N'SUP002', N'Pending', CAST(N'2025-03-30' AS Date), CAST(450.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-24T01:15:49.973' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [TOTALAMOUNT], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO003', N'SUP002', N'Received', CAST(N'2025-03-28' AS Date), CAST(790.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-24T11:25:21.523' AS DateTime), 1, CAST(N'2025-03-24T11:26:27.913' AS DateTime))
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [TOTALAMOUNT], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO004', N'SUP002', N'Pending', CAST(N'2025-03-27' AS Date), CAST(100.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-24T12:22:25.123' AS DateTime), 1, CAST(N'2025-03-24T12:22:54.303' AS DateTime))
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
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType_ID], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN001', N'WH001', N'Bin A1', 1, 200, N'Lock', 2, CAST(N'2025-03-01T13:47:54.693' AS DateTime), 2, CAST(N'2025-03-24T03:01:44.580' AS DateTime))
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType_ID], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN002', N'WH001', N'Bin A2', 2, 200, N'Lock', 2, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 2, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType_ID], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN003', N'WH002', N'Bin B2', 3, 300, N'Lock', 2, CAST(N'2025-03-23T17:26:48.790' AS DateTime), 2, CAST(N'2025-03-24T03:07:37.493' AS DateTime))
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType_ID], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN004', N'WH001', N'Bin C3', 1, 200, N'Active', 2, CAST(N'2025-03-24T02:48:06.937' AS DateTime), 2, CAST(N'2025-03-24T02:49:16.713' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[StorageCheck] ON 

INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'BIN001', 1, N'Completed', N'Initial check', 1, CAST(N'2025-03-24T10:39:40.610' AS DateTime), NULL, CAST(N'2025-03-24T10:39:40.610' AS DateTime))
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'BIN002', 2, N'Processing', N'Recheck needed', 2, CAST(N'2025-03-24T10:39:40.610' AS DateTime), NULL, CAST(N'2025-03-24T10:39:40.610' AS DateTime))
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'BIN001', 3, N'Completed', N'Final check', 1, CAST(N'2025-03-24T10:39:40.610' AS DateTime), NULL, CAST(N'2025-03-24T10:39:40.610' AS DateTime))
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'BIN002', 4, N'Completed', N'Everything is fine', 2, CAST(N'2025-03-24T10:39:40.610' AS DateTime), NULL, CAST(N'2025-03-24T10:39:40.610' AS DateTime))
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'BIN001', 5, N'Processing', N'Check discrepancies', 1, CAST(N'2025-03-24T10:39:40.610' AS DateTime), NULL, CAST(N'2025-03-24T10:39:40.610' AS DateTime))
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'BIN002', 6, N'Completed', N'Stock verified', 2, CAST(N'2025-03-24T10:39:40.610' AS DateTime), NULL, CAST(N'2025-03-24T10:39:40.610' AS DateTime))
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'BIN001', 2, N'Processing', N'A', 2, CAST(N'2025-03-24T11:02:53.920' AS DateTime), 1, CAST(N'2025-03-24T11:03:49.607' AS DateTime))
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'BIN002', 1, N'Completed', N'', 2, CAST(N'2025-03-24T11:05:50.387' AS DateTime), 1, CAST(N'2025-03-24T11:06:06.137' AS DateTime))
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'BIN001', 0, N'Deactivate', N'Note', 2, CAST(N'2025-03-24T11:45:36.447' AS DateTime), NULL, NULL)
INSERT [dbo].[StorageCheck] ([StorageCheckID], [StorageBinID], [CheckCounter], [Status], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, N'BIN002', 2, N'Processing', N'Note2', 2, CAST(N'2025-03-24T11:46:43.217' AS DateTime), 1, CAST(N'2025-03-24T11:54:40.900' AS DateTime))
SET IDENTITY_INSERT [dbo].[StorageCheck] OFF
GO
SET IDENTITY_INSERT [dbo].[StorageCheckDetail] ON 

INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 1, 1, N'VAR001', 18, 20, 1, N'Checked VAR001 in BIN001', 1, CAST(N'2025-03-24T10:39:40.623' AS DateTime), NULL, CAST(N'2025-03-24T10:39:40.623' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 1, 2, N'VAR002', 14, 15, 1, N'Checked VAR002 in BIN001', 2, CAST(N'2025-03-24T10:39:40.623' AS DateTime), NULL, CAST(N'2025-03-24T10:39:40.623' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 2, 1, N'VAR003', 9, 10, 2, N'Checked VAR003 in BIN001', 1, CAST(N'2025-03-24T10:39:40.623' AS DateTime), NULL, CAST(N'2025-03-24T10:39:40.623' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, 3, 2, N'VAR004', 24, 25, 1, N'Checked VAR004 in BIN002', 2, CAST(N'2025-03-24T10:39:40.623' AS DateTime), NULL, CAST(N'2025-03-24T10:39:40.623' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, 4, 1, N'VAR005', 20, 25, 2, N'Checked VAR005 in BIN001', 1, CAST(N'2025-03-24T10:39:40.623' AS DateTime), NULL, CAST(N'2025-03-24T10:39:40.623' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, 5, 2, N'VAR002', 23, 25, 3, N'Checked VAR002 in BIN001', 2, CAST(N'2025-03-24T10:39:40.623' AS DateTime), NULL, CAST(N'2025-03-24T10:39:40.623' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, 7, 1, N'VAR001', 1, 20, 1, N'a', 1, CAST(N'2025-03-24T11:03:20.270' AS DateTime), NULL, CAST(N'2025-03-24T11:03:20.270' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, 7, 3, N'VAR003', 1, 10, 1, N'v', 1, CAST(N'2025-03-24T11:03:20.380' AS DateTime), NULL, CAST(N'2025-03-24T11:03:20.380' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 7, 5, N'VAR005', 3, 0, 1, N'c', 1, CAST(N'2025-03-24T11:03:20.460' AS DateTime), NULL, CAST(N'2025-03-24T11:03:20.460' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 7, 1, N'VAR001', 2, 20, 2, N'a1', 1, CAST(N'2025-03-24T11:03:49.647' AS DateTime), NULL, CAST(N'2025-03-24T11:03:49.647' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, 7, 3, N'VAR003', 2, 10, 2, N'v1', 1, CAST(N'2025-03-24T11:03:49.747' AS DateTime), NULL, CAST(N'2025-03-24T11:03:49.747' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (12, 7, 5, N'VAR005', 4, 0, 2, N'c1', 1, CAST(N'2025-03-24T11:03:49.877' AS DateTime), NULL, CAST(N'2025-03-24T11:03:49.877' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, 8, 2, N'VAR002', 5, 14, 1, N'', 1, CAST(N'2025-03-24T11:06:06.167' AS DateTime), NULL, CAST(N'2025-03-24T11:06:06.167' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (14, 8, 4, N'VAR004', 5, 5, 1, N'', 1, CAST(N'2025-03-24T11:06:06.263' AS DateTime), NULL, CAST(N'2025-03-24T11:06:06.263' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (15, 10, 2, N'VAR002', 99, 5, 1, N'1', 1, CAST(N'2025-03-24T11:51:46.930' AS DateTime), NULL, CAST(N'2025-03-24T11:51:46.930' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (16, 10, 4, N'VAR004', 33, 5, 1, N'2', 1, CAST(N'2025-03-24T11:51:46.977' AS DateTime), NULL, CAST(N'2025-03-24T11:51:46.977' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (17, 10, 2, N'VAR002', 99, 5, 2, N'1', 1, CAST(N'2025-03-24T11:54:40.913' AS DateTime), NULL, CAST(N'2025-03-24T11:54:40.913' AS DateTime))
INSERT [dbo].[StorageCheckDetail] ([StorageCheckDetailID], [StorageCheckID], [BinProductID], [ProductVariantID], [ActualQuantity], [ExpectedQuantity], [CheckPeriod], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (18, 10, 4, N'VAR004', 33, 5, 2, N'2', 1, CAST(N'2025-03-24T11:54:40.947' AS DateTime), NULL, CAST(N'2025-03-24T11:54:40.947' AS DateTime))
SET IDENTITY_INSERT [dbo].[StorageCheckDetail] OFF
GO
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Tax_number], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'SUP001', N'Nhà cung cấp Việt Anh', N'Hanoi', N'0123456789', N'123456789', N'Active', 2, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 2, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Tax_number], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'SUP002', N'Nhà cung cấp Long An', N'Ho Chi Minh', N'0987654321', N'987654321', N'Active', 2, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 2, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
GO
INSERT [dbo].[Warehouse] ([WarehouseID], [WarehouseName], [Location], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'WH001', N'Main Warehouse', N'so 123, Xã Lạc Nông, Huyện Bắc Mê, Tỉnh Hà Giang', N'Main storage facility', 1, CAST(N'2025-03-01T13:47:54.693' AS DateTime), 1, CAST(N'2025-03-24T04:09:25.327' AS DateTime))
INSERT [dbo].[Warehouse] ([WarehouseID], [WarehouseName], [Location], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'WH002', N'Backup Warehouse', N'so 841, Xã Chiềng Công, Huyện Mường La, Tỉnh Sơn La', N'Secondary storage facility', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-24T04:09:42.240' AS DateTime))
INSERT [dbo].[Warehouse] ([WarehouseID], [WarehouseName], [Location], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'WH003', N'wh long biên', N'số nhà 46, Phường Giang Biên, Quận Long Biên, Thành phố Hà Nội', N'abc', 1, CAST(N'2025-03-24T11:33:27.857' AS DateTime), NULL, NULL)
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
ALTER TABLE [dbo].[BinTransferDetail]  WITH CHECK ADD FOREIGN KEY([BinProductID])
REFERENCES [dbo].[BinProduct] ([BinProductID])
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
ALTER TABLE [dbo].[receiving_items]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[receiving_items]  WITH CHECK ADD  CONSTRAINT [FK__receiving__Produ__6B24EA82] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductVariant] ([ProductVariantID])
GO
ALTER TABLE [dbo].[receiving_items] CHECK CONSTRAINT [FK__receiving__Produ__6B24EA82]
GO
ALTER TABLE [dbo].[receiving_items]  WITH CHECK ADD FOREIGN KEY([RO_ID])
REFERENCES [dbo].[receiving_orders] ([RO_ID])
GO
ALTER TABLE [dbo].[receiving_items]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[receiving_orders]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[receiving_orders]  WITH CHECK ADD  CONSTRAINT [FK__receiving__DO_ID__6EF57B66] FOREIGN KEY([DO_ID])
REFERENCES [dbo].[delivery_orders] ([DO_ID])
GO
ALTER TABLE [dbo].[receiving_orders] CHECK CONSTRAINT [FK__receiving__DO_ID__6EF57B66]
GO
ALTER TABLE [dbo].[receiving_orders]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
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
