create database BAZA;

CREATE TABLE [dbo].[Zamowienia]
(
    [Row ID] INT NOT NULL PRIMARY KEY,
    [Order ID] INT NOT NULL,
    [Order Date] DATE NOT NULL,
    [Order Priority] TEXT NOT NULL,
    [Order Quantity] INT NOT NULL,
    [Sales] NUMERIC(7, 2) NOT NULL,
    [Discount] NUMERIC(7, 2) NOT NULL,
    [Ship Mode] TEXT NOT NULL,
    [Profit] NUMERIC(7, 2) NOT NULL,
    [Unit Price] NUMERIC(7, 2) NOT NULL,
    [Shipping Cost] NUMERIC(7, 2) NOT NULL,
    [Customer Name] TEXT NOT NULL,
    [Province] TEXT NOT NULL,
    [Region] TEXT NOT NULL,
    [Customer Segment] TEXT NOT NULL,
    [Product Category] TEXT NOT NULL,
    [Product Sub-Category] TEXT NOT NULL,
    [Product Name] TEXT NOT NULL,
    [Product Container] TEXT NOT NULL,
    [Product Base Margin] NUMERIC(7, 2) NULL,
    [Ship Date] DATE NOT NULL
)

CREATE TABLE [dbo].[Zwroty]
(
    [Order ID] INT NOT NULL PRIMARY KEY,
    [Status] TEXT NOT NULL
)

CREATE TABLE [dbo].[Użytkownicy]
(
    [Id] Int Not null primary key IDENTITY(1,1),
    [Region] TEXT NOT NULL,
    [Manager] TEXT NOT NULL
)

