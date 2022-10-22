Use StandardMetalDB;


Alter function GetAutoGenQuotationNumber(@IsNewCustomer bit,@NewCustomerName varchar(max))
Returns varchar(100)
As
Begin
Declare @QuotationNumber varchar(100)
If Not Exists(Select 1 from QuotationMasterFinal) 
Begin
If(@IsNewCustomer=1)
	Begin
	SET @QuotationNumber= (Select Upper(SUBSTRING(@NewCustomerName,1,2)))
	END
	Else
	Begin
	Declare @ExistCustomerName varchar(100)=(Select CustName from CustomerMaster where Id=(Select max(Id) from CustomerMaster))
	--Print 'Exists' + @ExistCustomerName
	Set @QuotationNumber  = ((Select Upper(SUBSTRING(@ExistCustomerName, 1, 2)))) 
	END
 Return @QuotationNumber 
END
Declare @CustomerCode varchar(100)=(Select CustCode from CustomerMaster where Id=(Select max(Id) from CustomerMaster))
Declare @LastCustNumber varchar(100)=(Select Substring(@CustomerCode,5,LEN(@CustomerCode)))+1
Declare @FinalNumber varchar(100)=(Select dbo.FourDigitAutoGenNumber(@LastCustNumber))
Return ('QTN' + '/' +@QuotationNumber + '/' + @FinalNumber)
End


Select dbo.GetAutoGenQuotationNumber(1,'Shobhana');

Declare @ExistCustomerName varchar(100)=(Select CustName from CustomerMaster where Id=(Select max(Id) from CustomerMaster))
	Print 'Exists ' + @ExistCustomerName

(Select * from CustomerMaster where Id=(Select max(Id) from CustomerMaster));
Select * from CustomerMaster;
Select * from CustomerPOMaster;

Select * from dbo.SplitString('kaustubh kesarkar',' ');


GO

Create FUNCTION [dbo].[SplitString]
(
  @List     nvarchar(max),
  @Delim    nvarchar(255)
)
RETURNS TABLE
AS
  RETURN ( SELECT [Value] FROM 
  ( 
    SELECT [Value] = LTRIM(RTRIM(SUBSTRING(@List, [Number],
      CHARINDEX(@Delim, @List + @Delim, [Number]) - [Number])))
    FROM (SELECT Number = ROW_NUMBER() OVER (ORDER BY name)
      FROM sys.all_columns) AS x WHERE Number <= LEN(@List)
      AND SUBSTRING(@Delim + @List, [Number], DATALENGTH(@Delim)/2) = @Delim
    ) AS y
  );
GO