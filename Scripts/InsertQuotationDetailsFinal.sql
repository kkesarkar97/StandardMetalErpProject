use StandardMetalDB;

Select * from QuotationDetailFinal;

Alter procedure InsertIntoQuotationDetails
(@ID int,
@ToolMouldId int,
@DeliveryLeadTime datetime,
@PackingCost decimal(10,2),
@DevelopmentToolCost decimal(10,2),
@MouldCost decimal(10,2),
@MouldCavity int,
@OtherCost decimal(10,2),
@OtherCostRemark varchar(100),
@Material varchar(100),
@UnitId int,
@Ecess varchar(100),
@ServiceTax int,
@Excise varchar(100),
@SaleTax int,
@PaymentTypeId int ,
@QuotationId int)
As
Begin
Insert into QuotationDetailFinal(
ID,
ToolMouldId ,
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
Excise,
SaleTax,
PaymentTypeId,
QuotationId)
values
(@ID,
@ToolMouldId ,
@DeliveryLeadTime,
@PackingCost,
@DevelopmentToolCost,
@MouldCost,
@MouldCavity,
@OtherCost,
@OtherCostRemark,
@Material,
@UnitId ,
@Ecess,
@ServiceTax,
@Excise,
@SaleTax,
@PaymentTypeId,
@QuotationId)
End;

exec InsertIntoQuotationDetails 1,1,1,'2022-10-11',1000,20000,3000.00,2,3000.00,'Get It','Alu',9,'Yes',1000,'No',2000,1,1
exec InsertIntoQuotationDetails 2,2,3,3,'2022-10-11',2000.00,3000.00,12000.00,2,10000,'Get It','Alu',9,'Yes',1000,'No',1000,1,1
Select * from QuotationDetailFinal;
Select * from QuotationMasterFinal;