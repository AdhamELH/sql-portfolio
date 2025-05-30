USE [master]
GO
/****** Object:  Database [RETAIL SALES]    Script Date: 5/9/2025 2:00:52 PM ******/
CREATE DATABASE [RETAIL SALES]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RETAIL SALES', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MASONCLASSES\MSSQL\DATA\RETAIL SALES.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RETAIL SALES_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MASONCLASSES\MSSQL\DATA\RETAIL SALES_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RETAIL SALES] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RETAIL SALES].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RETAIL SALES] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RETAIL SALES] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RETAIL SALES] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RETAIL SALES] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RETAIL SALES] SET ARITHABORT OFF 
GO
ALTER DATABASE [RETAIL SALES] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RETAIL SALES] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RETAIL SALES] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RETAIL SALES] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RETAIL SALES] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RETAIL SALES] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RETAIL SALES] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RETAIL SALES] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RETAIL SALES] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RETAIL SALES] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RETAIL SALES] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RETAIL SALES] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RETAIL SALES] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RETAIL SALES] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RETAIL SALES] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RETAIL SALES] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RETAIL SALES] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RETAIL SALES] SET RECOVERY FULL 
GO
ALTER DATABASE [RETAIL SALES] SET  MULTI_USER 
GO
ALTER DATABASE [RETAIL SALES] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RETAIL SALES] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RETAIL SALES] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RETAIL SALES] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RETAIL SALES] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RETAIL SALES] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RETAIL SALES', N'ON'
GO
ALTER DATABASE [RETAIL SALES] SET QUERY_STORE = OFF
GO
USE [RETAIL SALES]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 5/9/2025 2:00:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[accountNum] [char](10) NOT NULL,
	[fName] [varchar](50) NOT NULL,
	[lName] [varchar](50) NOT NULL,
	[mInitial] [char](1) NULL,
	[streetNum] [varchar](10) NOT NULL,
	[apt/unitNum] [varchar](10) NULL,
	[streetLine1] [varchar](100) NOT NULL,
	[streetLine2] [varchar](100) NULL,
	[city] [varchar](50) NOT NULL,
	[stateCode] [char](2) NOT NULL,
	[zipCode] [char](5) NOT NULL,
	[telNum] [char](10) NOT NULL,
	[email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_ACNTNUM] PRIMARY KEY CLUSTERED 
(
	[accountNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INVOICE]    Script Date: 5/9/2025 2:00:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INVOICE](
	[invoiceNum] [char](10) NOT NULL,
	[PONum] [char](4) NOT NULL,
	[accountNum] [char](10) NOT NULL,
	[dateInvoiced] [date] NOT NULL,
	[actualShip] [date] NOT NULL,
	[actualDel] [date] NULL,
	[taxCharged] [smallmoney] NOT NULL,
	[shippingCostCharged] [smallmoney] NOT NULL,
	[additionalDiscount] [smallmoney] NULL,
	[actualShipCode] [char](3) NOT NULL,
 CONSTRAINT [PK_INVOICENUM] PRIMARY KEY CLUSTERED 
(
	[invoiceNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ITEMS SHIPPED]    Script Date: 5/9/2025 2:00:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEMS SHIPPED](
	[invoiceNum] [char](10) NOT NULL,
	[lineNum] [char](10) NOT NULL,
	[qtyShipped] [tinyint] NOT NULL,
 CONSTRAINT [PK_ITEMS_SHIPPED] PRIMARY KEY CLUSTERED 
(
	[invoiceNum] ASC,
	[lineNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERED PRODUCTS]    Script Date: 5/9/2025 2:00:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERED PRODUCTS](
	[lineNum] [char](10) NOT NULL,
	[productNo] [char](10) NOT NULL,
	[qtyOrdered] [tinyint] NOT NULL,
	[units] [varchar](10) NOT NULL,
	[unitPrice] [smallmoney] NOT NULL,
	[discount] [smallmoney] NULL,
	[PONum] [char](4) NOT NULL,
	[accountNum] [char](10) NOT NULL,
 CONSTRAINT [PK_ORDERED_PRODUCTS] PRIMARY KEY CLUSTERED 
(
	[lineNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 5/9/2025 2:00:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[productNo] [char](10) NOT NULL,
	[pName] [varchar](100) NOT NULL,
	[description] [varchar](200) NOT NULL,
	[detailedDescription] [varchar](1000) NULL,
	[listPrice] [smallmoney] NOT NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[productNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PURCHASE ORDER]    Script Date: 5/9/2025 2:00:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PURCHASE ORDER](
	[PONum] [char](4) NOT NULL,
	[accountNum] [char](10) NOT NULL,
	[datePlaced] [date] NOT NULL,
	[expectedShip] [date] NOT NULL,
	[exptectedDel] [date] NOT NULL,
	[shippingCost] [smallmoney] NOT NULL,
	[taxAmount] [smallmoney] NOT NULL,
	[otherAdjustments] [smallmoney] NULL,
	[shipAddNum] [char](4) NOT NULL,
	[shipCode] [char](3) NOT NULL,
 CONSTRAINT [PK_PONUM] PRIMARY KEY CLUSTERED 
(
	[PONum] ASC,
	[accountNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHIP METHODS]    Script Date: 5/9/2025 2:00:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHIP METHODS](
	[shipCode] [char](3) NOT NULL,
	[courier] [varchar](20) NOT NULL,
	[shipMethod] [varchar](20) NOT NULL,
	[typicalNumDaysDel] [tinyint] NOT NULL,
 CONSTRAINT [PK_SHIPCODE] PRIMARY KEY CLUSTERED 
(
	[shipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHIPMENT]    Script Date: 5/9/2025 2:00:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHIPMENT](
	[trackingCode] [char](18) NOT NULL,
	[invoiceNum] [char](10) NOT NULL,
	[datetimePickedup] [smalldatetime] NULL,
	[datetimeDelivered] [smalldatetime] NULL,
	[weightLBS] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_SHIPMENT] PRIMARY KEY CLUSTERED 
(
	[trackingCode] ASC,
	[invoiceNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHIPTO]    Script Date: 5/9/2025 2:00:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHIPTO](
	[accountNum] [char](10) NOT NULL,
	[shipAddNum] [char](4) NOT NULL,
	[fName] [varchar](50) NOT NULL,
	[lName] [varchar](50) NOT NULL,
	[mInitial] [char](1) NULL,
	[streetNum] [varchar](10) NOT NULL,
	[apt/unitNum] [varchar](10) NULL,
	[streetLine1] [varchar](100) NOT NULL,
	[streetLine2] [varchar](100) NULL,
	[city] [varchar](50) NOT NULL,
	[stateCode] [char](2) NOT NULL,
	[zipCode] [char](5) NOT NULL,
	[telNum] [char](10) NOT NULL,
	[email] [varchar](100) NULL,
 CONSTRAINT [PK_SHIP_ACCNTNUM] PRIMARY KEY CLUSTERED 
(
	[accountNum] ASC,
	[shipAddNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10001     ', N'James', N'Smith', N'A', N'123', N'1A', N'Main St', N' ', N'Richmond', N'VA', N'23220', N'8045551212', N'james.smith@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10002     ', N'Mary', N'Johnson', N'B', N'456', N'2B', N'Oak Ave', N' ', N'Arlington', N'VA', N'22202', N'7035553434', N'mary.johnson@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10003     ', N'Robert', N'Williams', N'C', N'789', N'3C', N'Elm St', N' ', N'Alexandria', N'VA', N'22304', N'7035555656', N'robert.williams@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10004     ', N'Jennifer', N'Brown', N'D', N'1011', N'4D', N'Pine St', N' ', N'Norfolk', N'VA', N'23504', N'7575557878', N'jennifer.brown@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10005     ', N'Michael', N'Jones', N'E', N'1314', N'5E', N'Maple Ave', N' ', N'Chesapeake', N'VA', N'23320', N'7575550101', N'michael.jones@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10006     ', N'Linda', N'Miller', N'F', N'1617', N'6F', N'Cedar Ln', N' ', N'Virginia Beach', N'VA', N'23451', N'7575552323', N'linda.miller@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10007     ', N'David', N'Davis', N'G', N'1920', N'7G', N'Willow Dr', N' ', N'Roanoke', N'VA', N'24012', N'5405554545', N'david.davis@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10008     ', N'Barbara', N'Garcia', N'H', N'2223', N'8H', N'Birch Rd', N' ', N'Newport News', N'VA', N'23601', N'7575556767', N'barbara.garcia@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10009     ', N'William', N'Rodriguez', N'I', N'2526', N'9I', N'Oakwood Ct', N' ', N'Lynchburg', N'VA', N'24502', N'4345558989', N'william.rodriguez@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10010     ', N'Elizabeth', N'Wilson', N'J', N'2829', N'10J', N'Dogwood Pl', N' ', N'Charlottesville', N'VA', N'22901', N'4345551010', N'elizabeth.wilson@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10011     ', N'John', N'Martinez', N'K', N'3132', N'11K', N'Holly Ave', N' ', N'Harrisonburg', N'VA', N'22801', N'5405553232', N'john.martinez@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10012     ', N'Jessica', N'Anderson', N'L', N'3435', N'12L', N'Aspen Dr', N' ', N'Fredericksburg', N'VA', N'22401', N'5405555454', N'jessica.anderson@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10013     ', N'Richard', N'Taylor', N'M', N'3738', N'13M', N'Sycamore Ln', N' ', N'Winchester', N'VA', N'22601', N'5405557676', N'richard.taylor@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10014     ', N'Sarah', N'Thomas', N'N', N'4041', N'14N', N'Redwood Rd', N' ', N'Staunton', N'VA', N'24401', N'5405559898', N'sarah.thomas@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10015     ', N'Charles', N'Moore', N'O', N'4344', N'15O', N'Magnolia Ct', N' ', N'Danville', N'VA', N'24541', N'4345552121', N'charles.moore@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10016     ', N'Joseph', N'Jackson', N'P', N'4647', N'16P', N'Ashwood Pl', N' ', N'Petersburg', N'VA', N'23803', N'8045554343', N'joseph.jackson@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10017     ', N'Patricia', N'Martin', N'Q', N'4950', N'17Q', N'Cedarwood Ave', N' ', N'Hopewell', N'VA', N'23860', N'8045556565', N'patricia.martin@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10018     ', N'Christopher', N'Lee', N'R', N'5253', N'18R', N'Willowbrook Dr', N' ', N'Bristol', N'VA', N'24201', N'2765558787', N'christopher.lee@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10019     ', N'Lisa', N'Perez', N'S', N'5556', N'19S', N'Oakbrook Ln', N' ', N'Radford', N'VA', N'24141', N'5405550909', N'lisa.perez@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10020     ', N'Daniel', N'Thompson', N'T', N'5859', N'20T', N'Pinebrook Rd', N' ', N'Salem', N'VA', N'24153', N'5405553131', N'daniel.thompson@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10021     ', N'Nancy', N'White', N'U', N'6162', N'21U', N'Maplebrook Ct', N' ', N'Blacksburg', N'VA', N'24060', N'5405555353', N'nancy.white@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10022     ', N'Paul', N'Harris', N'V', N'6465', N'22V', N'Dogwoodbrook Pl', N' ', N'Christiansburg', N'VA', N'24073', N'5405557575', N'paul.harris@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10023     ', N'Karen', N'Sanchez', N'W', N'6768', N'23W', N'Hollybrook Ave', N' ', N'Abingdon', N'VA', N'24210', N'2765559797', N'karen.sanchez@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10024     ', N'Mark', N'Clark', N'X', N'7071', N'24X', N'Aspenbrook Dr', N' ', N'Marion', N'VA', N'24354', N'2765551818', N'mark.clark@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10025     ', N'Margaret', N'Lewis', N'Y', N'7374', N'25Y', N'Sycamorebrook Ln', N' ', N'Wytheville', N'VA', N'24382', N'2765554040', N'margaret.lewis@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10026     ', N'Steven', N'Robinson', N'Z', N'7677', N'26Z', N'Redwoodbrook Rd', N' ', N'Pulaski', N'VA', N'24301', N'5405556262', N'steven.robinson@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10027     ', N'Betty', N'Walker', N'A', N'7980', N'27A', N'Magnoliabrook Ct', N' ', N'Galax', N'VA', N'24333', N'2765558484', N'betty.walker@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10028     ', N'Donald', N'Hall', N'B', N'8283', N'28B', N'Ashwoodbrook Pl', N' ', N'Martinsville', N'VA', N'24112', N'2765550606', N'donald.hall@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10029     ', N'Sandra', N'Allen', N'C', N'8586', N'29C', N'Cedarwoodbrook Ave', N' ', N'South Boston', N'VA', N'24592', N'4345552828', N'sandra.allen@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10030     ', N'George', N'Young', N'D', N'8889', N'30D', N'Willowwoodbrook Dr', N' ', N'Lexington', N'VA', N'24450', N'5405555050', N'george.young@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10031     ', N'Kenneth', N'Hernandez', N'E', N'9192', N'31E', N'Oakwoodbrook Ln', N' ', N'Covington', N'VA', N'24426', N'5405557272', N'kenneth.hernandez@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10032     ', N'Maria', N'King', N'F', N'9495', N'32F', N'Pinewoodbrook Rd', N' ', N'Buena Vista', N'VA', N'24416', N'5405559494', N'maria.king@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10033     ', N'Timothy', N'Wright', N'G', N'9798', N'33G', N'Maplewoodbrook Ct', N' ', N'Waynesboro', N'VA', N'22980', N'5405551616', N'timothy.wright@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10034     ', N'Donna', N'Green', N'H', N'10101', N'34H', N'Dogwoodwoodbrook Pl', N' ', N'Front Royal', N'VA', N'22630', N'5405553838', N'donna.green@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10035     ', N'Edward', N'Adams', N'I', N'10404', N'35I', N'Hollywoodbrook Ave', N' ', N'Falls Church', N'VA', N'22041', N'7035556060', N'edward.adams@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10036     ', N'Carol', N'Baker', N'J', N'10707', N'36J', N'Aspenwoodbrook Dr', N' ', N'Manassas', N'VA', N'20109', N'7035558282', N'carol.baker@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10037     ', N'Jason', N'Nelson', N'K', N'11010', N'37K', N'Sycamorewoodbrook Ln', N' ', N'Woodbridge', N'VA', N'22191', N'7035550404', N'jason.nelson@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10038     ', N'Michelle', N'Carter', N'L', N'11313', N'38L', N'Redwoodwoodbrook Rd', N' ', N'Fredericksburg', N'VA', N'22405', N'5405552626', N'michelle.carter@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10039     ', N'Anthony', N'Mitchell', N'M', N'11616', N'39M', N'Magnoliawoodbrook Ct', N' ', N'Culpeper', N'VA', N'22701', N'5405554848', N'anthony.mitchell@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10040     ', N'Laura', N'Perez', N'N', N'11919', N'40N', N'Ashwoodwoodbrook Pl', N' ', N'Warrenton', N'VA', N'20186', N'5405557070', N'laura.perez@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10041     ', N'Andrew', N'Roberts', N'O', N'12222', N'41O', N'Cedarwoodwoodbrook Ave', N' ', N'Leesburg', N'VA', N'20175', N'7035559292', N'andrew.roberts@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10042     ', N'Kimberly', N'Turner', N'P', N'12525', N'42P', N'Willowwoodwoodbrook Dr', N' ', N'Purcellville', N'VA', N'20132', N'5405551414', N'kimberly.turner@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10043     ', N'Brian', N'Phillips', N'Q', N'12828', N'43Q', N'Oakwoodwoodbrook Ln', N' ', N'Berryville', N'VA', N'22611', N'5405553636', N'brian.phillips@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10044     ', N'Dorothy', N'Campbell', N'R', N'13131', N'44R', N'Pinewoodwoodbrook Rd', N' ', N'Luray', N'VA', N'22835', N'5405555858', N'dorothy.campbell@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10045     ', N'Kevin', N'Parker', N'S', N'13434', N'45S', N'Maplewoodwoodbrook Ct', N' ', N'Stanley', N'VA', N'22851', N'5405558080', N'kevin.parker@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10046     ', N'Deborah', N'Evans', N'T', N'13737', N'46T', N'Maple Ave', N' ', N'Orange', N'VA', N'22960', N'5405550202', N'deborah.evans@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10047     ', N'Ronald', N'Edwards', N'U', N'14040', N'47U', N'Oakwood Ct.', N' ', N'Tappahannock', N'VA', N'22560', N'8045552424', N'ronald.edwards@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10048     ', N'Debra', N'Collins', N'V', N'14343', N'48V', N'Willow Ln', N' ', N'Kilmarnock', N'VA', N'22482', N'8045554646', N'debra.collins@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10049     ', N'Jeffrey', N'Stewart', N'W', N'14646', N'49W', N'Sycamore St.', N' ', N'West Point', N'VA', N'23181', N'8045556868', N'jeffrey.stewart@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10050     ', N'Martha', N'Stewart', N'W', N'14646', N'49W', N'Sycamore St.', N' ', N'West Point', N'VA', N'23181', N'8045556868', N'jeffrey.stewart@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10051     ', N'Anthony', N'Mitchell', N'M', N'11616', N'39M', N'Magnoliawoodbrook Ct', N' ', N'Culpeper', N'VA', N'22701', N'5405554848', N'anthony.mitchell@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10052     ', N'Laura', N'Perez', N'N', N'11919', N'40N', N'Ashwoodwoodbrook Pl', N' ', N'Warrenton', N'VA', N'20186', N'5405557070', N'laura.perez@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10053     ', N'Andrew', N'Roberts', N'O', N'12222', N'41O', N'Cedarwoodwoodbrook Ave', N' ', N'Leesburg', N'VA', N'20175', N'7035559292', N'andrew.roberts@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10054     ', N'Kimberly', N'Turner', N'P', N'12525', N'42P', N'Willowwoodwoodbrook Dr', N' ', N'Purcellville', N'VA', N'20132', N'5405551414', N'kimberly.turner@example.com
')
INSERT [dbo].[CUSTOMER] ([accountNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10055     ', N'Brian', N'Phillips', N'Q', N'12828', N'43Q', N'Oakwoodwoodbrook Ln', N' ', N'Berryville', N'VA', N'22611', N'5405553636', N'brian.phillips@example.com
')
GO
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000001   ', N'1050', N'10008     ', CAST(N'2025-01-10' AS Date), CAST(N'2025-01-17' AS Date), CAST(N'2025-01-21' AS Date), 2.4800, 8.3300, 6.5200, N'EXP')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000002   ', N'1009', N'10005     ', CAST(N'2025-01-15' AS Date), CAST(N'2025-01-25' AS Date), CAST(N'2025-01-30' AS Date), 3.8100, 10.9100, 1.1400, N'NDA')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000003   ', N'1008', N'10005     ', CAST(N'2025-01-14' AS Date), CAST(N'2025-01-24' AS Date), CAST(N'2025-01-25' AS Date), 2.0700, 11.6800, 8.6300, N'INT')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000004   ', N'1016', N'10023     ', CAST(N'2024-12-24' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-01-05' AS Date), 4.1400, 14.4200, 0.5800, N'LTL')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000005   ', N'1030', N'10020     ', CAST(N'2025-01-12' AS Date), CAST(N'2025-01-20' AS Date), CAST(N'2025-02-01' AS Date), 4.3000, 10.0300, 1.1500, N'PRI')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000006   ', N'1003', N'10023     ', CAST(N'2025-01-03' AS Date), CAST(N'2025-01-06' AS Date), CAST(N'2025-01-14' AS Date), 3.6400, 11.9200, 7.3000, N'LTL')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000007   ', N'1023', N'10013     ', CAST(N'2025-01-06' AS Date), CAST(N'2025-01-12' AS Date), CAST(N'2025-01-21' AS Date), 2.2900, 8.5500, 9.2900, N'PRI')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000008   ', N'1027', N'10006     ', CAST(N'2025-01-06' AS Date), CAST(N'2025-01-14' AS Date), CAST(N'2025-01-15' AS Date), 4.8100, 12.9700, 7.6300, N'PRI')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000009   ', N'1049', N'10008     ', CAST(N'2025-01-04' AS Date), CAST(N'2025-01-09' AS Date), CAST(N'2025-01-11' AS Date), 4.6100, 12.6700, 7.8900, N'2DA')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000010   ', N'1038', N'10018     ', CAST(N'2025-01-07' AS Date), CAST(N'2025-01-11' AS Date), CAST(N'2025-01-12' AS Date), 3.2600, 13.4600, 5.3500, N'PRI')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000011   ', N'1024', N'10013     ', CAST(N'2025-01-21' AS Date), CAST(N'2025-01-28' AS Date), CAST(N'2025-02-03' AS Date), 1.8600, 11.8000, 9.4800, N'INT')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000012   ', N'1033', N'10020     ', CAST(N'2024-12-29' AS Date), CAST(N'2025-01-02' AS Date), CAST(N'2025-01-11' AS Date), 2.0600, 9.5700, 9.0800, N'LTL')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000013   ', N'1007', N'10020     ', CAST(N'2024-12-24' AS Date), CAST(N'2025-01-02' AS Date), CAST(N'2025-01-08' AS Date), 1.2100, 5.3700, 5.1200, N'INT')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000014   ', N'1007', N'10020     ', CAST(N'2024-12-28' AS Date), CAST(N'2025-01-05' AS Date), CAST(N'2025-01-06' AS Date), 1.4600, 10.3000, 5.6800, N'STD')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000015   ', N'1020', N'10025     ', CAST(N'2025-01-16' AS Date), CAST(N'2025-01-25' AS Date), CAST(N'2025-02-02' AS Date), 3.8100, 10.1400, 2.0900, N'FCP')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000016   ', N'1043', N'10013     ', CAST(N'2025-01-13' AS Date), CAST(N'2025-01-20' AS Date), CAST(N'2025-01-23' AS Date), 2.2800, 13.5300, 6.9900, N'NDA')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000017   ', N'1019', N'10025     ', CAST(N'2025-01-03' AS Date), CAST(N'2025-01-07' AS Date), CAST(N'2025-01-14' AS Date), 2.1100, 12.4400, 3.9600, N'STD')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000018   ', N'1020', N'10025     ', CAST(N'2025-01-20' AS Date), CAST(N'2025-01-24' AS Date), CAST(N'2025-02-03' AS Date), 2.8900, 14.8900, 5.8400, N'MFR')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000019   ', N'1010', N'10005     ', CAST(N'2025-01-16' AS Date), CAST(N'2025-01-26' AS Date), CAST(N'2025-01-25' AS Date), 2.1400, 14.9300, 1.8300, N'STD')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000020   ', N'1045', N'10010     ', CAST(N'2025-01-21' AS Date), CAST(N'2025-01-29' AS Date), CAST(N'2025-02-02' AS Date), 4.9300, 12.6300, 7.2400, N'NDA')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000021   ', N'1025', N'10019     ', CAST(N'2025-01-03' AS Date), CAST(N'2025-01-11' AS Date), CAST(N'2025-01-18' AS Date), 3.0700, 13.0800, 9.8300, N'LTL')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000022   ', N'1040', N'10010     ', CAST(N'2025-01-12' AS Date), CAST(N'2025-01-19' AS Date), CAST(N'2025-01-28' AS Date), 4.6000, 11.1400, 4.9300, N'XRI')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000023   ', N'1036', N'10018     ', CAST(N'2025-01-10' AS Date), CAST(N'2025-01-19' AS Date), CAST(N'2025-01-21' AS Date), 4.4000, 11.2200, 4.2200, N'EXP')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000024   ', N'1027', N'10006     ', CAST(N'2025-01-05' AS Date), CAST(N'2025-01-18' AS Date), CAST(N'2025-01-15' AS Date), 4.0700, 10.0100, 1.1500, N'NDA')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000025   ', N'1021', N'10025     ', CAST(N'2024-12-29' AS Date), CAST(N'2024-12-31' AS Date), CAST(N'2025-01-05' AS Date), 2.4900, 5.0500, 6.0400, N'GRD')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000026   ', N'1046', N'10010     ', CAST(N'2025-01-14' AS Date), CAST(N'2025-01-19' AS Date), CAST(N'2025-01-22' AS Date), 4.1100, 14.6000, 7.5100, N'NDA')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000027   ', N'1001', N'10007     ', CAST(N'2025-01-06' AS Date), CAST(N'2025-01-08' AS Date), CAST(N'2025-01-11' AS Date), 3.3500, 14.6000, 3.1100, N'FCP')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000028   ', N'1017', N'10023     ', CAST(N'2025-01-05' AS Date), CAST(N'2025-01-07' AS Date), CAST(N'2025-01-17' AS Date), 1.3300, 6.3000, 5.0800, N'2DA')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000029   ', N'1043', N'10013     ', CAST(N'2025-01-11' AS Date), CAST(N'2025-01-18' AS Date), CAST(N'2025-01-23' AS Date), 1.5700, 7.9900, 0.8000, N'GRD')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000030   ', N'1020', N'10025     ', CAST(N'2025-01-16' AS Date), CAST(N'2025-01-28' AS Date), CAST(N'2025-02-02' AS Date), 4.2300, 6.3100, 7.4800, N'INT')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000031   ', N'1019', N'10025     ', CAST(N'2024-12-30' AS Date), CAST(N'2025-01-11' AS Date), CAST(N'2025-01-13' AS Date), 1.9400, 13.0000, 1.5300, N'GRD')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000032   ', N'1034', N'10020     ', CAST(N'2024-12-22' AS Date), CAST(N'2025-01-04' AS Date), CAST(N'2025-01-02' AS Date), 1.6200, 9.3400, 0.8500, N'STD')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000033   ', N'1021', N'10025     ', CAST(N'2024-12-23' AS Date), CAST(N'2025-01-03' AS Date), CAST(N'2025-01-07' AS Date), 1.5600, 6.6200, 3.0100, N'EXP')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000034   ', N'1006', N'10003     ', CAST(N'2025-01-22' AS Date), CAST(N'2025-01-26' AS Date), CAST(N'2025-01-30' AS Date), 1.5200, 14.8700, 4.6300, N'MFR')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000035   ', N'1029', N'10017     ', CAST(N'2024-12-30' AS Date), CAST(N'2025-01-03' AS Date), CAST(N'2025-01-11' AS Date), 1.8300, 13.9900, 9.3300, N'2DA')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000036   ', N'1026', N'10019     ', CAST(N'2025-01-07' AS Date), CAST(N'2025-01-09' AS Date), CAST(N'2025-01-13' AS Date), 3.1100, 8.8100, 6.4300, N'PRI')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000037   ', N'1012', N'10001     ', CAST(N'2025-01-01' AS Date), CAST(N'2025-01-11' AS Date), CAST(N'2025-01-21' AS Date), 3.5700, 6.3300, 9.8500, N'EXP')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000038   ', N'1001', N'10007     ', CAST(N'2025-01-05' AS Date), CAST(N'2025-01-10' AS Date), CAST(N'2025-01-10' AS Date), 4.1400, 6.6300, 5.7000, N'2DA')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000039   ', N'1050', N'10008     ', CAST(N'2025-01-09' AS Date), CAST(N'2025-01-16' AS Date), CAST(N'2025-01-20' AS Date), 4.7000, 14.1300, 0.8500, N'NDA')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'2000040   ', N'1349', N'10008     ', CAST(N'2024-12-28' AS Date), CAST(N'2025-01-07' AS Date), CAST(N'2025-01-09' AS Date), 4.1600, 5.5600, 9.7700, N'FCP')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'3000019   ', N'1310', N'10005     ', CAST(N'2025-01-16' AS Date), CAST(N'2025-01-26' AS Date), CAST(N'2025-01-25' AS Date), 2.1400, 14.9300, 1.8300, N'STD')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'3000020   ', N'1345', N'10010     ', CAST(N'2025-01-21' AS Date), CAST(N'2025-01-29' AS Date), CAST(N'2025-02-02' AS Date), 4.9300, 12.6300, 7.2400, N'ADA')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'3000021   ', N'1025', N'15019     ', CAST(N'2025-01-03' AS Date), CAST(N'2025-01-11' AS Date), CAST(N'2025-01-18' AS Date), 3.0700, 13.0800, 9.8300, N'LTL')
INSERT [dbo].[INVOICE] ([invoiceNum], [PONum], [accountNum], [dateInvoiced], [actualShip], [actualDel], [taxCharged], [shippingCostCharged], [additionalDiscount], [actualShipCode]) VALUES (N'3000022   ', N'1040', N'15010     ', CAST(N'2025-01-12' AS Date), CAST(N'2025-01-19' AS Date), CAST(N'2025-01-28' AS Date), 4.6000, 11.1400, 4.9300, N'PRI')
GO
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000001   ', N'1000087   ', 4)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000001   ', N'1000097   ', 10)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000002   ', N'1000092   ', 4)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000003   ', N'1000030   ', 4)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000003   ', N'1000069   ', 1)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000004   ', N'1000042   ', 6)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000004   ', N'1000068   ', 3)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000005   ', N'1000023   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000005   ', N'1000094   ', 2)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000006   ', N'1000013   ', 8)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000006   ', N'1000036   ', 2)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000006   ', N'1000039   ', 8)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000008   ', N'1000014   ', 9)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000009   ', N'1000098   ', 1)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000010   ', N'1000043   ', 2)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000010   ', N'1000053   ', 6)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000010   ', N'1000056   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000012   ', N'1000002   ', 9)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000012   ', N'1000020   ', 3)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000012   ', N'1000047   ', 6)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000012   ', N'1000051   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000013   ', N'1000003   ', 4)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000013   ', N'1000004   ', 10)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000013   ', N'1000035   ', 5)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000013   ', N'1000058   ', 2)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000013   ', N'1000062   ', 9)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000013   ', N'1000066   ', 5)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000013   ', N'1000079   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000013   ', N'1000093   ', 1)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000014   ', N'1000003   ', 4)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000014   ', N'1000004   ', 10)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000014   ', N'1000035   ', 5)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000014   ', N'1000058   ', 2)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000014   ', N'1000062   ', 9)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000014   ', N'1000066   ', 5)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000014   ', N'1000079   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000014   ', N'1000093   ', 1)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000015   ', N'1000028   ', 3)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000015   ', N'1000044   ', 1)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000016   ', N'1000096   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000017   ', N'1000059   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000017   ', N'1000071   ', 9)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000018   ', N'1000028   ', 3)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000018   ', N'1000044   ', 1)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000019   ', N'1000061   ', 3)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000020   ', N'1000005   ', 10)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000020   ', N'1000038   ', 9)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000020   ', N'1000082   ', 3)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000020   ', N'1000085   ', 1)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000021   ', N'1000046   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000021   ', N'1000055   ', 3)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000022   ', N'1000065   ', 1)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000023   ', N'1000007   ', 1)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000023   ', N'1000041   ', 4)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000023   ', N'1000083   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000024   ', N'1000014   ', 9)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000025   ', N'1000010   ', 6)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000025   ', N'1000018   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000027   ', N'1000027   ', 9)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000027   ', N'1000057   ', 5)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000028   ', N'1000052   ', 10)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000028   ', N'1000089   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000029   ', N'1000096   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000030   ', N'1000028   ', 3)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000030   ', N'1000044   ', 1)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000031   ', N'1000059   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000031   ', N'1000071   ', 9)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000033   ', N'1000010   ', 6)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000033   ', N'1000018   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000034   ', N'1000016   ', 10)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000035   ', N'1000084   ', 10)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000036   ', N'1000067   ', 6)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000037   ', N'1000001   ', 3)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000037   ', N'1000019   ', 9)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000037   ', N'1000075   ', 3)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000038   ', N'1000027   ', 9)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000038   ', N'1000057   ', 5)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000039   ', N'1000087   ', 4)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000039   ', N'1000097   ', 10)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'2000040   ', N'1000098   ', 1)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'5000018   ', N'1000028   ', 3)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'5000018   ', N'1000044   ', 1)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'6000030   ', N'1300028   ', 3)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'6000030   ', N'1300044   ', 1)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'7000016   ', N'1400096   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'8000029   ', N'1500096   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'9000017   ', N'1600059   ', 7)
INSERT [dbo].[ITEMS SHIPPED] ([invoiceNum], [lineNum], [qtyShipped]) VALUES (N'9000017   ', N'1600071   ', 9)
GO
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000000   ', N'100041    ', 5, N'pieces', 21.5500, 0.1800, N'1004', N'10023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000001   ', N'100001    ', 3, N'liters', 52.4000, 0.1200, N'1012', N'10001     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000002   ', N'100029    ', 9, N'kg', 80.5700, 0.0700, N'1033', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000003   ', N'100020    ', 4, N'pieces', 29.5900, 0.1600, N'1007', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000004   ', N'100021    ', 10, N'kg', 63.5700, 0.1800, N'1007', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000005   ', N'100049    ', 10, N'units', 26.1900, 0.1700, N'1045', N'10010     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000006   ', N'100005    ', 8, N'kg', 5.4300, 0.1300, N'1039', N'10010     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000007   ', N'100041    ', 1, N'kg', 5.3300, 0.1900, N'1036', N'10018     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000008   ', N'100024    ', 9, N'pieces', 41.3100, 0.1100, N'1035', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000009   ', N'100024    ', 6, N'kg', 95.7400, 0.1500, N'1039', N'10010     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000010   ', N'100041    ', 6, N'units', 83.9000, 0.1000, N'1021', N'10025     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000011   ', N'100011    ', 2, N'liters', 95.8200, 0.0700, N'1035', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000012   ', N'100021    ', 1, N'pieces', 24.4600, 0.0700, N'1028', N'10017     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000013   ', N'100048    ', 8, N'units', 7.0700, 0.1000, N'1003', N'10023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000014   ', N'100049    ', 9, N'units', 89.0800, 0.0100, N'1027', N'10006     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000015   ', N'100036    ', 9, N'liters', 71.6400, 0.1800, N'1011', N'10001     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000016   ', N'100046    ', 10, N'pieces', 27.0100, 0.0300, N'1006', N'10003     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000017   ', N'100012    ', 10, N'pieces', 99.1400, 0.0100, N'1014', N'10008     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000018   ', N'100048    ', 7, N'pieces', 85.1100, 0.1400, N'1021', N'10025     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000019   ', N'100037    ', 9, N'pieces', 4.5500, 0.0700, N'1012', N'10001     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000020   ', N'100036    ', 3, N'kg', 45.3700, 0.1600, N'1033', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000021   ', N'100032    ', 1, N'pieces', 14.7700, 0.0600, N'1004', N'10023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000022   ', N'100047    ', 2, N'liters', 2.8700, 0.0300, N'1041', N'10022     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000023   ', N'100001    ', 7, N'kg', 62.6200, 0.0700, N'1030', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000024   ', N'100030    ', 7, N'units', 65.0600, 0.0100, N'1004', N'10023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000025   ', N'100026    ', 1, N'units', 35.3000, 0.1000, N'1048', N'10009     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000026   ', N'100021    ', 3, N'kg', 85.3300, 0.1500, N'1032', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000027   ', N'100018    ', 9, N'pieces', 11.7800, 0.1800, N'1001', N'10007     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000028   ', N'100008    ', 3, N'units', 26.0000, 0.1400, N'1020', N'10025     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000029   ', N'100049    ', 6, N'kg', 44.1600, 0.1700, N'1035', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000030   ', N'100028    ', 4, N'pieces', 78.6300, 0.1700, N'1008', N'10005     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000031   ', N'100001    ', 4, N'kg', 93.7600, 0.1400, N'1013', N'10008     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000032   ', N'100006    ', 4, N'pieces', 49.6300, 0.1600, N'1014', N'10008     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000033   ', N'100041    ', 1, N'liters', 49.4400, 0.0100, N'1031', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000034   ', N'100027    ', 3, N'units', 53.0400, 0.1900, N'1011', N'10001     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000035   ', N'100005    ', 5, N'units', 48.4700, 0.1900, N'1007', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000036   ', N'100040    ', 2, N'units', 45.4000, 0.1800, N'1003', N'10023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000037   ', N'100050    ', 10, N'units', 66.5300, 0.0100, N'1042', N'10013     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000038   ', N'100025    ', 9, N'pieces', 52.2300, 0.0100, N'1045', N'10010     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000039   ', N'100005    ', 8, N'kg', 83.3200, 0.0000, N'1003', N'10023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000040   ', N'100042    ', 6, N'units', 32.4000, 0.1400, N'1035', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000041   ', N'100032    ', 4, N'liters', 91.0500, 0.1600, N'1036', N'10018     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000042   ', N'100003    ', 6, N'units', 29.8100, 0.0300, N'1016', N'10023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000043   ', N'100044    ', 2, N'kg', 4.8600, 0.0700, N'1038', N'10018     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000044   ', N'100019    ', 1, N'pieces', 93.0700, 0.0400, N'1020', N'10025     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000045   ', N'100026    ', 10, N'kg', 47.3000, 0.0100, N'1028', N'10017     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000046   ', N'100018    ', 7, N'pieces', 53.1900, 0.0900, N'1025', N'10019     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000047   ', N'100001    ', 6, N'pieces', 47.1200, 0.1300, N'1033', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000048   ', N'100015    ', 10, N'kg', 34.2200, 0.1500, N'1035', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000049   ', N'100009    ', 1, N'kg', 67.6500, 0.0700, N'1022', N'10001     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000050   ', N'100031    ', 2, N'kg', 91.3200, 0.0400, N'1047', N'10009     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000051   ', N'100009    ', 7, N'pieces', 47.1700, 0.0800, N'1033', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000052   ', N'100017    ', 10, N'kg', 67.1100, 0.0200, N'1017', N'10023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000053   ', N'100017    ', 6, N'units', 8.4000, 0.0600, N'1038', N'10018     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000054   ', N'100028    ', 8, N'kg', 71.3300, 0.0500, N'1011', N'10001     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000055   ', N'100007    ', 3, N'kg', 29.8500, 0.1600, N'1025', N'10019     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000056   ', N'100002    ', 7, N'units', 91.0400, 0.1300, N'1038', N'10018     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000057   ', N'100049    ', 5, N'kg', 65.9900, 0.1100, N'1001', N'10007     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000058   ', N'100047    ', 2, N'units', 48.8600, 0.0400, N'1007', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000059   ', N'100015    ', 7, N'units', 65.8300, 0.0000, N'1019', N'10025     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000060   ', N'100017    ', 9, N'kg', 59.5700, 0.0900, N'1044', N'10013     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000061   ', N'100013    ', 3, N'units', 14.5700, 0.1600, N'1010', N'10005     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000062   ', N'100041    ', 9, N'units', 73.3400, 0.1300, N'1007', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000063   ', N'100002    ', 5, N'pieces', 20.0000, 0.1100, N'1011', N'10001     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000064   ', N'100014    ', 5, N'kg', 10.7200, 0.0100, N'1028', N'10017     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000065   ', N'100042    ', 1, N'units', 59.1300, 0.1300, N'1040', N'10010     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000066   ', N'100011    ', 5, N'kg', 66.0200, 0.1000, N'1007', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000067   ', N'100034    ', 6, N'pieces', 10.2200, 0.1300, N'1026', N'10019     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000068   ', N'100016    ', 3, N'kg', 7.9600, 0.1400, N'1016', N'10023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000069   ', N'100033    ', 1, N'units', 40.5900, 0.0500, N'1008', N'10005     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000070   ', N'100002    ', 10, N'liters', 61.4400, 0.1000, N'1044', N'10013     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000071   ', N'100045    ', 9, N'units', 62.1600, 0.1100, N'1019', N'10025     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000072   ', N'100038    ', 2, N'liters', 51.1100, 0.2000, N'1031', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000073   ', N'100010    ', 3, N'pieces', 97.1700, 0.0300, N'1028', N'10017     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000074   ', N'100026    ', 10, N'kg', 42.7800, 0.1500, N'1005', N'10023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000075   ', N'100029    ', 3, N'liters', 62.4200, 0.1900, N'1012', N'10001     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000076   ', N'100028    ', 5, N'kg', 67.9300, 0.0900, N'1002', N'10007     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000077   ', N'100007    ', 10, N'pieces', 10.9000, 0.0700, N'1018', N'10023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000078   ', N'100027    ', 8, N'liters', 68.1600, 0.1900, N'1014', N'10008     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000079   ', N'100022    ', 7, N'liters', 18.1300, 0.0500, N'1007', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000080   ', N'100013    ', 5, N'kg', 39.0700, 0.0800, N'1044', N'10013     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000081   ', N'100042    ', 8, N'units', 56.6400, 0.0100, N'1037', N'10018     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000082   ', N'100017    ', 3, N'pieces', 50.4300, 0.0100, N'1045', N'10010     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000083   ', N'100019    ', 7, N'units', 35.3300, 0.1900, N'1036', N'10018     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000084   ', N'100046    ', 10, N'liters', 13.0300, 0.1500, N'1029', N'10017     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000085   ', N'100013    ', 1, N'units', 98.8100, 0.1200, N'1045', N'10010     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000086   ', N'100034    ', 10, N'pieces', 45.4800, 0.1700, N'1028', N'10017     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000087   ', N'100044    ', 4, N'kg', 6.4100, 0.1200, N'1050', N'10008     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000088   ', N'100008    ', 5, N'liters', 34.9700, 0.1300, N'1015', N'10008     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000089   ', N'100036    ', 7, N'pieces', 54.2900, 0.1800, N'1017', N'10023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000090   ', N'100048    ', 8, N'liters', 13.3500, 0.0700, N'1004', N'10023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000091   ', N'100031    ', 6, N'units', 90.1300, 0.0600, N'1037', N'10018     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000092   ', N'100023    ', 4, N'pieces', 89.0200, 0.1000, N'1009', N'10005     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000093   ', N'100045    ', 1, N'pieces', 57.2500, 0.1000, N'1007', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000094   ', N'100050    ', 2, N'units', 83.0900, 0.0300, N'1030', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000095   ', N'100036    ', 6, N'kg', 23.2000, 0.1700, N'1037', N'10018     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000096   ', N'100021    ', 7, N'kg', 97.3500, 0.0600, N'1043', N'10013     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000097   ', N'100014    ', 10, N'units', 58.1100, 0.1700, N'1050', N'10008     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000098   ', N'100038    ', 1, N'liters', 80.8300, 0.1000, N'1049', N'10008     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'1000099   ', N'100033    ', 1, N'pieces', 95.1700, 0.0100, N'1015', N'10008     ')
GO
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'2000066   ', N'100011    ', 5, N'kg', 66.0200, 0.1000, N'2007', N'10020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'2000067   ', N'200034    ', 6, N'pieces', 10.2200, 0.1300, N'2026', N'10019     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'2000068   ', N'200016    ', 3, N'kg', 7.9600, 0.1400, N'2016', N'10023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'2000069   ', N'200033    ', 1, N'units', 40.5900, 0.0500, N'2008', N'10005     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'2000070   ', N'200002    ', 10, N'liters', 61.4400, 0.1000, N'2044', N'10013     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'2000071   ', N'200045    ', 9, N'units', 62.1600, 0.1100, N'2019', N'10025     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'2000072   ', N'200038    ', 2, N'liters', 51.1100, 0.2000, N'2031', N'60020     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'2000073   ', N'200010    ', 3, N'pieces', 97.1700, 0.0300, N'2028', N'60017     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'2000074   ', N'200026    ', 10, N'kg', 42.7800, 0.1500, N'2005', N'60023     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'2000075   ', N'200029    ', 3, N'liters', 62.4200, 0.1900, N'2012', N'10001     ')
INSERT [dbo].[ORDERED PRODUCTS] ([lineNum], [productNo], [qtyOrdered], [units], [unitPrice], [discount], [PONum], [accountNum]) VALUES (N'3000076   ', N'200028    ', 5, N'kg', 67.9300, 0.0900, N'2002', N'10007     ')
GO
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100001    ', N'Product 1', N'Short description for product 1', N'Detailed description for product 1', 24.4600)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100002    ', N'Product 2', N'Short description for product 2', N'Detailed description for product 2', 651.3200)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100003    ', N'Product 3', N'Short description for product 3', N'Detailed description for product 3', 678.3100)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100004    ', N'Product 4', N'Short description for product 4', N'Detailed description for product 4', 315.9800)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100005    ', N'Product 5', N'Short description for product 5', N'Detailed description for product 5', 934.5100)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100006    ', N'Product 6', N'Short description for product 6', N'Detailed description for product 6', 64.5300)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100007    ', N'Product 7', N'Short description for product 7', N'Detailed description for product 7', 207.8600)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100008    ', N'Product 8', N'Short description for product 8', N'Detailed description for product 8', 994.0100)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100009    ', N'Product 9', N'Short description for product 9', N'Detailed description for product 9', 597.6000)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100010    ', N'Product 10', N'Short description for product 10', N'Detailed description for product 10', 398.9300)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100011    ', N'Product 11', N'Short description for product 11', N'Detailed description for product 11', 418.8700)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100012    ', N'Product 12', N'Short description for product 12', N'Detailed description for product 12', 998.8200)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100013    ', N'Product 13', N'Short description for product 13', N'Detailed description for product 13', 738.7500)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100014    ', N'Product 14', N'Short description for product 14', N'Detailed description for product 14', 43.1400)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100015    ', N'Product 15', N'Short description for product 15', N'Detailed description for product 15', 75.9200)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100016    ', N'Product 16', N'Short description for product 16', N'Detailed description for product 16', 786.9200)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100017    ', N'Product 17', N'Short description for product 17', N'Detailed description for product 17', 613.7800)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100018    ', N'Product 18', N'Short description for product 18', N'Detailed description for product 18', 21.6000)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100019    ', N'Product 19', N'Short description for product 19', N'Detailed description for product 19', 152.2600)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100020    ', N'Product 20', N'Short description for product 20', N'Detailed description for product 20', 749.0700)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100021    ', N'Product 21', N'Short description for product 21', N'Detailed description for product 21', 906.1800)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100022    ', N'Product 22', N'Short description for product 22', N'Detailed description for product 22', 869.8200)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100023    ', N'Product 23', N'Short description for product 23', N'Detailed description for product 23', 637.2900)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100024    ', N'Product 24', N'Short description for product 24', N'Detailed description for product 24', 246.0400)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100025    ', N'Product 25', N'Short description for product 25', N'Detailed description for product 25', 380.5100)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100026    ', N'Product 26', N'Short description for product 26', N'Detailed description for product 26', 592.6200)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100027    ', N'Product 27', N'Short description for product 27', N'Detailed description for product 27', 704.9500)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100028    ', N'Product 28', N'Short description for product 28', N'Detailed description for product 28', 650.9600)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100029    ', N'Product 29', N'Short description for product 29', N'Detailed description for product 29', 732.3800)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100030    ', N'Product 30', N'Short description for product 30', N'Detailed description for product 30', 737.6300)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100031    ', N'Product 31', N'Short description for product 31', N'Detailed description for product 31', 420.3300)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100032    ', N'Product 32', N'Short description for product 32', N'Detailed description for product 32', 768.4900)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100033    ', N'Product 33', N'Short description for product 33', N'Detailed description for product 33', 142.1400)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100034    ', N'Product 34', N'Short description for product 34', N'Detailed description for product 34', 752.3300)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100035    ', N'Product 35', N'Short description for product 35', N'Detailed description for product 35', 359.0500)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100036    ', N'Product 36', N'Short description for product 36', N'Detailed description for product 36', 364.7600)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100037    ', N'Product 37', N'Short description for product 37', N'Detailed description for product 37', 306.5900)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100038    ', N'Product 38', N'Short description for product 38', N'Detailed description for product 38', 693.2000)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100039    ', N'Product 39', N'Short description for product 39', N'Detailed description for product 39', 843.1300)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100040    ', N'Product 40', N'Short description for product 40', N'Detailed description for product 40', 203.1300)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100041    ', N'Product 41', N'Short description for product 41', N'Detailed description for product 41', 260.7100)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100042    ', N'Product 42', N'Short description for product 42', N'Detailed description for product 42', 556.8200)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100043    ', N'Product 43', N'Short description for product 43', N'Detailed description for product 43', 156.1200)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100044    ', N'Product 44', N'Short description for product 44', N'Detailed description for product 44', 540.6400)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100045    ', N'Product 45', N'Short description for product 45', N'Detailed description for product 45', 133.4700)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100046    ', N'Product 46', N'Short description for product 46', N'Detailed description for product 46', 305.0800)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100047    ', N'Product 47', N'Short description for product 47', N'Detailed description for product 47', 570.4900)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100048    ', N'Product 48', N'Short description for product 48', N'Detailed description for product 48', 451.4300)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100049    ', N'Product 49', N'Short description for product 49', N'Detailed description for product 49', 580.0100)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100050    ', N'Product 50', N'Short description for product 50', N'Detailed description for product 50', 120.4200)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100058    ', N'Product 28', N'Short description for product 28', N'Detailed description for product 28', 650.9600)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100059    ', N'Product 29', N'Short description for product 29', N'Detailed description for product 29', 732.3800)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100060    ', N'Product 30', N'Short description for product 30', N'Detailed description for product 30', 737.6300)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100061    ', N'Product 31', N'Short description for product 31', N'Detailed description for product 31', 420.3300)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100062    ', N'Product 32', N'Short description for product 32', N'Detailed description for product 32', 768.4900)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100073    ', N'Product 33', N'Short description for product 33', N'Detailed description for product 33', 142.1400)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100074    ', N'Product 34', N'Short description for product 34', N'Detailed description for product 34', 752.3300)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100075    ', N'Product 35', N'Short description for product 35', N'Detailed description for product 35', 359.0500)
INSERT [dbo].[PRODUCT] ([productNo], [pName], [description], [detailedDescription], [listPrice]) VALUES (N'100086    ', N'Product 36', N'Short description for product 36', N'Detailed description for product 36', 364.7600)
GO
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1001', N'10007     ', CAST(N'2025-01-04' AS Date), CAST(N'2025-01-07' AS Date), CAST(N'2025-01-10' AS Date), 10.5500, 0.2700, 7.9100, N'1   ', N'PRI')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1002', N'10007     ', CAST(N'2025-01-24' AS Date), CAST(N'2025-01-29' AS Date), CAST(N'2025-02-01' AS Date), 12.4900, 1.8900, 7.1500, N'1   ', N'FCP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1003', N'10023     ', CAST(N'2024-12-31' AS Date), CAST(N'2025-01-06' AS Date), CAST(N'2025-01-10' AS Date), 18.4200, 0.7800, 7.2300, N'1   ', N'GRD')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1004', N'10023     ', CAST(N'2025-01-02' AS Date), CAST(N'2025-01-07' AS Date), CAST(N'2025-01-12' AS Date), 19.4500, 1.0100, 7.2200, N'1   ', N'STD')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1005', N'10023     ', CAST(N'2024-12-27' AS Date), CAST(N'2024-12-30' AS Date), CAST(N'2025-01-02' AS Date), 19.7800, 0.6000, 6.4200, N'1   ', N'PRI')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1006', N'10012     ', CAST(N'2025-01-11' AS Date), CAST(N'2025-01-13' AS Date), CAST(N'2025-01-16' AS Date), 16.8400, 0.3800, 1.7400, N'1   ', N'NDA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1007', N'10012     ', CAST(N'2024-12-28' AS Date), CAST(N'2025-01-03' AS Date), CAST(N'2025-01-07' AS Date), 14.2600, 1.3700, 4.7100, N'1   ', N'2DA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1008', N'10016     ', CAST(N'2025-01-17' AS Date), CAST(N'2025-01-20' AS Date), CAST(N'2025-01-27' AS Date), 17.2400, 0.1700, 4.2800, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1009', N'10016     ', CAST(N'2025-01-12' AS Date), CAST(N'2025-01-18' AS Date), CAST(N'2025-01-22' AS Date), 13.7100, 1.3200, 9.2600, N'1   ', N'EXP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1010', N'10016     ', CAST(N'2025-01-08' AS Date), CAST(N'2025-01-09' AS Date), CAST(N'2025-01-14' AS Date), 8.1300, 0.8600, 4.2100, N'1   ', N'NDA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1011', N'10003     ', CAST(N'2024-12-30' AS Date), CAST(N'2025-01-04' AS Date), CAST(N'2025-01-09' AS Date), 14.7800, 1.6400, 3.7800, N'1   ', N'FCP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1012', N'10003     ', CAST(N'2025-01-18' AS Date), CAST(N'2025-01-24' AS Date), CAST(N'2025-01-29' AS Date), 14.1400, 1.4400, 0.0900, N'1   ', N'FCP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1013', N'10009     ', CAST(N'2025-01-16' AS Date), CAST(N'2025-01-20' AS Date), CAST(N'2025-01-22' AS Date), 5.9800, 1.2300, 3.5100, N'1   ', N'EXP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1014', N'10009     ', CAST(N'2025-01-04' AS Date), CAST(N'2025-01-08' AS Date), CAST(N'2025-01-15' AS Date), 13.1400, 0.2300, 5.7700, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1015', N'10001     ', CAST(N'2025-01-19' AS Date), CAST(N'2025-01-21' AS Date), CAST(N'2025-01-24' AS Date), 17.1100, 0.9400, 3.2800, N'1   ', N'2DA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1016', N'10001     ', CAST(N'2025-01-01' AS Date), CAST(N'2025-01-03' AS Date), CAST(N'2025-01-08' AS Date), 17.1400, 0.4400, 3.5400, N'1   ', N'FCP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1017', N'10018     ', CAST(N'2025-01-12' AS Date), CAST(N'2025-01-14' AS Date), CAST(N'2025-01-19' AS Date), 16.1800, 0.7100, 2.3700, N'1   ', N'FCP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1018', N'10018     ', CAST(N'2025-01-19' AS Date), CAST(N'2025-01-22' AS Date), CAST(N'2025-01-29' AS Date), 6.0700, 0.1300, 1.2400, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1019', N'10010     ', CAST(N'2024-12-29' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-01-04' AS Date), 15.7100, 0.1300, 4.4700, N'1   ', N'2DA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1020', N'10010     ', CAST(N'2025-01-06' AS Date), CAST(N'2025-01-12' AS Date), CAST(N'2025-01-19' AS Date), 10.1300, 1.9800, 5.0000, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1021', N'10010     ', CAST(N'2025-01-09' AS Date), CAST(N'2025-01-11' AS Date), CAST(N'2025-01-14' AS Date), 14.7400, 0.9800, 3.2400, N'1   ', N'2DA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1022', N'10005     ', CAST(N'2025-01-07' AS Date), CAST(N'2025-01-10' AS Date), CAST(N'2025-01-17' AS Date), 11.7800, 0.2200, 3.4800, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1023', N'10005     ', CAST(N'2025-01-17' AS Date), CAST(N'2025-01-23' AS Date), CAST(N'2025-01-25' AS Date), 18.7100, 0.3100, 4.0900, N'1   ', N'EXP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1024', N'10020     ', CAST(N'2025-01-16' AS Date), CAST(N'2025-01-19' AS Date), CAST(N'2025-01-24' AS Date), 13.3800, 0.4200, 6.0000, N'1   ', N'FCP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1025', N'10020     ', CAST(N'2025-01-08' AS Date), CAST(N'2025-01-10' AS Date), CAST(N'2025-01-13' AS Date), 17.9400, 1.5800, 3.0100, N'1   ', N'2DA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1026', N'10002     ', CAST(N'2025-01-04' AS Date), CAST(N'2025-01-07' AS Date), CAST(N'2025-01-09' AS Date), 18.2500, 1.7500, 3.3700, N'1   ', N'NDA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1027', N'10008     ', CAST(N'2025-01-06' AS Date), CAST(N'2025-01-12' AS Date), CAST(N'2025-01-14' AS Date), 9.4800, 1.5400, 5.7800, N'1   ', N'EXP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1028', N'10008     ', CAST(N'2025-01-18' AS Date), CAST(N'2025-01-21' AS Date), CAST(N'2025-01-28' AS Date), 9.4400, 1.3200, 4.3600, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1029', N'10004     ', CAST(N'2025-01-12' AS Date), CAST(N'2025-01-17' AS Date), CAST(N'2025-01-24' AS Date), 7.1400, 0.8400, 8.6400, N'1   ', N'FCP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1030', N'10004     ', CAST(N'2025-01-19' AS Date), CAST(N'2025-01-23' AS Date), CAST(N'2025-01-26' AS Date), 13.9400, 1.4800, 3.9100, N'1   ', N'2DA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1031', N'10014     ', CAST(N'2024-12-27' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-01-06' AS Date), 17.4300, 1.5400, 2.4700, N'1   ', N'STD')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1032', N'10014     ', CAST(N'2025-01-02' AS Date), CAST(N'2025-01-04' AS Date), CAST(N'2025-01-07' AS Date), 12.7700, 0.0100, 4.4400, N'1   ', N'2DA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1033', N'10014     ', CAST(N'2025-01-14' AS Date), CAST(N'2025-01-19' AS Date), CAST(N'2025-01-21' AS Date), 13.7400, 1.7500, 6.3600, N'1   ', N'EXP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1034', N'10011     ', CAST(N'2025-01-08' AS Date), CAST(N'2025-01-13' AS Date), CAST(N'2025-01-15' AS Date), 17.3300, 1.5200, 4.5800, N'1   ', N'EXP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1035', N'10011     ', CAST(N'2025-01-09' AS Date), CAST(N'2025-01-14' AS Date), CAST(N'2025-01-21' AS Date), 18.7700, 1.1800, 7.5800, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1036', N'10017     ', CAST(N'2025-01-04' AS Date), CAST(N'2025-01-09' AS Date), CAST(N'2025-01-11' AS Date), 10.2700, 0.2500, 5.4400, N'1   ', N'EXP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1037', N'10017     ', CAST(N'2024-12-29' AS Date), CAST(N'2025-01-02' AS Date), CAST(N'2025-01-09' AS Date), 13.3200, 0.4300, 5.9400, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1038', N'10025     ', CAST(N'2025-01-17' AS Date), CAST(N'2025-01-21' AS Date), CAST(N'2025-01-23' AS Date), 13.9500, 0.8800, 6.2800, N'1   ', N'EXP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1039', N'10025     ', CAST(N'2025-01-11' AS Date), CAST(N'2025-01-13' AS Date), CAST(N'2025-01-20' AS Date), 6.4400, 0.9600, 7.4400, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1040', N'10025     ', CAST(N'2025-01-15' AS Date), CAST(N'2025-01-21' AS Date), CAST(N'2025-01-28' AS Date), 14.7500, 0.1800, 5.2900, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1041', N'10022     ', CAST(N'2025-01-01' AS Date), CAST(N'2025-01-03' AS Date), CAST(N'2025-01-06' AS Date), 16.2800, 0.5700, 9.9700, N'1   ', N'2DA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1042', N'10022     ', CAST(N'2025-01-06' AS Date), CAST(N'2025-01-08' AS Date), CAST(N'2025-01-11' AS Date), 9.4500, 1.8800, 6.4900, N'1   ', N'2DA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1043', N'10006     ', CAST(N'2025-01-15' AS Date), CAST(N'2025-01-18' AS Date), CAST(N'2025-01-25' AS Date), 17.4100, 1.9100, 4.4400, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1044', N'10006     ', CAST(N'2025-01-18' AS Date), CAST(N'2025-01-24' AS Date), CAST(N'2025-01-29' AS Date), 12.1100, 0.7200, 6.5600, N'1   ', N'FCP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1045', N'10019     ', CAST(N'2025-01-15' AS Date), CAST(N'2025-01-17' AS Date), CAST(N'2025-01-22' AS Date), 17.4700, 1.4200, 4.4100, N'1   ', N'FCP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1046', N'10019     ', CAST(N'2024-12-31' AS Date), CAST(N'2025-01-05' AS Date), CAST(N'2025-01-07' AS Date), 19.4200, 0.3500, 2.5800, N'1   ', N'EXP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1047', N'10015     ', CAST(N'2025-01-16' AS Date), CAST(N'2025-01-22' AS Date), CAST(N'2025-01-24' AS Date), 12.2400, 0.9800, 5.5800, N'1   ', N'EXP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1048', N'10015     ', CAST(N'2025-01-09' AS Date), CAST(N'2025-01-11' AS Date), CAST(N'2025-01-18' AS Date), 10.9600, 1.4800, 6.9600, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1049', N'10013     ', CAST(N'2025-01-12' AS Date), CAST(N'2025-01-18' AS Date), CAST(N'2025-01-20' AS Date), 18.3400, 1.4500, 8.1400, N'1   ', N'EXP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'1050', N'10021     ', CAST(N'2025-01-02' AS Date), CAST(N'2025-01-08' AS Date), CAST(N'2025-01-13' AS Date), 13.9100, 0.3400, 6.5600, N'1   ', N'FCP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'2015', N'20001     ', CAST(N'2025-01-19' AS Date), CAST(N'2025-01-21' AS Date), CAST(N'2025-01-24' AS Date), 17.1100, 0.9400, 3.2800, N'1   ', N'2DA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'2016', N'20001     ', CAST(N'2025-01-01' AS Date), CAST(N'2025-01-03' AS Date), CAST(N'2025-01-08' AS Date), 17.1400, 0.4400, 3.5400, N'1   ', N'FCP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'2017', N'20018     ', CAST(N'2025-01-12' AS Date), CAST(N'2025-01-14' AS Date), CAST(N'2025-01-19' AS Date), 16.1800, 0.7100, 2.3700, N'1   ', N'FCP')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'2018', N'20018     ', CAST(N'2025-01-19' AS Date), CAST(N'2025-01-22' AS Date), CAST(N'2025-01-29' AS Date), 6.0700, 0.1300, 1.2400, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'2019', N'20010     ', CAST(N'2024-12-29' AS Date), CAST(N'2025-01-01' AS Date), CAST(N'2025-01-04' AS Date), 15.7100, 0.1300, 4.4700, N'1   ', N'2DA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'2020', N'20010     ', CAST(N'2025-01-06' AS Date), CAST(N'2025-01-12' AS Date), CAST(N'2025-01-19' AS Date), 10.1300, 1.9800, 5.0000, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'2021', N'20010     ', CAST(N'2025-01-09' AS Date), CAST(N'2025-01-11' AS Date), CAST(N'2025-01-14' AS Date), 14.7400, 0.9800, 3.2400, N'1   ', N'2DA')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'2022', N'20005     ', CAST(N'2025-01-07' AS Date), CAST(N'2025-01-10' AS Date), CAST(N'2025-01-17' AS Date), 11.7800, 0.2200, 3.4800, N'1   ', N'INT')
INSERT [dbo].[PURCHASE ORDER] ([PONum], [accountNum], [datePlaced], [expectedShip], [exptectedDel], [shippingCost], [taxAmount], [otherAdjustments], [shipAddNum], [shipCode]) VALUES (N'2023', N'20005     ', CAST(N'2025-01-17' AS Date), CAST(N'2025-01-23' AS Date), CAST(N'2025-01-25' AS Date), 18.7100, 0.3100, 4.0900, N'1   ', N'EXP')
GO
INSERT [dbo].[SHIP METHODS] ([shipCode], [courier], [shipMethod], [typicalNumDaysDel]) VALUES (N'2DA', N'UPS', N'2-Day Air', 2)
INSERT [dbo].[SHIP METHODS] ([shipCode], [courier], [shipMethod], [typicalNumDaysDel]) VALUES (N'EXP', N'FedEx', N'Express', 2)
INSERT [dbo].[SHIP METHODS] ([shipCode], [courier], [shipMethod], [typicalNumDaysDel]) VALUES (N'FCP', N'USPS', N'First-Class Package', 3)
INSERT [dbo].[SHIP METHODS] ([shipCode], [courier], [shipMethod], [typicalNumDaysDel]) VALUES (N'GRD', N'USPS', N'Ground Advantage', 4)
INSERT [dbo].[SHIP METHODS] ([shipCode], [courier], [shipMethod], [typicalNumDaysDel]) VALUES (N'INT', N'DHL', N'International', 7)
INSERT [dbo].[SHIP METHODS] ([shipCode], [courier], [shipMethod], [typicalNumDaysDel]) VALUES (N'LTL', N'Freight', N'LTL Freight', 10)
INSERT [dbo].[SHIP METHODS] ([shipCode], [courier], [shipMethod], [typicalNumDaysDel]) VALUES (N'MFR', N'USPS', N'Media Mail', 7)
INSERT [dbo].[SHIP METHODS] ([shipCode], [courier], [shipMethod], [typicalNumDaysDel]) VALUES (N'NDA', N'UPS', N'Next Day Air', 1)
INSERT [dbo].[SHIP METHODS] ([shipCode], [courier], [shipMethod], [typicalNumDaysDel]) VALUES (N'PRI', N'USPS', N'Priority Mail', 3)
INSERT [dbo].[SHIP METHODS] ([shipCode], [courier], [shipMethod], [typicalNumDaysDel]) VALUES (N'STD', N'FedEx', N'Ground', 5)
INSERT [dbo].[SHIP METHODS] ([shipCode], [courier], [shipMethod], [typicalNumDaysDel]) VALUES (N'UBR', N'Uber', N'Car', 0)
GO
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000001XYZ  ', N'2000015   ', CAST(N'2025-01-29T00:00:00' AS SmallDateTime), CAST(N'2025-01-30T00:00:00' AS SmallDateTime), CAST(24.11 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000001XYZ  ', N'2000022   ', CAST(N'2025-01-19T00:00:00' AS SmallDateTime), CAST(N'2025-01-21T00:00:00' AS SmallDateTime), CAST(78.80 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000002XYZ  ', N'2000010   ', CAST(N'2025-01-14T00:00:00' AS SmallDateTime), CAST(N'2025-01-14T00:00:00' AS SmallDateTime), CAST(68.79 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000002XYZ  ', N'2000016   ', CAST(N'2025-01-23T00:00:00' AS SmallDateTime), CAST(N'2025-01-27T00:00:00' AS SmallDateTime), CAST(66.69 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000003XYZ  ', N'2000001   ', CAST(N'2025-01-20T00:00:00' AS SmallDateTime), CAST(N'2025-01-22T00:00:00' AS SmallDateTime), CAST(68.90 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000003XYZ  ', N'2000022   ', CAST(N'2025-01-20T00:00:00' AS SmallDateTime), CAST(N'2025-01-23T00:00:00' AS SmallDateTime), CAST(11.42 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000004XYZ  ', N'2000022   ', CAST(N'2025-01-22T00:00:00' AS SmallDateTime), CAST(N'2025-01-25T00:00:00' AS SmallDateTime), CAST(23.19 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000005XYZ  ', N'2000016   ', CAST(N'2025-01-23T00:00:00' AS SmallDateTime), CAST(N'2025-01-24T00:00:00' AS SmallDateTime), CAST(52.11 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000006XYZ  ', N'2000006   ', CAST(N'2025-01-11T00:00:00' AS SmallDateTime), CAST(N'2025-01-12T00:00:00' AS SmallDateTime), CAST(97.24 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000007XYZ  ', N'2000014   ', CAST(N'2025-01-08T00:00:00' AS SmallDateTime), CAST(N'2025-01-15T00:00:00' AS SmallDateTime), CAST(41.31 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000008XYZ  ', N'2000001   ', CAST(N'2025-01-20T00:00:00' AS SmallDateTime), CAST(N'2025-01-22T00:00:00' AS SmallDateTime), CAST(84.79 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000008XYZ  ', N'2000002   ', CAST(N'2025-01-29T00:00:00' AS SmallDateTime), CAST(N'2025-01-29T00:00:00' AS SmallDateTime), CAST(13.30 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000009XYZ  ', N'2000038   ', CAST(N'2025-01-16T00:00:00' AS SmallDateTime), CAST(N'2025-01-19T00:00:00' AS SmallDateTime), CAST(50.94 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000010XYZ  ', N'2000040   ', CAST(N'2025-01-07T00:00:00' AS SmallDateTime), CAST(N'2025-01-09T00:00:00' AS SmallDateTime), CAST(21.97 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000011XYZ  ', N'2000001   ', CAST(N'2025-01-17T00:00:00' AS SmallDateTime), CAST(N'2025-01-19T00:00:00' AS SmallDateTime), CAST(9.07 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000011XYZ  ', N'2000009   ', CAST(N'2025-01-16T00:00:00' AS SmallDateTime), CAST(N'2025-01-23T00:00:00' AS SmallDateTime), CAST(14.90 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000012XYZ  ', N'2000009   ', CAST(N'2025-01-14T00:00:00' AS SmallDateTime), CAST(N'2025-01-20T00:00:00' AS SmallDateTime), CAST(81.49 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000013XYZ  ', N'2000019   ', CAST(N'2025-01-29T00:00:00' AS SmallDateTime), CAST(N'2025-02-05T00:00:00' AS SmallDateTime), CAST(3.14 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000014XYZ  ', N'2000011   ', CAST(N'2025-01-31T00:00:00' AS SmallDateTime), CAST(N'2025-02-05T00:00:00' AS SmallDateTime), CAST(1.62 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000015XYZ  ', N'2000010   ', CAST(N'2025-01-11T00:00:00' AS SmallDateTime), CAST(N'2025-01-11T00:00:00' AS SmallDateTime), CAST(75.20 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000015XYZ  ', N'2000033   ', CAST(N'2025-01-04T00:00:00' AS SmallDateTime), CAST(N'2025-01-08T00:00:00' AS SmallDateTime), CAST(30.72 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000016XYZ  ', N'2000020   ', CAST(N'2025-02-05T00:00:00' AS SmallDateTime), CAST(N'2025-02-12T00:00:00' AS SmallDateTime), CAST(34.36 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000017XYZ  ', N'2000002   ', CAST(N'2025-02-01T00:00:00' AS SmallDateTime), CAST(N'2025-02-04T00:00:00' AS SmallDateTime), CAST(26.97 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000017XYZ  ', N'2000011   ', CAST(N'2025-01-29T00:00:00' AS SmallDateTime), CAST(N'2025-01-29T00:00:00' AS SmallDateTime), CAST(28.98 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000017XYZ  ', N'2000021   ', CAST(N'2025-01-18T00:00:00' AS SmallDateTime), CAST(N'2025-01-23T00:00:00' AS SmallDateTime), CAST(12.77 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000018XYZ  ', N'2000019   ', CAST(N'2025-01-31T00:00:00' AS SmallDateTime), CAST(N'2025-02-05T00:00:00' AS SmallDateTime), CAST(70.80 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000018XYZ  ', N'2000032   ', CAST(N'2025-01-04T00:00:00' AS SmallDateTime), CAST(N'2025-01-05T00:00:00' AS SmallDateTime), CAST(3.12 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000019XYZ  ', N'2000022   ', CAST(N'2025-01-20T00:00:00' AS SmallDateTime), CAST(N'2025-01-24T00:00:00' AS SmallDateTime), CAST(74.72 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000020XYZ  ', N'2000016   ', CAST(N'2025-01-20T00:00:00' AS SmallDateTime), CAST(N'2025-01-23T00:00:00' AS SmallDateTime), CAST(65.01 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000020XYZ  ', N'2000024   ', CAST(N'2025-01-22T00:00:00' AS SmallDateTime), CAST(N'2025-01-22T00:00:00' AS SmallDateTime), CAST(39.47 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000021XYZ  ', N'2000019   ', CAST(N'2025-02-01T00:00:00' AS SmallDateTime), CAST(N'2025-02-07T00:00:00' AS SmallDateTime), CAST(25.63 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000021XYZ  ', N'2000034   ', CAST(N'2025-01-28T00:00:00' AS SmallDateTime), CAST(N'2025-01-31T00:00:00' AS SmallDateTime), CAST(52.08 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000021XYZ  ', N'6000019   ', CAST(N'2025-02-01T00:00:00' AS SmallDateTime), CAST(N'2025-02-07T00:00:00' AS SmallDateTime), CAST(25.63 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000021XYZ  ', N'6000034   ', CAST(N'2025-01-28T00:00:00' AS SmallDateTime), CAST(N'2025-01-31T00:00:00' AS SmallDateTime), CAST(52.08 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000022XYZ  ', N'2000029   ', CAST(N'2025-01-24T00:00:00' AS SmallDateTime), CAST(N'2025-01-31T00:00:00' AS SmallDateTime), CAST(5.11 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000022XYZ  ', N'7000029   ', CAST(N'2025-01-24T00:00:00' AS SmallDateTime), CAST(N'2025-01-31T00:00:00' AS SmallDateTime), CAST(5.11 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000023XYZ  ', N'2000038   ', CAST(N'2025-01-14T00:00:00' AS SmallDateTime), CAST(N'2025-01-18T00:00:00' AS SmallDateTime), CAST(2.58 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000023XYZ  ', N'8000038   ', CAST(N'2025-01-14T00:00:00' AS SmallDateTime), CAST(N'2025-01-18T00:00:00' AS SmallDateTime), CAST(2.58 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000024XYZ  ', N'2000012   ', CAST(N'2025-01-07T00:00:00' AS SmallDateTime), CAST(N'2025-01-07T00:00:00' AS SmallDateTime), CAST(93.14 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000024XYZ  ', N'2000032   ', CAST(N'2025-01-07T00:00:00' AS SmallDateTime), CAST(N'2025-01-09T00:00:00' AS SmallDateTime), CAST(34.21 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000025XYZ  ', N'2000030   ', CAST(N'2025-01-30T00:00:00' AS SmallDateTime), CAST(N'2025-02-01T00:00:00' AS SmallDateTime), CAST(60.11 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000025XYZ  ', N'2000039   ', CAST(N'2025-01-16T00:00:00' AS SmallDateTime), CAST(N'2025-01-17T00:00:00' AS SmallDateTime), CAST(13.68 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000026XYZ  ', N'2000006   ', CAST(N'2025-01-10T00:00:00' AS SmallDateTime), CAST(N'2025-01-12T00:00:00' AS SmallDateTime), CAST(95.99 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000027XYZ  ', N'2000008   ', CAST(N'2025-01-14T00:00:00' AS SmallDateTime), CAST(N'2025-01-17T00:00:00' AS SmallDateTime), CAST(92.72 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000027XYZ  ', N'2000017   ', CAST(N'2025-01-11T00:00:00' AS SmallDateTime), CAST(N'2025-01-18T00:00:00' AS SmallDateTime), CAST(62.32 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000028XYZ  ', N'2000039   ', CAST(N'2025-01-17T00:00:00' AS SmallDateTime), CAST(N'2025-01-17T00:00:00' AS SmallDateTime), CAST(16.13 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000029XYZ  ', N'2000021   ', CAST(N'2025-01-18T00:00:00' AS SmallDateTime), CAST(N'2025-01-23T00:00:00' AS SmallDateTime), CAST(13.39 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000030XYZ  ', N'2000016   ', CAST(N'2025-01-25T00:00:00' AS SmallDateTime), CAST(N'2025-01-26T00:00:00' AS SmallDateTime), CAST(12.70 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000030XYZ  ', N'2000032   ', CAST(N'2025-01-08T00:00:00' AS SmallDateTime), CAST(N'2025-01-14T00:00:00' AS SmallDateTime), CAST(47.11 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000031XYZ  ', N'2000024   ', CAST(N'2025-01-21T00:00:00' AS SmallDateTime), CAST(N'2025-01-24T00:00:00' AS SmallDateTime), CAST(51.78 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000032XYZ  ', N'2000037   ', CAST(N'2025-01-17T00:00:00' AS SmallDateTime), CAST(N'2025-01-18T00:00:00' AS SmallDateTime), CAST(66.38 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000033XYZ  ', N'2000035   ', CAST(N'2025-01-09T00:00:00' AS SmallDateTime), CAST(N'2025-01-14T00:00:00' AS SmallDateTime), CAST(38.49 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000034XYZ  ', N'2000003   ', CAST(N'2025-01-27T00:00:00' AS SmallDateTime), CAST(N'2025-02-02T00:00:00' AS SmallDateTime), CAST(67.98 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000034XYZ  ', N'2000034   ', CAST(N'2025-01-27T00:00:00' AS SmallDateTime), CAST(N'2025-01-31T00:00:00' AS SmallDateTime), CAST(24.00 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000035XYZ  ', N'2000013   ', CAST(N'2025-01-06T00:00:00' AS SmallDateTime), CAST(N'2025-01-09T00:00:00' AS SmallDateTime), CAST(44.39 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000036XYZ  ', N'2000035   ', CAST(N'2025-01-06T00:00:00' AS SmallDateTime), CAST(N'2025-01-10T00:00:00' AS SmallDateTime), CAST(90.63 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000036XYZ  ', N'2000036   ', CAST(N'2025-01-13T00:00:00' AS SmallDateTime), CAST(N'2025-01-16T00:00:00' AS SmallDateTime), CAST(23.89 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000037XYZ  ', N'2000008   ', CAST(N'2025-01-14T00:00:00' AS SmallDateTime), CAST(N'2025-01-16T00:00:00' AS SmallDateTime), CAST(68.54 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000037XYZ  ', N'2000037   ', CAST(N'2025-01-15T00:00:00' AS SmallDateTime), CAST(N'2025-01-21T00:00:00' AS SmallDateTime), CAST(72.87 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000038XYZ  ', N'2000037   ', CAST(N'2025-01-13T00:00:00' AS SmallDateTime), CAST(N'2025-01-19T00:00:00' AS SmallDateTime), CAST(35.80 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000039XYZ  ', N'2000003   ', CAST(N'2025-01-28T00:00:00' AS SmallDateTime), CAST(N'2025-01-30T00:00:00' AS SmallDateTime), CAST(73.94 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'ABC0000000040XYZ  ', N'2000019   ', CAST(N'2025-01-28T00:00:00' AS SmallDateTime), CAST(N'2025-02-01T00:00:00' AS SmallDateTime), CAST(26.99 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'GHI0000000019XYZ  ', N'5000022   ', CAST(N'2025-01-20T00:00:00' AS SmallDateTime), CAST(N'2025-01-24T00:00:00' AS SmallDateTime), CAST(74.72 AS Decimal(5, 2)))
INSERT [dbo].[SHIPMENT] ([trackingCode], [invoiceNum], [datetimePickedup], [datetimeDelivered], [weightLBS]) VALUES (N'GHI0000000020XYZ  ', N'5000024   ', CAST(N'2025-01-22T00:00:00' AS SmallDateTime), CAST(N'2025-01-22T00:00:00' AS SmallDateTime), CAST(39.47 AS Decimal(5, 2)))
GO
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10001     ', N'1   ', N'James', N'Smith', N'A', N'123', N' ', N'Main St', N' ', N'Richmond', N'VA', N'23220', N'8045551213', N'james.smith.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10002     ', N'1   ', N'Mary', N'Johnson', N'B', N'456', N' ', N'Oak Ave', N' ', N'Arlington', N'VA', N'22202', N'7035553435', N'mary.johnson.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10003     ', N'1   ', N'Robert', N'Williams', N'C', N'789', N' ', N'Elm St', N' ', N'Alexandria', N'VA', N'22304', N'7035555657', N'robert.williams.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10004     ', N'1   ', N'Jennifer', N'Brown', N'D', N'1011', N' ', N'Pine St', N' ', N'Norfolk', N'VA', N'23504', N'7575557879', N'jennifer.brown.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10005     ', N'1   ', N'Michael', N'Jones', N'E', N'1314', N' ', N'Maple Ave', N' ', N'Chesapeake', N'VA', N'23320', N'7575550102', N'michael.jones.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10006     ', N'1   ', N'Linda', N'Miller', N'F', N'1617', N' ', N'Cedar Ln', N' ', N'Virginia Beach', N'VA', N'23451', N'7575552324', N'linda.miller.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10007     ', N'1   ', N'David', N'Davis', N'G', N'1920', N' ', N'Willow Dr', N' ', N'Roanoke', N'VA', N'24012', N'5405554546', N'david.davis.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10008     ', N'1   ', N'Barbara', N'Garcia', N'H', N'2223', N' ', N'Birch Rd', N' ', N'Newport News', N'VA', N'23601', N'7575556768', N'barbara.garcia.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10009     ', N'1   ', N'William', N'Rodriguez', N'I', N'2526', N' ', N'Oakwood Ct', N' ', N'Lynchburg', N'VA', N'24502', N'4345558990', N'william.rodriguez.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10010     ', N'1   ', N'Elizabeth', N'Wilson', N'J', N'2829', N' ', N'Dogwood Pl', N' ', N'Charlottesville', N'VA', N'22901', N'4345551011', N'elizabeth.wilson.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10011     ', N'1   ', N'John', N'Martinez', N'K', N'3132', N' ', N'Holly Ave', N' ', N'Harrisonburg', N'VA', N'22801', N'5405553233', N'john.martinez.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10012     ', N'1   ', N'Jessica', N'Anderson', N'L', N'3435', N' ', N'Aspen Dr', N' ', N'Fredericksburg', N'VA', N'22401', N'5405555455', N'jessica.anderson.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10013     ', N'1   ', N'Richard', N'Taylor', N'M', N'3738', N' ', N'Sycamore Ln', N' ', N'Winchester', N'VA', N'22601', N'5405557677', N'richard.taylor.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10014     ', N'1   ', N'Sarah', N'Thomas', N'N', N'4041', N' ', N'Redwood Rd', N' ', N'Staunton', N'VA', N'24401', N'5405559899', N'sarah.thomas.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10015     ', N'1   ', N'Charles', N'Moore', N'O', N'4344', N' ', N'Magnolia Ct', N' ', N'Danville', N'VA', N'24541', N'4345552122', N'charles.moore.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10016     ', N'1   ', N'Joseph', N'Jackson', N'P', N'4647', N' ', N'Ashwood Pl', N' ', N'Petersburg', N'VA', N'23803', N'8045554344', N'joseph.jackson.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10017     ', N'1   ', N'Patricia', N'Martin', N'Q', N'4950', N' ', N'Cedarwood Ave', N' ', N'Hopewell', N'VA', N'23860', N'8045556566', N'patricia.martin.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10018     ', N'1   ', N'Christopher', N'Lee', N'R', N'5253', N' ', N'Willowbrook Dr', N' ', N'Bristol', N'VA', N'24201', N'2765558788', N'christopher.lee.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10019     ', N'1   ', N'Lisa', N'Perez', N'S', N'5556', N' ', N'Oakbrook Ln', N' ', N'Radford', N'VA', N'24141', N'5405550910', N'lisa.perez.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10020     ', N'1   ', N'Daniel', N'Thompson', N'T', N'5859', N' ', N'Pinebrook Rd', N' ', N'Salem', N'VA', N'24153', N'5405553132', N'daniel.thompson.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10021     ', N'1   ', N'Nancy', N'White', N'U', N'6162', N' ', N'Maplebrook Ct', N' ', N'Blacksburg', N'VA', N'24060', N'5405555354', N'nancy.white.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10022     ', N'1   ', N'Paul', N'Harris', N'V', N'6465', N' ', N'Dogwoodbrook Pl', N' ', N'Christiansburg', N'VA', N'24073', N'5405557576', N'paul.harris.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10023     ', N'1   ', N'Karen', N'Sanchez', N'W', N'6768', N' ', N'Hollybrook Ave', N' ', N'Abingdon', N'VA', N'24210', N'2765559798', N'karen.sanchez.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10024     ', N'1   ', N'Mark', N'Clark', N'X', N'7071', N' ', N'Aspenbrook Dr', N' ', N'Marion', N'VA', N'24354', N'2765551819', N'mark.clark.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10025     ', N'1   ', N'Margaret', N'Lewis', N'Y', N'7374', N' ', N'Sycamorebrook Ln', N' ', N'Wytheville', N'VA', N'24382', N'2765554041', N'margaret.lewis.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10026     ', N'1   ', N'Steven', N'Robinson', N'Z', N'7677', N' ', N'Redwoodbrook Rd', N' ', N'Pulaski', N'VA', N'24301', N'5405556263', N'steven.robinson.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10027     ', N'1   ', N'Betty', N'Walker', N'A', N'7980', N' ', N'Magnoliabrook Ct', N' ', N'Galax', N'VA', N'24333', N'2765558485', N'betty.walker.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10028     ', N'1   ', N'Donald', N'Hall', N'B', N'8283', N' ', N'Ashwoodbrook Pl', N' ', N'Martinsville', N'VA', N'24112', N'2765550607', N'donald.hall.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10029     ', N'1   ', N'Sandra', N'Allen', N'C', N'8586', N' ', N'Cedarwoodbrook Ave', N' ', N'South Boston', N'VA', N'24592', N'4345552829', N'sandra.allen.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10030     ', N'1   ', N'George', N'Young', N'D', N'8889', N' ', N'Willowwoodbrook Dr', N' ', N'Lexington', N'VA', N'24450', N'5405555051', N'george.young.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10031     ', N'1   ', N'Kenneth', N'Hernandez', N'E', N'9192', N' ', N'Oakwoodbrook Ln', N' ', N'Covington', N'VA', N'24426', N'5405557273', N'kenneth.hernandez.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10032     ', N'1   ', N'Maria', N'King', N'F', N'9495', N' ', N'Pinewoodbrook Rd', N' ', N'Buena Vista', N'VA', N'24416', N'5405559495', N'maria.king.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10033     ', N'1   ', N'Timothy', N'Wright', N'G', N'9798', N' ', N'Maplewoodbrook Ct', N' ', N'Waynesboro', N'VA', N'22980', N'5405551617', N'timothy.wright.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10034     ', N'1   ', N'Donna', N'Green', N'H', N'10101', N' ', N'Dogwoodwoodbrook Pl', N' ', N'Front Royal', N'VA', N'22630', N'5405553839', N'donna.green.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10035     ', N'1   ', N'Edward', N'Adams', N'I', N'10404', N' ', N'Hollywoodbrook Ave', N' ', N'Falls Church', N'VA', N'22041', N'7035556061', N'edward.adams.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10036     ', N'1   ', N'Carol', N'Baker', N'J', N'10707', N' ', N'Aspenwoodbrook Dr', N' ', N'Manassas', N'VA', N'20109', N'7035558283', N'carol.baker.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10037     ', N'1   ', N'Jason', N'Nelson', N'K', N'11010', N' ', N'Sycamorewoodbrook Ln', N' ', N'Woodbridge', N'VA', N'22191', N'7035550405', N'jason.nelson.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10038     ', N'1   ', N'Michelle', N'Carter', N'L', N'11313', N' ', N'Redwoodwoodbrook Rd', N' ', N'Fredericksburg', N'VA', N'22405', N'5405552627', N'michelle.carter.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10039     ', N'1   ', N'Anthony', N'Mitchell', N'M', N'11616', N' ', N'Magnoliawoodbrook Ct', N' ', N'Culpeper', N'VA', N'22701', N'5405554849', N'anthony.mitchell.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10040     ', N'1   ', N'Laura', N'Perez', N'N', N'11919', N' ', N'Ashwoodwoodbrook Pl', N' ', N'Warrenton', N'VA', N'20186', N'5405557071', N'laura.perez.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10041     ', N'1   ', N'Andrew', N'Roberts', N'O', N'12222', N' ', N'Cedarwoodwoodbrook Ave', N' ', N'Leesburg', N'VA', N'20175', N'7035559293', N'andrew.roberts.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10042     ', N'1   ', N'Kimberly', N'Turner', N'P', N'12525', N' ', N'Willowwoodwoodbrook Dr', N' ', N'Purcellville', N'VA', N'20132', N'5405551415', N'kimberly.turner.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10043     ', N'1   ', N'Brian', N'Phillips', N'Q', N'12828', N' ', N'Oakwoodwoodbrook Ln', N' ', N'Berryville', N'VA', N'22611', N'5405553637', N'brian.phillips.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10044     ', N'1   ', N'Dorothy', N'Campbell', N'R', N'13131', N' ', N'Pinewoodwoodbrook Rd', N' ', N'Luray', N'VA', N'22835', N'5405555859', N'dorothy.campbell.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10045     ', N'1   ', N'Kevin', N'Parker', N'S', N'13434', N' ', N'Maplewoodwoodbrook Ct', N' ', N'Stanley', N'VA', N'22851', N'5405558081', N'kevin.parker.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10046     ', N'1   ', N'Deborah', N'Evans', N'T', N'13737', N' ', N'Maple Ave.', N' ', N'Orange', N'VA', N'22960', N'5405550203', N'deborah.evans.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10047     ', N'1   ', N'Ronald', N'Edwards', N'U', N'14040', N' ', N'Oak St.', N' ', N'Tappahannock', N'VA', N'22560', N'8045552425', N'ronald.edwards.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10048     ', N'1   ', N'Debra', N'Collins', N'V', N'14343', N' ', N'Sycamore Rd.', N' ', N'Kilmarnock', N'VA', N'22482', N'8045554647', N'debra.collins.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10049     ', N'1   ', N'Jeffrey', N'Stewart', N'W', N'14646', N' ', N'Main St.', N' ', N'West Point', N'VA', N'23181', N'8045556869', N'jeffrey.stewart.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10050     ', N'1   ', N'Brenda', N'Sanchez', N'X', N'14949', N' ', N'Willow Ct.', N' ', N'Smithfield', N'VA', N'23430', N'7575559091', N'brenda.sanchez.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10058     ', N'1   ', N'Donald', N'Hall', N'B', N'8283', N' ', N'Ashwoodbrook Pl', N' ', N'Martinsville', N'VA', N'24112', N'2765550607', N'donald.hall.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10059     ', N'1   ', N'Sandra', N'Allen', N'C', N'8586', N' ', N'Cedarwoodbrook Ave', N' ', N'South Boston', N'VA', N'24592', N'4345552829', N'sandra.allen.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10060     ', N'1   ', N'George', N'Young', N'D', N'8889', N' ', N'Willowwoodbrook Dr', N' ', N'Lexington', N'VA', N'24450', N'5405555051', N'george.young.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10061     ', N'1   ', N'Kenneth', N'Hernandez', N'E', N'9192', N' ', N'Oakwoodbrook Ln', N' ', N'Covington', N'VA', N'24426', N'5405557273', N'kenneth.hernandez.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10062     ', N'1   ', N'Maria', N'King', N'F', N'9495', N' ', N'Pinewoodbrook Rd', N' ', N'Buena Vista', N'VA', N'24416', N'5405559495', N'maria.king.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10063     ', N'1   ', N'Timothy', N'Wright', N'G', N'9798', N' ', N'Maplewoodbrook Ct', N' ', N'Waynesboro', N'VA', N'22980', N'5405551617', N'timothy.wright.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10064     ', N'1   ', N'Donna', N'Green', N'H', N'10101', N' ', N'Dogwoodwoodbrook Pl', N' ', N'Front Royal', N'VA', N'22630', N'5405553839', N'donna.green.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10065     ', N'1   ', N'Edward', N'Adams', N'I', N'10404', N' ', N'Hollywoodbrook Ave', N' ', N'Falls Church', N'VA', N'22041', N'7035556061', N'edward.adams.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10066     ', N'1   ', N'Carol', N'Baker', N'J', N'10707', N' ', N'Aspenwoodbrook Dr', N' ', N'Manassas', N'VA', N'20109', N'7035558283', N'carol.baker.ship@example.com
')
INSERT [dbo].[SHIPTO] ([accountNum], [shipAddNum], [fName], [lName], [mInitial], [streetNum], [apt/unitNum], [streetLine1], [streetLine2], [city], [stateCode], [zipCode], [telNum], [email]) VALUES (N'10067     ', N'1   ', N'Jason', N'Nelson', N'K', N'11010', N' ', N'Sycamorewoodbrook Ln', N' ', N'Woodbridge', N'VA', N'22191', N'7035550405', N'jason.nelson.ship@example.com
')
GO
USE [master]
GO
ALTER DATABASE [RETAIL SALES] SET  READ_WRITE 
GO
