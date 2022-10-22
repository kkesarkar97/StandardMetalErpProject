use StandardMetalDB;


Create Table ToolTermsMaster(
ToolId int primary key identity(1,1),
ToolMouldCode varchar(100),
ToolMouldName varchar(100),
MouldCost decimal(10,2),
MouldCavity int,
OtherCost decimal(10,2),
OtherCostRemark varchar(100),
ToolSubject varchar(100),
ToolTerms varchar(100),
PreparedbyEmpCodeId int,
PreparedbyEmpNameId int,
ApprovedbyEmpCodeId int,
ApprovedbyEmpNameId int,
ReviewedByEmpCodeId int,
ReviewedByEmpNameId int);
