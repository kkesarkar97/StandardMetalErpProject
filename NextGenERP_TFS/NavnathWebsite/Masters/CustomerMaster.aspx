<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerMaster.aspx.cs" Inherits="NavnathWebsite.Demo.CustomerMaster" %>
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
<script src="../bower_components/datatables.net-bs/js/data<a href="CustomerMaster.aspx">CustomerMaster.aspx</a>Tables.bootstrap.min.js" type="text/javascript"></script>
<script src="../bower_components/select2/dist/js/select2.full.min.js" type="text/javascript"></script>

<script type="text/javascript">
    $(function () {

        $('.select2').select2()
    })
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="server">

<div class="col-lg-12 col-md-12">
    <section id="CustomerInfo">
        <div class="col-lg-12 col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Search</h3>
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
                                <th width="15%">Customer Name</th>
                                <td width="55%">
                                    <asp:DropDownList ID="drpCustSearch" runat="server" 
                                        CssClass="form-control select2" 
                                        ></asp:DropDownList></td>
                                <td width="30%">
                                    <asp:Button ID="btnCustSearch" runat="server" Text="Search" 
                                        CssClass="btn btn-primary" onclick="btnCustSearch_Click"></asp:Button>
                                </td>
                            </tr>
                        </tbody>
                   </table> 
                </div><!--box-body-->
            </div> <!--box info-->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Information</h3>
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
                                <td width="50"><asp:TextBox ID="txtCustCode" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Customer Code" ControlToValidate="txtCustCode" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <td width="50%"><asp:TextBox ID="txtCustName" runat="server" 
                                        CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Customer Name" ControlToValidate="txtCustName" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                
                                </td>
                            </tr>
                            <tr>
                                <th width="15%"> Contact Person</th>
                                <td width="35"><asp:TextBox ID="txtContPerson" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Contact Person" ControlToValidate="txtContPerson" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Branch</th>
                                <td width="35%"><asp:TextBox ID="txtBranch" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Branch" ControlToValidate="txtBranch" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%"> Address1</th>
                                <td width="35"><asp:TextBox ID="txtAddress1" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Address" ControlToValidate="txtAddress1" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Address2</th>
                                <td width="35%"><asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control input-sm"></asp:TextBox> </td>
                            </tr>
                            <tr>
                                <th width="15%"> City</th>
                                <td width="35"><asp:TextBox ID="txtCity" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter City" ControlToValidate="txtCity" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">State</th>
                                <td width="35%"><asp:DropDownList ID="drpState" runat="server" 
                                        CssClass="form-control select2">
                                                <asp:ListItem>--Select--</asp:ListItem>
                                                <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                                <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                                                <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                                <asp:ListItem>Assam</asp:ListItem>
                                                <asp:ListItem>Bihar</asp:ListItem>
                                                <asp:ListItem>Chandigarh</asp:ListItem>
                                                <asp:ListItem>Chhattisgarh</asp:ListItem>
                                                <asp:ListItem>Dadar and Nagar Haveli</asp:ListItem>
                                                <asp:ListItem>Daman and Diu</asp:ListItem>
                                                <asp:ListItem>Delhi</asp:ListItem>
                                                <asp:ListItem>Goa</asp:ListItem>
                                                <asp:ListItem>Gujarat</asp:ListItem>
                                                <asp:ListItem>Haryana</asp:ListItem>
                                                <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                                <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                                                <asp:ListItem>Jharkhand</asp:ListItem>
                                                <asp:ListItem>Karnataka</asp:ListItem>
                                                <asp:ListItem>Kerala</asp:ListItem>
                                                <asp:ListItem>Lakshadweep</asp:ListItem>
                                                <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                                <asp:ListItem>Maharashtra</asp:ListItem>
                                                <asp:ListItem>Manipur</asp:ListItem>
                                                <asp:ListItem>Meghalaya</asp:ListItem>
                                                <asp:ListItem>Mizoram</asp:ListItem>
                                                <asp:ListItem>Nagaland</asp:ListItem>
                                                <asp:ListItem>Odisha</asp:ListItem>
                                                <asp:ListItem>Pondicherry</asp:ListItem>
                                                <asp:ListItem>Punjab</asp:ListItem>
                                                <asp:ListItem>Rajasthan</asp:ListItem>
                                                <asp:ListItem>Sikkim</asp:ListItem>
                                                <asp:ListItem>Tamil Nadu</asp:ListItem>
                                                <asp:ListItem>Telangana</asp:ListItem>
                                                <asp:ListItem>Tripura</asp:ListItem>
                                                <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                                <asp:ListItem>Uttarakhand</asp:ListItem>
                                                <asp:ListItem>West Bangal</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Select State" ControlToValidate="drpState" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%"> Pin Code</th>
                                <td width="35"><asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Pin Code" ControlToValidate="txtPinCode" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Country</th>
                                <td width="35%"><asp:TextBox ID="txtCountry" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Country" ControlToValidate="txtCountry" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Email ID</th>
                                <td width="35%">
                                <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-envelope"></i>
                                        </div>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtEmail" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Telephone</th>
                                <td width="35%">
                                <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-phone"></i>
                                        </div>
                                        <asp:TextBox ID="txtTelephone" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Mobile</th>
                                <td width="35%">
                                <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-mobile"></i>
                                        </div>
                                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Enter Mobile Number" ControlToValidate="txtMobile" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Fax</th>
                                <td width="35%">
                                <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-fax"></i>
                                        </div>
                                        <asp:TextBox ID="txtFax" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Web Site</th>
                                <td width="35%">
                                <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-globe"></i>
                                        </div>
                                        <asp:TextBox ID="txtWebSite" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                </div>
                                </td>
                                <th width="15%">GSTIN</th>
                                <td width="35%">
                                <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-balance-scale"></i>
                                        </div>
                                        <asp:TextBox ID="txtGSTIN" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Enter GSTIN" ControlToValidate="txtGSTIN" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Remark</th>
                                <td width="35%"><asp:TextBox ID="txtRemark" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                            </tr>
                        </tbody>
                   </table>
                   <div class="row">
                        <center>
                               <asp:Button ID="btnNewItem" runat="server" Text="New Item" 
                                   CssClass="btn btn-success" onclick="btnNewItem_Click"></asp:Button>
                                   <asp:Button ID="btnSave" runat="server" Text="Save" 
                                   CssClass="btn btn-primary" onclick="btnSave_Click" ValidationGroup="g1"></asp:Button>
                               <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                                   CssClass="btn btn-warning" onclick="btnUpdate_Click"></asp:Button>
                               <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                   CssClass="btn btn-danger" onclick="btnCancel_Click"></asp:Button>


                        <asp:Button ID="BtnAllCustomer" runat="server" CssClass="btn btn-warning" 
                                   Text="Employee Wise Report" />
                        <asp:Button ID="btnCustWise" runat="server" CssClass="btn btn-warning" 
                                   Text="All Employee Report" OnClick="btnCustWise_Click" />



                                    <button type="button" id="btnReport" class="btn btn-info btn-sm" 
                                    data-toggle="modal" data-target="#ReportModel" 
                                    onclick="return btnReport_onclick()" onclick="return btnReport_onclick()" 
                                    onclick="return btnReport_onclick()">Preview</button>

                        </center>
                    </div>
                </div><!--box-body-->
            </div> <!--box info-->
        </div>
    </section>
</div>

<div class="model">

        <!-- ReportModel -->
        <div class="modal fade" id="ReportModel" role="dialog">
            <div class="modal-dialog">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Employee Master Report</h4>
                    </div>
                    <div class="modal-body">




                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
</div>

</asp:Content>
