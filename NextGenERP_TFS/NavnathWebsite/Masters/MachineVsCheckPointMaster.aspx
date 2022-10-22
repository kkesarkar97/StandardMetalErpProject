<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MachineVsCheckPointMaster.aspx.cs" Inherits="NavnathWebsite.Masters.MachineVsCheckPointMaster" %>

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
                    <h3 class="box-title">Search Machine</h3>
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
                                <th width="15%">Select Machine</th>
                                <td width="55%">
                                    <asp:DropDownList ID="drpMachineSearch" runat="server" 
                                        CssClass="form-control select2" 
                                        onselectedindexchanged="drpMachineSearch_SelectedIndexChanged" 
                                        AutoPostBack="True"></asp:DropDownList></td>
                                <td width="30%">
                                    <asp:Button ID="btnMachineSearch" runat="server" Text="Search" 
                                        CssClass="btn btn-primary" onclick="btnMachineSearch_Click"></asp:Button></td>
                                <td>
                                <input id="Radio1" type="radio" name="Radio Button" value="Radio Search"/>
                                </td>
                                <td>
                                <input id="Radio2" type="radio" name="Radio Button" value="Radio Search"/>
                                </td>
                                <td>
                                <input id="Radio3" type="radio" name="Radio Button" value="Radio Search"/>
                                </td>
                            </tr>
                        </tbody>
                   </table> 
                </div><!--box-body-->
            </div> <!--box info-->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Machine Information</h3>
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
                                <th width="10%">Machine Code</th>
                                <td width="20%">
                                    <asp:DropDownList ID="drpMachineCode" runat="server" 
                                        CssClass="form-control select2" AutoPostBack="True" 
                                        onselectedindexchanged="drpMachineCode_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Please Select Machine Code" ForeColor="RED" ValidationGroup="g1" Display="Dynamic" Operator="NotEqual" ValueToCompare="Select" ControlToValidate="drpMachineCode"></asp:CompareValidator>
                                        </td>
                                <th width="10%">Machine Name</th>
                                <td width="20%"><asp:DropDownList ID="drpMachineName" runat="server" 
                                        CssClass="form-control select2" AutoPostBack="True" 
                                        onselectedindexchanged="drpMachineName_SelectedIndexChanged"></asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Please Select Machine Name" ForeColor="RED" ValidationGroup="g1" Display="Dynamic" Operator="NotEqual" ValueToCompare="Select" ControlToValidate="drpMachineName"></asp:CompareValidator>
                                </td>
                                <th width="10%">Plan Type</th>
                                <td width="20%"><asp:DropDownList ID="drpPlanType" runat="server" 
                                        CssClass="form-control select2" 
                                        onselectedindexchanged="drpPlanType_SelectedIndexChanged" 
                                        AutoPostBack="True">
                                    <asp:ListItem Value="Select"></asp:ListItem>
                                    <asp:ListItem Value="Daily"></asp:ListItem>
                                    <asp:ListItem Value="Weekly"></asp:ListItem>
                                    <asp:ListItem Value="By Weekly"></asp:ListItem>
                                    <asp:ListItem Value="Monthly"></asp:ListItem>
                                    <asp:ListItem Value="Quaterly"></asp:ListItem>
                                    <asp:ListItem Value="Half Year"></asp:ListItem>
                                    <asp:ListItem Value="Yearly"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Please Select Plan Type" ForeColor="RED" ValidationGroup="g1" Display="Dynamic" Operator="NotEqual" ValueToCompare="Select" ControlToValidate="drpPlanType"></asp:CompareValidator>
                                    </td>
                               
                            </tr>
                            <tr>
                                <th width="10%"> Location </th>
                                <td width="20"><asp:TextBox ID="txtLocation" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Location" ControlToValidate="txtLocation" ValidationGroup="g1" ForeColor="RED"></asp:RequiredFieldValidator>
                                </td>
                                <th width="10%">Parameter</th>
                                <td width="20%"><asp:TextBox ID="txtParameter" runat="server" CssClass="form-control input-sm"></asp:TextBox> 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Parameter" ControlToValidate="txtParameter" ValidationGroup="g1" ForeColor="RED"></asp:RequiredFieldValidator>
                                </td>
                                <th width="10%"> Schedule</th>
                                <td width="20%"><asp:DropDownList ID="drpSchedule" runat="server" CssClass="form-control select2"></asp:DropDownList><br />
                                                <asp:Button ID="AddSchedule" runat="server" Text="Add" 
                                   CssClass="btn btn-primary" onclick="AddSchedule_Click"></asp:Button>
                                                <asp:Button ID="RemoveSchedule" runat="server" Text="Remove" 
                                   CssClass="btn btn-danger" onclick="RemoveSchedule_Click"></asp:Button>
                        
                                
                                </td>
                            </tr>
                            <tr>
                                <th width="10%"> Check Point </th>
                                <td width="20%"><asp:TextBox ID="txtCheckPoint" runat="server" 
                                        CssClass="form-control input-sm" ontextchanged="txtCheckPoint_TextChanged" 
                                        AutoPostBack="True"></asp:TextBox>
                                        <asp:Label ID="lblCheckptError" runat="server" ForeColor="#FF3300"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Check Point" ControlToValidate="txtCheckPoint" ValidationGroup="g1" ForeColor="RED"></asp:RequiredFieldValidator>
                                </td>
                                <th width="10%"> Serial Number</th>
                                <td width="20"><asp:TextBox ID="txtSerialNumber" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Serial Number" ControlToValidate="txtSerialNumber" ValidationGroup="g1" ForeColor="RED"></asp:RequiredFieldValidator>
                                </td>
                                 <td width="40%" colspan="2"> <asp:ListBox ID="lstSchedule" runat="server" Height="95px" 
                                        Width="100%"></asp:ListBox> </td>
                            </tr>
                        </tbody>
                   </table>
                   <div class="row">
                        <center>
                               <asp:Button ID="btnAddItem" runat="server" Text="Add" 
                                   CssClass="btn btn-success" onclick="btnAddItem_Click" ValidationGroup="g1"></asp:Button>
                        </center>
                    </div>
                </div><!--box-body-->
            </div> <!--box info-->


            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Check Point Details</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                    </div><!--box-tool -->
                </div><!--box-header -->
                <div class="box-body">
                
              
                                        
                                          <div style="width: 100%; height: 150px;  overflow:scroll; clear: both; border: 1px solid #808080;">


                                             

                                                 <asp:GridView  runat="server" ID="grdMVCDetailis"  AutoGenerateColumns="False" EmptyDataText="NO DATA FOUND"
                                                ShowHeaderWhenEmpty="True" Width="100%"  TabIndex="7" 
                                                CellPadding="4"   AllowSorting="True" 
                                                 
                                                style="margin-top: 0px" onrowcommand="grdMVCDetailis_RowCommand">
                                                <AlternatingRowStyle Wrap="False" />
                                                <HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" Wrap="True" />
                                                <RowStyle BackColor="White" Wrap="False" />
                                                <SelectedRowStyle Wrap="False" />
                                                <Columns >
                                                <asp:TemplateField HeaderText="Sr No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID8" runat="server" Text='<%#Eval("ID8") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Machine Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID1" runat="server" Text='<%#Eval("ID1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText=" Machine Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID2" runat="server" Text='<%#Eval("ID2") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Check Point">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID3" runat="server" Text='<%#Eval("ID3") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Parameters">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID6" runat="server" Text='<%#Eval("ID6") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Location">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID7" runat="server" Text='<%#Eval("ID7") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Plan Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID4" runat="server" Text='<%#Eval("ID4") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Schedule">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID5" runat="server" Text='<%#Eval("ID5") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Remove">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="Button1" runat="server" Text="Remove" CommandName="Remove"
                                                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                            ></asp:LinkButton></td>
                                                        </ItemTemplate>
                                                    </asp:TemplateField> 
                                                </Columns>
                                              
                                            </asp:GridView>
                                            </div>
                                     
                   
                </div><!--box-body-->
            </div> <!--box info-->
                    <div class="row">
                        <center>
                               <asp:Button ID="btnSave" runat="server" Text="Save" 
                                   CssClass="btn btn-primary" onclick="btnSave_Click"></asp:Button>
                               <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                                   CssClass="btn btn-warning" onclick="btnUpdate_Click"></asp:Button>
                               <asp:Button ID="btnExit" runat="server" Text="Cancel" CssClass="btn btn-info" 
                                   onclick="btnExit_Click"></asp:Button>
                                <button type="button" id="btnReport" class="btn btn-info btn-sm" 
                                data-toggle="modal" data-target="#ReportModel" onclick="return btnReport_onclick()" 
                                onclick="return btnReport_onclick()" 
                                onclick="return btnReport_onclick()">View Reports</button>
                          
                        </center>
                    </div>

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
                        <h4 class="modal-title">MachineVsCheckPoint Report</h4>
                    </div>
                    <div class="modal-body">
                        <asp:Button ID="btnRemove" runat="server" Text="Preview All" 
                                   CssClass="btn btn-danger" onclick="btnRemove_Click"></asp:Button>
                        <asp:Button ID="BtnMachineWise" runat="server" Text="Preview Machine Wise" 
                                   CssClass="btn btn-danger" onclick="BtnMachineWise_Click"></asp:Button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
</div>



</asp:Content>
