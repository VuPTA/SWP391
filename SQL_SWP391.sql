USE [SWP391]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/4/2025 5:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] NOT NULL,
	[PersonID] [int] NULL,
	[RoleID] [int] NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Phone] [nchar](10) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinProduct]    Script Date: 3/4/2025 5:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinProduct](
	[BinProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductVariantID] [nvarchar](50) NULL,
	[StorageBinID] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BinProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/4/2025 5:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [nvarchar](50) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](500) NULL,
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
/****** Object:  Table [dbo].[delivery_item]    Script Date: 3/4/2025 5:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delivery_item](
	[delivery_Item_ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductVariantID] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[delivery_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 3/4/2025 5:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Gender] [nvarchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [nvarchar](255) NULL,
	[ContactRole] [nvarchar](255) NULL,
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
/****** Object:  Table [dbo].[Product]    Script Date: 3/4/2025 5:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [nvarchar](50) NOT NULL,
	[CategoryID] [nvarchar](50) NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](500) NULL,
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
/****** Object:  Table [dbo].[ProductVariant]    Script Date: 3/4/2025 5:36:21 PM ******/
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
	[Price] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__ProductV__E4D667250DC7E8FF] PRIMARY KEY CLUSTERED 
(
	[ProductVariantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase_Item]    Script Date: 3/4/2025 5:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase_Item](
	[purchase_Item_ID] [int] IDENTITY(1,1) NOT NULL,
	[PO_ID] [nvarchar](50) NULL,
	[ProductVariantID] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[purchase_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase_orders]    Script Date: 3/4/2025 5:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase_orders](
	[PO_ID] [nvarchar](50) NOT NULL,
	[Supplier] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NULL,
	[Expected_date] [date] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/4/2025 5:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](500) NULL,
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
/****** Object:  Table [dbo].[StorageBin]    Script Date: 3/4/2025 5:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageBin](
	[StorageBinID] [nvarchar](50) NOT NULL,
	[WarehouseID] [nvarchar](50) NULL,
	[BinName] [nvarchar](255) NULL,
	[BinType] [nvarchar](50) NULL,
	[Capacity] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[TimeLocked] [date] NULL,
	[TimeUnlock] [date] NULL,
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
/****** Object:  Table [dbo].[Suppliers]    Script Date: 3/4/2025 5:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [nvarchar](50) NOT NULL,
	[SupplierName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[TaxNumber] [varchar](13) NULL,
	[ContactPersonID] [int] NULL,
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
/****** Object:  Table [dbo].[WareHouse]    Script Date: 3/4/2025 5:36:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WareHouse](
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
SET IDENTITY_INSERT [dbo].[BinProduct] ON 

INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (1, N'VAR001', N'BIN001', 20)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (2, N'VAR002', N'BIN002', 15)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (3, N'VAR003', N'BIN001', 10)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (4, N'VAR004', N'BIN002', 5)
INSERT [dbo].[BinProduct] ([BinProductID], [ProductVariantID], [StorageBinID], [Quantity]) VALUES (5, N'VAR005', N'BIN001', 25)
SET IDENTITY_INSERT [dbo].[BinProduct] OFF
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT001', N'Sneakers', N'Casual shoes for everyday wear', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT002', N'Formal Shoes', N'Shoes for office and formal occasions', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT003', N'Boots', N'Stylish boots for various occasions', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT004', N'Sandals', N'Comfortable sandals for summer', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'CAT005', N'Loafers', N'Easy slip-on shoes', N'Active', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[delivery_item] ON 

INSERT [dbo].[delivery_item] ([delivery_Item_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'VAR001', 10, CAST(100.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
INSERT [dbo].[delivery_item] ([delivery_Item_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'VAR002', 5, CAST(105.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
INSERT [dbo].[delivery_item] ([delivery_Item_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'VAR003', 8, CAST(110.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
SET IDENTITY_INSERT [dbo].[delivery_item] OFF
GO
INSERT [dbo].[Person] ([PersonID], [Name], [Gender], [Phone], [Email], [ContactRole], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Nguyễn Văn A', N'Nam', N'0901234567', N'nguyenvana@example.com', N'Quản lý', N'Hoạt động', 0, CAST(N'2025-03-04T00:20:50.857' AS DateTime), 0, CAST(N'2025-03-04T00:20:50.857' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [Name], [Gender], [Phone], [Email], [ContactRole], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Trần Thị B', N'Nữ', N'0912345678', N'tranthib@example.com', N'Nhân viên', N'Hoạt động', 0, CAST(N'2025-03-04T00:20:50.857' AS DateTime), 0, CAST(N'2025-03-04T00:20:50.857' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [Name], [Gender], [Phone], [Email], [ContactRole], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Lê Văn C', N'Nam', N'0923456789', N'levanc@example.com', N'Nhân viên', N'Không hoạt động', 0, CAST(N'2025-03-04T00:20:50.857' AS DateTime), 0, CAST(N'2025-03-04T00:20:50.857' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [Name], [Gender], [Phone], [Email], [ContactRole], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'Phạm Thị D', N'Nữ', N'0934567890', N'phamthid@example.com', N'Khách hàng', N'Hoạt động', 0, CAST(N'2025-03-04T00:20:50.857' AS DateTime), 0, CAST(N'2025-03-04T00:20:50.857' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [Name], [Gender], [Phone], [Email], [ContactRole], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'Hoàng Văn E', N'Nam', N'0945678901', N'hoangvane@example.com', N'Đối tác', N'Hoạt động', 0, CAST(N'2025-03-04T00:20:50.857' AS DateTime), 0, CAST(N'2025-03-04T00:20:50.857' AS DateTime))
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD001', N'CAT001', N'Nike Air Force 1', N'Classic sneakers', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD002', N'CAT002', N'Oxford Leather Shoes', N'Elegant formal shoes', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD003', N'CAT003', N'Timberland Boots', N'Durable outdoor boots', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD004', N'CAT004', N'Adidas Slides', N'Comfortable casual sandals', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PROD005', N'CAT005', N'Penny Loafers', N'Classic leather loafers', N'Available', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
GO
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color], [Size], [Price], [Quantity], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR001', N'PROD001', N'Nike AF1 White', N'image1.jpg', N'White', N'42', CAST(50.00 AS Decimal(18, 2)), 50, 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color], [Size], [Price], [Quantity], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR002', N'PROD001', N'Nike AF1 Black', N'image2.jpg', N'Black', N'43', CAST(50.00 AS Decimal(18, 2)), 40, 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color], [Size], [Price], [Quantity], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR003', N'PROD002', N'Oxford Brown', N'image3.jpg', N'Brown', N'41', CAST(53.00 AS Decimal(18, 2)), 30, 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color], [Size], [Price], [Quantity], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR004', N'PROD003', N'Timberland Yellow', N'image4.jpg', N'Yellow', N'44', CAST(70.00 AS Decimal(18, 2)), 20, 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[ProductVariant] ([ProductVariantID], [ProductID], [PVName], [Image], [Color], [Size], [Price], [Quantity], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'VAR005', N'PROD004', N'Adidas Slides Blue', N'image5.jpg', N'Blue', N'40', CAST(200.00 AS Decimal(18, 2)), 25, 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[purchase_Item] ON 

INSERT [dbo].[purchase_Item] ([purchase_Item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'PO001', N'VAR001', 10, CAST(100.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
INSERT [dbo].[purchase_Item] ([purchase_Item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'PO001', N'VAR002', 5, CAST(105.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
INSERT [dbo].[purchase_Item] ([purchase_Item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'PO002', N'VAR003', 8, CAST(110.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
INSERT [dbo].[purchase_Item] ([purchase_Item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'PO003', N'VAR005', 3, CAST(200.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-04T17:32:51.373' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_Item] ([purchase_Item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'PO003', N'VAR004', 2, CAST(70.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-04T17:32:51.373' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_Item] ([purchase_Item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'PO004', N'VAR002', 2, CAST(50.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-04T17:35:10.763' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_Item] ([purchase_Item_ID], [PO_ID], [ProductVariantID], [Quantity], [UnitPrice], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'PO004', N'VAR004', 1, CAST(70.00 AS Decimal(18, 2)), 1, CAST(N'2025-03-04T17:35:10.763' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[purchase_Item] OFF
GO
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO001', N'Nike Vietnam', N'Pending', CAST(N'2025-03-10' AS Date), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO002', N'Adidas Supplier', N'Completed', CAST(N'2025-02-28' AS Date), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO003', N'Adidas Supplier', N'Pending', CAST(N'2025-03-08' AS Date), 1, CAST(N'2025-03-04T17:32:51.373' AS DateTime), NULL, NULL)
INSERT [dbo].[purchase_orders] ([PO_ID], [Supplier], [Status], [Expected_date], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'PO004', N'Adidas Supplier', N'Pending', CAST(N'2025-03-10' AS Date), 1, CAST(N'2025-03-04T17:35:10.763' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Admin', N'Qu?n tr? h? th?ng', N'Active', 1, CAST(N'2025-03-01T13:58:35.900' AS DateTime), 1, CAST(N'2025-03-01T13:58:35.900' AS DateTime))
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Manager', N'Qu?n lý c?p cao', N'Active', 2, CAST(N'2025-03-01T13:58:35.900' AS DateTime), 2, CAST(N'2025-03-01T13:58:35.900' AS DateTime))
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Staff', N'Nhân viên', N'Active', 3, CAST(N'2025-03-01T13:58:35.900' AS DateTime), 3, CAST(N'2025-03-01T13:58:35.900' AS DateTime))
GO
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType], [Capacity], [Status], [TimeLocked], [TimeUnlock], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN001', N'WH001', N'Bin A1', N'Standard', 100, N'Active', NULL, NULL, 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[StorageBin] ([StorageBinID], [WarehouseID], [BinName], [BinType], [Capacity], [Status], [TimeLocked], [TimeUnlock], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'BIN002', N'WH001', N'Bin A2', N'Standard', 80, N'Active', NULL, NULL, 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
GO
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [TaxNumber], [ContactPersonID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'SUP001', N'Nike Vietnam', N'Hanoi', N'0123456789', N'123456789', 1, N'Active', 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [TaxNumber], [ContactPersonID], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'SUP002', N'Adidas Supplier', N'Ho Chi Minh', N'0987654321', N'987654321', 1, N'Active', 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.697' AS DateTime))
GO
INSERT [dbo].[WareHouse] ([WarehouseID], [WarehouseName], [Location], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'WH001', N'Main Warehouse', N'Hanoi', N'Main storage facility', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
INSERT [dbo].[WareHouse] ([WarehouseID], [WarehouseName], [Location], [Note], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (N'WH002', N'Backup Warehouse', N'Ho Chi Minh', N'Secondary storage facility', 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime), 1, CAST(N'2025-03-01T13:48:54.693' AS DateTime))
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[BinProduct]  WITH CHECK ADD  CONSTRAINT [FK__BinProduc__Produ__3C69FB99] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductVariant] ([ProductVariantID])
GO
ALTER TABLE [dbo].[BinProduct] CHECK CONSTRAINT [FK__BinProduc__Produ__3C69FB99]
GO
ALTER TABLE [dbo].[BinProduct]  WITH CHECK ADD FOREIGN KEY([StorageBinID])
REFERENCES [dbo].[StorageBin] ([StorageBinID])
GO
ALTER TABLE [dbo].[delivery_item]  WITH CHECK ADD  CONSTRAINT [FK__delivery___Produ__3E52440B] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductVariant] ([ProductVariantID])
GO
ALTER TABLE [dbo].[delivery_item] CHECK CONSTRAINT [FK__delivery___Produ__3E52440B]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK__ProductVa__Produ__403A8C7D] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [FK__ProductVa__Produ__403A8C7D]
GO
ALTER TABLE [dbo].[purchase_Item]  WITH CHECK ADD FOREIGN KEY([PO_ID])
REFERENCES [dbo].[purchase_orders] ([PO_ID])
GO
ALTER TABLE [dbo].[purchase_Item]  WITH CHECK ADD  CONSTRAINT [FK__purchase___Produ__4222D4EF] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[ProductVariant] ([ProductVariantID])
GO
ALTER TABLE [dbo].[purchase_Item] CHECK CONSTRAINT [FK__purchase___Produ__4222D4EF]
GO
ALTER TABLE [dbo].[StorageBin]  WITH CHECK ADD FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[WareHouse] ([WarehouseID])
GO
