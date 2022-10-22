use StandardMetalDB;


Select * from QuotationMasterFinal;

--Drop table QuotationMasterFinal;

Alter procedure InsertIntoQuotationMaster(
@WithEnquiry bit,
@EnquiryId varchar(100),
@RevisionNumber varchar(100),
@QuotationNumber varchar(100),
@QuotationDate datetime,
@IsNewCustomer bit,
@NewCustomerName varchar(100),
@NewCustomerCode varchar(100),
@Id int,
--@CustomerName varchar(100),
--@CustomerCode varchar(100),
@Address varchar(100),
@ContactPerson varchar(100),
@Quantity int,
@Rate int,
@SymbolId int,
@LoginUserId int,
@BranchId int,
@SystemEntryDate datetime,
@QuotationId int out)
As
begin
Insert into QuotationMasterFinal
(WithEnquiry,
EnquiryId,
RevisionNumber,
QuotationNumber,
QuotationDate,
IsNewCustomer,
NewCustomerName,
NewCustomerCode,
Id,
--CustomerName,
--CustomerCode,
[Address],
ContactPerson,
Quantity,
Rate,
SymbolId,
LoginUserId,
BranchId,
SystemEntryDate)
values
(@WithEnquiry,
@EnquiryId,
@RevisionNumber,
@QuotationNumber,
@QuotationDate,
@IsNewCustomer,
@NewCustomerName,
@NewCustomerCode,
@Id,
--@CustomerName,
--@CustomerCode,
@Address,
@ContactPerson,
@Quantity,
@Rate,
@SymbolId,
@LoginUserId,
@BranchId,
@SystemEntryDate)
SET @QuotationId = (SELECT SCOPE_IDENTITY())
End;

Select * from QuotationDetailFinal;

Select * from Marketing_