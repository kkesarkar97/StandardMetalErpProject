<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemMaster19Sept.aspx.cs" Inherits="NavnathWebsite.ItemMaster19Sept" %>

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
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="server">

<section id="ItemSearch">
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
                        <asp:DropDownList ID="drpSearchItem" runat="server" CssClass="form-control select2" OnSelectedIndexChanged="drpSearchItem_SelectedIndexChanged" AutoPostBack="true">
                            <%--<asp:ListItem>Louver</asp:ListItem>
                            <asp:ListItem>Wire Mesh</asp:ListItem>--%>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <strong class="align text-center">Item Name</strong>
                        <asp:DropDownList ID="drpItemType" runat="server" CssClass="form-control select2" OnSelectedIndexChanged="drpItemType_SelectedIndexChanged" AutoPostBack="true" >
                            <%--<asp:ListItem>Light</asp:ListItem>
                            <asp:ListItem>Medium</asp:ListItem>
                            <asp:ListItem>Heavy</asp:ListItem>--%>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                       <%-- <strong>Item SubType</strong>--%>
                        <asp:DropDownList ID="drpItemSubType" runat="server" CssClass="form-control select2" OnSelectedIndexChanged="drpItemSubType_SelectedIndexChanged" AutoPostBack="true" Visible="false">
                            <%--<asp:ListItem>2 Blade</asp:ListItem>
                            <asp:ListItem>4 Blade</asp:ListItem>
                            <asp:ListItem>6 Blade</asp:ListItem>--%>
                        </asp:DropDownList>
                    </div>

                      <div class="col-md-4">
                       <%-- <strong>Item SubType</strong>--%>
                       
                          <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-sm- btn-primary" OnClick="btnSearch_Click" /> 
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
                            CssClass="form-control select2"  AutoPostBack="true" 
                            onselectedindexchanged="drpItemCategory_SelectedIndexChanged">
                           
                        </asp:DropDownList>
                    </div>

                     <div class="col-md-4">
                       
                        <strong>Item Subcategory</strong>
                        <asp:DropDownList ID="drpItemSubCategory" runat="server" 
                             CssClass="form-control select2"  >   
        
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
        
                         <strong>Manufacturer</strong>
                        <asp:DropDownList ID="drpManufacturer" runat="server" 
                            CssClass="form-control select2"  AutoPostBack="true">
                           
                        </asp:DropDownList>
                    </div>

        <div class="col-md-4">
                       
                        <strong>Colour</strong>
                        <asp:DropDownList ID="drpColour" runat="server" 
                             CssClass="form-control select2"  >   
        
                        </asp:DropDownList>
                    </div>

                      <div class="col-md-4">
                       
                        <strong>UOM</strong>
                        <asp:DropDownList ID="drpUOM" runat="server" 
                             CssClass="form-control select2"  >   
        
                        </asp:DropDownList>
                    </div>

                
                        </asp:DropDownList>
                    </div>

                    <table class="table-condensed table-hover table-responsive" width="100%">
                        <tbody>
                            <tr>
                                <th style="width: 15%"></th>
                                <th style="width: 35%">
                                    <asp:CheckBox ID="chkRawMaterial" runat="server" Text="Raw Material" 
                                        AutoPostBack="True" oncheckedchanged="chkRawMaterial_CheckedChanged"  />
                                </th>
                                <th style="width: 15%"></th>
                                <th style="width: 35%"></th>
                            </tr>
                            <tr>
                                <th width="15%">Item Code</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control input-sm" ReadOnly="true"></asp:TextBox></td>
                                <th width="15%">Item Name </th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>

                            </tr>
                            <tr>
                                <th width="15%">Manufacturer</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemManuf" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                <th width="15%">Material</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemMaterial" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th width="15%">Item Type</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemType" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                <th width="15%">Item SybType</th>
                                '
                             <td width="35%">
                                 <asp:TextBox ID="txtItemSubType" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th width="15%">Color</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemColor" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                <th width="15%">UOM</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemUOM" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>

                            </tr>
                            <tr>
                                <th width="15%">HSN Code</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemHSN" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                <th width="15%">GST Rate</th>
                                <td width="35%">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtGSTRate" runat="server" CssClass="form-control input-sm"   ></asp:TextBox><span class="input-group-addon"><i class="fa fa-percent"></i></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>

                                <th width="15%">Purchase Cost</th>
                                <td width="35%">
                                    <div class="input-group"><span class="input-group-addon">&#8377;</span><asp:TextBox ID="txtItemPurchaseCost" runat="server" CssClass="form-control input-sm"  ></asp:TextBox><span class="input-group-addon">.00</span></div>
                                </td>
                                <th width="15%">Selling Price</th>
                                <td width="35%">
                                    <div class="input-group"><span class="input-group-addon">&#8377;</span><asp:TextBox ID="txtItemSellingCost" runat="server" CssClass="form-control input-sm"></asp:TextBox><span class="input-group-addon">.00</span></div>
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
                    <asp:Button ID="btnNewItem" runat="server" CssClass="btn btn-success" Text="New Item" OnClick="btnNewItem_Click" />
                    <asp:Button ID="btnSaveItem" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSaveItem_Click" />
                    <asp:Button ID="btnUpdateItem" runat="server" CssClass="btn btn-warning" Text="Update" OnClick="btnUpdateItem_Click" />
                    <asp:Button ID="btnCancelItem" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btnCancelItem_Click" />
                    <asp:Button ID="btnpreview" runat="server" CssClass="btn btn-primary" Text="Preview" onclick="btnpreview_Click"/>
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
                        <asp:Button ID="btnAllItem" runat="server" CssClass="btn btn-warning" Text="All Item Report" onclick="btnAllItem_Click"/>
                        <asp:Button ID="btnItemWise" runat="server" CssClass="btn btn-warning" Text="Item Wise Report" onclick="btnItemWise_Click"/>
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
