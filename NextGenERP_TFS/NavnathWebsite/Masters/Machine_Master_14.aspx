<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Machine_Master_14.aspx.cs" Inherits="NavnathWebsite.Masters.Machine_Master_14" %>
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

    <style type="text/css">
        .style1
        {
            height: 57px;
        }
        .style2
        {
            height: 37px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="server">

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
                       
                        <strong>Machine Code</strong>
                        <asp:DropDownList ID="drpMachineCode" runat="server" 
                            CssClass="form-control select2" 
                             
                             
                            AutoPostBack="True" 
                            onselectedindexchanged="drpMachineCode_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <strong class="align text-center">Machine Name</strong>
                        <asp:DropDownList ID="drpMachineName" runat="server" 
                            CssClass="form-control select2"  
                            AutoPostBack="True" 
                            onselectedindexchanged="drpMachineName_SelectedIndexChanged" >
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                       <%-- <strong>Item SubType</strong>--%>
                        
                    </div>

                      <div class="col-md-4">
                       <%-- <strong>Item SubType</strong>--%>
                       
                          <asp:Button runat="server" ID="btnSearch" Text="Search" 
                              CssClass="btn btn-sm- btn-primary"  
                              meta:resourcekey="btnSearchResource1" onclick="btnSearch_Click"/> 
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
                    <h3 class="box-title">Item Information</h3>

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
                                <th style="width: 15%"> <asp:Label ID="Label17" runat="server" Text="Machine Type"></asp:Label> </th>
                                <th style="width: 35%">
                                    <asp:DropDownList ID="drpMachineType" runat="server" 
                             CssClass="form-control select2" meta:resourcekey="drpItemSubCategoryResource1"   
                           >   
                           
                        </asp:DropDownList>


                                </th>
                                <th style="width: 15%"></th>
                                <th style="width: 35%"></th>
                            </tr>
                          
                            <tr>
                                <th width="15%"> <asp:Label ID="Label1" runat="server" Text="Machine Code"></asp:Label> </th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemManuf" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemManufResource1"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage=" Please Enter Machine Code" 
                                        ControlToValidate="txtItemManuf" ForeColor="Red" ValidationGroup="G1">Please Enter Machine Code</asp:RequiredFieldValidator>
                                    </td>
                                <th width="15%"> <asp:Label ID="Label2" runat="server" Text="Machine Name"></asp:Label> </th>
                                <td width="35%">
                                    <asp:TextBox ID="txtItemMaterial" runat="server" 
                                        CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemMaterialResource1" AutoPostBack="True" 
                                        ValidationGroup="G1"></asp:TextBox>
                               
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter MachineName" 
                                        ControlToValidate="txtItemMaterial" ForeColor="Red" ValidationGroup="G1">Please Enter Machine Name</asp:RequiredFieldValidator>
<%--                       <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Duplicate Machine Name Entered" 
                                        ControlToValidate="txtItemMaterial" ForeColor="Red"--%> 
                          <%--          ValidationGroup="G1">Machine Name Already Exixst.......!</asp:CustomValidator>--%>

                                         
                                    </td>
                            </tr>
                          

  <tr>
                                <th width="15%" class="style2"> <asp:Label ID="Label3" runat="server" Text="Manual Code"></asp:Label> </th>
                                <td width="35%" class="style2">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemManufResource1"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Enter Manual Code" 
                                        ControlToValidate="TextBox1" ForeColor="Red" ValidationGroup="G1">Please Enter Manual Code</asp:RequiredFieldValidator>
                                    </td>
                                <th width="15%" class="style2"> <asp:Label ID="Label4" runat="server" Text="Manual Name"></asp:Label> </th>
                                <td width="35%" class="style2">
                                    <asp:TextBox ID="TextBox2" runat="server" 
                                        CssClass="form-control input-sm" meta:resourcekey="txtItemMaterialResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Enter Manual Name" 
                                        ControlToValidate="TextBox2" ForeColor="Red" ValidationGroup="G1">Please Enter Manual Name</asp:RequiredFieldValidator>
                                   <%-- <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                        ErrorMessage="Client side validation" ControlToValidate="txtItemMaterial" 
                                        ForeColor="#FF3300" ValidationGroup="G1" 
                                        ClientValidationFunction="ValidateSomething" meta:resourcekey="CustomValidator2Resource1"
                                        >Client side validation</asp:CustomValidator>--%>
                                    </td>
                            </tr>
                          

  <tr>
                                <th width="15%"> <asp:Label ID="Label5" runat="server" Text="Make"></asp:Label> </th>
                                <td width="35%">
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemManufResource1"></asp:TextBox></td>
                                <th width="15%"> <asp:Label ID="Label6" runat="server" Text="Internal Code"></asp:Label> </th>
                                <td width="35%">
                                    <asp:TextBox ID="TextBox4" runat="server" 
                                        CssClass="form-control input-sm" meta:resourcekey="txtItemMaterialResource1"></asp:TextBox>
                                    <%--<asp:CustomValidator ID="CustomValidator3" runat="server" 
                                        ErrorMessage="Client side validation" ControlToValidate="txtItemMaterial" 
                                        ForeColor="#FF3300" ValidationGroup="G1" 
                                        ClientValidationFunction="ValidateSomething" meta:resourcekey="CustomValidator2Resource1"
                                        >Client side validation</asp:CustomValidator>--%>
                                    </td>
                            </tr>
                          

                         <tr>
                                <th width="15%"> <asp:Label ID="Label7" runat="server" Text="Document Format Number"></asp:Label> </th>
                                <td width="35%">
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                             CssClass="form-control select2" meta:resourcekey="drpItemSubCategoryResource1"   
                           >   
                           
                        </asp:DropDownList></td>
                                <th width="15%"> <asp:Label ID="Label8" runat="server" Text="Machine Operating Cost"></asp:Label> </th>
                                <td width="35%">
                                    <asp:TextBox ID="TextBox6" runat="server" 
                                        CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemMaterialResource1" AutoPostBack="True"></asp:TextBox>
                                    <%--<asp:CustomValidator ID="CustomValidator4" runat="server" 
                                        ErrorMessage="Client side validation" ControlToValidate="txtItemMaterial" 
                                        ForeColor="#FF3300" ValidationGroup="G1" 
                                        ClientValidationFunction="ValidateSomething" meta:resourcekey="CustomValidator2Resource1"
                                        >Client side validation</asp:CustomValidator>--%>
                                    </td>
                            </tr>
                          

  <tr>
                                <th width="15%"> <asp:Label ID="Label9" runat="server" Text="Capacity"></asp:Label> </th>
                                <td width="35%">
                                    <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemManufResource1"></asp:TextBox>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                        ControlToValidate="TextBox7" ErrorMessage="Please Enter Int Only" 
                                        ForeColor="Red" MaximumValue="380000" MinimumValue="00" Type="Integer" 
                                        ValidationGroup="G1">Please Enter Int Only</asp:RangeValidator>
                                </td>
                                <th width="15%">   </th>
                                <td width="35%">
                                     
                                    </td>
                            </tr>
                          

  <tr>
                                <th width="15%"> <asp:Label ID="Label11" runat="server" Text="Location"></asp:Label> </th>
                                <td width="35%">
                                    <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemManufResource1"></asp:TextBox></td>
                                <th width="15%"> <asp:Label ID="Label12" runat="server" Text="P.M.Plan"></asp:Label> </th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpPMplan" runat="server" 
                             CssClass="form-control select2" meta:resourcekey="drpItemSubCategoryResource1"   
                           >   
                           
                        </asp:DropDownList>
                                    <%--<asp:CustomValidator ID="CustomValidator6" runat="server" 
                                        ErrorMessage="Client side validation" ControlToValidate="txtItemMaterial" 
                                        ForeColor="#FF3300" ValidationGroup="G1" 
                                        ClientValidationFunction="ValidateSomething" meta:resourcekey="CustomValidator2Resource1"
                                        >Client side validation</asp:CustomValidator>--%>
                                    </td>
                            </tr>
                          

  <tr>
                                <th width="15%" class="style1"> <asp:Label ID="Label13" runat="server" Text="Model"></asp:Label> </th>
                                <td width="35%" class="style1">
                                    <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control input-sm" 
                                        meta:resourcekey="txtItemManufResource1"></asp:TextBox></td>
                                <th width="15%" class="style1"> <asp:Label ID="Label14" runat="server" Text="Machine Power K.W."></asp:Label> </th>
                                <td width="35%" class="style1">
                                    <asp:TextBox ID="TextBox12" runat="server" 
                                        CssClass="form-control input-sm" meta:resourcekey="txtItemMaterialResource1"></asp:TextBox>
                                    <%--<asp:CustomValidator ID="CustomValidator7" runat="server" 
                                        ErrorMessage="Client side validation" ControlToValidate="txtItemMaterial" 
                                        ForeColor="#FF3300" ValidationGroup="G1" 
                                        ClientValidationFunction="ValidateSomething" meta:resourcekey="CustomValidator2Resource1"
                                        >Client side validation</asp:CustomValidator>--%>
                                    </td>
                            </tr>
                          



                        </tbody>
                    </table>

                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </section>

     <section id = "Part Details">

<div class="col-lg-12 col-md-12">
            <div class="box box-info">

             <div class="box-header with-border">
                    <h3 class="box-title"><asp:Label ID="Label19" runat="server" Text="Document Name"></asp:Label></h3>

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
                        <th width="15%"><asp:Label ID="lblItemName1" runat="server" Text="Document Name"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rdqItemNameText" runat="server" 
                                        ErrorMessage="Item Name is not mentioned" ControlToValidate="txtItemName" ForeColor="Red" 
                                        ValidationGroup="G2">*</asp:RequiredFieldValidator>

                         

                         </td>



                        <th width="15%"><asp:Label ID="lblItemCode1" runat="server" Text="Specification"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rdqItemCodeText" runat="server" 
                                        ErrorMessage="Item Code not mentioned" ControlToValidate="txtItemCode" ForeColor="Red" 
                                        ValidationGroup="G2">*</asp:RequiredFieldValidator>
                           </td>
                        </tr>

                        <tr>
                       <th width="15%"> </th>
                                <td width="35%">  
                                
                                <asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>
                                                                  
                                      
                                  </td>

                        <th width="15%"> </th>
                                <td width="35%">
                                    </td>
                        </tr>                        
                        </tbody>
                        </table>
                        </div>
                        <div class="row">
                        <center>
                               <asp:Button ID="btnAddItem" runat="server" Text="Add" 
                                   CssClass="btn btn-success" ValidationGroup="G2"  ></asp:Button>
                        </center>
                    </div>

                    <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Check Item Details</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                    </div><!--box-tool -->
                </div><!--box-header -->
              <div class="box-body">
                
              
                                        
                                                
                                        
                                          <div style="width: 100%; height: 150px;  overflow:scroll; clear: both; border: 1px solid #808080;">

                                                 <asp:GridView  runat="server" ID="grdMachineMaster" EmptyDataText="NO DATA FOUND"
                                                ShowHeaderWhenEmpty="True" Width="100%"  TabIndex="7" 
                                                CellPadding="4"   AllowSorting="True" 
                                                 
                                                style="margin-top: 0px"  
                                                     >                                                     
                                                <AlternatingRowStyle Wrap="False" />
                                                <HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" Wrap="True" />
                                                <RowStyle BackColor="White" Wrap="False" />
                                                <SelectedRowStyle Wrap="False" />
                        
                                              
                                            </asp:GridView>                                              
                                                
                                            </div> 
                                            
                                                                              
                   
                </div>
                </div>

                 <table class="table-condensed table-hover table-responsive" width="100%">
                        <tbody>
                      

                        <tr>
                        <th width="15%"><asp:Label ID="Label10" runat="server" Text="Purchase Date"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ErrorMessage="Please Enter A date." ControlToValidate="TextBox5" ForeColor="Red" 
                                        ValidationGroup="G2">*</asp:RequiredFieldValidator>

                         

                         </td>



                        <th width="15%"><asp:Label ID="Label15" runat="server" Text="Machine Purchase Price"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ErrorMessage="Item Code not mentioned" ControlToValidate="txtItemCode" ForeColor="Red" 
                                        ValidationGroup="G2">*</asp:RequiredFieldValidator>
                           </td>
                        </tr>



                         <tr>
                        <th width="15%"><asp:Label ID="Label16" runat="server" Text="Remark"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ErrorMessage="Pleae Mention Remark" ControlToValidate="TextBox10" ForeColor="Red" 
                                        ValidationGroup="G1">*</asp:RequiredFieldValidator>

                         

                         </td>



                        <th width="15%"><asp:Label ID="Label18" runat="server" Text="Machine Obsolete"></asp:Label></th>
                        <td width="35%"> 

                        <asp:CheckBox ID="chkRawMaterial" runat="server" Text="" 
                                         
                                        meta:resourcekey="chkRawMaterialResource1"  />

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ErrorMessage="Item Code not mentioned" ControlToValidate="txtItemCode" ForeColor="Red" 
                                        ValidationGroup="G2">*</asp:RequiredFieldValidator>
                           </td>
                        </tr>

                                                
                        </tbody>
                        </table>

                </div>
                </div>
                

</section>

<section id="ItemActionMenu">
        <div class="col-lg-12 col-md-12">

            <div class="box box-info">
                <div class="box-header with-border">
                    <%--<h4 class="box-title">Action Menu</h4>--%>
                </div>
                <div class="box-body">
                    <center>
                    <asp:Button ID="btnNewItem" runat="server" CssClass="btn btn-success" 
                            Text="New Item"  
                            meta:resourcekey="btnNewItemResource1" />
                    <asp:Button ID="btnSaveItem" runat="server" CssClass="btn btn-primary" Text="Save" 
                            ValidationGroup="G1" 
                            meta:resourcekey="btnSaveItemResource1" onclick="btnSaveItem_Click"/>
                    <asp:Button ID="btnUpdateItem" runat="server" CssClass="btn btn-warning" 
                            Text="Update" ValidationGroup="G1" 
                            meta:resourcekey="btnUpdateItemResource1" onclick="btnUpdateItem_Click"/>
                    <asp:Button ID="btnCancelItem" runat="server" CssClass="btn btn-danger" 
                            Text="Cancel" 
                            meta:resourcekey="btnCancelItemResource1" onclick="btnCancelItem_Click"/>
                    <asp:Button ID="btnpreview" runat="server" CssClass="btn btn-primary" 
                            Text="Preview" 
                            meta:resourcekey="btnpreviewResource1"/>
          <button type="button" id="Button1" class="btn btn-info btn-sm" data-toggle="modal" data-target="#ReportModel" onclick="return btnReport_onclick()" onclick="return btnReport_onclick()" onclick="return btnReport_onclick()">View Reports</button>
                    </center>
                </div>
            </div>

        </div>
    </section>






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
                                        AutoPostBack="True"></asp:DropDownList></td>
                                <td width="30%">

                                </td>
                            </tr>
                        </tbody>
                   </table> 
                </div><!--box-body-->








            </div> <!--box info-->

                    <div class="row">
                        <center>
                        <asp:Button ID="btnRemove" runat="server" Text="Preview All" 
                                   CssClass="btn btn-danger" ></asp:Button>
                   
                        <asp:Button ID="BtnMachineWise" runat="server" Text="Preview Machine Wise" 
                                   CssClass="btn btn-danger" ></asp:Button>
                   
                        <button type="button" id="btnReport" class="btn btn-info btn-sm" 
                                data-toggle="modal" data-target="#ReportModel" >View Reports</button>
                          
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
                        <h4 class="modal-title">machine Master Report</h4>
                    </div>
                    <div class="modal-body">
                        
                   <%--     <asp:Button ID="btnRemove" runat="server" Text="Preview All" 
                                   CssClass="btn btn-danger" onclick="btnRemove_Click"></asp:Button>
                        <asp:Button ID="BtnMachineWise" runat="server" Text="Preview Machine Wise" 
                                   CssClass="btn btn-danger" onclick="BtnMachineWise_Click"></asp:Button>
                   --%>

                     </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
</div>



</asp:Content>
