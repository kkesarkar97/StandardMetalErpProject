USE [StandardMetalDB]
GO

/****** Object:  Table [dbo].[QuotationMasterFinal]    Script Date: 10/10/2022 22:55:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
Select * from QuotationMasterFinal;
SET ANSI_PADDING ON
GO
drop table QuotationMasterFinal;
CREATE TABLE [dbo].[QuotationMasterFinal](
	[QuotationId] [int] IDENTITY(1,1) NOT NULL,
	[WithEnquiry] [bit] NULL,
	[EnquiryId] int NULL,
	[RevisionNumber] [varchar](100) NULL,
	[QuotationNumber] [varchar](100) NULL,
	[QuotationDate] [datetime] NULL,
	[IsNewCustomer] [bit] NULL,
	[NewCustomerName] [varchar](100) NULL,
	[NewCustomerCode] [varchar](100) NULL,
	[Id] [int] Null,
	--[CustomerName] [varchar](100) NULL,
	--[CustomerCode] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[ContactPerson] [varchar](100) NULL,
	[Quantity] [int] NULL,
	[Rate] [int] NULL,
	[SymbolId] [int] NULL,
	[LoginUserId] [int] NULL,
	[BranchId] [int] NULL,
	[SystemEntryDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuotationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


