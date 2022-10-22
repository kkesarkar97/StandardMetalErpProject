<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SupplierMaster.aspx.cs" Inherits="NavnathWebsite.Demo.SupplierMaster" %>
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

 <section id="SupplierSearch">
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
                       
                        <strong>Supplier Code</strong>
                        <asp:DropDownList ID="drpSearchSupplier" runat="server" 
                            CssClass="form-control select2"  AutoPostBack="true" 
                            onselectedindexchanged="drpSearchSupplier_SelectedIndexChanged">
                            <%--<asp:ListItem>Louver</asp:ListItem>
                            <asp:ListItem>Wire Mesh</asp:ListItem>--%>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <strong class="align text-center">Supplier Name</strong>
                        <asp:DropDownList ID="drpSupplierName" runat="server" 
                            CssClass="form-control select2" AutoPostBack="true" 
                            onselectedindexchanged="drpSupplierName_SelectedIndexChanged" >
                            <%--<asp:ListItem>Light</asp:ListItem>
                            <asp:ListItem>Medium</asp:ListItem>
                            <asp:ListItem>Heavy</asp:ListItem>--%>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                       <%-- <strong>Item SubType</strong>--%>
                   <%--     <asp:DropDownList ID="drpItemSubType" runat="server" CssClass="form-control select2" OnSelectedIndexChanged="drpItemSubType_SelectedIndexChanged" AutoPostBack="true" Visible="false">--%>
                            <%--<asp:ListItem>2 Blade</asp:ListItem>
                            <asp:ListItem>4 Blade</asp:ListItem>
                            <asp:ListItem>6 Blade</asp:ListItem>--%>
                        </asp:DropDownList>
                    </div>

                      <div class="col-md-4">
                       <%-- <strong>Item SubType</strong>--%>

                       
                          <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-sm- btn-primary"  /> 
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </section>




 <section id="SupplierInfo">
        <div class="col-lg-12 col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Supplier Information</h3>

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
                                <th width="15%">Supplier Code</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtSupplierCode" runat="server" CssClass="form-control input-sm" ReadOnly="true"></asp:TextBox></td>
                                <th width="15%">Supplier Name </th>
                                <td width="35%">
                                    <asp:TextBox ID="txtSupplierName" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>

                            </tr>
                            <tr>
                                <th width="15%">Contact Person</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtContactPerson" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                <th width="15%">Branch</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtBranch" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                            </tr>
                               <tr>
                                <th width="15%">Address1</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtAddress1" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                <th width="15%">Address2</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                            </tr>
                            
                               <tr>
                                <th width="15%">City</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtcity" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                <th width="15%">State</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtstate" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                            </tr>
                            
                               <tr>
                                <th width="15%">Pincode</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtpincode" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                <th width="15%">Country</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtcountry" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                            </tr>
                            
                               <tr>
                                <th width="15%">EmailID</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                <th width="15%">Telephone</th>
                                <td width="35%">
                                    <asp:TextBox ID="txttelephone" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                            </tr>
                            
                               <tr>
                                <th width="15%">Mobile</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtmobile" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                <th width="15%">Fax</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtfax" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                            </tr>
                            
                               <tr>
                                <th width="15%">Website</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtwebsite" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                <th width="15%">GSTIN</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtgstin" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                            </tr>
                             <tr>
                                <th width="15%">Remarks</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtremark" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                            </tr>
                         
                          </tbody>
                    </table>

                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </section>

</asp:Content>







