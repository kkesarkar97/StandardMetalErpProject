<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestForm.aspx.cs" Inherits="NavnathWebsite.Purchase.TestForm" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <div>
       Language:
    <asp:DropDownList ID="ddlLanguages" runat="server" AutoPostBack="true">
        <asp:ListItem Text="English" Value="en-US" />
        <asp:ListItem Text="French" Value="fr" />
        <asp:ListItem Text="Marathi" Value="mr-IN" />
    </asp:DropDownList>

    <br />
<br />
<br />



<asp:Label ID="lblShow" runat="server" Text="Label" meta:resourcekey="lblShowResource1" 
         ></asp:Label>

</div>
    </div>
    </form>
</body>
</html>
