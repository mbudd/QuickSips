USE master
GO

IF EXISTS(SELECT * FROM sysdatabases
    WHERE name='Cart')
  DROP DATABASE Cart
GO

CREATE DATABASE Cart
ON (NAME=Cart,
    FILENAME = 'Documents\VisualStudio2013\CartUpdate\Cart.mdf',
    SIZE=10 )
GO

USE Cart


CREATE TABLE Categories (
  catid VARCHAR(10)  NOT NULL,
  name  VARCHAR(50)  NOT NULL,
  [desc]  VARCHAR(MAX) NOT NULL,
  PRIMARY KEY(catid), )
  GO


  CREATE TABLE Beer (
    [ProductID] INT           IDENTITY (1, 1) NOT NULL,
    [Type]      NVARCHAR (50) NULL,
    [Brand]     NVARCHAR (50) NULL,
    [Size]      NVARCHAR (50) NULL,
    [Price]     MONEY         NULL,
    [Quantity]  INT           NULL,
    [Picture]   VARCHAR (MAX) NULL,
    PRIMARY KEY(ProductID), )
	GO



  CREATE TABLE Customers (
    [email]     VARCHAR (50) NOT NULL,
    [lastname]  VARCHAR (50) NULL,
    [firstname] VARCHAR (50) NULL,
    [address]   VARCHAR (50) NULL,
    [city]      VARCHAR (50) NULL,
    [state]     VARCHAR (2)  NULL,
    [zipcode]   VARCHAR (9)  NULL,
    [phone]     VARCHAR (20) NULL,
    PRIMARY KEY(email), )
	GO

  
 
  CREATE TABLE Garnishes (
    [ProductID] INT           IDENTITY (1000, 1) NOT NULL,
    [Kind]      NVARCHAR (50) NULL,
    [Type]      NVARCHAR (50) NULL,
    [Size]      NVARCHAR (50) NULL,
    [Price]     MONEY         NULL,
    [Quantity]  INT           NULL,
    [Picture]   VARCHAR (MAX) NULL,
    PRIMARY KEY(ProductID), )
	GO


  CREATE TABLE Liquor (
    [ProductID] INT            IDENTITY (3000, 1) NOT NULL,
    [Type]      NVARCHAR (50)  NULL,
    [Brand]     NVARCHAR (50)  NULL,
    [Size]      NVARCHAR (50)  NULL,
    [Price]     MONEY          NULL,
    [Quantity]  INT            NULL,
    [Product]   NVARCHAR (MAX) NULL,
    [Picture]   VARCHAR (MAX)  NULL,
    PRIMARY KEY  (ProductID) , )
	GO


 CREATE TABLE Mixers (
    [ProductID] INT           IDENTITY (2000, 1) NOT NULL,
    [Type]      NVARCHAR (50) NULL,
    [Brand]     NVARCHAR (50) NULL,
    [Size]      NVARCHAR (50) NULL,
    [Price]     MONEY         NULL,
    [Quantity]  INT           NULL,
    [Picture]   VARCHAR (MAX) NULL,
    PRIMARY KEY  (ProductID) , )
	GO

 CREATE TABLE Packages (
    [ProductID] INT           IDENTITY (4000, 1) NOT NULL,
    [Type]      NVARCHAR (50) NULL,
    [Brand]     NVARCHAR (50) NULL,
    [Size]      NVARCHAR (50) NULL,
    [Price]     MONEY         NULL,
    [Quantity]  INT           NULL,
    [Picture ]  VARCHAR (MAX) NULL,
     PRIMARY KEY  (ProductID) , )
	GO

	CREATE TABLE Supplies (
    [ProductID] INT           IDENTITY (5000, 1) NOT NULL,
    [Type]      NVARCHAR (50) NULL,
    [Brand]     NVARCHAR (50) NULL,
    [Size]      NVARCHAR (50) NULL,
    [Quantity]  INT           NULL,
    [Price]     MONEY         NULL,
    [Picture]   VARCHAR (MAX) NULL,
     PRIMARY KEY  (ProductID) , )
	GO

	CREATE TABLE Wine (
    [ProductID] INT           IDENTITY (6000, 1) NOT NULL,
    [Variety]   NVARCHAR (50) NULL,
    [Type]      NVARCHAR (50) NULL,
    [Brand]     NVARCHAR (50) NULL,
    [Wine]      NVARCHAR (50) NULL,
    [Year]      NVARCHAR (50) NULL,
    [Size]      NVARCHAR (50) NULL,
    [Price]     MONEY         NULL,
    [Quantity]  INT           NULL,
    [Picture]   VARCHAR (MAX) NULL,
     PRIMARY KEY  (ProductID) , )
	GO



	CREATE TABLE Orders (
    [ordernum]  INT           IDENTITY (1, 1) NOT NULL,
    [orderdate] SMALLDATETIME NOT NULL,
    [custemail] VARCHAR (50)  NOT NULL,
    [subtotal]  MONEY         NOT NULL,
    [salestax]  MONEY         NOT NULL,
    [shipping]  MONEY         NOT NULL,
    [total]     AS            (([subtotal]+[salestax])+[shipping]),
    PRIMARY KEY  (ordernum) , )
	GO


  CREATE TABLE OrderItems (
  [ordernum]  INT          NOT NULL,
  [ProductID] VARCHAR (10) NOT NULL,
  [Type]      VARCHAR (50) NULL,
  [price]     MONEY        NULL,
  [quantity]  SMALLINT     NULL,
  total     AS (price * quantity),
  PRIMARY KEY(ordernum, productid), 
  FOREIGN KEY(ordernum) REFERENCES Orders(ordernum),
  FOREIGN KEY(productid) REFERENCES Products(productid) )
  GO
