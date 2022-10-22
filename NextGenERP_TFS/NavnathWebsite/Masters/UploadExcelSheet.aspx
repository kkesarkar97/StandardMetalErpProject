<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="UploadExcelSheet.aspx.cs" Inherits="NavnathWebsite.Masters.UploadExcelSheet" %>

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
    <style type="text/css">
        .style1
        {
            height: 46px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="server">
    <div class="col-lg-12 col-md-12">
        <section id="UploadSheet">
        <div class="col-lg-12 col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Upload Excelsheet</h3>

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
                Company/Client Name:
            </th>
            <td>
                    <asp:DropDownList ID="drpClient" runat="server" CssClass="form-control select2">
                    <asp:ListItem>--Select--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ErrorMessage="Please Select Client" ControlToValidate="drpClient" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
            </td>
            <td></td>
            <td></td>
        </tr>

        <tr>
            <th> Upload Name: </th>
            <td>
                    <asp:DropDownList ID="drpUploadName" runat="server" 
                        CssClass="form-control select2" 
                        
                        AutoPostBack="True" AppendDataBoundItems="true" 
                        onselectedindexchanged="drpUploadName_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Please Upload Name" ControlToValidate="drpUploadName" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>

            </td>
              <td></td>
            <td></td>
        
        </tr>
        <tr>
            <th>Upload Type: </th>
            <td>
                    <asp:DropDownList ID="drpUploadType" runat="server" CssClass="form-control select2">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Please Upload Type" ControlToValidate="drpUploadType" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
            
            </td>
              <td></td>
            <td></td>
        
        </tr> 





                            <tr>
                                
                                <th width="20%" class="style1">Select File</th>
                                <td width="40%" class="style1">
                                    <asp:FileUpload ID="uploadExcel" runat="server" CssClass="btn btn-Primary"/>
                                </td>
                                <td width="20%" class="style1">
                                    <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-primary" onclick="btnUpload_Click"></asp:Button>
                                </td>
                                <td width="20%" class="style1">
                                    <a href="../ExcelFile/Templates/MachineVsCheckPoint_Template.xlsx">Download Template</a>
                                </td>
                             </tr>
                             <tr>
                                <th width="100%" colspan="3">
                                    <center><asp:Label ID="lblResult" runat="server" Text=""></asp:Label></center>
                                </th>
                             </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <center><asp:Label ID="lbl1" runat="server" Text="" Font-Bold="true" ForeColor="GREEN"></asp:Label></center>

    <asp:GridView ID="grdUplodedData" runat="server" width="100%" Enabled="false" BorderStyle="Solid">
                    </asp:GridView>

      <center><asp:Label ID="lbl2" runat="server" Text="" Font-Bold="true" ForeColor="RED"></asp:Label>
      &nbsp;&nbsp;&nbsp; <asp:Button 
              ID="btnUpload0" runat="server" Text="Download File" 
              CssClass="btn btn-primary" onclick="btnUpload0_Click" 
              ></asp:Button>
                                </center>

    <asp:GridView ID="grdUplodedData1" runat="server" width="100%" Enabled="false" BorderStyle="Solid">
                    </asp:GridView>
    </section>
    </div>
</asp:Content>
