<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxCallFrom.aspx.cs" Inherits="NavnathWebsite.Masters.JsMaster.AjaxCallFrom" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
    
    
     <script src="../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
     <script>
     $(document).ready(function () {

var ddlItemName=$("[id*=drpItemType]");

    //fill the item code and item code
$.ajax({
     //type:"GET",
       type:"POST",
   // alert('its working');
       url: "AjaxCallFrom.aspx/FillItemMaster",
    data: '{name:"aarti"}',
    contentType:"application/json;charset=utf-8",
    dataType:"json",
    success:OnSuccess,
    failure:function (response) {
    alert(response.d);
    }
});
function OnSuccess(response){
var StateCodeList=response.d;
alert(StateCodeList);
$.each(StateCodeList,function (){
       ddlItemCode.append($("<option></option>").val(this['EmpId']).html(this['EmpName']));
       
       });
       }

       });
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
