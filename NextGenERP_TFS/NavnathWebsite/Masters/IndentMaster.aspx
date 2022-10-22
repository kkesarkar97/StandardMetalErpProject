<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IndentMaster.aspx.cs" Inherits="NavnathWebsite.Masters.IndentMaster" %>

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
</script>


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="Server">
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
                
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </section>

    <section id="ItemInfo">
        <div class="col-lg-12 col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Indent Information</h3>

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
                        <th>
                            Select Indent Number:
                        </th>
                        <td>
                            <asp:DropDownList ID="drpIndentNumber" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            From Date: 
                        </th>
                        <td>
                        <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server"
                                    TargetControlID="txtFromDate" Format="MM/dd/yyyy" >
                                    </cc1:CalendarExtender>
                            
                        </td>

                        <th>
                            To Date :
                        </th>
                        <td>
                        <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server"
                                    TargetControlID="txtToDate" Format="MM/dd/yyyy" >
                                    </cc1:CalendarExtender>
                        </td>
                    </tr>
                            
                        </tbody>
                    </table>
                <button type="button" id="btnReport" class="btn btn-info btn-sm" data-toggle="modal" data-target="#ReportModel" onclick="return btnReport_onclick()" onclick="return btnReport_onclick()" onclick="return btnReport_onclick()">View Reports</button>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
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
                        <h4 class="modal-title">Indent Master Report</h4>
                    </div>
                    <div class="modal-body">
                        <asp:Button ID="btnAllIndent" runat="server" CssClass="btn btn-warning" 
                            Text="All Indent Report" onclick="btnAllIndent_Click"/>
                        <asp:Button ID="btnIndentWise" runat="server" CssClass="btn btn-warning" Text="Indent Wise Report"/>
                        <asp:Button ID="btnDateWise" runat="server" CssClass="btn btn-warning" Text="Date Wise Report"/>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
</div>


    </div>


    </div>


</asp:Content>
