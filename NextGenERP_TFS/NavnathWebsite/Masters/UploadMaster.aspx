<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="UploadMaster.aspx.cs" Inherits="NavnathWebsite.Masters.UploadMaster" %>

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
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="server">
    <div class="col-lg-12 col-md-12">
        <section id="UploadSheet">
        <div class="col-lg-12 col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Upload Master</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                    </div>
                    <!-- /.box-tools -->
                </div>
                <!-- /.box-header -->

<table class="table-condensed table-hover table-responsive">
    <tbody>
       <tr>
            <th>
                Company/Client Name:
            </th>
            <td>
                    <asp:DropDownList ID="drpClient" runat="server" CssClass="form-control select2">
                    <asp:ListItem>--Select--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ErrorMessage="Please Select Client" ControlToValidate="drpClient" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <th> Upload Name: </th>
            <td>
                    <asp:DropDownList ID="drpUploadName" runat="server" 
                        CssClass="form-control select2" 
                        onselectedindexchanged="drpUploadName_SelectedIndexChanged" 
                        AutoPostBack="True" AppendDataBoundItems="true">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Please Upload Name" ControlToValidate="drpUploadName" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <th>Upload Type: </th>
            <td>
                    <asp:DropDownList ID="drpUploadType" runat="server" CssClass="form-control select2">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Please Upload Type" ControlToValidate="drpUploadType" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
            
            </td>
        </tr>

        <tr>
            <th>
                <asp:FileUpload ID="uploadExcel" runat="server"/>
            </th>
            <td>
                <asp:Button ID="btnValidate" runat="server" CssClass="btn btn-primary" 
                    Text="Validate" ValidationGroup="g1" onclick="btnValidate_Click"/>
            </td>
        </tr>

                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
    </section>
        <asp:GridView ID="grdUplodedData1" runat="server" Width="100%" BorderStyle="Solid">
        </asp:GridView>
    </div>
    <div class="box-body">
    </div>
</asp:Content>
