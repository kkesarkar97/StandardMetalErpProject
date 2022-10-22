<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ItemMaster_2April.aspx.cs" Inherits="NavnathWebsite.Masters.ItemMaster_2April" %>

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
    <script type="text/javascript">
        $(function () {

            $('.select2').select2()
        })
        function btnReport_onclick() {

        }
    </script>
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
                        <asp:DropDownList ID="drpSearchItem" runat="server" CssClass="form-control select2"  AutoPostBack="true">
                        </asp:DropDownList>
                        </div>
        <div class="col-md-4">
                        <strong class="align text-center">Item Name</strong>
                        <asp:DropDownList ID="drpItemType" runat="server" CssClass="form-control select2" AutoPostBack="true" >
                            </asp:DropDownList>
                    </div>
                  
                  <div class="col-md-4">
                          <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-sm- btn-primary" /> 
                    </div>
                        


                    </div>
                <!-- /.box-body -->

         
         </div>
        
        </div>
        </section>



</asp:Content>
