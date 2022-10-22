<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DemoItemMaster.aspx.cs" Inherits="NavnathWebsite.Masters.DemoItemMaster" %>

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
                             
                            meta:resourcekey="drpSearchItemResource1" AutoPostBack="True" 
                            onselectedindexchanged="drpSearchItem_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                  
 
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </section>






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

                
                  <table class="table-condensed table-hover table-responsive" width="100%">
                        <tbody>
                        
                            <tr>
                                <th width="15%">Item Code</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemCodeResource1"></asp:TextBox></td>
                                <th width="15%"> <asp:Label ID="Label1" runat="server" 
                                        Text= "<%$ Resources:Resource, ItemName %>" 
                                        meta:resourcekey="Label1Resource1"  ></asp:Label> </th>
                                 
                                <td width="35%">
                                    <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemNameResource1"></asp:TextBox>
                                    


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
                            Text="New Item"  
                            meta:resourcekey="btnNewItemResource1" />
                    <asp:Button ID="btnSaveItem" runat="server" CssClass="btn btn-primary" Text="Save" 
                           ValidationGroup="G1" 
                            meta:resourcekey="btnSaveItemResource1" onclick="btnSaveItem_Click" />
                    <asp:Button ID="btnUpdateItem" runat="server" CssClass="btn btn-warning" 
                            Text="Update"   ValidationGroup="G1" 
                            meta:resourcekey="btnUpdateItemResource1" onclick="btnUpdateItem_Click" />
                    <asp:Button ID="btnCancelItem" runat="server" CssClass="btn btn-danger" 
                            Text="Cancel"  
                            meta:resourcekey="btnCancelItemResource1" onclick="btnCancelItem_Click" />
                     
                     </center>
                </div>
            </div>

        </div>
    </section>



</asp:Content>



     
