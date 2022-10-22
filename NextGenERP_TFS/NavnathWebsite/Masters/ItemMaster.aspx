<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemMaster.aspx.cs" Inherits="NavnathWebsite.Masters.ItemMaster" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>


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

        if (n<5) {
            args.IsValid = false;
            return;
        }

        
        args.IsValid = true;
    }

</script>


</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="Server">

 
 
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
                       
                        <strong>Item Code</strong>
                        <asp:DropDownList ID="drpSearchItem" runat="server" 
                            CssClass="form-control select2" 
                            OnSelectedIndexChanged="drpSearchItem_SelectedIndexChanged" AutoPostBack="True" 
                            meta:resourcekey="drpSearchItemResource1">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <strong class="align text-center">Item Name</strong>
                        <asp:DropDownList ID="drpItemType" runat="server" 
                            CssClass="form-control select2" 
                            OnSelectedIndexChanged="drpItemType_SelectedIndexChanged" AutoPostBack="True" 
                            meta:resourcekey="drpItemTypeResource1" >
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                       <%-- <strong>Item SubType</strong>--%>
                        <asp:DropDownList ID="drpItemSubType" runat="server" 
                            CssClass="form-control select2" 
                            OnSelectedIndexChanged="drpItemSubType_SelectedIndexChanged" 
                            AutoPostBack="True" Visible="False" meta:resourcekey="drpItemSubTypeResource1">
                        </asp:DropDownList>
                    </div>

                      <div class="col-md-4">
                       <%-- <strong>Item SubType</strong>--%>
                       
                          <asp:Button runat="server" ID="btnSearch" Text="Search" 
                              CssClass="btn btn-sm- btn-primary" OnClick="btnSearch_Click" 
                              meta:resourcekey="btnSearchResource1" /> 
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

                 <div class="col-md-4">
                       
                        <strong>Item Category</strong>
                        <asp:DropDownList ID="drpItemCategory" runat="server" 
                            CssClass="form-control select2"  AutoPostBack="True" 
                            onselectedindexchanged="drpItemCategory_SelectedIndexChanged" 
                            meta:resourcekey="drpItemCategoryResource1">
                           
                        </asp:DropDownList>
                    </div>

                     <div class="col-md-4">
                       
                        <strong>Item Subcategory</strong>
                        <asp:DropDownList ID="drpItemSubCategory" runat="server" 
                             CssClass="form-control select2" meta:resourcekey="drpItemSubCategoryResource1"   
                           >   
                           
                        </asp:DropDownList>
                    </div>


                    <table class="table-condensed table-hover table-responsive" width="100%">
                        <tbody>
                            <tr>
                                <th style="width: 15%"></th>
                                <th style="width: 35%">
                                    <asp:CheckBox ID="chkRawMaterial" runat="server" Text="Raw Material" 
                                        AutoPostBack="True" oncheckedchanged="chkRawMaterial_CheckedChanged" 
                                        meta:resourcekey="chkRawMaterialResource1"  />
                                </th>
                                <th style="width: 15%"></th>
                                <th style="width: 35%"></th>
                            </tr>
                            <tr>
<%--                                <th width="15%">Item Code</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control input-sm" 
                                        ReadOnly="True" meta:resourcekey="txtItemCodeResource1"></asp:TextBox></td>
                                <th width="15%"> <asp:Label ID="Label1" runat="server" 
                                        Text= "<%$ Resources:Resource, ItemName %>" 
                                        meta:resourcekey="Label1Resource1"  ></asp:Label> </th>--%>
                                        
                                <th width="15%">Item Code:</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control input-sm" 
                                        ReadOnly="True" meta:resourcekey="txtItemCodeResource1"></asp:TextBox></td>
                                <th width="15%"> ItemName:</th> 
                                <td width="35%">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemNameResource1"></asp:TextBox>
                                    
                                    </td>

                            </tr>
                                 

                                <td width="35%">
                                    <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemNameResource1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ErrorMessage="Please enter Item Name" ControlToValidate="txtItemName" 
                                        ForeColor="#FF3300" ValidationGroup="G1" 
                                        meta:resourcekey="RequiredFieldValidator1Resource1">*</asp:RequiredFieldValidator>

                         <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                        ErrorMessage="Item Is Already Exist" ControlToValidate="txtItemName" 
                                        ForeColor="#FF3300" ValidationGroup="G1"
                                        OnServerValidate="cusCheckDupItem_ServerValidate" meta:resourcekey="CustomValidator1Resource1"
                                        >Item Is Already Exist</asp:CustomValidator>


                                    </td>

                            </tr>
                            <tr>
                                <th width="15%">Manufacturer</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemManuf" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemManufResource1"></asp:TextBox></td>
                                <th width="15%">Material</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemMaterial" runat="server" 
                                        CssClass="form-control input-sm" meta:resourcekey="txtItemMaterialResource1"></asp:TextBox>
                                    <asp:CustomValidator ID="CustomValidator2" runat="server" 
                                        ErrorMessage="Client side validation" ControlToValidate="txtItemMaterial" 
                                        ForeColor="#FF3300" ValidationGroup="G1" 
                                        ClientValidationFunction="ValidateSomething" meta:resourcekey="CustomValidator2Resource1"
                                        >Client side validation</asp:CustomValidator>
                                    </td>
                            </tr>
                            <tr>
                                <th width="15%">Item Type</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemType" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemTypeResource1"></asp:TextBox></td>
                                <th width="15%">Item SybType</th>
                                '
                             <td width="35%">
                                 <asp:TextBox ID="txtItemSubType" runat="server" 
                                     CssClass="form-control input-sm" meta:resourcekey="txtItemSubTypeResource1"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th width="15%">Color</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemColor" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemColorResource1"></asp:TextBox></td>
                                <th width="15%">UOM</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemUOM" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemUOMResource1"></asp:TextBox></td>

                            </tr>
                            <tr>
                                <th width="15%">HSN Code</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemHSN" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemHSNResource1"></asp:TextBox></td>
                                <th width="15%">GST Rate</th>
                                <td width="35%">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtGSTRate" runat="server" CssClass="form-control input-sm" 
                                            meta:resourcekey="txtGSTRateResource1"   ></asp:TextBox><span class="input-group-addon"><i class="fa fa-percent"></i></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>

                                <th width="15%">Purchase Cost</th>
                                <td width="35%">
                                    <div class="input-group"><span class="input-group-addon">&#8377;</span><asp:TextBox 
                                            ID="txtItemPurchaseCost" runat="server" CssClass="form-control input-sm" 
                                            meta:resourcekey="txtItemPurchaseCostResource1"  ></asp:TextBox><span class="input-group-addon">.00</span></div>
                                </td>
                                <th width="15%">Selling Price</th>
                                <td width="35%">
                                    <div class="input-group"><span class="input-group-addon">&#8377;</span><asp:TextBox 
                                            ID="txtItemSellingCost" runat="server" CssClass="form-control input-sm" 
                                            meta:resourcekey="txtItemSellingCostResource1"></asp:TextBox><span class="input-group-addon">.00</span></div>
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
                    <asp:Button ID="btnNewItem" runat="server" CssClass="btn btn-success" 
                            Text="New Item" OnClick="btnNewItem_Click" 
                            meta:resourcekey="btnNewItemResource1" />
                    <asp:Button ID="btnSaveItem" runat="server" CssClass="btn btn-primary" Text="Save" 
                            OnClick="btnSaveItem_Click" ValidationGroup="G1" 
                            meta:resourcekey="btnSaveItemResource1" />
                    <asp:Button ID="btnUpdateItem" runat="server" CssClass="btn btn-warning" 
                            Text="Update" OnClick="btnUpdateItem_Click" ValidationGroup="G1" 
                            meta:resourcekey="btnUpdateItemResource1" />
                    <asp:Button ID="btnCancelItem" runat="server" CssClass="btn btn-danger" 
                            Text="Cancel" OnClick="btnCancelItem_Click" 
                            meta:resourcekey="btnCancelItemResource1" />
                    <asp:Button ID="btnpreview" runat="server" CssClass="btn btn-primary" 
                            Text="Preview" onclick="btnpreview_Click" 
                            meta:resourcekey="btnpreviewResource1"/>
          <button type="button" id="btnReport" class="btn btn-info btn-sm" data-toggle="modal" data-target="#ReportModel" onclick="return btnReport_onclick()" onclick="return btnReport_onclick()" onclick="return btnReport_onclick()">View Reports</button>
                    </center>
                </div>
            </div>

        </div>
    </section>


<div class="model">

        <!-- ReportModel -->
        <div class="modal fade" id="ReportModel" role="dialog">
            <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Item Master Report</h4>
                    </div>
                    <div class="modal-body">
                        <asp:Button ID="btnAllItem" runat="server" CssClass="btn btn-warning" 
                            Text="All Item Report" onclick="btnAllItem_Click" 
                            meta:resourcekey="btnAllItemResource1"/>
                        <asp:Button ID="btnItemWise" runat="server" CssClass="btn btn-warning" 
                            Text="Item Wise Report" onclick="btnItemWise_Click" 
                            meta:resourcekey="btnItemWiseResource1"/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
</div>


    </div>


</asp:Content>


