<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SupplierPO.aspx.cs" Inherits="NavnathWebsite.Purchase.SupplierPO" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>







<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />     
  <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css"  type="text/css"/>
  <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css"  type="text/css"/>
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css"  type="text/css"/>
  <link rel="stylesheet" href="../dist/css/skins/skin-blue.min.css"  type="text/css"/>
  <link rel="stylesheet" href="../bower_components/select2/dist/css/select2.min.css"  type="text/css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic" type="text/css" />

  <link href="../Styles/CommomStyles.css" rel="stylesheet" type="text/css" />
  <link href="../Styles/GridCode.css" rel="stylesheet" type="text/css" />


<script src="../bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>
<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../dist/js/adminlte.min.js" type="text/javascript"></script>
<script src="../bower_components/datatables.net/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="../bower_components/select2/dist/js/select2.full.min.js" type="text/javascript"></script>

<script type="text/javascript">
    $(function () {

        $('.select2').select2()
    })
    </script>

    <style type="text/css">
        .style2
        {
            height: 310px;
        }
    </style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
</asp:Content>






<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="server">

    <div class="col-lg-12 col-md-12">
<section id="SupplierPO">
<div class="col-lg-12 col-md-12">


<%--Approved Indent Drpdown--%>

<div class="box box-info">
<div class="box-body">

<div class="row top-buffer"> 

<div class="col-md-4">

<asp:Label ID="lblAutoApprovedIndent" runat="server" Text="Approved Indent"></asp:Label> 

</div>

<div class="col-md-4">
 
<asp:DropDownList ID="drpAutoApprovedIndent" runat="server" CssClass="form-control select2" 
        onselectedindexchanged="drpAutoApprovedIndent_SelectedIndexChanged"></asp:DropDownList>
</div>

<div class="col-md-4">
 
</div>
<%--<div class="col-md-3">
  
</div>--%>

</div> <%--row close --%>

</div><!--box-body-->
</div> <!--box info-->



<div class="box box-info">
<div class="box-header with-border">
<%--<h3 class="box-title">Search Supplier</h3>--%>
<div class="box-tools pull-right">
<button type="button" class="btn btn-box-tool" data-widget="collapse">
<i class="fa fa-minus"></i>
</button>

</div><!--box-tool -->
</div><!--box-header -->

<div class="box-body">

<div class="row top-buffer">

<div class="col-md-2">

<asp:Label ID="lblSearchSupplier" runat="server" Text="Search Supplier"></asp:Label>

</div>

<div class="col-md-2">

<asp:Label ID="lblCodeWise" runat="server" Text="CodeWise"></asp:Label>
<asp:RadioButton ID="radCodeWise" runat="server" GroupName="S1"   ></asp:RadioButton>

</div>


<div class="col-md-2">

<asp:Label ID="lblNameWise" runat="server" Text="NameWise"></asp:Label>
<asp:RadioButton ID="radNameWise" runat="server" Checked="True" GroupName="S1" ></asp:RadioButton>

</div>


<div class="col-md-2">

<asp:DropDownList ID="drpSearchSupplier" runat="server" CssClass="form-control select2"   
        ></asp:DropDownList>


</div>


<div class="col-md-2">

</div>


<div class="col-md-2">

</div>


</div> <!--Row class close -->

</div><!--box-body-->
</div> <!--box info-->




<%--Supplier Po Drpdwn --%>

<div class="box box-info">
<div class="box-body">

<div class="row top-buffer"> 
<div class="col-md-4">

<asp:Label ID="lblAutoSupplierPO" runat="server" Text="Supplier PO"></asp:Label> 

</div>

<div class="col-md-4">
 
<asp:DropDownList ID="drpAutoSupplierPO" runat="server" CssClass="form-control select2"></asp:DropDownList>

</div>


<div class="col-md-4">
 
</div>
 
 
<div class="col-md-3">
  
</div>

</div> <!--row class-->

</div><!--box-body-->
</div> <!--box info-->





<div class="box box-info">

<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" 
        ValidationGroup="G1" ShowSummary="False"></asp:ValidationSummary>



<div class="box-header with-border">
<h3 class="box-title">
<asp:Label ID="lblSupplierDetails" runat="server" Text="Supplier Details"></asp:Label>
</h3>

<div class="box-tools pull-right">
<button type="button" class="btn btn-box-tool" data-widget="collapse">
<i class="fa fa-minus"></i>
</button>
</div><!--box-tool -->
</div><!--box-header -->



<div class="box-body">

<%--<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblPOId" runat="server" Text="PO No"></asp:Label>

</div>


<div class="col-md-3">

<asp:TextBox ID="txtSupplierPoId" runat="server" CssClass="form-control input-sm"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Please Enter SupplierPo Id" ControlToValidate="txtSupplierPoId" 
        ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator>


</div>


<div class="col-md-3">

<asp:Label ID="lblItemNo" runat="server" Text="Item No"></asp:Label>

</div>


<div class="col-md-3">

<asp:TextBox ID="txtItemNo" runat="server" CssClass="form-control input-sm"></asp:TextBox>

</div>
</div>--%><!--row class close-->


<div class="row top-buffer">


<div class="col-md-3">

<asp:Label ID="lblPONo" runat="server" Text="PO No"></asp:Label>

</div>

<div class="col-md-3">

<asp:TextBox ID="txtPONo" runat="server" CssClass="form-control input-sm"></asp:TextBox>  
 
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ErrorMessage="Please Enter Po No" ControlToValidate="txtPONo" 
        ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator>
  
</div>




<div class="col-md-3">

<asp:Label ID="lblSupplierCode" runat="server" Text="Supplier Code"></asp:Label>

</div>

<div class="col-md-3">

<asp:TextBox ID="txtSupplierCode" runat="server" CssClass="form-control input-sm"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="Please Enter Supplier Code" ControlToValidate="txtSupplierCode" 
        ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator>

</div>



</div><!--row class close-->

<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblSupplierName" runat="server" Text="Supplier Name"></asp:Label>

</div>

<div class="col-md-3">

<asp:TextBox ID="txtSupplierName" runat="server" CssClass="form-control input-sm"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ErrorMessage="Please Enter Supplier Name" ControlToValidate="txtSupplierName" 
        ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator>

</div>


<div class="col-md-3">

<asp:Label ID="lblPODate" runat="server" Text="PO Date"></asp:Label>

</div>

<div class="col-md-3">

<asp:TextBox ID="txtPODate" runat="server" CssClass="form-control input-sm"></asp:TextBox>
<cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtPODate" Format="MM/dd/yyyy" ></cc1:CalendarExtender>
 
</div>
</div><!--row class close-->

<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblQuotationNo" runat="server" Text="Quotation No"></asp:Label>

</div>


<div class="col-md-3">

<asp:TextBox ID="txtQuotationNo" runat="server" CssClass="form-control input-sm"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ErrorMessage="Please Enter Quotation No" ControlToValidate="txtQuotationNo" 
        ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator>

</div>


<div class="col-md-3">

<asp:Label ID="lblQuotationDate" runat="server" Text="Quotation Date"></asp:Label>

</div>

<div class="col-md-3">

<asp:TextBox ID="txtQuotationDate" runat="server" CssClass="form-control input-sm"></asp:TextBox>

<cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtQuotationDate" Format="MM/dd/yyyy" ></cc1:CalendarExtender>
  
</div>
</div><!--row class close-->

</div><!--box-body-->
</div> <!--box info-->




<div class="box box-info">

<asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="True" 
        ValidationGroup="G2" ShowSummary="False"></asp:ValidationSummary>

<div class="box-header with-border">

<h3 class="box-title">
<asp:Label ID="lblItemDetails" runat="server" Text="Item Details"></asp:Label>
</h3>

<div class="box-tools pull-right">
<button type="button" class="btn btn-box-tool" data-widget="collapse">
<i class="fa fa-minus"></i>
</button>
</div><!--box-tool -->
</div><!--box-header -->

<div class="box-body">

<div class="row top-buffer">
<div class="md-col-4">

<asp:CheckBox ID="chkWithIndent" runat="server" Text="With Indent" AutoPostBack="true"
        oncheckedchanged="chkWithIndent_CheckedChanged"></asp:CheckBox>
</div>

<div class="md-col-4">
</div>

<div class="md-col-4">
</div>

<div class="md-col-4">
</div>
</div><!--row class close-->


<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblItemName" runat="server" Text="Item Name"></asp:Label>

</div>

<div class="col-md-3">

<asp:DropDownList ID="drpItemName" runat="server" CssClass="form-control select2" AutoPostBack="true" 
                        onselectedindexchanged="drpItemName_SelectedIndexChanged"></asp:DropDownList>


<asp:CompareValidator ID="CompareValidator6" runat="server" 
        ErrorMessage="Please Select Item Name " ValidationGroup="G2" ForeColor="Red" 
        ControlToValidate="drpItemName" Operator="NotEqual" ValueToCompare="Select"></asp:CompareValidator>


</div>


<div class="col-md-3">

<asp:Label ID="lblApprovedIndent" runat="server" Text="Approved Indent"></asp:Label>

</div>


<div class="col-md-3">

<asp:DropDownList ID="drpApprovedIndent" runat="server" CssClass="form-control select2" 
        AutoPostBack="True" onselectedindexchanged="drpApprovedIndent_SelectedIndexChanged"></asp:DropDownList>

</div>
</div><!--row class close-->


<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblItemCode" runat="server" Text="Item Code"></asp:Label>

</div>

<div class="col-md-3">

<asp:DropDownList ID="drpItemCode" runat="server" CssClass="form-control select2" 
        AutoPostBack="True" 
        onselectedindexchanged="drpItemCode_SelectedIndexChanged" ></asp:DropDownList>


<asp:CompareValidator ID="CompareValidator1" runat="server" 
        ErrorMessage="Please Select Item Code " ValidationGroup="G2" ForeColor="Red" 
        ControlToValidate="drpItemCode" Operator="NotEqual" ValueToCompare="Select"></asp:CompareValidator>

      
</div>


<div class="col-md-3">

<asp:Label ID="lblUnit" runat="server" Text="Unit"></asp:Label>

</div>


<div class="col-md-3">

<asp:DropDownList ID="drpUnit" runat="server" CssClass="form-control select2"></asp:DropDownList>

<asp:CompareValidator ID="CompareValidator2" runat="server" 
        ErrorMessage="Please Select Unit " ValidationGroup="G2" ForeColor="Red" 
        ControlToValidate="drpUnit" Operator="NotEqual" ValueToCompare="Select"></asp:CompareValidator>
    

</div>
</div><!--row class close-->


<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblQuantity" runat="server" Text="Quantity"></asp:Label>

</div>


<div class="col-md-3">

<asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control input-sm"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
        ErrorMessage="Please Enter Quantity" ControlToValidate="txtQuantity" 
        ForeColor="Red" ValidationGroup="G2"></asp:RequiredFieldValidator>
      
</div>



<div class="col-md-3">

<asp:Label ID="lblRate" runat="server" Text="Rate"></asp:Label>

</div>

<div class="col-md-3"> 

<asp:TextBox ID="txtRate" runat="server" CssClass="form-control input-sm"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
        ErrorMessage="Please Enter Rate" ControlToValidate="txtRate" 
        ForeColor="Red" ValidationGroup="G2"></asp:RequiredFieldValidator>
      

</div>
</div><!--row class close-->


<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblExcise" runat="server" Text="Excise"></asp:Label>

</div>


<div class="col-md-3">

<asp:TextBox ID="txtExcise" runat="server" CssClass="form-control input-sm"></asp:TextBox>
<span class="input-group-addon"><i class="fa fa-percent"></i></span>
   
<asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
        ErrorMessage="Please Enter Excise" ControlToValidate="txtExcise" 
        ForeColor="Red" ValidationGroup="G2"></asp:RequiredFieldValidator>
      
     
</div>


<div class="col-md-3">

<asp:Label ID="lblTaxType" runat="server" Text="Tax Type"></asp:Label>

</div>


<div class="col-md-3">

<asp:RadioButton ID="radGST" runat="server" Text="GST"></asp:RadioButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</div>
</div><!--row class close-->


<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblVAT" runat="server" Text="VAT"></asp:Label>

</div>


<div class="col-md-3">

<asp:TextBox ID="txtVAT" runat="server" CssClass="form-control input-sm"></asp:TextBox>
<span class="input-group-addon"><i class="fa fa-percent"></i></span>
      
</div>


<div class="col-md-3">

<asp:Label ID="lblDiscount" runat="server" Text="Discount"></asp:Label>

</div>

<div class="col-md-3">

<asp:TextBox ID="txtDiscount" runat="server" CssClass="form-control input-sm"></asp:TextBox><span class="input-group-addon"><i class="fa fa-percent"></i></span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
        ErrorMessage="Please Enter Discount" ControlToValidate="txtDiscount" 
        ForeColor="Red" ValidationGroup="G2"></asp:RequiredFieldValidator>
    

</div>

</div><!--row class close-->




<h3 class="box box-title">
<asp:Label ID="lblScheduleDetails" runat="server" Text="Schedule Details"></asp:Label>
</h3>
<div class="box-tools">


<div class="row top-buffer">
<div class="col-md-4">


<asp:CheckBox ID="chkShedule" runat="server" Text="Schedule-1"></asp:CheckBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtScedule1" runat="server"></asp:TextBox>

<cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtScedule1" Format="dd/MM/yyyy" ></cc1:CalendarExtender>

</div>


<div class="col-md-4">

<asp:CheckBox ID="chkSchedule2" runat="server" Text="Schedule-2"></asp:CheckBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtSchedule2" runat="server"></asp:TextBox>

<cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtSchedule2" Format="dd/MM/yyyy" ></cc1:CalendarExtender>
     
</div>



<div class="col-md-4">

<asp:CheckBox ID="chkSchedule3" runat="server" Text="Schedule-3"></asp:CheckBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtSchedule3" runat="server"></asp:TextBox>

<cc1:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtSchedule3" Format="MM/dd/yyyy" ></cc1:CalendarExtender>


</div>
</div><!--row class close-->

<div class="row top-buffer">

<div class="col-md-4">

<asp:CheckBox ID="chkSchedule4" runat="server" Text="Schedule-4"></asp:CheckBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtSchedule4" runat="server"></asp:TextBox>

<cc1:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="txtSchedule4" Format="MM/dd/yyyy" ></cc1:CalendarExtender>

</div>


<div class="col-md-4">

<asp:CheckBox ID="chkSchedule5" runat="server" Text="Schedule-5"></asp:CheckBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtSchedule5" runat="server"></asp:TextBox>

<cc1:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID="txtSchedule5" Format="MM/dd/yyyy" ></cc1:CalendarExtender>
     
</div>


<div class="col-md-4">

</div>

</div><!--row class close-->

</div><!--box-tools-->
</div> <!--box body-->
</div> <!--box info-->
</div><!--div class col md 12 close-->



<div class="row top-buffer">
<center>

<asp:Button ID="btnAddItem" runat="server" Text="Add" CssClass="btn btn-success" 
        onclick="btnAddItem_Click" ValidationGroup="G2"></asp:Button>

</center>
</div>



<div class="box box-info">
<div class="box-header with-border">
<div class="box-tools pull-right">
<button type="button" class="btn btn-box-tool" data-widget="collapse">
<i class="fa fa-minus"></i>
</button>
</div><!--box-tool -->
</div><!--box-header -->

<div class="box-body" width="100px">

<div style="width: 100%; height: 150px;  overflow:scroll; clear: both; border: 1px solid #808080;">

<asp:GridView  runat="server" ID="grdSupplierPO"  AutoGenerateColumns="False" EmptyDataText="NO DATA FOUND"
                    ShowHeaderWhenEmpty="True" Width="100%"  TabIndex="7" CellPadding="4"   AllowSorting="True" 
                    style="margin-top: 0px" onrowcommand="grdSupplierPO_RowCommand">
                    
<AlternatingRowStyle Wrap="False" />

<HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" Wrap="True" />
<RowStyle BackColor="White" Wrap="False" />
<SelectedRowStyle Wrap="False" />
<Columns >
    
    
     
<asp:TemplateField HeaderText="Item Code">
<ItemTemplate>
     
<asp:Label ID="ID1" runat="server" Text='<%#Eval("ID1") %>'></asp:Label>
     
</ItemTemplate>
</asp:TemplateField>




<asp:TemplateField HeaderText="Item Name">
<ItemTemplate>

<asp:Label ID="ID2" runat="server" Text='<%#Eval("ID2") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>




<asp:TemplateField HeaderText=" Approved Indent">
<ItemTemplate>

<asp:Label ID="ID3" runat="server" Text='<%#Eval("ID3") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>




<asp:TemplateField HeaderText="Unit">
<ItemTemplate>

<asp:Label ID="ID4" runat="server" Text='<%#Eval("ID4") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>



<asp:TemplateField HeaderText="Quantity">
<ItemTemplate>

<asp:Label ID="ID5" runat="server" Text='<%#Eval("ID5") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>



<asp:TemplateField HeaderText="Rate">
<ItemTemplate>

<asp:Label ID="ID6" runat="server" Text='<%#Eval("ID6") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>



<asp:TemplateField HeaderText="Excise">
<ItemTemplate>

<asp:Label ID="ID7" runat="server" Text='<%#Eval("ID7") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="VAT">
<ItemTemplate>

<asp:Label ID="ID8" runat="server" Text='<%#Eval("ID8") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>



<asp:TemplateField HeaderText="Discount">
<ItemTemplate>

<asp:Label ID="ID9" runat="server" Text='<%#Eval("ID9") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="Schedule Date-1">
<ItemTemplate>

<asp:Label ID="ID10" runat="server" Text='<%#Eval("ID10") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>



<asp:TemplateField HeaderText="Schedule Date-2">
<ItemTemplate>

<asp:Label ID="ID11" runat="server" Text='<%#Eval("ID11") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>




<%--<asp:TemplateField HeaderText="Approved">
<ItemTemplate>

<asp:CheckBox ID="chkApproved" runat="server"></asp:CheckBox>

</ItemTemplate>
</asp:TemplateField>--%>


<asp:TemplateField HeaderText="Edit">
<ItemTemplate>


<asp:LinkButton ID="btnEdit" runat="server" Text="<i class='fa fa-pencil-square-o' aria-hidden='true' style='font-size:20px;'></i>" CommandName="RowEditing"
                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>


</ItemTemplate>
</asp:TemplateField> 


<asp:TemplateField HeaderText="Remove">
<ItemTemplate>


<asp:LinkButton ID="btnRemove" runat="server" Text="<i class='fa fa-trash-o' aria-hidden='true' style='font-size:20px;'></i>" CommandName="Remove"
                      CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ></asp:LinkButton>


</ItemTemplate>
</asp:TemplateField>


</Columns>
</asp:GridView>
</div>
</div><!--box-body-->
</div> <!--box info-->


<div class="box box-info">
<div class="box-header with-border">
<h3 class="box-title">
<asp:Label ID="lblOtherDetails" runat="server" Text="Other Details">
</asp:Label>
</h3>
<div class="box-tools pull-right">
<button type="button" class="btn btn-box-tool" data-widget="collapse">
<i class="fa fa-minus"></i>
</button>
</div><!--box-tool -->
</div><!--box-header -->





<div class="box-body">

<div class="row top-buffer">

<div class="col-md-3">

<asp:Label ID="lblOtherDtls" runat="server" Text="Inspection/Test Report"></asp:Label>

</div>

<div class="col-md-3">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkTC" runat="server" Text="TC"></asp:CheckBox>&nbsp;&nbsp;&nbsp;&nbsp;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:CheckBox ID="chkPDI" runat="server" Text="PDI"></asp:CheckBox> </td>  
</div>

<div class="col-md-3">

</div>

<div class="col-md-3">

</div>
</div><!--row class close-->


<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblPayment" runat="server" Text="Payment Type"></asp:Label>

</div>


<div class="col-md-3">

<asp:DropDownList ID="drpPayment" runat="server" CssClass="form-control select2" 
        AutoPostBack="false" ></asp:DropDownList>
   
<asp:CompareValidator ID="CompareValidator3" runat="server" 
        ErrorMessage="Please Select PaymentType " ValidationGroup="G1" ForeColor="Red" 
        ControlToValidate="drpPayment" Operator="NotEqual" ValueToCompare="Select"></asp:CompareValidator>
  
</div>


<div class="col-md-3">

<asp:Label ID="lblPacking" runat="server" Text="Packing"></asp:Label>

</div>

<div class="col-md-3">

<asp:TextBox ID="txtPacking" runat="server" CssClass="form-control input-sm"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
        ErrorMessage="Please Enter Packing" ControlToValidate="txtPacking" 
        ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator>
  

</div>
</div><!--row class close-->


<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblHeight" runat="server" Text="Height"></asp:Label>

</div>

<div class="col-md-3">

<asp:TextBox ID="txtHeighgt" runat="server" CssClass="form-control input-sm"></asp:TextBox>
    
<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
        ErrorMessage="Please Enter Height" ControlToValidate="txtHeighgt" 
        ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator>    
     
</div>


<div class="col-md-3">

<asp:Label ID="lblTransport" runat="server" Text="Transport Type"></asp:Label>

</div>

<div class="col-md-3">

<asp:DropDownList ID="drpTransport" runat="server" CssClass="form-control select2"><asp:ListItem>Select</asp:ListItem></asp:DropDownList>

<asp:CompareValidator ID="CompareValidator4" runat="server" 
        ErrorMessage="Please Select TransportType " ValidationGroup="G1" ForeColor="Red" 
        ControlToValidate="drpTransport" Operator="NotEqual" ValueToCompare="Select"></asp:CompareValidator>
  

</div>
</div><!--row class close-->


<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblAmount" runat="server" Text="Amount"></asp:Label>

</div>

<div class="col-md-3">

<asp:TextBox ID="txtTotalAmount" runat="server" CssClass="form-control input-sm"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
        ErrorMessage="Please Enter Total Amount" ControlToValidate="txtTotalAmount" 
        ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator>
     
</div>


<div class="col-md-3">

<asp:Label ID="lblTransporter" runat="server" Text="Transporter"></asp:Label>

</div>

<div class="col-md-3">

<asp:DropDownList ID="drpTransporter" runat="server" CssClass="form-control select2"><asp:ListItem>Select</asp:ListItem></asp:DropDownList>
 
<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
        ErrorMessage="Please Select Trasporter" ControlToValidate="drpTransporter" 
        ForeColor="Red" ValidationGroup="G3"></asp:RequiredFieldValidator>--%>

</div>
</div><!--row class close-->


<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblWarrenty" runat="server" Text="Warrenty"></asp:Label>

</div>

<div class="col-md-3">

<asp:TextBox ID="txtWarrenty" runat="server" CssClass="form-control input-sm"></asp:TextBox>
     
</div>


<div class="col-md-3">

<asp:Label ID="lblServiceTax" runat="server" Text="Service Tax"></asp:Label>

</div>

<div class="col-md-3">

<asp:TextBox ID="txtServiceTax" runat="server" CssClass="form-control input-sm"></asp:TextBox>
<span class="input-group-addon"><i class="fa fa-percent"></i></span>

</div>
</div><!--row class close-->


<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblOtherCharges" runat="server" Text="Other Charges"></asp:Label>

</div>

<div class="col-md-3">

<asp:TextBox ID="txtOtherCharges" runat="server" CssClass="form-control input-sm"></asp:TextBox>
<span class="input-group-addon"><i class="fa fa-percent"></i></span>
     
</div>


<div class="col-md-3">

<asp:Label ID="lblNetTotal" runat="server" Text="Net Total"></asp:Label>

</div>

<div class="col-md-3">

<asp:TextBox ID="txtNetTotal" runat="server" CssClass="form-control input-sm"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
        ErrorMessage="Please Enter Net Total" ControlToValidate="txtNetTotal" 
        ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator>

</div>
</div><!--row class close-->


<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblVerifyByCode" runat="server" Text="VerifyByCode(Emp Code)"></asp:Label>

</div>

<div class="col-md-3">

<asp:DropDownList ID="drpVerifyByCode" runat="server" 
        CssClass="form-control select2" 
        onselectedindexchanged="drpVerifyByCode_SelectedIndexChanged" 
        AutoPostBack="True"><asp:ListItem>Select</asp:ListItem></asp:DropDownList>
  
<asp:CompareValidator ID="CompareValidator5" runat="server" 
        ErrorMessage="Please Select VerifiedByCodee " ValidationGroup="G1" ForeColor="Red" 
        ControlToValidate="drpVerifyByCode" Operator="NotEqual" ValueToCompare="Select"></asp:CompareValidator>
  

</div>


<div class="col-md-3">

<asp:Label ID="lblVerifyByName" runat="server" Text="VerifyByName(Emp Name)"></asp:Label>

</div>

<div class="col-md-3">

<asp:DropDownList ID="drpVerifyByName" runat="server" 
        CssClass="form-control select2" 
        onselectedindexchanged="drpVerifyByName_SelectedIndexChanged"><asp:ListItem>Select</asp:ListItem></asp:DropDownList>

<asp:CompareValidator ID="CompareValidator7" runat="server" 
        ErrorMessage="Please Select VerifiedByName " ValidationGroup="G1" ForeColor="Red" 
        ControlToValidate="drpVerifyByName" Operator="NotEqual" ValueToCompare="Select"></asp:CompareValidator>
  

</div>
</div><!--row class close-->


<div class="row top-buffer">
<div class="col-md-3">

<asp:Label ID="lblRemark" runat="server" Text="Remark"></asp:Label>

</div>

<div class="col-md-3">

<asp:TextBox ID="txtRemark" runat="server" CssClass="form-control input-sm" Height="100px"></asp:TextBox>

</div>


<div class="col-md-3">

</div>

<div class="col-md-3">

</div>

</div><!--row class close-->

</div><!--box-body-->
</div> <!--box info-->


<div class="row top-buffer">
<center>

<asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn btn-success" OnClick = "btnNew_Click"></asp:Button>

<asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" onclick="btnSave_Click" ValidationGroup="G1"></asp:Button>

<asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-warning" OnClick = "btnUpdate_Click"></asp:Button>

<asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger"></asp:Button>

<asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick = "btnCancel_Click"></asp:Button>

<asp:Button ID="btnPreview" runat="server" Text="Preview" CssClass="btn btn-danger"></asp:Button>

<asp:Button ID="btnSendMail" runat="server" Text="Send Mail" CssClass="btn btn-success"></asp:Button>


</center>
</div>



<div class="box box-info">
<div class="box-header with-border">
<h3 class="box-title">
<asp:Label ID="Label1" runat="server" Text="Search Master and Master Details"></asp:Label>
</h3>
<div class="box-tools pull-right">
<button type="button" class="btn btn-box-tool" data-widget="collapse">
<i class="fa fa-minus"></i>
</button>
</div><!--box-tool -->
</div><!--box-header -->

<div class="box-body" width="100px">

<div class="row top-buffer">
<div class="col-md-4">

<asp:TextBox ID="txtMasterSerach" runat="server" CssClass="form-control input-sm" OnTextChanged = "txtMasterSerach_TextChanged"></asp:TextBox>

</div>


<div class="col-md-4">

<asp:Button ID="btnMasterSearch" runat="server" CssClass="btn btn-sm- btn-primary" Text="Search"></asp:Button>

</div>


<div class="col-md-4">


</div>

</div><!--row class close-->
</div><!--box-body-->



<div class="box-body" width="100px">
<%--
<div style="width: 100%; height: 150px;  overflow:scroll; clear: both; border: 1px solid #808080;">

<asp:GridView  runat="server" ID="grdSupplierPOMaster"  AutoGenerateColumns="False" EmptyDataText="NO DATA FOUND"
                    ShowHeaderWhenEmpty="True" Width="100%"  TabIndex="7" CellPadding="4"   AllowSorting="True" 
                    style="margin-top: 0px" onrowcommand="grdSupplierPO_RowCommand">
                    
<AlternatingRowStyle Wrap="False" />
<HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" Wrap="True" />
<RowStyle BackColor="White" Wrap="False" />
<SelectedRowStyle Wrap="False" />

<Columns >  
 
<asp:TemplateField HeaderText="SupplierPONo">
<ItemTemplate>
     
<asp:Label ID="ID21" runat="server" Text='<%#Eval("ID21") %>'></asp:Label>
     
</ItemTemplate>
</asp:TemplateField>




<asp:TemplateField HeaderText="SuppName">
<ItemTemplate>

<asp:Label ID="ID22" runat="server" Text='<%#Eval("ID22") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>




<asp:TemplateField HeaderText="PaymentType">
<ItemTemplate>

<asp:Label ID="ID23" runat="server" Text='<%#Eval("ID23") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>




<asp:TemplateField HeaderText="Packing">
<ItemTemplate>

<asp:Label ID="ID24" runat="server" Text='<%#Eval("ID24") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>



<asp:TemplateField HeaderText="Height">
<ItemTemplate>

<asp:Label ID="ID25" runat="server" Text='<%#Eval("ID25") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>



<asp:TemplateField HeaderText="TransportType">
<ItemTemplate>

<asp:Label ID="ID26" runat="server" Text='<%#Eval("ID26") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>



<asp:TemplateField HeaderText="TotalAmount">
<ItemTemplate>

<asp:Label ID="ID27" runat="server" Text='<%#Eval("ID27") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="Name">
<ItemTemplate>

<asp:Label ID="ID28" runat="server" Text='<%#Eval("ID28") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>



<asp:TemplateField HeaderText="Warrenty">
<ItemTemplate>

<asp:Label ID="ID29" runat="server" Text='<%#Eval("ID29") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="ServiceTax">
<ItemTemplate>

<asp:Label ID="ID30" runat="server" Text='<%#Eval("ID30") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>



<asp:TemplateField HeaderText="OtherCharges">
<ItemTemplate>

<asp:Label ID="ID31" runat="server" Text='<%#Eval("ID31") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>



<asp:TemplateField HeaderText="NetTotal">
<ItemTemplate>

<asp:Label ID="ID32" runat="server" Text='<%#Eval("ID32") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>



<asp:TemplateField HeaderText="Remark">
<ItemTemplate>

<asp:Label ID="ID33" runat="server" Text='<%#Eval("ID33") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>



<asp:TemplateField HeaderText="TransporterType">
<ItemTemplate>

<asp:Label ID="ID34" runat="server" Text='<%#Eval("ID34") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="UserName">
<ItemTemplate>

<asp:Label ID="ID35" runat="server" Text='<%#Eval("ID35") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="BranchName">
<ItemTemplate>

<asp:Label ID="ID36" runat="server" Text='<%#Eval("ID36") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="SupplierPoDate">
<ItemTemplate>

<asp:Label ID="ID37" runat="server" Text='<%#Eval("ID37") %>'></asp:Label>

</ItemTemplate>
</asp:TemplateField>

<%--
<asp:TemplateField HeaderText="NetTotal">
<ItemTemplate>

<asp:CheckBox ID="chkApproved" runat="server"></asp:CheckBox>

</ItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="Edit">
<ItemTemplate>


<asp:LinkButton ID="btnEdit" runat="server" Text="<i class='fa fa-pencil-square-o' aria-hidden='true' style='font-size:20px;'></i>" CommandName="RowEditing"
                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>


</ItemTemplate>
</asp:TemplateField> 


<asp:TemplateField HeaderText="Remove">
<ItemTemplate>


<asp:LinkButton ID="btnRemove" runat="server" Text="<i class='fa fa-trash-o' aria-hidden='true' style='font-size:20px;'></i>" CommandName="Remove"
                      CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ></asp:LinkButton>


</ItemTemplate>
</asp:TemplateField>


</Columns>


</asp:GridView>--%>

<div class = "table-responsive">

<asp:GridView ID="gvSuppPOMaster" runat="server" AutoGenerateColumns = "false" EmptyDataText="No Data Found" Width="100%" CssClass="Grid" 
                    AlternatingRowStyle-CssClass="alt"  PagerStyle-CssClass="pgr" >
<Columns>

<asp:TemplateField HeaderText="Select Id">
<ItemTemplate>

<asp:RadioButton ID="rbIdSuppPO" runat="server"  Text='<%#Eval("SupplierPoId") %>' OnCheckedChanged="rbIdSuppPO_OnCheckedChanged"></asp:RadioButton>

</ItemTemplate>
</asp:TemplateField>

<asp:BoundField HeaderText = "Supplier POId" DataField="SupplierPoId" />
<asp:BoundField HeaderText = "Supplier PONo" DataField="SupplierPONo" />
<%--<asp:BoundField HeaderText = "Supplier Name" DataField = "SuppName" />--%>
<asp:BoundField HeaderText = "Payment type" DataField = "PaymentType" />
<asp:BoundField HeaderText = "Packing" DataField = "Packing" />
<asp:BoundField HeaderText = "Height" DataField = "Height" />
<asp:BoundField HeaderText = "Transport Type" DataField = "TransportType" />

<asp:BoundField HeaderText = "Total Amount" DataField = "TotalAmount" />
<asp:BoundField HeaderText = "Name" DataField = "Name" />
<asp:BoundField HeaderText = "Warrenty" DataField = "Warrenty" />
<asp:BoundField HeaderText = "Service Tax" DataField = "ServiceTax" />
<asp:BoundField HeaderText = "Other Charges" DataField = "OtherCharges" />
<asp:BoundField HeaderText = "Net Total" DataField = "NetTotal" />


<asp:BoundField HeaderText = "Remark" DataField = "Remark" />
<asp:BoundField HeaderText = "Transporter Type" DataField = "TransporterType" />
<asp:BoundField HeaderText = "User Name" DataField = "UserName" />
<asp:BoundField HeaderText = "Branch Name" DataField = "BranchName" />
<asp:BoundField HeaderText = "SupplierPo Date" DataField = "SupplierPoDate" />

</Columns>
</asp:GridView>

</div>
</div><!--box-body-->



<div class="box-body" width="100px">


<div class = "table-responsive">
<asp:GridView ID="gvSuppPODtlMaster" runat="server" AutoGenerateColumns="false" EmptyDataText="No Data Found" Width="100%" CssClass="Grid" 
                    AlternatingRowStyle-CssClass="alt"  PagerStyle-CssClass="pgr">
<Columns>

<asp:BoundField HeaderText = "Supplier PoId" DataField = "SupplierPoId" />
<asp:BoundField HeaderText = "Supplier PoDtlId" DataField = "SupplierPoDtlId" />

<asp:BoundField HeaderText = "Item Id" DataField = "ItemId" />
<asp:BoundField HeaderText = "Item Name" DataField = "ItemName" />
<asp:BoundField HeaderText = "Item Code" DataField = "ItemCode" />
<asp:BoundField HeaderText = "Po Rate" DataField = "PoRate" />
<asp:BoundField HeaderText = "Po Quantity" DataField = "PoQuantity" />
<asp:BoundField HeaderText = "Excise" DataField = "Excise" />
<asp:BoundField HeaderText = "Discount" DataField = "Discount" />
<asp:BoundField HeaderText = "PoSchedule Date" DataField = "PoScheduleDate" />

</Columns>
</asp:GridView>
</div>

</div><!--box-body-->
</div><!--box info-->

</section>
</div>
</asp:Content>