<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemMaster_JS.aspx.cs" Inherits="NavnathWebsite.Masters.JsMaster.ItemMaster_JS" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
        name="viewport">
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"
        type="text/css" />
    <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css"
        type="text/css" />
    <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css" type="text/css" />
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css" type="text/css" />
    <link rel="stylesheet" href="../dist/css/skins/skin-blue.min.css" type="text/css" />
    <link rel="stylesheet" href="../bower_components/select2/dist/css/select2.min.css"
        type="text/css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"
        type="text/css" />
    <script src="../bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../dist/js/adminlte.min.js" type="text/javascript"></script>
    <script src="../bower_components/datatables.net/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"
        type="text/javascript"></script>
    <script src="../bower_components/select2/dist/js/select2.full.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
     <script src="../../Content/JS/Master/ItemMaster.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(function () {

            $('.select2').select2()
        });

          
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
                    <div class="col-md-4 inline ">
                       
                        <strong>Item Code</strong>
                         <select id="drpSearchItem" class="form-control  col-sm-6" style="margin-bottom: 5px;">
                                                                <option value="-1" lang="en">-Select-</option>

                                                            </select>

                       
                    </div>
                    <div class="col-md-4">
                        <strong class="align text-center">Item Name</strong>
                         <select id="drpItemType" class="form-control ddLocationState col-sm-6" ><option value="-1" >-select-</option> </select>
                    </div>
                    <div class="col-md-4">
                       <%-- <strong>Item SubType</strong>--%>
                        <asp:DropDownList ID="drpItemSubType" runat="server" CssClass="form-control select2"   AutoPostBack="true" Visible="false">
                         </asp:DropDownList>
                    </div>

                      <div class="col-md-4">
                       <%-- <strong>Item SubType</strong>--%>
                       
                    <%--      <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-sm- btn-primary" OnClick="btnSearch_Click" /> --%>
                          <input id="btnSearchItem" type="button" value="Search" class="btn btn-sm- btn-primary" />
                          
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
                                    <asp:CheckBox ID="chkRawMaterial" runat="server" Text="Raw Material"  />
                                </th>
                                <th style="width: 15%"></th>
                                <th style="width: 35%"></th>
                            </tr>
                            <tr>
                                <th width="15%">Item Code</th>
                                <td width="35%">
                                   <%-- <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control input-sm" ReadOnly="true"></asp:TextBox>--%>
                                   <input id="txtItemCode" class="form-control input-sm" type="text" />
                                    </td>
                                <th width="15%">Item Name </th>
                                <td width="35%">
                                    <%--<asp:TextBox ID="txtItemName" runat="server" CssClass="form-control input-sm"></asp:TextBox>--%>
                                    <input id="txtItemName" class="form-control input-sm" type="text" />
                                    </td>

                            </tr>
                            <tr>
                                <th width="15%">Manufacturer</th>
                                <td width="35%">
                                       <input id="txtItemManuf" class="form-control input-sm" type="text" /></td>
                                <th width="15%">Material</th>
                                <td width="35%">
                                     <input id="txtItemMaterial" class="form-control input-sm" type="text" />
                                    </td>
                            </tr>
                            <tr>
                                <th width="15%">Item Type</th>
                                <td width="35%">
                                    
                                     <input id="txtItemType" class="form-control input-sm" type="text" /></td>
                                <th width="15%">Item SybType</th>
                                '
                             <td width="35%">
                                  <input id="txtItemSubType" class="form-control input-sm" type="text" />
                                 </td>
                             </tr>
                            <tr>
                                <th width="15%">Color</th>
                                <td width="35%">
                                     <input id="txtItemColor" class="form-control input-sm" type="text" />
                                     </td>
                                <th width="15%">UOM</th>
                                <td width="35%">
                                      <input id="txtItemUOM" class="form-control input-sm" type="text" />
                                     </td>

                            </tr>
                            <tr>
                                <th width="15%">HSN Code</th>
                                <td width="35%">
                                      <input id="txtItemHSN" class="form-control input-sm" type="text" />
                                    </td>
                                <th width="15%">GST Rate</th>
                                <td width="35%">
                                    <div class="input-group">
                                             <input id="txtGSTRate" class="form-control input-sm" type="text" />
                                        <span class="input-group-addon"><i class="fa fa-percent"></i></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>

                                <th width="15%">Purchase Cost</th>
                                <td width="35%">
                                    <div class="input-group"><span class="input-group-addon">&#8377;</span>
                                         <input id="txtItemPurchaseCost" class="form-control input-sm" type="text" />
                                    <span class="input-group-addon">.00</span></div>
                                </td>
                                <th width="15%">Selling Price</th>
                                <td width="35%">
                                    <div class="input-group"><span class="input-group-addon">&#8377;</span>
                                     <input id="txtItemSellingCost" class="form-control input-sm" type="text" />
                                    <span class="input-group-addon">.00</span></div>
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
                    <asp:Button ID="btnNewItem" runat="server" CssClass="btn btn-success" Text="New Item"  />
                    
                    <input id="btnSaveItem" type="button" value="Save" class="btn btn-sm- btn-primary" />
                     
                     <input id="btnUpdate" type="button" value="Update" class="btn btn-warning" />
                    

                        <asp:Button ID="btnCancelItem" runat="server" CssClass="btn btn-danger" Text="Delete"  />
                        <asp:Button ID="btnpreview" runat="server" CssClass="btn btn-primary" Text="Preview"  />
                    
                    </center>
                </div>
            </div>

        </div>
    </section>

</asp:Content>
