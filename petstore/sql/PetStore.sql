raiserror('Creating PetStore database....',0,1)
SET NOCOUNT ON
GO
USE [master]
GO
CREATE DATABASE [PetStore]
GO
USE [PetStore]
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[name] [varchar](50) NOT NULL
)
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[description] [varchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[discount] [float] NOT NULL,
	[categoryId] [int] references Category(id) NOT NULL
)
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[name] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[phone] [varchar](12) NOT NULL,
	[email] [varchar](30) NOT NULL,
	--password: default = 1
	[password] [char](64) NOT NULL default('6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B'),
	[enabled] [bit] NOT NULL default(1),
	[role] [varchar](255) NOT NULL
)
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] PRIMARY KEY references [Account](id) NOT NULL,
	[category] varchar(50) NOT NULL CHECK([category] IN ('Gold','Silver','Copper')),
	[shipToAddress] [varchar](50) NOT NULL
)
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] PRIMARY KEY references [Account](id) NOT NULL,
	[salary] [money] NOT NULL,
	[departmentId] [int] NOT NULL
)
GO
CREATE TABLE [dbo].[OrderHeader](
	[id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [varchar](30) NULL,
	[customerId] [int] references Customer(id) NOT NULL,
	[employeeId] [int] references Employee(id) NOT NULL
)
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[orderHeaderId] [int] references OrderHeader(id) NOT NULL,
	[productId] [int] references Product(id) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[discount] [float] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Dog')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Cat')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Parrot')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (1, N'Dog 1', 204.99, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (2, N'Dog 2', 73.94, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (3, N'Dog 3', 74.11, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (4, N'Dog 4', 52.73, 0, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (5, N'Dog 5', 171.13, 0.15, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (6, N'Dog 6', 140.55, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (7, N'Dog 7', 56.01, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (8, N'Dog 8', 48.17, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (9, N'Dog 9', 62.03, 0, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (10, N'Dog 10', 88.19, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (11, N'Dog 11', 20.31, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (12, N'Dog 12', 96.47, 0.15, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (13, N'Dog 13', 155.58, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (14, N'Dog 14', 204.26, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (15, N'Dog 15', 148.25, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (16, N'Dog 16', 209.9, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (17, N'Dog 17', 104.29, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (18, N'Dog 18', 146.36, 0, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (19, N'Dog 19', 154.76, 0.15, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (20, N'Dog 20', 135.82, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (21, N'Dog 21', 158.46, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (22, N'Dog 22', 165.89, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (23, N'Dog 23', 95.7, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (24, N'Dog 24', 80.16, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (25, N'Cat 25', 19.25, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (26, N'Cat 26', 171.36, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (27, N'Cat 27', 35.08, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (28, N'Cat 28', 57.92, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (29, N'Cat 29', 157.81, 0, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (30, N'Cat 30', 151, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (31, N'Cat 31', 126.34, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (32, N'Cat 32', 170.23, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (33, N'Cat 33', 136.5, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (34, N'Cat 34', 24.68, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (35, N'Cat 35', 88.71, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (36, N'Cat 36', 190.43, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (37, N'Parrot 37', 14, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (38, N'Parrot 38', 206.57, 0.1, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (39, N'Parrot 39', 163.48, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (40, N'Parrot 40', 92.3, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (41, N'Parrot 41', 168.69, 0.1, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (42, N'Parrot 42', 117.89, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (43, N'Parrot 43', 56.34, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (44, N'Parrot 44', 158.61, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (45, N'Parrot 45', 209.96, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (46, N'Parrot 46', 176.24, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (47, N'Parrot 47', 174.28, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (48, N'Parrot 48', 70.65, 0, 3)
SET IDENTITY_INSERT [dbo].[Product] OFF

SET IDENTITY_INSERT [dbo].[Account] ON 
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role]) VALUES
(1, N'Admin', N'9652 Los Angeles', N'0123456789', N'a@petstore.com', 'ROLE_ADMIN'),
(2, N'Employee1', N'5747 Shirley Drive', N'1234567890', N'e1@petstore.com', 'ROLE_EMPLOYEE'),
(3, N'Employee2', N'3841 Silver Oaks Place', N'2345678901', N'e2@petstore.com', 'ROLE_EMPLOYEE'),
(4, N'Customer1', N'1873 Lion Circle', N'5678901234', N'c1@gmail.com','ROLE_CUSTOMER'),
(5, N'Customer2', N'5747 Shirley Drive', N'6789872314', N'c2@gmail.com', 'ROLE_CUSTOMER')
SET IDENTITY_INSERT [dbo].[Account] OFF

INSERT [dbo].[Customer] ([id], [category], [shipToAddress]) VALUES (4, 'Copper', N'1873 Lion Circle')
INSERT [dbo].[Customer] ([id], [category], [shipToAddress]) VALUES (5, 'Copper', N'5747 Shirley Drive')

INSERT [dbo].[Employee] ([id], [salary], [departmentId]) VALUES 
(1, 1200, 1),(2, 1000, 2),(3, 800, 2)
GO
SET NOCOUNT OFF
raiserror('The PetStore database in now ready for use.',0,1)
GO







//////////////////////////////
raiserror('Creating FishStore database....',0,1)
SET NOCOUNT ON
GO
USE [master]
GO
CREATE DATABASE [FishStore]
GO
USE [FishStore]
GO
CREATE TABLE [dbo].[Category](
    [id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [name] [varchar](50) NOT NULL
)
GO
CREATE TABLE [dbo].[Product](
    [id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [description] [varchar](50) NOT NULL,
    [price] [float] NOT NULL,
    [discount] [float] NOT NULL,
    [categoryId] [int] references Category(id) NOT NULL
)
GO
CREATE TABLE [dbo].[Account](
    [id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [name] [varchar](50) NOT NULL,
    [address] [varchar](50) NOT NULL,
    [phone] [varchar](12) NOT NULL,
    [email] [varchar](30) NOT NULL,
    --password: default = 1
    [password] [char](64) NOT NULL default('6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B'),
    [enabled] [bit] NOT NULL default(1),
    [role] [varchar](255) NOT NULL
)
GO
CREATE TABLE [dbo].[Customer](
    [id] [int] PRIMARY KEY references [Account](id) NOT NULL,
    [category] varchar(50) NOT NULL CHECK([category] IN ('Gold','Silver','Copper')),
    [shipToAddress] [varchar](50) NOT NULL
)
GO
CREATE TABLE [dbo].[Employee](
    [id] [int] PRIMARY KEY references [Account](id) NOT NULL,
    [salary] [money] NOT NULL,
    [departmentId] [int] NOT NULL
)
GO
CREATE TABLE [dbo].[OrderHeader](
    [id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [date] [datetime] NOT NULL,
    [status] [varchar](30) NULL,
    [customerId] [int] references Customer(id) NOT NULL,
    [employeeId] [int] references Employee(id) NOT NULL
)
GO
CREATE TABLE [dbo].[OrderDetail](
    [id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [orderHeaderId] [int] references OrderHeader(id) NOT NULL,
    [productId] [int] references Product(id) NOT NULL,
    [quantity] [int] NOT NULL,
    [price] [float] NOT NULL,
    [discount] [float] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Freshwater Fish')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Saltwater Fish')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Plants')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (1, N'Freshwater Fish 1', 20.99, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (2, N'Freshwater Fish 2', 30.94, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (3, N'Freshwater Fish 3', 24.11, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (4, N'Saltwater Fish 1', 52.73, 0, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (5, N'Saltwater Fish 2', 70.13, 0.15, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (6, N'Saltwater Fish 3', 60.55, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (7, N'Saltwater Fish 4', 56.01, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (8, N'Plant 1', 10.17, 0.1, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (9, N'Plant 2', 12.03, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (10, N'Plant 3', 18.19, 0.1, 3)
SET IDENTITY_INSERT [dbo].[Product] OFF

SET IDENTITY_INSERT [dbo].[Account] ON 
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role]) VALUES
(1, N'Admin', N'9652 Fish Street', N'0123456789', N'a@fishstore.com', 'ROLE_ADMIN'),
(2, N'Employee1', N'5747 Coral Drive', N'1234567890', N'e1@fishstore.com', 'ROLE_EMPLOYEE'),
(3, N'Employee2', N'3841 Ocean Place', N'2345678901', N'e2@fishstore.com', 'ROLE_EMPLOYEE'),
(4, N'Customer1', N'1873 Seashore Lane', N'5678901234', N'c1@gmail.com','ROLE_CUSTOMER'),
(5, N'Customer2', N'5747 Coral Drive', N'6789872314', N'c2@gmail.com', 'ROLE_CUSTOMER')
SET IDENTITY_INSERT [dbo].[Account] OFF

INSERT [dbo].[Customer] ([id], [category], [shipToAddress]) VALUES (4, 'Copper', N'1873 Seashore Lane')
INSERT [dbo].[Customer] ([id], [category], [shipToAddress]) VALUES (5, 'Copper', N'5747 Coral Drive')

INSERT [dbo].[Employee] ([id], [salary], [departmentId]) VALUES 
(1, 1200, 1),(2, 1000, 2),(3, 800, 2)
GO
SET NOCOUNT OFF
raiserror('The FishStore database is now ready for use.',0,1)
GO
