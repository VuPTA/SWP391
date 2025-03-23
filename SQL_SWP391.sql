USE [SWP391_Re]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/23/2025 9:19:01 PM ******/
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
/****** Object:  Table [dbo].[BinProduct]    Script Date: 3/23/2025 9:19:01 PM ******/
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
/****** Object:  Table [dbo].[BinTransfer]    Script Date: 3/23/2025 9:19:01 PM ******/
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
/****** Object:  Table [dbo].[BinTransferDetail]    Script Date: 3/23/2025 9:19:01 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 3/23/2025 9:19:01 PM ******/
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
/****** Object:  Table [dbo].[delivery_item]    Script Date: 3/23/2025 9:19:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delivery_item](
	[delivery_item_ID] [nvarchar](50) NOT NULL,
	[DO_ID] [nvarchar](50) NULL,
	[ProductVariantID] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[ReceivedQuantity] [int] NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[delivery_item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delivery_orders]    Script Date: 3/23/2025 9:19:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delivery_orders](
	[DO_ID] [nvarchar](50) NOT NULL,
	[PO_ID] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Expected_date] [datetime] NULL,
	[total_amount] [decimal](18, 0) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 3/23/2025 9:19:01 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 3/23/2025 9:19:01 PM ******/
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
/****** Object:  Table [dbo].[ProductVariant]    Script Date: 3/23/2025 9:19:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariant](
	[ProductVariantID] [nvarchar](50) NOT NULL,
	[ProductID] [nvarchar](50) NULL,
	[PVName] [nvarchar](255) NULL,
	[Image] [nvarchar](500) NULL,
	[Color] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[purchase_item]    Script Date: 3/23/2025 9:19:01 PM ******/
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
/****** Object:  Table [dbo].[purchase_orders]    Script Date: 3/23/2025 9:19:01 PM ******/
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
/****** Object:  Table [dbo].[receiving_items]    Script Date: 3/23/2025 9:19:01 PM ******/
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
/****** Object:  Table [dbo].[receiving_orders]    Script Date: 3/23/2025 9:19:01 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 3/23/2025 9:19:01 PM ******/
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
/****** Object:  Table [dbo].[StorageBin]    Script Date: 3/23/2025 9:19:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageBin](
	[StorageBinID] [nvarchar](50) NOT NULL,
	[WarehouseID] [nvarchar](50) NULL,
	[BinName] [nvarchar](50) NULL,
	[BinType] [nvarchar](255) NULL,
	[Capacity] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StorageBinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorageCheck]    Script Date: 3/23/2025 9:19:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageCheck](
	[StorageCheckID] [int] NOT NULL,
	[StorageBinID] [nvarchar](50) NULL,
	[CheckCounter] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[Note] [nvarchar](500) NULL,
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
/****** Object:  Table [dbo].[StorageCheckDetail]    Script Date: 3/23/2025 9:19:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageCheckDetail](
	[StorageCheckDetailID] [int] NOT NULL,
	[StorageCheckID] [int] NULL,
	[BinProductID] [int] NULL,
	[ProductVariantID] [nvarchar](50) NULL,
	[ActualQuantity] [int] NULL,
	[ExpectedQuantity] [int] NULL,
	[CheckPeriod] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StorageCheckDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 3/23/2025 9:19:01 PM ******/
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
/****** Object:  Table [dbo].[Warehouse]    Script Date: 3/23/2025 9:19:01 PM ******/
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
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (1, N'VAR001', N'BIN001', 20)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (2, N'VAR002', N'BIN002', 15)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (3, N'VAR003', N'BIN001', 10)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (4, N'VAR004', N'BIN002', 5)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (5, N'VAR005', N'BIN001', 25)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT001', N'Sneakers', N'Casual shoes for everyday wear', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT002', N'Formal Shoes', N'Shoes for office and formal occasions', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT003', N'Boots', N'Stylish boots for various occasions', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT004', N'Sandals', N'Comfortable sandals for summer', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT005', N'Loafers', N'Easy slip-on shoes', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD001', N'CAT001', N'Nike Air Force 1', N'Classic sneakers', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD002', N'CAT002', N'Oxford Leather Shoes', N'Elegant formal shoes', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD003', N'CAT003', N'Timberland Boots', N'Durable outdoor boots', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD004', N'CAT004', N'Adidas Slides', N'Comfortable casual sandals', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD005', N'CAT005', N'Penny Loafers', N'Classic leather loafers', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
GO
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color], [Size], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR001', N'PROD001', N'Nike AF1 White', N'image1.jpg', N'White', N'42', NULL, CAST(50.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color], [Size], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR002', N'PROD001', N'Nike AF1 Black', N'image2.jpg', N'Black', N'43', NULL, CAST(40.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color], [Size], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR003', N'PROD002', N'Oxford Brown', N'image3.jpg', N'Brown', N'41', NULL, CAST(30.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color], [Size], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR004', N'PROD003', N'Timberland Yellow', N'image4.jpg', N'Yellow', N'44', NULL, CAST(20.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color], [Size], [Quantity], [Price], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR005', N'PROD004', N'Adidas Slides Blue', N'image5.jpg', N'Blue', N'40', NULL, CAST(25.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[purchase_item] ON 

INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (12, N'PO001', N'VAR001', 2, CAST(50.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-23T21:12:30.000' AS DateTime), 1, CAST(N'2025-03-23T21:16:06.230' AS DateTime))
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, N'PO001', N'VAR003', 4, CAST(30.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-23T21:12:30.000' AS DateTime), 1, CAST(N'2025-03-23T21:16:06.230' AS DateTime))
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (14, N'PO001', N'VAR001', 2, CAST(50.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-23T21:12:30.000' AS DateTime), 1, CAST(N'2025-03-23T21:16:06.230' AS DateTime))
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (15, N'PO002', N'VAR001', 10, CAST(50.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-23T21:16:45.153' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_item] ([purchase_item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (16, N'PO002', N'VAR005', 6, CAST(25.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-23T21:16:45.153' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[purchase_item] OFF
GO
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [TOTALAMOUNT], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO001', N'SUP002', N'Pending', CAST(N'2025-04-01' AS Date), CAST(320.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-23T21:12:30.933' AS DateTime), 1, CAST(N'2025-03-23T21:16:06.230' AS DateTime))
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [TOTALAMOUNT], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO002', N'SUP001', N'Pending', CAST(N'2025-04-03' AS Date), CAST(650.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-23T21:16:45.153' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Admin', N'Chủ', N'Active', 1, CAST(N'2025-03-01T13:58:35.900' AS DateTime), 1, CAST(N'2025-03-01T13:58:35.900' AS DateTime))
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Manager', N'Quản lý', N'Active', 2, CAST(N'2025-03-01T13:58:35.900' AS DateTime), 2, CAST(N'2025-03-01T13:58:35.900' AS DateTime))
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Staff', N'Nhân viên', N'Active', 3, CAST(N'2025-03-01T13:58:35.900' AS DateTime), 3, CAST(N'2025-03-01T13:58:35.900' AS DateTime))
GO
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN001', N'WH001', N'Bin A1', N'Standard', 100, N'Active', 2, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 2, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN002', N'WH001', N'Bin A2', N'Standard', 80, N'Active', 2, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 2, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType], [Capacity], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN003', N'WH002', N'Bin B2', N'Large', 5000, N'Lock', 2, CAST(N'2025-03-23T17:26:48.790' AS DateTime), 2, CAST(N'2025-03-23T17:40:28.117' AS DateTime))
GO
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Tax_number], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'SUP001', N'Nhà cung cấp Việt Anh', N'Hanoi', N'0123456789', N'123456789', N'Active', 2, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 2, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Tax_number], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'SUP002', N'Nhà cung cấp Long An', N'Ho Chi Minh', N'0987654321', N'987654321', N'Active', 2, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 2, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
GO
INSERT [dbo].[Warehouse] ([WarehouseID], [WarehouseName], [Location], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'WH001', N'Main Warehouse', N'Hanoi', N'Main storage facility', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Warehouse] ([WarehouseID], [WarehouseName], [Location], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'WH002', N'Backup Warehouse', N'Hanoi', N'Secondary storage facility', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
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
ALTER TABLE [dbo].[BinProduct]  WITH CHECK ADD FOREIGN KEY([StorageBinID])
REFERENCES [dbo].[StorageBin] ([StorageBinID])
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
ALTER TABLE [dbo].[delivery_item]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[delivery_item]  WITH CHECK ADD FOREIGN KEY([DO_ID])
REFERENCES [dbo].[delivery_orders] ([DO_ID])
GO
ALTER TABLE [dbo].[delivery_item]  WITH CHECK ADD  CONSTRAINT [FK__delivery___Produ__5812160E] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductVariant] ([ProductVariantID])
GO
ALTER TABLE [dbo].[delivery_item] CHECK CONSTRAINT [FK__delivery___Produ__5812160E]
GO
ALTER TABLE [dbo].[delivery_item]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[delivery_orders]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[delivery_orders]  WITH CHECK ADD  CONSTRAINT [FK__delivery___PO_ID__5AEE82B9] FOREIGN KEY([PO_ID])
REFERENCES [dbo].[purchase_orders] ([PO_ID])
GO
ALTER TABLE [dbo].[delivery_orders] CHECK CONSTRAINT [FK__delivery___PO_ID__5AEE82B9]
GO
ALTER TABLE [dbo].[delivery_orders]  WITH CHECK ADD FOREIGN KEY([Supplier])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[delivery_orders]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
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
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK__ProductVa__Creat__60A75C0F] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [FK__ProductVa__Creat__60A75C0F]
GO
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK__ProductVa__Produ__619B8048] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [FK__ProductVa__Produ__619B8048]
GO
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK__ProductVa__Updat__628FA481] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [FK__ProductVa__Updat__628FA481]
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
ALTER TABLE [dbo].[receiving_orders]  WITH CHECK ADD FOREIGN KEY([DO_ID])
REFERENCES [dbo].[delivery_orders] ([DO_ID])
GO
ALTER TABLE [dbo].[receiving_orders]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[StorageBin]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[StorageBin]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[StorageBin]  WITH CHECK ADD FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouse] ([WarehouseID])
GO
ALTER TABLE [dbo].[StorageCheck]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[StorageCheck]  WITH CHECK ADD FOREIGN KEY([StorageBinID])
REFERENCES [dbo].[StorageBin] ([StorageBinID])
GO
ALTER TABLE [dbo].[StorageCheck]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[StorageCheckDetail]  WITH CHECK ADD FOREIGN KEY([BinProductID])
REFERENCES [dbo].[BinProduct] ([BinProductID])
GO
ALTER TABLE [dbo].[StorageCheckDetail]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[StorageCheckDetail]  WITH CHECK ADD  CONSTRAINT [FK__StorageCh__Produ__787EE5A0] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductVariant] ([ProductVariantID])
GO
ALTER TABLE [dbo].[StorageCheckDetail] CHECK CONSTRAINT [FK__StorageCh__Produ__787EE5A0]
GO
ALTER TABLE [dbo].[StorageCheckDetail]  WITH CHECK ADD FOREIGN KEY([StorageCheckID])
REFERENCES [dbo].[StorageCheck] ([StorageCheckID])
GO
ALTER TABLE [dbo].[StorageCheckDetail]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Account] ([AccountID])
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
