<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IndentApproval.aspx.cs" Inherits="NavnathWebsite.Purchase.IndentApproval" %>
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
                         <th width="15%"> From Date</th>
                                <td width="20%"><asp:TextBox ID="txtFromDate" runat="server" 
                                        CssClass="form-control input-sm"  ></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server"  
                                                    TargetControlID="txtFromDate" StartDate="01/01/2015"   Format="MM-dd-yyyy"  >
                                                    </cc1:CalendarExtender>
                                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  Font-Size="X-Small"   ForeColor="Red" ErrorMessage="Please select date" 
                                                       ControlToValidate="txtFromDate" ValidationGroup="DateValidator"></asp:RequiredFieldValidator>
                                  
                                  
                                  
                            </td>

                             <th width="10%"> To Date</th>

                                <td width="20%"><asp:TextBox ID="txtToDate"    runat="server" 
                                        CssClass="form-control input-sm" ValidationGroup="DateValidator"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender3" runat="server"  
                                                    TargetControlID="txtToDate"   StartDate="01/01/2015" Format="MM-dd-yyyy"  >
                                                    </cc1:CalendarExtender>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red"  Font-Size="X-Small"  ErrorMessage="Please select date" 
                                                       ControlToValidate="txtToDate" ValidationGroup="DateValidator"></asp:RequiredFieldValidator>
                          
                            </td>
  

                           <td width="5%">
                           <asp:LinkButton runat="server" ID="btnSearch" OnClick="btnSearch_Click"  ValidationGroup="DateValidator">
    <span aria-hidden="true" class="glyphicon glyphicon-search"></span>
</asp:LinkButton>
                           </td>
                           <td width="35%">
                           <asp:CheckBox ID="chkApprovedIndent" runat="server" Text="&nbsp;&nbsp;Check Approved Indent" 
                                        AutoPostBack="True" 
                                   oncheckedchanged="chkApprovedIndent_CheckedChanged"/>
                           </td>                            
                              
                            </tr>
                        </tbody>
                   </table> 
                </div><!--box-body-->
            </div> <!--box info-->


            <!--box info-->

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

             <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Non Approve Details</h3>
                         <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse">
                            <i class="fa fa-minus"></i>
                </div><!--box-header -->
                 <!--box-body----%>
            </div> <!--box info-->

              <div class="box-body">
                                       
                                        
                                          <div style="width: 100%; height: 150px;  overflow:scroll; clear: both; border: 1px solid #808080;">

                                                 <asp:GridView  runat="server" ID="grdIndentApprovalMaster"  
                                                     AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found"
                                                Width="100%"  TabIndex="7"   CellPadding="4"   AllowSorting="True" 
                                                     style="margin-top: 0px"  >
                                                <AlternatingRowStyle Wrap="False" />
                                                <HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" Wrap="True" />
                                                <RowStyle BackColor="White" Wrap="False" />
                                                <SelectedRowStyle Wrap="False" />
                                                <Columns >
                                                <asp:TemplateField HeaderText="Approved">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkApproved" runat="server" AutoPostBack="true" OnCheckedChanged="chkApproved_CheckedChanged"></asp:CheckBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Indent Number">
                                                    <ItemTemplate>
                                                            <asp:Label ID="ID1" runat="server" Text='<%#Eval("ID1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Item Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID2" runat="server" Text='<%#Eval("ID2") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText=" Item Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID3" runat="server" Text='<%#Eval("ID3") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Purpose">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID4" runat="server" Text='<%#Eval("ID4") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Current Stock">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID5" runat="server" Text='<%#Eval("ID5") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Required Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID6" runat="server" Text='<%#Eval("ID6") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="ToOrder Quantity">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID7" runat="server" Text='<%#Eval("ID7") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Approved Quantity">
                                                      <ItemTemplate>
                                                    <asp:TextBox ID="txtApprovedQuantity" runat="server" Text='<%#Eval("ID8") %>' AutoPostBack="true"
                                                      Visible="true" Enabled="false" OnTextChanged="txtApprovedQuantity_TextChanged"></asp:TextBox>
                                                     
                                                      
                                                        
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Rejected Quantity">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRejectedQuantity" runat="server" Text='<%#Eval("ID9") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Remark">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtRemark"  Enabled="false" runat="server" Text='<%#Eval("ID10") %>' Visible="true" ></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Indent Prepared By">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID10" runat="server" Text='<%#Eval("ID11") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    

                                                   
                                              </Columns>
                                              
                                            </asp:GridView>


                                                
                                                
                                            </div>
                                     
                   
                </div>



              <div class="box-body">
                   <table class="table-condensed table-hover table-responsive" width="100%">
                        <tbody>
                               <tr>
                                <th width="25%">Indent Approved By</th>
                                <td width="25%">
                                   <asp:TextBox ID="txtIndentApprovedByCode" runat="server"></asp:TextBox>
                                                    
                                   
                                </td>                            
                                <th width="25%">Indent Approved By</th>
                                <td width="25%">
                                    <asp:TextBox ID="txtIndentApprovedByName" runat="server"></asp:TextBox>
                                                    
                                    
                                </td>                            
                            </tr>
                        
                    <tr>
                                <th width="25%">Indent Approved Date</th>
                                <td width="25%">
                                 <asp:TextBox ID="txtDate" runat="server"  ></asp:TextBox>
                                     
                                </td>                            
                                <th width="25%">Time</th>
                                <td width="25%">
                                 <asp:TextBox ID="txtTime" runat="server"  ></asp:TextBox>
                                </td>                            
                            </tr>
           </tbody>
                        </table>
                   </div>

                   
                  <div>                     
                     <center>
                               <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn btn-success" onclick="btnNew_Click" 
                                   ></asp:Button>
                               <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" onclick="btnSave_Click" 
                                ></asp:Button>
                                
                                
                               <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                   CssClass="btn btn-danger" onclick="btnCancel_Click"  ></asp:Button>
                               <asp:Button ID="btnPreview" runat="server" Text="Preview" 
                                   CssClass="btn btn-danger"  ></asp:Button>


                        </center>
                        </div>
                        
                      
                    </div>
                



        </div>
    </section>
    </div>
   
    
   
    
   
    </div>
   
    
   
    
   
</asp:Content>
