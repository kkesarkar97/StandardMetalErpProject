USE [StandardMetalDB]
GO
Select * from IndentMaster;
/****** Object:  Table [dbo].[QuotationDetailFinal]    Script Date: 10/10/2022 23:42:52 ******/
SET ANSI_NULLS ON
GO
Select * from ItemMaster;
SET QUOTED_IDENTIFIER ON
GO
select * from QuotationDetailFinal1;
SET ANSI_PADDING ON
GO
--drop table QuotationDetailFinal;
CREATE TABLE [dbo].[QuotationDetailFinal](
	[QuatationDetailId] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int]  NULL,
	[ToolMouldId] int Null,
	[DeliveryLeadTime] [datetime] NULL,
	[PackingCost] [decimal](10, 2) NULL,
	[DevelopmentToolCost] [decimal](10, 2) NULL,
	[MouldCost] [decimal](10,2) Null,
	[MouldCavity] [int] Null,
	[OtherCost] [decimal](10,2) Null,
	[OtherCostRemark] [varchar](100) Null,
	[Material] [varchar](100) NULL,
	[UnitId][int] NULL,
	[Ecess] [varchar](100) NULL,
	[ServiceTax] [int] NULL,
	[Excise] [varchar](100) NULL,
	[SaleTax] [int] NULL,
	[PaymentTypeId] [int] NULL,
	[TransportId] [int] NULL,
	[FreightId] [int] NULL,
	[PlanTypeId] [int] NULL,
	[PackingId] [int] NULL,
	[StatusId] [int] NULL,
	[AgainstForm] [varchar](100) NULL,
	[Remark] [varchar](100) NULL,
	[DrawingId] [int] NULL,
	[SampleRequired] [varchar](100) NULL,
	[DeliveryTermId] [int] NULL,
	[DocumentRequired] [varchar](100) NULL,
	[Advance] [int] NULL,
	[ItemSubject] [varchar](100) NULL,
	[ItemTerms] [varchar](100) NULL,
	[ToolSubject] [varchar](100) Null,
	[ToolTerms] [varchar](100) Null,
	[PreparedbyEmpCodeId] [int] Null,
	[PreparedbyEmpNameId] [int],
	[ApprovedbyEmpCodeId] [int],
	[ApprovedbyEmpNameId] [int],
	[ReviewedByEmpCodeId] [int],
	[ReviewedByEmpNameId] [int],
	[QuotationId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuatationDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
select * from QuotationDetailFinal;
SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[QuotationDetailFinal]  WITH CHECK ADD FOREIGN KEY([QuotationId])
REFERENCES [dbo].[QuotationMasterFinal] ([QuotationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

drop table QuotationDetailFinal1;
select * from QuotationDetailFinal1;
CREATE TABLE [dbo].[QuotationDetailFinal1](
	[QuatationDetailId] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int]  NULL,
	[ToolMouldId] int Null,
	[DeliveryLeadTime] [datetime] NULL,
	[PackingCost] [decimal](10, 2) NULL,
	[DevelopmentToolCost] [decimal](10, 2) NULL,
	[MouldCost] [decimal](10,2) Null,
	[MouldCavity] [int] Null,
	[OtherCost] [decimal](10,2) Null,
	[OtherCostRemark] [varchar](100) Null,
	[Material] [varchar](100) NULL,
	[UnitId][int] NULL,
	[Ecess] [varchar](100) NULL,
	[ServiceTax] [decimal](10,2) NULL,
	[Excise] [varchar](100) NULL,
	[SaleTax] [decimal](10,2) NULL,
	[PaymentTypeId] [int] NULL,
	[TransportId] [int] NULL,
	[FreightId] [int] NULL,
	[PlanTypeId] [int] NULL,
	[PackingId] [int] NULL,
	[StatusId] [int] NULL,
	[AgainstForm] [varchar](100) NULL,
	[Remark] [varchar](100) NULL,
	[DrawingId] [int] NULL,
	[SampleRequired] [varchar](100) NULL,
	[DeliveryTermId] [int] NULL,
	[DocumentRequired] [varchar](100) NULL,
	[Advance] [decimal](10,2) NULL,
	[PreparedbyEmpNameId] [int] Null,
	[ApprovedbyEmpNameId] [int] Null,
	[ReviewedByEmpNameId] [int] Null,
	[ItemSubject] [varchar](100) NULL,
	[ItemTerms] [varchar](100) NULL,
	[ToolSubject] [varchar](100) Null,
	[ToolTerms] [varchar](100) Null,
	[QuotationId] int references QuotationMasterFinal(QuotationId) on delete cascade on update cascade);	
	
	
Alter procedure insertintoquotationfinal1
(@ID int ,
@ToolMouldId int,
@DeliveryLeadTime datetime,
@PackingCost decimal(10,2),
@DevelopmentToolCost decimal(10, 2),
@MouldCost decimal(10,2),
@MouldCavity int ,
@OtherCost decimal(10,2),
@OtherCostRemark varchar(100),
@Material varchar(100),
@UnitId int,
@Ecess varchar(100),
@ServiceTax decimal(10,2),
@Excise varchar(100),
@SaleTax decimal(10,2),
@PaymentTypeId int,
@TransportId int ,
@FreightId int,
@PlanTypeId int,
@PackingId int ,
@StatusId int,
@AgainstForm varchar(100),
@Remark varchar(100),
@DrawingId int,
@SampleRequired varchar(100),
@DeliveryTermId int,
@DocumentRequired varchar(100),
@Advance decimal(10,2),	
@PreparedbyEmpNameId int,
@ApprovedbyEmpNameId int,
@ReviewedByEmpNameId int ,
@ItemSubject varchar(100) ,
@ItemTerms varchar(100) ,
@ToolSubject varchar(100),
@ToolTerms varchar(100),	
@QuotationId int
)
As
Begin
Insert into QuotationDetailFinal1
(ID,
ToolMouldId,
DeliveryLeadTime,
PackingCost,
DevelopmentToolCost,
MouldCost,
MouldCavity,
OtherCost,
OtherCostRemark,
Material,
UnitId,
Ecess,
ServiceTax,
Excise ,
SaleTax,
PaymentTypeId,
TransportId,
FreightId,
PlanTypeId,
PackingId,
StatusId,
AgainstForm,		
Remark,
DrawingId,
SampleRequired ,
DeliveryTermId ,
DocumentRequired ,
Advance ,	
PreparedbyEmpNameId ,
ApprovedbyEmpNameId ,
ReviewedByEmpNameId  ,
ItemSubject  ,
ItemTerms  ,
ToolSubject ,
ToolTerms ,
QuotationId)
values
(@ID,
@ToolMouldId,
@DeliveryLeadTime ,
@PackingCost,
@DevelopmentToolCost,
@MouldCost,
@MouldCavity,
@OtherCost,
@OtherCostRemark,
@Material,
@UnitId ,
@Ecess,
@ServiceTax ,
@Excise ,
@SaleTax ,	
@PaymentTypeId ,
@TransportId ,
@FreightId ,
@PlanTypeId ,
@PackingId ,
@StatusId ,
@AgainstForm ,
@Remark,
@DrawingId,
@SampleRequired ,
@DeliveryTermId ,
@DocumentRequired ,
@Advance ,	
@PreparedbyEmpNameId ,
@ApprovedbyEmpNameId ,
@ReviewedByEmpNameId  ,
@ItemSubject  ,
@ItemTerms  ,
@ToolSubject ,
@ToolTerms ,
@QuotationId)
End;	



Create proc GetAllQuotationData
As
Begin
Select Q.WithEnquiry,Q.EnquiryId,Q.RevisionNumber,Q.QuotationNumber,Q.QuotationDate,Q.IsNewCustomer,Q.NewCustomerName,Q.NewCustomerCode,Q.Id,
Q.[Address],Q.ContactPerson,Q.Quantity,Q.Rate,Q.SymbolId,
Qt.ID,QT.ToolMouldId,Qt.DeliveryLeadTime,Qt.PackingCost,Qt.DevelopmentToolCost,Qt.MouldCost,Qt.MouldCavity,Qt.OtherCost,Qt.OtherCostRemark,Qt.Material,Qt.UnitId,Qt.Ecess,
Qt.ServiceTax,Qt.Excise,Qt.SaleTax,Qt.PaymentTypeId,Qt.TransportId,Qt.FreightId,Qt.PlanTypeId,Qt.PackingId,Qt.StatusId,Qt.AgainstForm,Qt.Remark,
Qt.DrawingId,Qt.SampleRequired,Qt.DeliveryTermId,Qt.DocumentRequired,Qt.Advance,Qt.PreparedByEmpNameId,Qt.ApprovedbyEmpNameId,ReviewedByEmpNameId,
Qt.ItemSubject,Qt.ItemTerms,Qt.ToolSubject,Qt.ToolTerms from QuotationMasterFinal Q inner join QuotationDetailFinal1 Qt on Q.QuotationId = Qt.QuotationId ;
end;



select * from Marketing_EnquiryMaster;
Select * from CustomerMaster;
Select * from QuotationDetailFinal1;
Select * from QuotationMasterFinal;
Select * from ToolMaster;
Select * from ItemMaster;
Select * from Marketing_EnquiryDetailMaster;

Create procedure GetAllQuotationData1
@QuotationId int = 0
As
Begin
if(@QuotationId=0)
Begin
Select QM.QuotationId,QM.WithEnquiry,QM.EnquiryId,QM.RevisionNumber,QM.QuotationNumber,QM.QuotationDate,QM.IsNewCustomer,QM.Id,
QM.NewCustomerName,QM.NewCustomerCode,QM.Quantity,QM.Rate,QM.SymbolId,

CM.Id,CM.CustCode,CM.CustName,CM.ContactPerson,CM.Address1,

IM.ID,IM.ItemCode,IM.ItemName,IM.Material,IM.UnitId,

TM.ToolMouldId,TM.ToolMouldCode,TM.ToolmouldName,TM.DeliveryLeadTime,TM.PackingCost,TM.DevelopmentToolCost,
TM.MouldCost,TM.MouldCavity,TM.OtherCost,TM.OtherCostRemark,

QT.QuatationDetailId,QT.ID,QT.ToolMouldId,QT.Ecess,Qt.ServiceTax,Qt.Excise,Qt.SaleTax,Qt.PaymentTypeId,Qt.TransportId,Qt.FreightId,Qt.PlanTypeId,Qt.PackingId,Qt.StatusId,Qt.AgainstForm,Qt.Remark,
Qt.DrawingId,Qt.SampleRequired,Qt.DeliveryTermId,Qt.DocumentRequired,Qt.Advance,Qt.PreparedByEmpNameId,Qt.ApprovedbyEmpNameId,ReviewedByEmpNameId,
Qt.ItemSubject,Qt.ItemTerms,Qt.ToolSubject,Qt.ToolTerms from QuotationDetailFinal1 Qt inner join QuotationMasterFinal QM on Qt.QuotationId=QM.QuotationId
inner join CustomerMaster CM on QM.Id=CM.Id
inner join ItemMaster IM on IM.ID=QT.ID
inner join ToolMaster TM on TM.ToolMouldId=QT.ToolMouldId
End
Else
Begin
Select QM.QuotationId,QM.WithEnquiry,QM.EnquiryId,QM.RevisionNumber,QM.QuotationNumber,QM.QuotationDate,QM.IsNewCustomer,QM.Id,
QM.NewCustomerName,QM.NewCustomerCode,QM.Quantity,QM.Rate,QM.SymbolId,
CM.Id,CM.CustCode,CM.CustName,CM.ContactPerson,CM.Address1,
IM.ID,IM.ItemCode,IM.ItemName,IM.Material,IM.UnitId,
TM.ToolMouldId,TM.ToolMouldCode,TM.ToolmouldName,TM.DeliveryLeadTime,TM.PackingCost,TM.DevelopmentToolCost,
TM.MouldCost,TM.MouldCavity,TM.OtherCost,TM.OtherCostRemark,

QT.QuatationDetailId,QT.ID,QT.ToolMouldId,QT.Ecess,Qt.ServiceTax,Qt.Excise,Qt.SaleTax,Qt.PaymentTypeId,Qt.TransportId,Qt.FreightId,Qt.PlanTypeId,Qt.PackingId,Qt.StatusId,Qt.AgainstForm,Qt.Remark,
Qt.DrawingId,Qt.SampleRequired,Qt.DeliveryTermId,Qt.DocumentRequired,Qt.Advance,Qt.PreparedByEmpNameId,Qt.ApprovedbyEmpNameId,ReviewedByEmpNameId,
Qt.ItemSubject,Qt.ItemTerms,Qt.ToolSubject,Qt.ToolTerms from QuotationDetailFinal1 Qt inner join QuotationMasterFinal QM on Qt.QuotationId=QM.QuotationId
inner join CustomerMaster CM on QM.Id=CM.Id
inner join ItemMaster IM on IM.ID=QT.ID
inner join ToolMaster TM on TM.ToolMouldId=QT.ToolMouldId
where QM.QuotationId=@QuotationId
End
End

Update QuotationMasterFinal set QuotationNumber='QTN001' where QuotationId=1;
Update QuotationMasterFinal set QuotationNumber='QTN002',RevisionNumber='REV002' where QuotationId=2;
Update QuotationMasterFinal set QuotationNumber='QTN003',RevisionNumber='REV003' where QuotationId=3;