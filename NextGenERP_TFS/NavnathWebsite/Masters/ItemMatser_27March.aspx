<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemMatser_27March.aspx.cs" Inherits="NavnathWebsite.Masters.ItemMatser_27March" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


<meta charset="utf-8">

  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />     
  <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css"  type="text/css"/>
  <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css"  type="text/css"/>
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css"  type="text/css"/>
  <link rel="stylesheet" href="../dist/css/skins/skin-blue.min.css"  type="text/css"/>
  <link rel="stylesheet" href="../bower_components/select2/dist/css/select2.min.css"  type="text/css"/>
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"  type="text/css" />
    
     
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
    function btnReport_onclick() {

    }



    function CheckPrice(sender, args) {



        var PurPrice = document.getElementById('<%=txtItemPurchaseCost.ClientID%>').value;
        alert(PurPrice)
        var SellPrice = document.getElementById('<%=txtItemSellingCost.ClientID%>').value;
        alert(SellPrice)

        //  alert(v)

        args.IsValid = true;

        // alert(v.length)

        if (PurPrice != "" && SellPrice != "") {
            
        

        if (PurPrice > SellPrice) {
            args.IsValid = false;  // field is empty
        }

    }

    }

</script>



</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="server">
    <section id="ItemSearch">
 
<div>
 <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" 
         ShowSummary="False" ValidationGroup="G2"></asp:ValidationSummary>
 </div> 
 
 <div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="G1"></asp:ValidationSummary>
    </div>

        <div class="col-lg-12 col-md-12">
            <div class="box box-info">

             <div class="box-header with-border">
                    <h3 class="box-title">Search</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                    </div>
                    <!-- /.box-tools -->
                </div>
                <!-- /.box-header -->


                <div class="box-body">

                

                    <div class="col-md-4">
                       <strong>Item Code</strong>
                        <asp:DropDownList ID="drpSearchItem" runat="server" 
                            CssClass="form-control select2"  AutoPostBack="True" 
                            onselectedindexchanged="drpSearchItem_SelectedIndexChanged" >
                        </asp:DropDownList>
                         <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ErrorMessage="Please Select Item Code" ControlToValidate="drpSearchItem" 
                            ForeColor="Red" Operator="NotEqual" ValidationGroup="G2" 
                            ValueToCompare="Select"></asp:CompareValidator> 
                             
                       </div>

                    <div class="col-md-4">
                        <strong class="align text-center">Item Name</strong>
                        <asp:DropDownList ID="drpItemType" runat="server" 
                            CssClass="form-control select2" AutoPostBack="true" 
                            onselectedindexchanged="drpItemType_SelectedIndexChanged" 
                            ValidationGroup="G2" >
                            </asp:DropDownList>
                    
                     <asp:CompareValidator ID="CompareValidator3" runat="server" 
                            ErrorMessage="Item Name Must be Inserted" 
                            ControlToValidate="drpItemType" Display="Dynamic" ForeColor="Red" 
                            Operator="NotEqual" ValidationGroup="G2" ValueToCompare="Select"></asp:CompareValidator> 
                       </div>
                    

                      <div class="col-md-4">
                      <asp:Button runat="server" ID="btnSearch" Text="Search" 
                              CssClass="btn btn-sm- btn-primary" onclick="btnSearch_Click" 
                              ValidationGroup="G2" /> 
                    </div>
                </div>
                <!-- /.box-body -->
           
            </div>

            <!-- /.box -->
        </div>
    </section>



           <section id="ItemInfo">
           <div class="col-lg-12 col-md-12">
            <div class="box box-info">

                <div class="box-header with-border">
                    <h3 class="box-title">Item Information</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                    </div>
                    <!-- /.box-tools -->
                </div>


                <!-- /.box-header -->
                <div class="box-body">

                         <table class="table-condensed table-hover table-responsive" width="100%">
                        <tbody>
                            <tr>
                                <th style="width: 15%"></th>
                                <th style="width: 35%">
                                    <asp:CheckBox ID="chkRawMaterial" runat="server" Text="Raw Material" 
                                        AutoPostBack="True"   />
                                </th>
                                <th style="width: 15%"></th>
                                <th style="width: 35%"></th>
                            </tr>

                            <tr>
                                <th width="15%">Item Code</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control input-sm" ReadOnly="true"></asp:TextBox></td>
                                <th width="15%"><%--  <asp:Label ID="Label1" runat="server" Text= "<%$Resources:Resource, ItemName %>"  >--%>  
                              
                                </asp:Label> </th>
                                 
                                <td width="35%">
                                    <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                        ErrorMessage="Item Name is not mentioned" ControlToValidate="txtItemName" ForeColor="Red" 
                                        ValidationGroup="G1">*</asp:RequiredFieldValidator> 
                                    
                                    </td>

                            </tr>
                            <tr>
                                <th width="15%">Manufacturer</th>
                                <td width="35%">
                                   
                                    <asp:DropDownList ID="drpManufactureID" runat="server" CssClass="form-control select2" >
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator5" runat="server" 
                                        ErrorMessage="Select Manufacturer" ControlToValidate="drpManufactureID" 
                                        Display="Dynamic" ForeColor="Red" Operator="NotEqual" ValidationGroup="G1" 
                                        ValueToCompare="Select"></asp:CompareValidator> 
                                    </td>
                                <th width="15%">Material</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemMaterial" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                        ErrorMessage="Material Name should be given" 
                                        ControlToValidate="txtItemMaterial" ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>
                                    </td>
                            </tr>
                            
                            <tr>
                                <th width="15%">Item Category</th>
                                <td width="35%"> 
                        <asp:DropDownList ID="drpItemCategory" runat="server" 
                            CssClass="form-control select2"  AutoPostBack="true" onselectedindexchanged="drpItemCategory_SelectedIndexChanged">
                        </asp:DropDownList>
                         <asp:CompareValidator ID="CompareValidator7" runat="server" 
                            ErrorMessage="Please Select Item Category" ControlToValidate="drpItemCategory" 
                            ForeColor="Red" Operator="NotEqual" ValidationGroup="G1" 
                            ValueToCompare="Select"></asp:CompareValidator> 
                         </td>
                                
                                <th width="15%">Item Subcategory</th>
                                <td width="35%">
                                  <asp:DropDownList ID="drpItemSubCategory" runat="server" CssClass="form-control select2"> </asp:DropDownList>
                                 <asp:CompareValidator ID="CompareValidator8" runat="server" 
                             ErrorMessage="Item Sub-Category Must be Selected " ControlToValidate="drpItemSubCategory" 
                             ForeColor="Red" Operator="NotEqual" 
                                     ValidationGroup="G1" Display="Dynamic" ValueToCompare="Select"></asp:CompareValidator> 
                         </td>
                            </tr>
                            <tr>
                                <th width="15%">Color</th>
                                <td width="35%">
                                <asp:DropDownList ID="drpColorId" runat="server" CssClass="form-control select2"  >
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator6" runat="server" 
                                        ErrorMessage="Select Color" ControlToValidate="drpColorId" Display="Dynamic" 
                                        ForeColor="Red" Operator="NotEqual" ValidationGroup="G1" 
                                        ValueToCompare="Select"></asp:CompareValidator>
                                    </td>
                                
                                <th width="15%">UOM</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpUOMId" runat="server" CssClass="form-control select2" > 
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                        ErrorMessage="Unit Of Measurement must be selected" 
                                        ControlToValidate="drpUOMId" ForeColor="Red" Operator="NotEqual" 
                                        ValidationGroup="G1" ValueToCompare="Select" Display="Dynamic"></asp:CompareValidator> 
                                    </td>
                                    </tr>
                            <tr>
                                <th width="15%">HSN Code</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemHSN" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                <th width="15%">GST Rate</th>
                                <td width="35%">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtGSTRate" runat="server" CssClass="form-control input-sm"   ></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                            ErrorMessage="Enter GSTRate Cost" ControlToValidate="txtGSTRate" 
                                            ForeColor="Red" ValidationExpression="^[1-9]\d*(\.\d{1,2})?$" 
                                            ValidationGroup="G1"></asp:RegularExpressionValidator>
                                    
                                    </div>
                                </td>
                            </tr>
                            <tr>

                                <th width="15%">Purchase Cost</th>
                                <td width="35%">
                                    <div class="input-group"><span class="input-group-addon">&#8377;<i class="fa fa-percent"></i><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ErrorMessage="Entered GSTRate Must Be a Decimal Number" 
                                            ControlToValidate="txtGSTRate" ValidationGroup="G1" 
                                            ForeColor="Red">*</asp:RequiredFieldValidator>
                                        </span><asp:TextBox ID="txtItemPurchaseCost" runat="server" CssClass="form-control input-sm"  ></asp:TextBox><span class="input-group-addon">.00</span>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ErrorMessage="Entered Purchase Cost Must Be a Decimal Number" 
                                            ControlToValidate="txtItemPurchaseCost" ValidationGroup="G1" 
                                            ForeColor="Red">*</asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ErrorMessage="Enter Purchase Cost" ControlToValidate="txtItemPurchaseCost" 
                                            ForeColor="Red" ValidationExpression="^[1-9]\d*(\.\d{1,2})?$" 
                                            ValidationGroup="G1"></asp:RegularExpressionValidator>
                                     

                                        <asp:CustomValidator ID="CustomValidator15555" runat="server" 
                                         ErrorMessage="Selling Price should be greater than purchase price" ControlToValidate="txtItemPurchaseCost" 
                                         ClientValidationFunction="CheckPrice" ValidationGroup="G1">Selling Price should be greater than purchase price</asp:CustomValidator>

                                    </div>
                                </td>
                                <th width="15%">Selling Price</th>
                                <td width="35%">
                                    <div class="input-group"><span class="input-group-addon">&#8377;</span><asp:TextBox ID="txtItemSellingCost" runat="server" CssClass="form-control input-sm"></asp:TextBox><span class="input-group-addon">.00</span>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ErrorMessage="Entered Selling Price Must Be a Decimal Number" 
                                            ControlToValidate="txtItemSellingCost" ForeColor="Red" 
                                            ValidationGroup="G1">*</asp:RequiredFieldValidator>
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                            ErrorMessage="Please Enter Selling Price" ControlToValidate="txtItemSellingCost" 
                                            ForeColor="Red" ValidationExpression="^[1-9]\d*(\.\d{1,2})?$" 
                                            ValidationGroup="G1"></asp:RegularExpressionValidator> 
                                  
                                              <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                         ErrorMessage="Selling Price should be greater than purchase price" ControlToValidate="txtItemSellingCost" 
                                         ClientValidationFunction="CheckPrice" ValidationGroup="G1">Selling Price should be greater than purchase price</asp:CustomValidator>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>



                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </section>


        <section id="ItemActionMenu">
        <div class="col-lg-12 col-md-12">

            <div class="box box-info">
                <div class="box-header with-border">
                    <%--<h4 class="box-title">Action Menu</h4>--%>
                </div>
                <div class="box-body">
                    <center>
                    <asp:Button ID="btnNewItem" runat="server" CssClass="btn btn-success" Text="New Item"   />
                    <asp:Button ID="btnSaveItem" runat="server" CssClass="btn btn-primary" Text="Save" onclick = "btnSaveItem_Click" ValidationGroup="G1" />
                    <asp:Button ID="btnUpdateItem" runat="server" CssClass="btn btn-warning" 
                            Text="Update" onclick="btnUpdateItem_Click" ValidationGroup="G1"   />
                    <asp:Button ID="btnCancelItem" runat="server" CssClass="btn btn-danger" Text="Cancel"   />
                    <asp:Button ID="btnpreview" runat="server" CssClass="btn btn-primary" 
                            Text="Preview" onclick="btnpreview_Click"  />
                 v

          <button type="button" id="btnReport" class="btn btn-info btn-sm" data-toggle="modal" data-target="#ReportModel" onclick="return btnReport_onclick()" onclick="return btnReport_onclick()" onclick="return btnReport_onclick()">View Reports</button>
                    </center>
                </div>
            </div>

        </div>
    </section>


</asp:Content>
