<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeMasterNew.aspx.cs" Inherits="NavnathWebsite.Masters.EmployeeMasterNew" %>
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
<div class="col-lg-12 col-md-12">
    <section id="CustomerInfo">
        <div class="col-lg-12 col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Search Employee</h3>
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
                                <td width="5%">
                                    <asp:RadioButton ID="radNameWise" runat="server" GroupName="Searchemp" 
                                        Checked="true" AutoPostBack="True" OnCheckedChanged="radNameWise_CheckedChanged"></asp:RadioButton>
                                </td>
                                <th width="20%">Name Wise</th>
                                <td width="5%">
                                    <asp:RadioButton ID="radCodeWise" runat="server" GroupName="Searchemp" 
                                        AutoPostBack="True" OnCheckedChanged="radCodeWise_CheckedChanged" ></asp:RadioButton>
                                </td>
                                <th width="20%">Code Wise</th>
                                <td width="30%">
                                    <asp:DropDownList ID="drpEmployeeSearch" runat="server" 
                                        CssClass="form-control select2" AutoPostBack="True"></asp:DropDownList>
                                </td>
                                <td width="10%">
                                    <asp:Button ID="btnEmployeeSearch" runat="server" Text="Search Employee" 
                                        CssClass="btn btn-success" OnClick="btnEmployeeSearch_Click" ></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td width="10">
                                    <button type="button" id="btnReport" class="btn btn-info btn-sm" 
                                    data-toggle="modal" data-target="#ReportModel">View Reports</button>
                                </td>
                            </tr>
                        </tbody>
                   </table> 
                </div><!--box-body-->
            </div> <!--box info-->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Employee Information</h3>
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
                                <th width="15%"> Employee Code</th>
                                <td width="35"><asp:TextBox ID="txtEmpCode" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Employee Code" ControlToValidate="txtEmpCode" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Attendance ID</th>
                                <td width="35%"><asp:TextBox ID="txtAttendanceID" runat="server" 
                                        CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Attendance ID" ControlToValidate="txtAttendanceID" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Title</th>
                                <td width="35"><asp:TextBox ID="txtTitle" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Title" ControlToValidate="txtTitle" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Employee's Photo</th>
                                <td width="35%">
                                    <asp:Button ID="btnBrowsePhoto" runat="server" Text="Browse" 
                                        CssClass="btn btn-primary"></asp:Button>&nbsp;&nbsp;<asp:Button ID="btnUploadPhoto" runat="server" Text="Upload" CssClass="btn btn-success" OnClick="btnUploadPhoto_Click"></asp:Button>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">First Name</th>
                                <td width="35"><asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter First name" ControlToValidate="txtFirstName" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Date Of Join</th>
                                <td width="35%"><asp:TextBox ID="txtDateOfJoin" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                                    
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Middle Name</th>
                                <td width="35"><asp:TextBox ID="txtMidName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Middle Name" ControlToValidate="txtMidName" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Qualification</th>
                                <td width="35%"><asp:DropDownList ID="drpQualification" runat="server" 
                                        CssClass="form-control select2">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Select Qualification" ControlToValidate="drpQualification" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Last Name</th>
                                <td width="35"><asp:TextBox ID="txtLastName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Last Name" ControlToValidate="txtLastName" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Designation</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpDesignation" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Select Designagnation" ControlToValidate="drpDesignation" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Contact Number</th>
                                <td width="35%">
                                <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-phone"></i>
                                        </div>
                                        <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter Contact Number" ControlToValidate="txtContactNumber" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Departnamet</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpDepartnamet" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Select Department" ControlToValidate="drpDepartnamet" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Mobile Number</th>
                                <td width="35%">
                                <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-mobile"></i>
                                        </div>
                                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Enter Mobile Number" ControlToValidate="txtMobile" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Category</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpCategory" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Select Category" ControlToValidate="drpCategory" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Email ID</th>
                                <td width="35%">
                                <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-envelope"></i>
                                        </div>
                                        <asp:TextBox ID="txtEmailID" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Enter Email ID" ControlToValidate="txtEmailID" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Weekly Off</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpWeeklyOff" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Select Weekly Off" ControlToValidate="drpWeeklyOff" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Date Of Birth</th>
                                <td width="35%">
                                <div class="input-group">
                                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                                    
                                </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Enter Date Of Birth" ControlToValidate="txtDOB" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Contractor</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpContractor" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Select Contractor" ControlToValidate="drpContractor" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Gender</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpGender" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="Select Gender" ControlToValidate="drpGender" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Type Of Staff</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpTypeOfStaff" runat="server" 
                                            CssClass="form-control select2">
                                                    
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="Select Staff Type" ControlToValidate="drpTypeOfStaff" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Blood Group</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpBloodGroup" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="Select Blood Group" ControlToValidate="drpBloodGroup" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Pay Type</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpPayType" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="Select Plan Type" ControlToValidate="drpPayType" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Marital Status</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpMaritalStatus" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="Select Marital Status" ControlToValidate="drpMaritalStatus" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Unit</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpUnit" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="Select Unit" ControlToValidate="drpUnit" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">CTC</th>
                                <td width="35"><asp:TextBox ID="txtCTC" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="Enter CTC" ControlToValidate="txtCTC" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Aadhar Card Number</th>
                                <td width="35%"><asp:TextBox ID="txtAadharNumber" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ErrorMessage="Enter Aadhar Number" ControlToValidate="txtAadharNumber" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Gross Amount</th>
                                <td width="35"><asp:TextBox ID="txtGrossAmount" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="Enter Gross Amount" ControlToValidate="txtGrossAmount" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Balance</th>
                                <td width="35%"><asp:TextBox ID="txtBalance" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="Enter Balance" ControlToValidate="txtBalance" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>                                
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Temp. Address</th>
                                <td width="35"><asp:TextBox ID="txtTempAddress" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="Enter Temp. Address" ControlToValidate="txtTempAddress" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Permanent Address</th>
                                <td width="35%"><asp:TextBox ID="txtPerAddress" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ErrorMessage="Enter Permanent Address" ControlToValidate="txtPerAddress" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>                                
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Document Name</th>
                                <td width="35"><asp:TextBox ID="txtDocumentName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="Enter Document Name" ControlToValidate="txtDocumentName" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Asset</th>
                                <td width="35%"><asp:TextBox ID="txtAsset" runat="server" CssClass="form-control input-sm" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ErrorMessage="Enter Asset" ControlToValidate="txtAsset" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>                                
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Select Document</th>
                                <td width="35%"><asp:Button ID="btnBrowseDocument" runat="server" Text="Browse" CssClass="btn btn-primary"></asp:Button>&nbsp;<asp:Button ID="btnUploadDocumnet" runat="server" Text="Upload" CssClass="btn btn-success"></asp:Button></td>
                                <th width="15%">Apprasal History</th>
                                <td width="35%"><asp:TextBox ID="txtApprasalHistory" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ErrorMessage="Enter Apprasal History" ControlToValidate="txtApprasalHistory" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>                                
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Training Details</th>
                                <td width="35"><asp:TextBox ID="txtTrainingDetails" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ErrorMessage="Enter Training Details" ControlToValidate="txtTrainingDetails" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">PF Accoount Number</th>
                                <td width="35%"><asp:TextBox ID="txtPFAccount" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ErrorMessage="Enter PF Account Number" ControlToValidate="txtPFAccount" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>                                
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Pan Number</th>
                                <td width="35"><asp:TextBox ID="txtPANNumber" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ErrorMessage="Enter PAN Number" ControlToValidate="txtPANNumber" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">ESIC Accoount Number</th>
                                <td width="35%"><asp:TextBox ID="txtESICNumber" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ErrorMessage="Enter ESIC Account Number" ControlToValidate="txtESICNumber" ForeColor="RED" ValidationGroup="g1"></asp:RequiredFieldValidator>                                
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Auto Mail</th>
                                <td width="35">
                                    <asp:RadioButton ID="radAutoMailYes" runat="server" GroupName="AutoMail" Checked="true" Text="Yes"></asp:RadioButton>&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="radAutoMailNo" runat="server" GroupName="AutoMail" Text="No"></asp:RadioButton>
                                </td>
                                <th width="15%">Is Left</th>
                                <td width="35%">
                                    <asp:RadioButton ID="radIsLeftYes" runat="server" GroupName="IsLeft" Checked="true" Text="Yes"></asp:RadioButton>&nbsp;&nbsp;<asp:RadioButton ID="radIsLeftNo" runat="server" GroupName="IsLeft" Text="No"></asp:RadioButton>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%">Leave Rule</th>
                                <td width="35">
                                    <asp:DropDownList ID="drpLeaveRule" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ErrorMessage="Select Leave Rule" ControlToValidate="drpLeaveRule" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>
                                </td>
                                <th width="15%">Left Date</th>
                                <td width="35%"><asp:TextBox ID="txtLeftDate" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                      
                                </td>
                            </tr>


                        </tbody>
                   </table>
                   <div class="row">
                        <center>
                               <asp:Button ID="btnNewItem" runat="server" Text="New Employee" 
                                   CssClass="btn btn-success" OnClick="btnNewItem_Click" ></asp:Button>
                                   <asp:Button ID="btnSave" runat="server" Text="Save Employee" 
                                   CssClass="btn btn-primary" ValidationGroup="g1" OnClick="btnSave_Click" ></asp:Button>
                               <asp:Button ID="btnUpdate" runat="server" Text="Update Employee" 
                                   CssClass="btn btn-warning" OnClick="btnUpdate_Click" ></asp:Button>
                               <asp:Button ID="btnCancel" runat="server" Text="Delete Employee" 
                                   CssClass="btn btn-danger" OnClick="btnCancel_Click" ></asp:Button>
                               <asp:Button ID="btnreport" runat="server" Text="report Employee" 
                                   CssClass="btn btn-danger" OnClick="btnreport_Click" ></asp:Button>

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
                        <asp:Button ID="btnEmployeeWise" runat="server" CssClass="btn btn-warning" Text="Employee Wise Report"  />
                        <asp:Button ID="btnAllEmployee" runat="server" CssClass="btn btn-warning" Text="All Employee Report"  />
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



    </div>



    </div>



</asp:Content>
