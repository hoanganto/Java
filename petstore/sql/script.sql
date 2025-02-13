USE [master]
GO
/****** Object:  Database [FishStore]    Script Date: 20-Dec-24 10:01:37 AM ******/
CREATE DATABASE [FishStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FishStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FishStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FishStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FishStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FishStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FishStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FishStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FishStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FishStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FishStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FishStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [FishStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FishStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FishStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FishStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FishStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FishStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FishStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FishStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FishStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FishStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FishStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FishStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FishStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FishStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FishStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FishStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FishStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FishStore] SET RECOVERY FULL 
GO
ALTER DATABASE [FishStore] SET  MULTI_USER 
GO
ALTER DATABASE [FishStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FishStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FishStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FishStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FishStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FishStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FishStore', N'ON'
GO
ALTER DATABASE [FishStore] SET QUERY_STORE = OFF
GO
USE [FishStore]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 20-Dec-24 10:01:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](15) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[enabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 20-Dec-24 10:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 20-Dec-24 10:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] NOT NULL,
	[category] [nvarchar](50) NOT NULL,
	[shipToAddress] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 20-Dec-24 10:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] NOT NULL,
	[salary] [money] NOT NULL,
	[departmentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 20-Dec-24 10:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderHeaderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[discount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHeader]    Script Date: 20-Dec-24 10:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeader](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[customerId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20-Dec-24 10:01:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](255) NOT NULL,
	[price] [float] NOT NULL,
	[discount] [float] NOT NULL,
	[categoryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role], [password], [enabled]) VALUES (1, N'Admin', N'123 Admin Street', N'0987654321', N'admin@fishstore.com', N'ROLE_ADMIN', N'adminpassword', 1)
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role], [password], [enabled]) VALUES (2, N'Employee1', N'456 Employee Lane', N'0123456789', N'employee1@fishstore.com', N'ROLE_EMPLOYEE', N'employee1password', 1)
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role], [password], [enabled]) VALUES (3, N'Customer1', N'789 Customer Road', N'0712345678', N'customer1@fishstore.com', N'ROLE_CUSTOMER', N'customer1password', 1)
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role], [password], [enabled]) VALUES (4, N'Customer2', N'321 Another Road', N'0734567890', N'customer2@fishstore.com', N'ROLE_CUSTOMER', N'customer2password', 1)
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role], [password], [enabled]) VALUES (5, N'Admin', N'123 Admin Street', N'0987654321', N'admin@fishstore.com', N'ROLE_ADMIN', N'defaultpassword', 1)
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role], [password], [enabled]) VALUES (6, N'Employee1', N'456 Employee Lane', N'0123456789', N'employee1@fishstore.com', N'ROLE_EMPLOYEE', N'defaultpassword', 1)
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role], [password], [enabled]) VALUES (7, N'Customer1', N'789 Customer Road', N'0712345678', N'customer1@fishstore.com', N'ROLE_CUSTOMER', N'defaultpassword', 1)
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role], [password], [enabled]) VALUES (8, N'Customer2', N'321 Another Road', N'0734567890', N'customer2@fishstore.com', N'ROLE_CUSTOMER', N'defaultpassword', 1)
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role], [password], [enabled]) VALUES (9, N'Admin', N'123 Admin Street', N'0987654321', N'admin@fishstore.com', N'ROLE_ADMIN', N'defaultpassword', 1)
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role], [password], [enabled]) VALUES (10, N'Employee1', N'456 Employee Lane', N'0123456789', N'employee1@fishstore.com', N'ROLE_EMPLOYEE', N'defaultpassword', 1)
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role], [password], [enabled]) VALUES (11, N'Customer1', N'789 Customer Road', N'0712345678', N'customer1@fishstore.com', N'ROLE_CUSTOMER', N'defaultpassword', 1)
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role], [password], [enabled]) VALUES (12, N'Customer2', N'321 Another Road', N'0734567890', N'customer2@fishstore.com', N'ROLE_CUSTOMER', N'defaultpassword', 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Freshwater Fish')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Saltwater Fish')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Aquarium Accessories')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Customer] ([id], [category], [shipToAddress]) VALUES (3, N'Gold', N'789 Customer Road')
INSERT [dbo].[Customer] ([id], [category], [shipToAddress]) VALUES (4, N'Silver', N'321 Another Road')
GO
INSERT [dbo].[Employee] ([id], [salary], [departmentId]) VALUES (2, 1200.0000, 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (1, N'Tropical Fish 1', 15.99, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (2, N'Tropical Fish 2', 12.5, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (3, N'Goldfish', 8.99, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (4, N'Molly Fish', 6.99, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (5, N'Saltwater Fish 1', 35.5, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (6, N'Saltwater Fish 2', 45.99, 0.15, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (7, N'Clownfish', 25.49, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (8, N'Aquarium Filter', 29.99, 0.1, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (9, N'Aquarium Heater', 19.99, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (10, N'Aquarium Light', 22.49, 0.1, 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderHeaderId])
REFERENCES [dbo].[OrderHeader] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderHeader]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[OrderHeader]  WITH CHECK ADD FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD CHECK  (([category]='Copper' OR [category]='Silver' OR [category]='Gold'))
GO
USE [master]
GO
ALTER DATABASE [FishStore] SET  READ_WRITE 
GO
