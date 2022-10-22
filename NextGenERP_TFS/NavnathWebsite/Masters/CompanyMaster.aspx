<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CompanyMaster.aspx.cs" Inherits="NavnathWebsite.Demo.CompanyMaster" %>

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
        $(document).ready(function () {

            // Code to not accept anything in text box
            $("#<%=demoDate.ClientID%>").keyup(function () {
                $("#<%=demoDate.ClientID%>").val('');
            });

            // code to check date is entered or not on button Click
            $("#<%=btnUpdateItem.ClientID%>").click(function () {
                if ($("#<%=demoDate.ClientID%>").val() == "" || $("#<%=demoDate.ClientID%>").val() == null) {
                    alert("Please select Date")
                    $("#<%=demoDate.ClientID%>").focus();
                    return false;
                }
                else { 
                    return true;
                }
            });

        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="Server">
    <div class="col-lg-12 col-md-12">
        <section id="CompanyInfo">
        <div class="col-lg-12 col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Information</h3>

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
                                <th width="15%">Date</th>
                                <td width="35%">
                                    <asp:TextBox ID="demoDate" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="demoDate" Animated="true" ></cc1:CalendarExtender>
                                    </td>
                        </tr>
                            <tr>
                                <th width="15%">Company Name</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtCompanyName" ValidationGroup="g1" ErrorMessage="*" 
                                        ForeColor="#cc0000">Enter Comany Name</asp:RequiredFieldValidator>
                                    </td>  
                            </tr>
                           
                            <tr>
                                <th width="15%">Address 1</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtCxAddress1" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="txtCxAddress1" ValidationGroup="g1" ErrorMessage="*" 
                                        ForeColor="#cc0000">Enter Address</asp:RequiredFieldValidator>
                                    </td>
                                <th width="15%">Address 2</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtCxAddress2" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    </td>
                            </tr>
                            
                            <tr>
                                <th width="15%">City</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtCxCity" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter City" ControlToValidate="txtCxCity" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                    </td>
                                <th width="15%">State</th>
                                <asp:UpdatePanel ID="stateUpdte" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="drpCxState" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <td>
                                            <asp:DropDownList ID="drpCxState" runat="server" CssClass="form-control select2">
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
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Please Select State" ForeColor="RED" ValidationGroup="g1" Display="Dynamic" Operator="NotEqual" ValueToCompare="--Select--" ControlToValidate="drpCxState"></asp:CompareValidator>
                                        </td>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </tr>
                            <tr>
                                <th width="15%">Pin Code</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtCxPinCode" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Pin Code" ForeColor="RED" ControlToValidate="txtCxPinCode" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                    </td>
                                <th width="15%">Country</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtCxCountry" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Country Name" ForeColor="RED" ControlToValidate="txtCxCountry" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                    </td>
                            </tr>
                            <tr>
                                <th width="15%">Email ID</th>

                                <td width="35%">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-envelope"></i>
                                        </div>
                                        <asp:TextBox ID="txtCxEmail" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                    </div>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ErrorMessage="Enter Proper Email format" ControlToValidate="txtCxEmail" 
                                        ForeColor="red" ValidationGroup="g1" 
                                        ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$"></asp:RegularExpressionValidator>
                                    
                                </td>
                                <th width="15%">Telephone</th>
                                <td width="35%">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-phone"></i>
                                        </div>
                                        <asp:TextBox ID="txtCxTelephone" runat="server" CssClass="form-control input-sm"  data-inputmask='"mask": "(999) 9999-9999"' data-mask></asp:TextBox>
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
                                        <asp:TextBox ID="txtCxMobile" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Mobile Number" ControlToValidate="txtCxMobile" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                 <th width="15%">Contact Person</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtCxContactPerson" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Contact Person" ControlToValidate="txtCxContactPerson" ValidationGroup="g1" ForeColor="RED"></asp:RequiredFieldValidator>

                                </td>
                                
                            </tr>
                            <tr>
                                <th width="15%">Website</th>

                                <td width="35%">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-globe"></i>
                                        </div>
                                        <asp:TextBox ID="txtCxWebsite" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                    </div>
                                </td>
                                <th width="15%">GSTIN</th>
                                <td width="35%">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-balance-scale"></i>
                                        </div>
                                        <asp:TextBox ID="txtCxGSTIN" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter GSTIN" ControlToValidate="txtCxGSTIN" ValidationGroup="g1" ForeColor="RED"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                           
                        </tbody>
                    </table>
                    <div class="row">
                        <center>
                   
                    <asp:Button ID="btnUpdateItem" runat="server" CssClass="btn btn-warning" 
                                Text="Update" onclick="btnUpdateItem_Click" ValidationGroup="g1" />
                        <asp:Button ID="btnCancelItem" runat="server" CssClass="btn btn-danger" 
                                Text="Cancel" onclick="btnCancelItem_Click" />

                           
                    </center>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </section>
    </div>
</asp:Content>
