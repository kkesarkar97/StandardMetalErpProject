<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuMaster.aspx.cs" Inherits="NavnathWebsite.Masters.MenuMaster" %>

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
                       
                        <strong>Menu Name</strong>
                        <asp:DropDownList ID="drpSearchMenu" runat="server" CssClass="form-control select2" AutoPostBack="true">
                             
                        </asp:DropDownList>
                    </div>
                     <div class="col-md-4"><br />
                        <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-sm- btn-primary"  /> 
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        
    </section>

    <section id="ItemInfo">
        <div class="col-lg-12 col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Menu Information</h3>

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
                                 <th class="15">Menu Name </th>
                                <td width="35%">
                                    <asp:TextBox ID="txtMenuName" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>

                                <th style="width: 15%"></th>
                                <th style="width: 35%">
                                    <asp:CheckBox ID="chkIsActive" Checked="true" runat="server" Text="IsActive" 
                                        AutoPostBack="False"   />
                               
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
                    <asp:Button ID="btnNewMenu" runat="server" CssClass="btn btn-success" 
                            Text="New Item" onclick="btnNewMenu_Click"  />
                    <asp:Button ID="btnSaveMenu" runat="server" CssClass="btn btn-primary" Text="Save" 
                            onclick="btnSaveMenu_Click"  />
                   <%-- <asp:Button ID="btnUpdateMenu" runat="server" CssClass="btn btn-warning" Text="Update"   />--%>
                    <asp:Button ID="btnCancelMenu" runat="server" CssClass="btn btn-danger" 
                            Text="Cancel" onclick="btnCancelMenu_Click" />
                    </center>
                </div>
            </div>

        </div>
    </section>





    </div>


</asp:Content>

