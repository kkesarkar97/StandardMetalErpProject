<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubMenuMaster.aspx.cs" Inherits="NavnathWebsite.Masters.SubMenuMaster" %>



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
    <script type="text/javascript">
        $(function () {

            $('.select2').select2()
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
&nbsp; 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="server">
    <div class="col-lg-12 col-md-12">
        <section id="CustomerInfo">
        <div class="col-lg-12 col-md-12">
          

            <div class="box box-info">
             <div class="box-header with-border">
                    <h3 class="box-title">SubMenu Details</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                    </div><!--box-tool -->
                </div><!--box-header -->

                <div class="box-body">
                   <table class="table-condensed table-hover table-responsive" width="100%">
                        <tbody>
                            <tr>

                             
                             <th width="20%">Menu Name</th>
                                <td width="30%">
                                    <asp:DropDownList ID="drpMenuName" runat="server" 
                                        CssClass="form-control select2" AutoPostBack="True" 
                                         ></asp:DropDownList>
                                </td>
                               
                             
                                 <th style="width: 15%">  SubMenu Name </th>
                                <th style="width: 35%">
                                   <asp:TextBox ID="txtSubMenuName" runat="server" CssClass="form-control input-sm" 
                                         ></asp:TextBox>
                                </th>
                                
                            </tr>
                            <tr>
                               
                              <th width="25%">SubMenu Link</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtSubMenuLink" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                </td>
                              <th width="25%">IsActive</th>
                                <td width="35%">
                              <asp:CheckBox ID="chkSubMenuIsActive" Checked="true" runat="server" Text="" />
                                 </td>
                            </tr>


                        </tbody>
                   </table> 
                </div><!--box-body-->
            </div> <!--box info-->

             <div class="box box-info hide">
                <div class="box-header with-border">
                    <h3 class="box-title"> - </h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                    </div><!--box-tool -->
                </div><!--box-header -->
                <div class="box-body">
                   <table class="table-condensed table-hover table-responsive" width="100%">
                      <tr>
                           <td width="25">
                                <asp:RadioButton ID="rdbItem" runat="server" GroupName="Searchemp" AutoPostBack="True" Text="&nbsp;&nbsp;Item"></asp:RadioButton>
                            </td>
                            <td width="25">
                                <asp:RadioButton ID="rdbMeasuringInstrument" runat="server" GroupName="Searchemp" AutoPostBack="True" Text="&nbsp;&nbsp;Measuring Instrument"></asp:RadioButton>
                            </td>
                            <td width="25">
                                <asp:RadioButton ID="rdbMachine" runat="server" GroupName="Searchemp" AutoPostBack="True" Text="&nbsp;&nbsp;Machine"></asp:RadioButton>
                            </td>
                            <td width="25">
                                <asp:RadioButton ID="rdbToolMode" runat="server" GroupName="Searchemp" AutoPostBack="True" Text="&nbsp;&nbsp;Tool/Mode"></asp:RadioButton>
                            </td>
                      </tr>
                              
                   </table> 
                </div><!--box-body-->
            </div> <!--box info-->

              <!--box info-->

              <div class="row">
                         
                    </div>



             <div class="box box-info">
                 <!--box-header -->
                 <!--box-body----%>
            </div> <!--box info-->

              <div class="box-body">
                   
                   <div class="row">
                        <center>
                               <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn btn-success" onclick="btnNew_Click" 
                                    ></asp:Button>
                               <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" onclick="btnSave_Click" 
                                   ></asp:Button>
                             <%--  <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                                   CssClass="btn btn-warning"  ></asp:Button>--%>
                               <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                   CssClass="btn btn-danger" onclick="btnCancel_Click"  ></asp:Button>
                               


                        </center>
                    </div>
                </div><!--box-body-->



        </div>
    </section>
    </div>
    </div>
</asp:Content>



