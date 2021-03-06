USE [master]
GO
/****** Object:  Database [SHOP]    Script Date: 11/20/2016 1:17:00 PM ******/
CREATE DATABASE [SHOP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SHOP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SHOP.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SHOP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SHOP_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SHOP] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SHOP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SHOP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SHOP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SHOP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SHOP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SHOP] SET ARITHABORT OFF 
GO
ALTER DATABASE [SHOP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SHOP] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SHOP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SHOP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SHOP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SHOP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SHOP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SHOP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SHOP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SHOP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SHOP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SHOP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SHOP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SHOP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SHOP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SHOP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SHOP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SHOP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SHOP] SET RECOVERY FULL 
GO
ALTER DATABASE [SHOP] SET  MULTI_USER 
GO
ALTER DATABASE [SHOP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SHOP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SHOP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SHOP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SHOP', N'ON'
GO
USE [SHOP]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/20/2016 1:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] NOT NULL,
	[NameVN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/20/2016 1:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Feedback] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](11) NULL,
	[Role] [nvarchar](20) NULL,
	[Rank] [float] NULL,
	[CountRank] [float] NULL,
	[Count] [float] NULL,
	[Activated] [nchar](10) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MasterRoles]    Script Date: 11/20/2016 1:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MasterId] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserInRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Masters]    Script Date: 11/20/2016 1:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masters](
	[Id] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Account]    Script Date: 11/20/2016 1:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Datetime] [datetime] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_Order_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/20/2016 1:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ID_Seller] [nvarchar](20) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Total] [float] NULL,
	[Status] [nvarchar](20) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/20/2016 1:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](20) NOT NULL,
	[RequireDate] [datetime] NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/20/2016 1:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nvarchar](20) NULL,
	[Name] [nvarchar](40) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Size] [nvarchar](100) NOT NULL,
	[Color] [nvarchar](100) NOT NULL,
	[Amount] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleActions]    Script Date: 11/20/2016 1:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleActions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](50) NOT NULL,
	[WebActionId] [int] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/20/2016 1:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WebActions]    Script Date: 11/20/2016 1:17:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebActions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Masters] ADD  CONSTRAINT [DF_Masters_FullName]  DEFAULT (N'Nguyễn Nghiệm') FOR [FullName]
GO
ALTER TABLE [dbo].[Masters] ADD  CONSTRAINT [DF_Masters_Mobile]  DEFAULT ((913745789)) FOR [Mobile]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__Amount__381A47C8]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[MasterRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserInRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterRoles] CHECK CONSTRAINT [FK_UserInRoles_Roles]
GO
ALTER TABLE [dbo].[MasterRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserInRoles_Users] FOREIGN KEY([MasterId])
REFERENCES [dbo].[Masters] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterRoles] CHECK CONSTRAINT [FK_UserInRoles_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_Loai1] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_HangHoa_Loai1]
GO
ALTER TABLE [dbo].[RoleActions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Actions] FOREIGN KEY([WebActionId])
REFERENCES [dbo].[WebActions] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleActions] CHECK CONSTRAINT [FK_Permissions_Actions]
GO
ALTER TABLE [dbo].[RoleActions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleActions] CHECK CONSTRAINT [FK_Permissions_Roles]
GO
USE [master]
GO
ALTER DATABASE [SHOP] SET  READ_WRITE 
GO
--Insert data

SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [NameVN]) VALUES (1000, N'Áo sơ mi')
INSERT [dbo].[Categories] ([Id], [NameVN]) VALUES (1001, N'Áo Thun')
INSERT [dbo].[Categories] ([Id], [NameVN]) VALUES (1002, N'Áo Khoác')
INSERT [dbo].[Categories] ([Id], [NameVN]) VALUES (1003, N'Quần Jeans')
INSERT [dbo].[Categories] ([Id], [NameVN]) VALUES (1004, N'Quần Kakis')
INSERT [dbo].[Categories] ([Id], [NameVN]) VALUES (1005, N'Quần Shorts')

SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email]) VALUES (N'KH001',N'061095',N'Thach Thi Kieu Linh',N'nlinh6894@gmail.com')
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email]) VALUES (N'KH002', N'061095', N'Huynh Du Nguyen', N'huynhdunguyen22@gmail.com')
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email]) VALUES (N'KH003', N'061095', N'Pham Tuan Anh', N'anhpham140195@gmail.com')

SET IDENTITY_INSERT [dbo].[MasterRoles] ON 

INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (106, N'nnghiem', N'admin')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (107, N'lththao', N'user')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (109, N'ndthienlong', N'user')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (110, N'ndhoanglong', N'user')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (157, N'songlong2k', N'super')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (158, N'songlong2k', N'user')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (165, N'999', N'super')
INSERT [dbo].[MasterRoles] ([Id], [MasterId], [RoleId]) VALUES (166, N'999', N'user')
SET IDENTITY_INSERT [dbo].[MasterRoles] OFF
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'999', N'999', N'999', N'999', N'999')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'lththao', N'songlong', N'Lê Thị Hương Thảo', N'lththao@gmail.com', N'0913745789')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'ndhoanglong', N'songlong', N'Nguyễn Đình Hoàng Long', N'ndhoanglong@gmail.com', N'0913745789')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'ndthienlong', N'songlong', N'Nguyễn Đình Thiên Long', N'ndthienlong@gmail.com', N'0913745789')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'nnghiem', N'songlong', N'Nguyễn Nghiệm', N'nghiemn@fpt.edu.vn', N'0913745789')
INSERT [dbo].[Masters] ([Id], [Password], [FullName], [Email], [Mobile]) VALUES (N'songlong2k', N'songlong', N'Song Long 2000', N'songlong2k@gmail.com', N'0913745789')

SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1001,N'KH001', N'Abercrombie Men Shirt'       , 450, N'1001.jpg',1, 1000, N'Áo sơ mi thương hiệu Abercrombie nhập khẩu. Được thiết kế sọc caro trắng đen tay dài form Muscle fit'                  ,N' S, M, L, XL',N'Trắng',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1002,N'KH001', N'Abercrombie Men Shirt'		  , 450, N'1002.jpg', 1, 1000, N'Áo sơ mi thương hiệu Abercrombie nhập khẩu. Được thiết kế sọc caro đỏ, xanh tay dài, form Muscle fit'                  ,N' S, M, L, XL',N'Đỏ',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1003,N'KH001', N'CALVIN KLEIN MEN SHIRT'		, 400, N'1003.jpg', 1, 1000, N'Áo sơ mi thương hiệu CALVIN KLEIN nhập khẩu .Được thiết kế tay dài , form rộng  '                                      ,N' S, M, L, XL',N'Trắng',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1004,N'KH001', N'ASOS MEN COTTON SHIRT'       , 500, N'1004.jpg', 1, 1000, N'Áo sơ mi thương hiệu ASOS nhập khẩu .Thiết kế với form Slim fit, chất khakis bông tuyết  '                             ,N' S, M, L, XL',N'Đen',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1005,N'KH001', N'DRDENIM JEANSMAKERS SHIRT'   , 550, N'1005.jpg',  1, 1000, N'Áo sơ mi thương hiệu DRDENIM nhập khẩu. Thiết kế caro lớn xám trắng và đen  '                                           ,N' S, M, L, XL',N'Xám',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1006,N'KH001', N'ATHL HOLLISTER MEN SHIRT'    , 350, N'1006.jpg', 1, 1000, N'Áo sơ mi thương hiệu HOLLISTER nhập khẩu.Thiết kế chất cotton bông, caro, với nhiều màu khác nhau  '                    ,N' S, M, L, XL',N'Xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1007,N'KH001', N'TOPMAN SHIRT IN LONG SLEEVE' , 550, N'1007.jpg', 1, 1000, N'Áo sơ mi thương hiệu TOPMAN nhập khẩu .Áo sơ mi có thiết kế cổ bẻ, tay dài, mang đến phong cách thời trang, lich lãm . ',N' S, M, L, XL',N'Xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1008,N'KH001', N'TOPMAN SHIRT IN LONG SLEEVE' , 550, N'1008.jpg', 1, 1000, N'Áo sơ mi thương hiệu TOPMAN nhập khẩu .Áo sơ mi có thiết kế cổ bẻ, tay dài, mang đến phong cách thời trang, lich lãm . ',N' S, M, L, XL',N'Trắng',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1009,N'KH001', N'Sơ mi MANGO HN'              , 400, N'1009.jpg', 1, 1000, N'Áo sơ mi thương hiệu MANGO  nhập khẩu. Thiết kế form Muscle fit  '                                                      ,N' S, M, L, XL',N'Trắng xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1010,N'KH001', N'Z.A.R.A TEXTURED WEAVE SHIRT', 450, N'1010.jpg', 1, 1000, N'Áo sơ mi thương hiệu Z.A.R.A nhập khẩu.Thiết kể sơ mi dài tay giả jean  '                                               ,N' S, M, L, XL',N'Xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1011,N'KH001', N'Z.A.R.A PRINT SHIRT'         , 400, N'1011.jpg', 1, 1000, N'Áo sơ mi thương hiệu Z.A.R.A  nhập khẩu .Thiết kế với màu xanh chấm bi trắng   '                                        ,N' S, M, L, XL',N'Xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color],[Amount]) VALUES (1012,N'KH001', N'H.M DENIM SHIRT'             , 500, N'1012.jpg', 1, 1000, N'Áo sơ mi thương hiệu DENIM  nhập khẩu .Thiết kể giả jean  '                                                            ,N' S, M, L, XL',N'Xám',0)

INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1013,N'KH001', N'POLO T-SHIRT'                , 200, N'1013.jpg', 1, 1001, N'Áo thun POLO có cổ tay ngắn  '                              ,N' S, M, L, XL',N'Trắng',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1014,N'KH001', N'ABERCROMBIE T-SHIRT 150'     , 150, N'1014.jpg', 1, 1001, N'Áo thun Abercombie-v-neck cổ tim '                           ,N' S, M, L, XL',N'Đen',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1015,N'KH001', N'PULL AND BEAR T-SHIRT'       , 250, N'1015.jpg', 1, 1001, N'Áo thun PULL AND BEAR cổ tròn , form body , cotton '         ,N' S, M, L, XL',N'Trắng',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1016,N'KH001', N'HOLLISTER HENLEY T-SHIRT'    , 300, N'1016.jpg', 1, 1001, N'Áo thun HOLLISTER  cổ tròn, cotton'                          ,N' S, M, L, XL',N'Trắng',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1017,N'KH001', N'ABERCOMBIE MEN T-SHIRT'      , 250, N'1017.jpg' , 1, 1001, N'Áo thun ABERCOMBIE chất cotton mịn, form muscle fit'         ,N' S, M, L, XL', N'Trắng',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1018,N'KH001', N'ZARA MAN T-SHIRT'            , 250, N'1018.jpg' , 1, 1001, N'Áo thun ZARA chất cotton, form muscle fit. chấm bi trắng  '  ,N' S, M, L, XL',N'Xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1019,N'KH001', N'F.PERRY POLO SHIRT PRINT'    , 250, N'1019.jpg' , 1, 1001, N'Áo thun POLO chất vải mịn, có cổ viền trắng'                 ,N' S, M, L, XL',N'Đen',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1020,N'KH001', N' ABERCROMBIE HG T8'          , 280, N'1020.jpg' , 1, 1001, N'Áo thun ABERCROMBIE cổ tròn, vải mịn form body'              ,N' S, M, L, XL',N'Xám',0)

INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1021,N'KH001', N'Z.A.R.A SUEDETTE BOMBER'     , 480, N'1021.jpg' , 1, 1002, N'Áo khoác vải nỉ Z.A.R.A không nón'               ,N' S, M, L, XL',N'Đen',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1022,N'KH001', N'Z.A.R.A LIGHT BOMBER'        , 450, N'1022.jpg' , 1, 1002, N'Áo khoác vải dù Z.A.R.A không nón '              ,N' S, M, L, XL',N'Xanh đen',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1023,N'KH001', N'TOP.MAN COTTON BOMBER'       , 380,N'1023.jpg' ,  1, 1002, N'Áo khoác vải cotton TOP.MAN không nón  '         ,N' S, M, L, XL',N'Trắng',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1024,N'KH001', N'J.JONES DENIM PRINTED SHIRTS', 320, N'1024.jpg' , 1, 1002, N'Áo khoác jean DENIM '                            ,N' S, M, L, XL',N'Xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1025,N'KH001', N'M.A.N.G.O CONCEALED HOOD'    , 550, N'1025.jpg' , 1, 1002, N'Áo khoác vải dù MANGO không nón'                ,N' S, M, L, XL',N'Đỏ',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1026,N'KH001', N'M.A.N.G.O CONCEALED HOOD'    , 550, N'1026.jpg' , 1, 1002, N'Áo khoác vải dù MANGO có nón'                    ,N' S, M, L, XL',N'Xanh',0)

INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1027,N'KH001', N'DENIM BEN STEVEN JEANS  '    , 550, N'1026.jpg' , 1, 1003, N'Quần Jean DENIM giả nhăn'                                                   ,N' 28-36',N'Đen',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1028,N'KH001', N'ZARA MAN JEAN           '    , 450, N'1026.jpg' , 1, 1003, N'Quần Jean Z.A.R.A giả nhăn và rách'                                        ,N' 28-36',N'Xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1029,N'KH001', N'TOP MAN JEAN            '    , 450, N'1026.jpg' , 1, 1003, N'Quần Jean TOPMEN form thẳng'                                                ,N' 28-36',N'Xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1030,N'KH001', N'ABERCOMBIE SKINNY JEAN  '    , 500, N'1026.jpg' , 1, 1003, N'Quần Jean ABERCOMBIE Chất Jean pha Spandex co giãn thoải mái, tiện dụng.'   ,N' 28-36',N'Đen',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1031,N'KH001', N'HOLLISTER JEAN          '    , 500, N'1026.jpg' , 1, 1003, N'Quần Jean HOLISTER .Chất Jean pha thun wash đỉnh cao Form skinny    '       ,N' 28-36',N'Đen',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1032,N'KH001', N'ABERCROMBIE JEAN        '    , 500, N'1026.jpg' , 1, 1003, N'Quần Jean ABERCOMBIE Chất Jean pha thun wash.Form skinny'                   ,N' 28-36',N'Đen',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1033,N'KH001', N'DENIM SPAO JEANS        '    , 400, N'1026.jpg' , 1, 1003, N'Quần Jean DENIM Form slim fit'                                              ,N' 28-36',N'Xanh Đen',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1034,N'KH001', N'TOPMEN SKINNY JEAN      '    , 400, N'1026.jpg' , 1, 1003, N'Quần Jean TOPMEN form skinny'                                                ,N' 28-36',N'Xanh Đen',0)

INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1035,N'KH001', N'TOPMEN SKINNY TROUSER   '    , 350, N'1026.jpg' , 1, 1004, N'Quần Khakis TOPMEN form skinny'                                  ,N' 28-36',N'Xanh Đen',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1036,N'KH001', N'Z.A.R.A MEN CHINO       '    , 350, N'1026.jpg' , 1, 1004, N'Quần Khakis ZARA form skinny'                                     ,N' 28-36',N'Xanh ',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1037,N'KH001', N'M.A.N.G.O SLIM FIT CHINO'    , 350, N'1026.jpg' , 1, 1004, N'Quần Khakis MANGO form slim fit'                                 ,N' 28-36',N'Xanh Đen',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1038,N'KH001', N'CANVIN KLEIN MEN        '    , 380, N'1026.jpg' , 1, 1004, N'Quần Khakis CANVIN KLEIN Chất vải kaki pha spandex dày mịn.'      ,N' 28-36',N' Đen',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1039,N'KH001', N'Z.A.R.A COMFORT SUIT    '    , 400, N'1026.jpg' , 1, 1004, N'Quần Khakis ZARA form slim fit'                                  ,N' 28-36',N' Đen',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description],[Size], [Color] ,[Amount]) VALUES (1040,N'KH001', N'CANVIN KLEIN Coloured   '    , 350, N'1026.jpg' , 1, 1004, N'Quần Khakis CANVIN KLEIN vải kaki dày mịn'                       ,N' 28-36',N'Xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1041,N'KH001', N'DR.DENIM HEYWOOD        '    , 350, N'1026.jpg' , 1, 1004, N'Quần Khakis DENIM vải kaki trơn'                                  ,N' 28-36',N'Trắng',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1042,N'KH001', N'PnB Basic Chinos        '    , 350, N'1026.jpg' , 1, 1004, N'Quần Khakis ASOS vải kaki dày bóng'                               ,N' 28-36',N'Đỏ',0)

INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1043,N'KH001', N'SHORT JEAN HOLLISTER    '    , 350, N'1026.jpg' , 1, 1005, N'Quần HOLISTER short vải jean      '                               ,N' 28-36',N'Xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1044,N'KH001', N'DENIM PRPS SHORT        '    , 250, N'1026.jpg' , 1, 1005, N'Quần DENIM short vải kaki bóng'                                   ,N' 28-36',N'Xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1045,N'KH001', N'MANGO MAN JEAN          '    , 350, N'1026.jpg' , 1, 1005, N'Quần MANGO short vải jean'                                        ,N' 28-36',N'Xám',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1046,N'KH001', N'ZARA MAN JEANS          '    , 350, N'1026.jpg' , 1, 1005, N'Quần ZARA short vải jean giả rách '                              ,N' 28-36',N'Xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1047,N'KH001', N'ZARA SHORT JEAN         '    , 350, N'1026.jpg' , 1, 1005, N'Quần ZARA short vải jean nhăn'                                   ,N' 28-36',N'Xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1048,N'KH001', N'HOLLISTER SHORT KHAKIS  '    , 250, N'1026.jpg' , 1, 1005, N'Quần HOLISTER short vải kakis'                                    ,N' 28-36',N'Xanh',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1049,N'KH001', N'MANGO MAN SHORT         '    , 250, N'1026.jpg' , 1, 1005, N'Quần MANGO short vải kakis form slim'                            ,N' 28-36',N'Xám',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1050,N'KH001', N'Z.A.R.A BASIC           '    , 280, N'1026.jpg' , 1, 1005, N'Quần ZARA short cotton có họa tiết'                               ,N' 28-36',N'Xám',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1051,N'KH001', N'T.O.P.M.A.N STRETCH     '    , 300, N'1026.jpg' , 1, 1005, N'Quần TOPMEN short vải kakis form skinny'                          ,N' 28-36',N'Nâu',0)
INSERT [dbo].[Products] ([Id], [CustomerID], [Name], [UnitPrice], [Image], [Available], [CategoryId], [Description], [Size], [Color] ,[Amount]) VALUES (1052,N'KH001', N'A.S.O.S PRINTED         '    , 280, N'1026.jpg' , 1, 1005, N'Quần ASOS short vải dù có họa tiết'                               ,N' 28-36',N'Xanh',0)


SET IDENTITY_INSERT [dbo].[Products] OFF