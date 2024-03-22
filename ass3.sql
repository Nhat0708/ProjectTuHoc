	USE [master]
	GO

	CREATE DATABASE SalesManagement
	GO
	USE SalesManagement

	CREATE TABLE Members(
		[MemberId] [int] IDENTITY(1,1) NOT NULL primary key,
		[Email] [varchar](100) NOT NULL,
		[CompanyName] [varchar](40) NOT NULL,
		[City] [varchar](15) NOT NULL,
		[Country] [varchar](15) NOT NULL,
		[Password] [varchar](100) NOT NULL
	 )
	CREATE TABLE Orders(
		[orderId] [int] IDENTITY(1,1) NOT NULL primary key,
		[MemberId] [int] NOT NULL FOREIGN KEY REFERENCES Members(MemberId),
		[OrderDate] [datetime] NOT NULL,
		[RequiredDate] [datetime],
		[ShippedDate] [datetime],
		[Freight] [money],
	)

	CREATE TABLE Products(
		[ProductId] [int] IDENTITY(1,1) NOT NULL primary key,
		[CategoryId] [int] NOT NULL,
		[ProductName] [varchar](40) NOT NULL,
		[Weight] [varchar](20) NOT NULL,
		[UnitPrice] [money] NOT NULL,
		[UnitsInStock] [int] NOT NULL
	 )
 
	CREATE TABLE OrderDetails(
		[orderId][int] NOT NULL  FOREIGN KEY REFERENCES Orders(orderId),
		[ProductId] [int] NOT NULL FOREIGN KEY REFERENCES Products(ProductId),
		[Quantity] [int] NOT NULL,
		[UnitPrice][money] NOT NULL,
		[Discount] [float] NOT NULL
	)
	insert into Members(Email, CompanyName, City, Country, Password)
	values('nhatvip@gmail.com','Microsoft','SonLa','VietNam','12345678'),
		  ('LinhTinh@langtang.com','Vinaphone','Paris','France','12345678'),
		  ('kekhokhao@ngok.com','Fpt','BangKok','ThaiLand','12345678'),
		  ('giangngu@gmail.com','Apple','HaTinh','VietNam','12345678')

	insert into Products(CategoryId, ProductName, Weight, UnitPrice, UnitsInStock)
	values (1, 'Chivas','500ml',100000,100),
		   (1, 'Volka','500ml',200000,100),
		   (1, 'Whiksy','500ml',300000,100),
		   (2, 'Juice','500ml',100000,50)

	insert into Orders(MemberId, OrderDate)
	values (1,'10/18/2022 9:00'),
		   (2,'12/30/2022 10:00')
	insert into OrderDetails(OrderId, ProductId, Quantity,UnitPrice, Discount)
	values (1,2,5,200000,0),
		   (1,3,1,300000,0),
		   (1,4,2,100000,0),
		   (2,1,2,100000,0)