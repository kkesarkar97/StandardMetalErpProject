<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemMaster_10May.aspx.cs" Inherits="NavnathWebsite.Masters.ItemMaster_10May" %>
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


    // msterial - clint side validation
    function ValidateSomething(sender, args) {

        var mySomething = args.Value;

        var n = mySomething.length;

        if (n < 5) {
            args.IsValid = false;
            return;
        }


        args.IsValid = true;
    }

</script>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="server">

 <section id="ItemSearch">

    <div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" 
            ShowSummary="False" ValidationGroup="G1" 
            meta:resourcekey="ValidationSummary1Resource1"></asp:ValidationSummary>
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
                       
                       <strong>Item Code:</strong>
                        <asp:DropDownList ID="drpSearchItem" runat="server" 
                            CssClass="form-control select2"  AutoPostBack="true" 
                            onselectedindexchanged="drpSearchItem_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ErrorMessage="Please Select Item Code" ControlToValidate="drpSearchItem" 
                            ForeColor="Red" Operator="NotEqual" ValidationGroup="G2" 
                            ValueToCompare="Select"></asp:CompareValidator> 
                    </div>

                      <div class="col-md-4">
                        <strong class="align text-center">Item Name:</strong>
                        <asp:DropDownList ID="drpItemType" runat="server" CssClass="form-control select2" 
                              AutoPostBack="true" onselectedindexchanged="drpItemType_SelectedIndexChanged" >
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                            ErrorMessage="Item Name Must be Inserted" 
                            ControlToValidate="drpItemType" Display="Dynamic" ForeColor="Red" 
                            Operator="NotEqual" ValidationGroup="G2" ValueToCompare="Select"></asp:CompareValidator> 
                    </div>
                     <div class="col-md-4">
                          <asp:Button runat="server" ID="btnSearch" Text="Search" 
                              CssClass="btn btn-sm- btn-primary" onclick="btn_Search_click" /> 
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
                    <h3 class="box-title">Item Information >></h3>

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
                                <th width="15%">ItemCode:</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemcode" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                     
                               
                                <th width="15%">ItemName:</th>
                                <td width="35%">
                                    <asp:TextBox ID="TxtItemName" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th width="15%">Manufacturer:</th>
                                <td width="35%">
                                   
                                    <asp:DropDownList ID="drpManufactureID" runat="server" CssClass="form-control select2" >
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator5" runat="server" 
                                        ErrorMessage="Select Manufacturer" ControlToValidate="drpManufactureID" 
                                        Display="Dynamic" ForeColor="Red" Operator="NotEqual" ValidationGroup="G1" 
                                        ValueToCompare="Select"></asp:CompareValidator> 
                                    
                                <th width="15%">Material:</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemMaterial" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                        ErrorMessage="Material Name should be given" 
                                        ControlToValidate="txtItemMaterial" ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>
                            </tr>
                             <tr>
                                <th width="15%">ItemCategory:</th>
                                <td width="35%">
                              <asp:DropDownList ID="drpItemCategory" runat="server" 
                                        cssClass="form-control select2" 
                                        onselectedindexchanged="drpItemCategory_SelectedIndexChanged"></asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator7" runat="server" 
                            ErrorMessage="Please Select Item Category" ControlToValidate="drpItemCategory" 
                            ForeColor="Red" Operator="NotEqual" ValidationGroup="G1" 
                            ValueToCompare="Select"></asp:CompareValidator>    
                             

                                <th width="15%">Item SubCategory:</th>
                                <td width="35%">
                                <asp:DropDownList ID="drpItemSubCategory" runat="server" 
                                        cssClass="form-control select2">
                                        </asp:DropDownList>
                                        <asp:CompareValidator ID="CompareValidator8" runat="server" 
                             ErrorMessage="Item Sub-Category Must be Selected " ControlToValidate="drpItemSubCategory" 
                             ForeColor="Red" Operator="NotEqual" 
                                     ValidationGroup="G1" Display="Dynamic" ValueToCompare="Select"></asp:CompareValidator> 
                               </tr>
                  
                            
                          
                            <tr>
                                <th width="15%">Color:</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpColorId" runat="server" CssClass="form-control select2"  >
                                    </asp:DropDownList>
                                     <asp:CompareValidator ID="CompareValidator6" runat="server" 
                                        ErrorMessage="Select Color" ControlToValidate="drpColorId" Display="Dynamic" 
                                        ForeColor="Red" Operator="NotEqual" ValidationGroup="G1" 
                                        ValueToCompare="Select"></asp:CompareValidator>
                                <th width="15%">UOM :</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpUOMId" runat="server" CssClass="form-control select2" > 
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                        ErrorMessage="Unit Of Measurement must be selected" 
                                        ControlToValidate="drpUOMId" ForeColor="Red" Operator="NotEqual" 
                                        ValidationGroup="G1" ValueToCompare="Select" Display="Dynamic"></asp:CompareValidator> 
                            </tr>
                            <tr>
                                <th width="15%">HSN Code:</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemHSN" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>

                                <th width="15%">GST Rate:</th>
                                <td width="35%">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtGSTRate" runat="server" CssClass="form-control input-sm"   ></asp:TextBox><span class="input-group-addon"><i class="fa fa-percent"></i></span>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                            ErrorMessage="Enter GSTRate Cost" ControlToValidate="txtGSTRate" 
                                            ForeColor="Red" ValidationExpression="^[1-9]\d*(\.\d{1,2})?$" 
                                            ValidationGroup="G1"></asp:RegularExpressionValidator>
                                    </div>
                                </td>
                            </tr>
                            
                            <tr>

                                <th width="15%">Purchase Cost:</th>
                                <td width="35%">
                                    <div class="input-group"><span class="input-group-addon">&#8377;</span><asp:TextBox ID="txtItemPurchaseCost" runat="server" CssClass="form-control input-sm"  ></asp:TextBox><span class="input-group-addon">.00</span></div>
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
                                         ClientValidationFunction="CheckPrice" ValidationGroup="G1">Selling Price should be greater than purchase price.</asp:CustomValidator>
                                </td>
                                </div>
                                <th width="15%">Selling Price:</th>
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
                    <asp:Button ID="btnSaveItem" runat="server" CssClass="btn btn-primary" Text="Save" onclick="btn_Save_click" 
                            />
                    <asp:Button ID="btnUpdateItem" runat="server" CssClass="btn btn-warning" 
                            Text="Update" onclick="btnUpdateItem_Click"   />
                    <asp:Button ID="btnCancelItem" runat="server" CssClass="btn btn-danger" 
                            Text="Cancel" onclick="btnCancelItem_Click"   />
                    <asp:Button ID="btnpreview" runat="server" CssClass="btn btn-primary" Text="Preview"  />
          <button type="button" id="btnReport" class="btn btn-info btn-sm" data-toggle="modal" data-target="#ReportModel" onclick="return btnReport_onclick()" onclick="return btnReport_onclick()" onclick="return btnReport_onclick()">View Reports</button>
                    </center>
                </div>
            </div>

        </div>
    </section>





</asp:Content>
