<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JQuery_BindDDL.aspx.cs" Inherits="JQueryAjaxCall.JQuery_BindDDL" %>

<!DOCTYPE html>

<html >
<head runat="server">
    <title></title> 
     
   <script src="../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script>

        $(document).ready(function () {
            alert('checked..');
            
             //Fill the Item code and Item Name
          
              $.ajax({
           // type: "GET",
               type: "POST",
               url: "../JsMaster/JQuery_BindDDL.aspx/FillItemMaster",
              // url: "http://localhost:50549/api/ItemMaster/TestAPI",
               //url: "http://localhost:62335/ItemMaster/FillItemMaster",
              // url : "http://localhost:54976/api/ItemMaster/GetVS10",
           
            data: '{name: "aalim"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            failure: function (response) {
                alert(response.d);
            }
        });

            function OnSuccess(response) {
                  
                alert('Success');
                     

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
