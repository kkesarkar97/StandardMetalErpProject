<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginUserMaster.aspx.cs" Inherits="NavnathWebsite.Admin.LoginUserMaster" %>



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



<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="Server">

 
 
    <section id="ItemSearch">

    <div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" 
            ShowSummary="False" ValidationGroup="G1" 
            meta:resourcekey="ValidationSummary1Resource1"></asp:ValidationSummary>
    </div>

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
                     <strong><asp:Label ID="lblSearchRole" runat="server" Text="Search Role"></asp:Label></strong>
                        <asp:DropDownList ID="drpSearchName" runat="server" 
                            CssClass="form-control select2" >
                        </asp:DropDownList>

                    </div>
                      
                      <div class="col-md-4">
                       <%-- <strong>Item SubType</strong>--%>
                       <asp:Button runat="server" ID="btnSearch" Text="Search" 
                              CssClass="btn btn-sm- btn-primary" onclick="btnSearch_Click" /> 
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </section>




    <section id="ItemInfo">
        <div class="col-lg-12 col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title"> 
                    <asp:Label ID="lblRoleDetail" runat="server" Text="Role Detail"></asp:Label> </h3>
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
                         <th width="15%">
                         <asp:Label ID="lblLoginuserName" runat="server" Text="Login User Name"></asp:Label> </th>
                                <td width="35%">
                                 <asp:TextBox ID="txtLoginUserName" runat="server" CssClass="form-control input-sm">
                                 </asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ErrorMessage="Please Enter Login User Name" ControlToValidate="txtLoginUserName" 
                                        ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>
<%--                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ErrorMessage="Incorrect EMail Entered" ControlToValidate="txtLoginUserName" 
                                        ForeColor="Red" 
                                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ValidationGroup="G1"></asp:RegularExpressionValidator>--%>
                               <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ErrorMessage="Enter Username Without Special Char and Number if its not an email" 
                                        ControlToValidate="txtLoginUserName" ForeColor="Red" 
                                        ValidationExpression="^[A-Za-z]$" ValidationGroup="G1"></asp:RegularExpressionValidator>--%>
                                 </td>
                                <th width="15%"> <asp:Label ID="lblRoleName" runat="server" Text="Role Name"></asp:Label> </th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpRoleName" runat="server" 
                            CssClass="form-control select2">
                        </asp:DropDownList>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                        ErrorMessage="*" 
                                        ControlToValidate="drpRoleName" ForeColor="Red" 
                                        ValidationGroup="G1" Operator="NotEqual" 
                                        ValueToCompare="Select"></asp:CompareValidator>
                                         
                        </td>
                               
                            </tr>
                            <tr>
                                 <th width="15%"> <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label></th>
                                <td width="35%">
                                 <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control input-sm" 
                                        ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ErrorMessage="Password is not entered" ControlToValidate="txtPassword" 
                                        ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>

                                        </td>
                                <th width="15%"> <asp:Label ID="Label1" runat="server" Text="ConfirmPassword"></asp:Label></th>
                                <td width="35%">
                                 <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control input-sm" 
                                        ></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ErrorMessage="Password Not Matches" ControlToCompare="txtPassword" 
                                        ControlToValidate="txtConfirmPassword" ForeColor="Red" 
                                        ValidationGroup="G1"></asp:CompareValidator>
                                        </td>
                                        </tr>
                           <tr>
                           <th width="15%"> <asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name"></asp:Label></th>
                                <td width="35%">
                                 <asp:DropDownList ID="drpEmployeeName" runat="server" 
                            CssClass="form-control select2">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ErrorMessage="*" ControlToValidate="drpEmployeeName" 
                                        ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                        ErrorMessage="*" 
                                        ControlToValidate="drpEmployeeName" ForeColor="Red" 
                                        ValidationGroup="G1" Operator="NotEqual" 
                                        ValueToCompare="&quot;Select&quot;"></asp:CompareValidator>
                                        </td>
                        </td>
                        <th width="15%"> <asp:Label ID="lblIsActive" runat="server" Text="IsActive"></asp:Label> </th>
                                <td width="35%">
                                 <asp:CheckBox ID="chkIsActive"  Checked="true" runat="server" Text=""/>
                                 </td>
                                <th width="15%"></th>
                                <td width="35%"></td>
                            </tr>
                            </tbody>
                    </table>

                    
                    <br />

                    <br />

                    <br />

                     <div class="row">
                        <center>
                               <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn btn-success" 
                                     ></asp:Button>
                               <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" 
                                     ValidationGroup="G1" onclick="btnSave_Click"  
                                  ></asp:Button>
                               <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                                   CssClass="btn btn-warning"  ValidationGroup="G1" 
                                   onclick="btnUpdate_Click" ></asp:Button>
                               
                               <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                   CssClass="btn btn-danger"
                                   ></asp:Button>
                             
                        </center>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </section>
</asp:Content>