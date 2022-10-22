<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IndentMasterOld.aspx.cs" Inherits="NavnathWebsite.Purchase.IndentMasterOld" %>
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
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"  type="text/css" />
    
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
                    <h3 class="box-title">Search</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                    </div><!--box-tool -->
                </div><!--box-header -->
                <div class="box-body">
                   <table class="table-condensed table-hover table-responsive" width="50%">
                        <tbody>
                            <tr>
                                
                                
                               
                                <th width="20%">Indent Number</th>
                                <td width="30%">
                                    <asp:DropDownList ID="drpIndentNumber" runat="server" 
                                        CssClass="form-control select2" AutoPostBack="True"></asp:DropDownList>
                                </td>
                               
                              
                            </tr>
                        </tbody>
                   </table> 
                </div><!--box-body-->
            </div> <!--box info-->



            <div class="box box-info">
             <div class="box-header with-border">
                    <h3 class="box-title">Indent Search</h3>
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

                            <th width="15%"> Indent Number</th>
                                <td width="35">
                                    <asp:TextBox ID="txtIndentNumber" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </td>
                                <th width="15%">Indent Date</th>
                                <td width="35%">
                                    <asp:TextBox ID="txtIndentDate" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <th width="15%"> Indent Type</th>
                                    <td width="35">
                                        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="Searchemp" AutoPostBack="True" Text="&nbsp;&nbsp;Purchess"></asp:RadioButton>
                                        &emsp;&emsp;
                                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Searchemp" AutoPostBack="True" Text="&nbsp;&nbsp;Services"></asp:RadioButton>
                                    </td>
                                <th width="15%">Time</th>
                                    <td width="35%">
                                        <asp:TextBox ID="txtTime" runat="server" CssClass="form-control input-sm" 
                                            Enabled="False"></asp:TextBox>

                                    </td>
                              
                            </tr>


                        </tbody>
                   </table> 
                </div><!--box-body-->
            </div> <!--box info-->

             <div class="box box-info">
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

             <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">ItemDetails</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                    </div><!--box-tool -->
                </div><!--box-header -->
                <div class="box-body">
                   <table class="table-condensed table-hover table-responsive" width="80%">
                        <tbody>                        
                            
                               <tr>                             
                                <th width="10%">ItemNmae</th>
                                <td width="30%">
                                    <asp:DropDownList ID="drpItemName" runat="server" 
                                            CssClass="form-control select2" AutoPostBack="True">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                </td>&nbsp;&nbsp;&nbsp;&nbsp;                            
                                
                                <th width="15%">Item Code</th>
                                <td width="35%">
                                    <asp:DropDownList ID="drpItemCode" runat="server" 
                                            CssClass="form-control select2" AutoPostBack="True">                                                    
                                    </asp:DropDownList>
                                </td>                           
                            </tr>
                              <tr>

                            <th width="15%"> Specification </th>
                                <td width="35"><asp:TextBox ID="txtSpecification" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                               
                                </td>
                                <th width="15%"> Drowing No </th>
                                <td width="35%"><asp:TextBox ID="txtDrowingNo" runat="server" 
                                        CssClass="form-control input-sm"></asp:TextBox>
                                
                                </td>
                              
                            </tr>
                            <tr>
                             <th width="10%">Department</th>
                                <td width="30%">
                                    <asp:DropDownList ID="drpDepartment1" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                </td>&nbsp;&nbsp;&nbsp;&nbsp; 
                                  <th width="15%"> Purpose</th>
                                <td width="35"><asp:TextBox ID="txtPurpose1" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                               
                                </td>

                            </tr>
                              <tr>
                             <th width="10%">Current Stock</th>
                                <td width="30%">
                                    <asp:Label ID="lblCurrentStock" runat="server" Text="0"></asp:Label>

                                   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="" 
                                    ControlToValidate="lblDepartment" ValidationGroup="g1" ForeColor="RED" InitialValue="--Select--"></asp:RequiredFieldValidator>--%>
                                </td>
                                  <th width="15%"> Requird Date</th>
                                <td width="35"><asp:TextBox ID="txtRequirdDate" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                               </td>
                             </tr>
                             <tr>
                               <th width="15%"> Required Quantity</th>
                                <td width="25"><asp:TextBox ID="txtRequiredQuantity" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                               
                                </td>
                                <th width="10%">Required Quentity Unit</th>
                                <td width="25%">
                                    <asp:DropDownList ID="drpRequiredQuentityUnit" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                </td>

                            </tr>
                          
                        </tbody>
                   </table> 
                </div><!--box-body-->
            </div> <!--box info-->

              <div class="row">
                        <center>
                               <asp:Button ID="btnAddItem" runat="server" Text="Add" 
                                   CssClass="btn btn-success"></asp:Button>
                        </center>
                    </div>



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
                
              
                                        
                                                
                                                
                                                 <asp:GridView  runat="server" ID="grdMVCDetailis"  AutoGenerateColumns="False" EmptyDataText="NO DATA FOUND"
                                                ShowHeaderWhenEmpty="True" Width="100%"  TabIndex="7" 
                                                CellPadding="4"   AllowSorting="True" 
                                                 
                                                style="margin-top: 0px">
                                                <AlternatingRowStyle Wrap="False" />
                                                <HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" Wrap="True" />
                                                <RowStyle BackColor="White" Wrap="False" />
                                                <SelectedRowStyle Wrap="False" />
                                                <Columns >
                                                <asp:TemplateField HeaderText="Item Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID1" runat="server" Text='<%#Eval("ID1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Item Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID2" runat="server" Text='<%#Eval("ID2") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText=" Specification">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID3" runat="server" Text='<%#Eval("ID3") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Drawing No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID4" runat="server" Text='<%#Eval("ID4") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Department">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID5" runat="server" Text='<%#Eval("ID5") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Purpose">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID6" runat="server" Text='<%#Eval("ID6") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Current Stock">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID7" runat="server" Text='<%#Eval("ID7") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Required Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID8" runat="server" Text='<%#Eval("ID8") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        </asp:TemplateField>

                                                          <asp:TemplateField HeaderText="Qutation">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID9" runat="server" Text='<%#Eval("ID9") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        </asp:TemplateField>

                                                          <asp:TemplateField HeaderText="Unit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID10" runat="server" Text='<%#Eval("ID10") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                      <asp:TemplateField HeaderText="Approved">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkApproved" runat="server"></asp:CheckBox>
                                                        </ItemTemplate>
                                                        </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Edit">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandName="Edit"
                                                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                            ></asp:LinkButton></td>
                                                        </ItemTemplate>
                                                    </asp:TemplateField> 
                                                </Columns>
                                              
                                            </asp:GridView>
                
              
                                        
                                          <div style="width: 100%; height: 150px;  overflow:scroll; clear: both; border: 1px solid #808080;">



                                                
                                                
                                            </div>
                                     
                   
                </div><!--box-body----%>
            </div> <!--box info-->

              <div class="box-body">
                   <table class="table-condensed table-hover table-responsive" width="50%">
                        <tbody>
                           


                            <tr align="center">
                                
                                <th width="20%">Remark</th>
                                <td width="30%" align="center"><asp:TextBox ID="txtRemark" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </td>
                            </tr>
                       
                              <tr>
                                <th width="20%">Prepaired By Code</th>
                                <td width="30%">
                                    <asp:DropDownList ID="drpPrepairedByCode" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                </td>                            
                            </tr>
                               <tr>
                                <th width="20%">Prepaired By Name</th>
                                <td width="30%">
                                    <asp:DropDownList ID="drpPrepairedByName" runat="server" 
                                            CssClass="form-control select2">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                </td>                            
                            </tr>
                        
                    
                   


                        </tbody>
                   </table>
                   <div class="row">
                        <center>
                               <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn btn-success"></asp:Button>
                               <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary"></asp:Button>
                               <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-warning"></asp:Button>
                               <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger"></asp:Button>
                               <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger"></asp:Button>
                               <asp:Button ID="btnPreview" runat="server" Text="Preview" CssClass="btn btn-danger"></asp:Button>


                        </center>
                    </div>
                </div><!--box-body-->



        </div>
    </section>
</div>



    </div>



</asp:Content>

