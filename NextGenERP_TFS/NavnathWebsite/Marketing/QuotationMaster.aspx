<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuotationMaster.aspx.cs" Inherits="NavnathWebsite.Marketing.QuotationMaster" %>



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

 <link href="../Styles/CommonStyleRow.css" rel="stylesheet" type="text/css" />

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
        .auto-style1 {
            border-top-left-radius: 0;
            border-top-right-radius: 0;
            border-bottom-right-radius: 3px;
            border-bottom-left-radius: 3px;
            overflow: scroll;
            width: 250px;
            height: 150px;
            padding: 10px;
        }
    </style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="server">


<div>

     

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="G1" />
</div>

<div>

    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" 
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="G2" />

        </div>
        <div>

    <asp:ValidationSummary ID="ValidationSummary3" runat="server" ForeColor="Red" 
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="g3" />

        </div>

<div class="col-lg-12 col-md-12">
    <section id="CustomerInfo">
        <div class="col-lg-12 col-md-12">
            <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title"> Search</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

                    </div><!--box-tool -->
             </div><!--box-header -->
 

                  <div class="box-body">
                  
                    <div class="row top-buffer">
                         <div class="col-md-4">
                                 <asp:Label ID="lblQuotationNo" runat="server" Text="Search Quotation Number"></asp:Label>
                         </div>
                                 <div class="col-md-4">
                                         <asp:DropDownList ID="drpQuotationNo" runat="server"  CssClass="form-control select2" OnSelectedIndexChanged="drpQuotationNo_SelectedIndexChanged" AutoPostBack="True" >
                                         </asp:DropDownList>
                                 </div>
                        </div>
                  </div>
             </div> <!--box info-->





        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title">Quotation Details</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

                    </div><!--box-tool -->
             </div><!--box-header -->


            <div class="box-body">
                 
                <div class="row top-buffer">
                    <div class="col-md-3">
                        <asp:CheckBox ID="chkWithEnquiry" runat="server" OnCheckedChanged="chkWithEnquiry_CheckedChanged" AutoPostBack="True"></asp:CheckBox>
                        <asp:Label ID="lblWithEnquiry" runat="server" Text="With Enquiry"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:DropDownList ID="drpWithEnquiry" runat="server" CssClass="form-control select2" OnSelectedIndexChanged="drpWithEnquiry_SelectedIndexChanged" AutoPostBack="True" >
                            </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lblRevisionNo" runat="server" Text="Revision Number"></asp:Label> 
                        </div>
                    <div class="col-md-3">
                         <asp:TextBox ID="txtRevisionNo" runat="server"></asp:TextBox>
                    </div>
                    </div>
                    <div class="row top-buffer">
                    <div class="col-md-3">
                       <asp:Label ID="lblQuotationNum" runat="server" Text="Quotation Number"></asp:Label>
                    </div>
                    <div class="col-md-3">
                       <asp:TextBox ID="txtQuotationNumber" runat="server"></asp:TextBox>
                       <!--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ErrorMessage="Enter Quotation Number" ControlToValidate="txtQuotationNumber" 
                                        ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>
                        -->
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lblQuotationDate" runat="server" Text="Quotation Date"></asp:Label> 
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtQuotationDate" runat="server"></asp:TextBox>
                        <!--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ErrorMessage="Enter Quotation Date" ControlToValidate="txtQuotationDate" 
                                        ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>-->
                    </div>
                </div>
            </div><!--box-body-->
        </div> <!--box info-->
 


        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title">Customer Details</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

                    </div><!--box-tool -->
             </div><!--box-header -->


            <div class="box-body">
                  
                <div class="row top-buffer">
                    <div class="col-md-3">
                         <asp:CheckBox ID="chkNewCustomer" runat="server" OnCheckedChanged="chkNewCustomer_CheckedChanged" AutoPostBack="True" 
                              ></asp:CheckBox>
                          <asp:Label ID="lblNewCustomer" runat="server" Text="New Customer"></asp:Label>         
                    </div>
                    <div class="col-md-3">
                         
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                    </div>
                </div>
                <div class="row top-buffer">
                    <div class="col-md-3">
                        <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name"></asp:Label>
                    </div>
                    <div class="col-md-3">
                            <asp:DropDownList ID="drpCustomerName" runat="server" 
                                CssClass="form-control select2" OnSelectedIndexChanged="drpCustomerName_SelectedIndexChanged" AutoPostBack="True" 
                                  ></asp:DropDownList>
                            <!--<asp:CompareValidator ID="cmpdrpDownCustName" runat="server" 
                             ErrorMessage="Customer Name Must be Selected " ControlToValidate="drpCustomerName" 
                             ForeColor="Red" Operator="NotEqual" 
                                     ValidationGroup="G1" Display="Dynamic" ValueToCompare="---Select---">  </asp:CompareValidator>                           <asp:TextBox ID="txtCustName" runat="server" Visible="false"></asp:TextBox>    
                             <asp:RequiredFieldValidator ID="rqCustomerName" runat="server" 
                                        ErrorMessage="Enter Customer Name" ControlToValidate="txtCustName" 
                                        ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>-->
                                                      <asp:TextBox ID="txtCustomerName" runat="server" Text="" Visible="false"></asp:TextBox>
  <!--<asp:RequiredFieldValidator ID="rpCustomerName" runat="server" 
                                        ErrorMessage="Enter Customer Code" ControlToValidate="txtCustomerName" 
                                        ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>
                        -->
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code"></asp:Label> 
                    </div>
                    <div class="col-md-3">
                            <asp:DropDownList ID="drpCustomerCode" runat="server" CssClass="form-control select2" OnSelectedIndexChanged="drpCustomerCode_SelectedIndexChanged" AutoPostBack="True" ></asp:DropDownList>
                                          <!--<asp:CompareValidator ID="cmpdrpDownCustCode" runat="server" 
                             ErrorMessage="Customer Code Must be Selected " ControlToValidate="drpCustomerCode" 
                             ForeColor="Red" Operator="NotEqual" 
                                     ValidationGroup="G1" Display="Dynamic" ValueToCompare="---Select---"></asp:CompareValidator>--> 
                                 
                              <asp:TextBox ID="txtCustomerCode" runat="server" Text="" Visible="false"></asp:TextBox>
                           <!--  <asp:RequiredFieldValidator ID="rqCustomerCode" runat="server" 
                                        ErrorMessage="Enter Customer Code" ControlToValidate="txtCustomerCode" 
                                        ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>
                    -->
                    </div>
                </div>
                <div class="row top-buffer">
                    <div class="col-md-3">
                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                       <!-- <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                        ErrorMessage="Address is not mentioned" ControlToValidate="txtAddress" ForeColor="Red" 
                                        ValidationGroup="G1">*</asp:RequiredFieldValidator>-->
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lblContactPerson" runat="server" Text="Contact Person"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtContactPerson" runat="server"></asp:TextBox>
                                    <!--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                        ErrorMessage="Contact Person Name is not mentioned" ControlToValidate="txtContactPerson" ForeColor="Red" 
                                        ValidationGroup="G1">*</asp:RequiredFieldValidator>-->
                    </div>
                </div>
            </div><!--box-body-->
        </div>



        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title">Item Details</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

                    </div><!--box-tool -->
             </div><!--box-header -->


            <div class="box-body">
                  
               <div class="row top-buffer">
                    <div class="col-md-3">
                        <asp:RadioButton ID="rdbtnItemWise" runat="server" AutoPostBack="true" OnCheckedChanged="rdbtnItemWise_CheckedChanged" ></asp:RadioButton> 
                                    <asp:Label ID="lblItemWise" runat="server" Text="Item Wise"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:RadioButton ID="rdbtnSetWise" runat="server" ></asp:RadioButton>
                                    <asp:Label ID="lblSetWise" runat="server" Text="Set Wise"></asp:Label>
                    </div>
                    <div class="col-md-3"> 
                    </div>
                    <div class="col-md-3">
                     
                    </div>
               </div>
               <div class="row top-buffer">
                <div class="col-md-3">
                    <asp:Label ID="lblItemName" runat="server" Text="Item Name"></asp:Label>
                    </div>
                <div class="col-md-3">
                   
                     

                         <asp:DropDownList ID="drpItemName" runat="server" CssClass="form-control select2" 
                            AutoPostBack="true" OnSelectedIndexChanged="drpItemName_SelectedIndexChanged" >
                        
                    </asp:DropDownList>

                

                    </div>
                    <div class="col-md-3">
                      <asp:Label ID="lblItemCode" runat="server" Text="Item Code"></asp:Label> 
                                       
                    </div>
                    <div class="col-md-3">
                           <asp:DropDownList ID="drpItemCode" runat="server" 
                               CssClass="form-control select2" OnSelectedIndexChanged="drpItemCode_SelectedIndexChanged" AutoPostBack="True"  
                                >
                           </asp:DropDownList>
                                      
                    </div>
                    
               </div>
               <div class="row top-buffer">

               <div class="col-md-3">
                      <asp:Label ID="lblToolName" runat="server" Text="Tool/Mould Name"></asp:Label>
                    </div>
                    <div class="col-md-3">
                                                            <asp:DropDownList ID="drpToolName" runat="server" CssClass="form-control select2" OnSelectedIndexChanged="drpToolName_SelectedIndexChanged" AutoPostBack="True" >
                                                            </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                    <asp:Label ID="lblToolCode" runat="server" Text="Tool/Mould Code"></asp:Label>  
                    </div>
                    <div class="col-md-3">
                        
                                         <asp:DropDownList ID="drpToolCode" runat="server" CssClass="form-control select2" OnSelectedIndexChanged="drpToolCode_SelectedIndexChanged" AutoPostBack="True" >
                                         </asp:DropDownList>

                    </div>
                    
               </div>
               <div class="row top-buffer">

                    <div class="col-md-3">
                             <asp:Label ID="lblDeliveryLeadTime" runat="server" Text="Delivery Lead Time"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtDeliveryLeadTime" runat="server"></asp:TextBox>
                                        <asp:Label ID="lbldlt" runat="server" Text="(Week)"></asp:Label>

                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lblPackingCost" runat="server" Text="PacKing Cost"></asp:Label> 
                    </div>
                    <div class="col-md-3">
                      <asp:TextBox ID="txtPackingCost" runat="server"></asp:TextBox>
                    </div>
                    
               </div>
               <div class="row top-buffer">
               <div class="col-md-3">
                     <asp:Label ID="lblDevelopmanetCost" runat="server" Text="Development Tool Cost"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtDevelopmentToolCost" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                             <asp:Label ID="lblMouldCost" runat="server" Text="Mould Cost"></asp:Label>
                    </div>
                    <div class="col-md-3">

                                                               <asp:TextBox ID="txtMouldCost" runat="server"></asp:TextBox>                        
                    </div>
                   
               </div>
               <div class="row top-buffer">
                <div class="col-md-3">
                          <asp:Label ID="lblMouldCavity" runat="server" Text="Mould Cavity"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtMouldCavity" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                                                                     <asp:Label ID="lblOtherCost" runat="server" Text="Other Cost"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtOtherCost" runat="server"></asp:TextBox>
                    </div>
                   
               </div>
               <div class="row top-buffer">

                <div class="col-md-3">
                        <asp:Label ID="lblOtherCostRemark" runat="server" Text="Other Cost Remark"></asp:Label> 
                    </div>
                    <div class="col-md-3">
                            <asp:TextBox ID="txtOtherCostRemark" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                            <asp:Label ID="lblMaterial" runat="server" Text="Material"></asp:Label>
                    </div>
                    <div class="col-md-3">
                         <asp:TextBox ID="txtMaterial" runat="server"></asp:TextBox>
                    </div>
                   
               </div>
               <div class="row top-buffer">
                <div class="col-md-3">
                            <asp:Label ID="lblUOM" runat="server" Text="UOM"></asp:Label> 
                    </div>
                    <div class="col-md-3">
                                         <asp:DropDownList ID="drpUOM" runat="server" CssClass="form-control select2" ></asp:DropDownList>
                    </div>
                     <div class="col-md-3"></div>
                      <div class="col-md-3"></div>
               </div>
               <div style="border: 1px solid #808080; width:100%; height:400px;">
               <div class="row top-buffer">
                      </br> 
                    <div class="col-md-3">
                            <asp:Label ID="lblQuantity" runat="server" Text="Quantity/Month"></asp:Label>
                    </div>
                    <div class="col-md-3">
                            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                             <!--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtQuantity" ForeColor="Red" ErrorMessage="Quantity must included" ValidationGroup="g3">*</asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator2"   ControlToValidate="txtQuantity"  ValidationExpression="^[0-9]*" runat="server"  
                       ForeColor="Red" ErrorMessage="Quanitity must in number" ValidationGroup="g3">*</asp:RegularExpressionValidator>-->
                    </div>
                    <div class="col-md-3">
                       <asp:Label ID="lblRate" runat="server" Text="Rate"></asp:Label>
                    </div>
                    <div class="col-md-3">
                       <asp:TextBox ID="txtRate" runat="server" Width="80PX"></asp:TextBox>
                       <!--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtRate" ForeColor="Red" ErrorMessage="Rate must included" ValidationGroup="g3">*</asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1"   ControlToValidate="txtRate"  ValidationExpression="^[0-9]*" runat="server" 
                        ForeColor="Red" ErrorMessage="Rate must in number" ValidationGroup="g3">*</asp:RegularExpressionValidator>-->

                         <asp:DropDownList ID="drpRate" runat="server" CssClass="form-control select2" Width="100PX">
                         </asp:DropDownList>
                        <!--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="drpRate" InitialValue="0" ErrorMessage="Please select Rate"
                        ValidationGroup="g3" ForeColor="Red">*</asp:RequiredFieldValidator>-->
                    </div>
               </div>
               <div class="row top-buffer">
                    <center>
                        <asp:Button ID="btnAddRate" runat="server" Text="Add" 
                            CssClass="btn btn-success" ValidationGroup="g3" OnClick="btnAddRate_Click"    ></asp:Button>
                   </center>
                   
                   </div>
                   <br />
                    <div class="row top-buffer">
                    <center>
                    <div  class="box-title"  style="border  : 1px solid #808080; width:300px; height:230px;">
                      Quantity/Rate
                     
                    
                   
                    <div   class="auto-style1" style="border  : 1px solid #808080">
                        
                          <asp:GridView  runat="server" ID="grdQuantityRate"  AutoGenerateColumns="False" EmptyDataText="NO DATA FOUND"
                    ShowHeaderWhenEmpty="True" Width="100%"  TabIndex="7" CellPadding="4"   AllowSorting="True" 
                    style="margin-top: 0px" OnRowCommand="grdQuantityRate_RowCommand" >
                    
                    <AlternatingRowStyle Wrap="False" />

                    <HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" Wrap="True" />
                        <RowStyle BackColor="White" Wrap="False" />
                            <SelectedRowStyle Wrap="False" />
                           <Columns>
                           <asp:TemplateField HeaderText="Quantity">
                           <ItemTemplate>  
                                 <asp:Label ID="ID1" runat="server" Text='<%#Eval("ID1") %>'  ></asp:Label>
     
                           </ItemTemplate>
                           </asp:TemplateField>
                               <asp:TemplateField HeaderText="Rate">
                           <ItemTemplate>
                                 <asp:Label ID="ID2" runat="server" Text='<%#Eval("ID2") %>'  ></asp:Label>
     
                           </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Symbol">
                           <ItemTemplate>
                                 <asp:Label ID="ID3" runat="server" Text='<%#Eval("ID3") %>'  ></asp:Label>
     
                           </ItemTemplate>
                           </asp:TemplateField>
                          
                           <asp:TemplateField HeaderText="Remove">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnRemove" runat="server" Text="<i class='fa fa-trash-o' aria-hidden='true' style='font-size:20px;'></i>" CommandName="Remove"
                                                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                        
                                  <asp:TemplateField HeaderText="Edit">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnEdit" runat="server" Text="<i class='fa fa-pencil-square-o' aria-hidden='true' style='font-size:20px;'></i>" CommandName="RowEditing"
                                                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                        
                           </Columns>
                            </asp:GridView> 
                        
                    </div>
                    <div class="box-footer">
                     <asp:HyperLink ID="lnkbtn" runat="server"><u>Remove</u></asp:HyperLink>
                    </div>
                    </div>
                     </center>
               </div>
               </div>
            </div><!--box-body-->
        </div>



 

                <div class="row">
                    <center>

                        <asp:Button ID="btnAddQuotationDetails" runat="server" Text="Add" CssClass="btn btn-success" OnClick="btnAddQuotationDetails_Click"></asp:Button>

                    </center>
                </div>




    <div class="box box-info">
         <div class="box-header with-border">
            <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse">
                        <i class="fa fa-minus"></i>
                    </button>
            </div><!--box-tool -->
        </div><!--box-header -->


        <div class="box-body" width="100px">


            <div style="width: 100%; height: 150px;  overflow:scroll; clear: both; border: 1px solid #808080;">

                    <asp:GridView  runat="server" ID="grdSupplierPO"  AutoGenerateColumns="False" EmptyDataText="NO DATA FOUND"
                    ShowHeaderWhenEmpty="True" Width="100%"  TabIndex="7" CellPadding="4"   AllowSorting="True" 
                    style="margin-top: 0px" OnRowCommand="grdSupplierPO_RowCommand" >
                    
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




                                <asp:TemplateField HeaderText=" Delivery Lead Time">
                                    <ItemTemplate>

                                        <asp:Label ID="ID3" runat="server" Text='<%#Eval("ID3") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>

                                    <asp:TemplateField HeaderText=" Packing Cost">
                                    <ItemTemplate>

                                        <asp:Label ID="ID4" runat="server" Text='<%#Eval("ID4") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>

                                   
                                    <asp:TemplateField HeaderText=" Development Tool Cost">
                                    <ItemTemplate>

                                        <asp:Label ID="ID5" runat="server" Text='<%#Eval("ID5") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText=" Mould Cost">
                                    <ItemTemplate>

                                        <asp:Label ID="ID6" runat="server" Text='<%#Eval("ID6") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>

                                    <asp:TemplateField HeaderText=" Mould Cavity">
                                    <ItemTemplate>

                                        <asp:Label ID="ID7" runat="server" Text='<%#Eval("ID7") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>

                                    <asp:TemplateField HeaderText=" Other Cost">
                                    <ItemTemplate>

                                        <asp:Label ID="ID8" runat="server" Text='<%#Eval("ID8") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>

                                    <asp:TemplateField HeaderText=" Other Cost Remark">
                                    <ItemTemplate>

                                        <asp:Label ID="ID9" runat="server" Text='<%#Eval("ID9") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>

                                    <asp:TemplateField HeaderText=" Material">
                                    <ItemTemplate>

                                        <asp:Label ID="ID10" runat="server" Text='<%#Eval("ID10") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Unit">
                                     <ItemTemplate>
                                        
                                         <asp:Label ID="ID11" runat="server" Text='<%#Eval("ID11") %>'></asp:Label>

                                     </ItemTemplate>
                               </asp:TemplateField>



                                <asp:TemplateField HeaderText="Quantity">
                                        <ItemTemplate>

                                                <asp:Label ID="ID12" runat="server" Text='<%#Eval("ID12") %>'></asp:Label>    

                                        </ItemTemplate>
                                </asp:TemplateField>



                                <asp:TemplateField HeaderText="Rate">
                                        <ItemTemplate>

                                                <asp:Label ID="ID13" runat="server" Text='<%#Eval("ID13") %>'></asp:Label>

                                        </ItemTemplate>
                                </asp:TemplateField>



                                
                                <asp:TemplateField HeaderText="Approved">
                                        <ItemTemplate>

                                                <asp:CheckBox ID="chkApproved" runat="server"></asp:CheckBox>

                                        </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Edit">
                                            <ItemTemplate>


                                                        <asp:LinkButton ID="btnEdit" runat="server" Text="<i class='fa fa-pencil-square-o' aria-hidden='true' style='font-size:20px;'></i>" 
                                                        CommandName="RowEditing" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>


                                              </ItemTemplate>
                                 </asp:TemplateField> 


                          <asp:TemplateField HeaderText="Remove">
                                <ItemTemplate>


                                         <asp:LinkButton ID="btnRemove" runat="server" Text="<i class='fa fa-trash-o' aria-hidden='true' style='font-size:20px;'></i>"
                                          CommandName="Remove" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ></asp:LinkButton>


                                </ItemTemplate>
                            </asp:TemplateField>


                </Columns>
            </asp:GridView>
        </div>

      </div><!--box-body-->
</div> <!--box info-->


<%--Other Details --%>
    <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title">Other Details</h3>
                       <div class="box-tools pull-right">
                             <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                              </button>
                        </div><!--box-tool -->
            </div><!--box-header -->


            <div class="box-body">
                     
                <div class="row top-buffer">
                    <div class="col-md-3">
                      <asp:Label ID="lblEcess" runat="server" Text="E. cess">  
                                    </asp:Label>

                    </div>
                    <div class="col-md-3">
                    <asp:TextBox ID="txtEcess" runat="server"></asp:TextBox> &nbsp; (%)
                    </div>
                    <div class="col-md-3">
                    <asp:Label ID="lblServiceTax" runat="server" Text="Service Tax"> </asp:Label>
                    </div>
                    <div class="col-md-3">
                    <asp:TextBox ID="txtServiceTax" runat="server"></asp:TextBox>&nbsp; (%) 
                    </div>
             </div>

             <div class="row top-buffer">
                    <div class="col-md-3">
                        <asp:Label ID="lblExcise" runat="server" Text="Excise"></asp:Label>
                    </div>
                     <div class="col-md-3">
                        <asp:TextBox ID="txtExcise" runat="server"></asp:TextBox>&nbsp; (%)
                    </div>
                     <div class="col-md-3">
                        <asp:Label ID="lblSaleTax" runat="server" Text="Sale Tax"> </asp:Label>
                    </div>
                     <div class="col-md-3">
                        <asp:TextBox ID="txtSaleTax" runat="server"></asp:TextBox>&nbsp;&nbsp;(%)
                    </div>
            </div>
            <div class="row top-buffer">
                    <div class="col-md-3">
                        <asp:Label ID="lblPayment" runat="server" Text="Payment"></asp:Label>
                    </div>
                     <div class="col-md-3">
                           <asp:DropDownList ID="drpPayment" runat="server" CssClass="form-control select2" >
                           </asp:DropDownList>
                    </div>
                     <div class="col-md-3">
                     <asp:Label ID="lblModeOfDispatch" runat="server" Text="Mode Of Dispatch"></asp:Label> 
                    </div>
                     <div class="col-md-3">
                     <asp:DropDownList ID="drpModeOfDispatch" runat="server" CssClass="form-control select2" >
                     </asp:DropDownList> </div>
            </div>
            <div class="row top-buffer">
                    <div class="col-md-3">
                        <asp:Label ID="lblFrieght" runat="server" Text="Frieght"></asp:Label>
                        
                    </div>
                     <div class="col-md-3">
                     <asp:DropDownList ID="drpFrieght" runat="server" CssClass="form-control select2" >
                         
                     </asp:DropDownList>
                    </div>
                     <div class="col-md-3">
                         <asp:Label ID="lblValidity" runat="server" Text="Validity"></asp:Label>
                    </div>
                     <div class="col-md-3">
                        <asp:DropDownList ID="drpValidity" runat="server" CssClass="form-control select2" >
                         </asp:DropDownList>
                    </div>
            </div>
            <div class="row top-buffer">
                    <div class="col-md-3">
                           <asp:Label ID="lblPacking" runat="server" Text="Packing"></asp:Label>
                    </div>
                     <div class="col-md-3">

                   <asp:DropDownList ID="drpPacking" runat="server" CssClass="form-control select2" >
                   </asp:DropDownList>
                    </div>
                     <div class="col-md-3">
                        <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label> 
                        
                    </div>
                     <div class="col-md-3">
                        <asp:DropDownList ID="drpStatus" runat="server" CssClass="form-control select2" >
                        </asp:DropDownList>
                    </div>
            </div>
            <div class="row top-buffer">
                    <div class="col-md-3">
                        
                    <asp:Label ID="lblAgainstFormNo" runat="server" Text="Against Form No."></asp:Label>

                    </div>
                     <div class="col-md-3">
                        <asp:TextBox ID="txtAgainstFormNo" runat="server"></asp:TextBox>
                    </div>
                     <div class="col-md-3">
                        <asp:Label ID="lblRemark" runat="server" Text="Remark"></asp:Label>
                    </div>
                     <div class="col-md-3">
                        <asp:TextBox  Height="50px" width="200Px" ID="txtRemark" runat="server"></asp:TextBox>
                    </div>
<div class="row top-buffer">
                    <div class="col-md-3">
                    
<asp:Label ID="lblDrawing" runat="server" Text="Drawing"></asp:Label>

                    </div>
                     <div class="col-md-3">
                         <asp:DropDownList ID="drpDrawing" runat="server" CssClass="form-control select2" >
                         </asp:DropDownList>
                    </div>
                     <div class="col-md-3">
                           <asp:Label ID="lblSampleRequired" runat="server" Text="Sample Required(If any)"></asp:Label>
                    </div>
                     <div class="col-md-3">
                        <asp:TextBox ID="txtSampleRequired" runat="server"></asp:TextBox>
                    </div>
            </div>
            <div class="row top-buffer">
                    <div class="col-md-3">
                        <asp:Label ID="lblDeliveryTerm" runat="server" Text="Delivery Term"></asp:Label>
                    </div>
                     <div class="col-md-3">
                        <asp:DropDownList ID="drpDeliveryTerm" runat="server" CssClass="form-control select2" >
                        </asp:DropDownList>
                    </div>
                     <div class="col-md-3">
                        <asp:Label ID="lblDoccumentRequired" runat="server" Text="Document Required(If any)"></asp:Label>


                    </div>
                     <div class="col-md-3">
                                                            <asp:TextBox ID="txtDocumentRequired" runat="server"></asp:TextBox>
                                

                    </div>
            </div>
            <div class="row top-buffer">
                    <div class="col-md-3">
                                                            <asp:Label ID="lblAdvance" runat="server" Text="Advance"></asp:Label>
                    </div>
                     <div class="col-md-3">
                                                         <asp:TextBox ID="txtAdvance" runat="server"></asp:TextBox>&nbsp;&nbsp;(%)
                                

                    </div>
                     <div class="col-md-3">
                        
                                
                                    <asp:Label ID="lblPreparedByEmpCode" runat="server" Text="Prepraed By(Emp Code)"></asp:Label>

                    </div>
                     <div class="col-md-3">
                                                            <asp:DropDownList ID="drpPreparedByEmpCode" runat="server" CssClass="form-control select2" AutoPostBack="True" OnSelectedIndexChanged="drpPreparedByEmpCode_SelectedIndexChanged" >
                                                            </asp:DropDownList>
                    </div>
            </div>
             <div class="row top-buffer">
                    <div class="col-md-3">
                        
                                    <asp:Label ID="lblApprovedByEmpCode" runat="server" Text="Approved By(Emp Code)"></asp:Label>

                    </div>
                     <div class="col-md-3">
                        
                                    <asp:DropDownList ID="drpApprovedByEmpCode" runat="server" CssClass="form-control select2" AutoPostBack="True" OnSelectedIndexChanged="drpApprovedByEmpCode_SelectedIndexChanged" >
                                    </asp:DropDownList>

                    </div>
                     <div class="col-md-3">
                        
                                       <asp:Label ID="lblPreparedByEmpName" 
runat="server" Text="Prepraed By(Emp Name)"></asp:Label> 

                    </div>
                     <div class="col-md-3">
                        
                                     <asp:DropDownList ID="drpPreparedByEmpName" runat="server" CssClass="form-control select2" AutoPostBack="True" OnSelectedIndexChanged="drpPreparedByEmpName_SelectedIndexChanged" >
                                     </asp:DropDownList>

                    </div>
            </div>
             <div class="row top-buffer">
                    <div class="col-md-3">
                        <asp:Label ID="lblApprovedByEmpName" runat="server" Text="Approved By(Emp Name)"></asp:Label> 
                    </div>
                     <div class="col-md-3">
                                                             <asp:DropDownList ID="drpApprovedByEmpName" runat="server" CssClass="form-control select2" AutoPostBack="True" OnSelectedIndexChanged="drpApprovedByEmpName_SelectedIndexChanged" >
                                                             </asp:DropDownList>
                    </div>
                     <div class="col-md-3">
                                                            <asp:Label ID="lblReviewedByEmpCode" runat="server" Text="Reviewed By(Emp Code)"></asp:Label>
                    </div>
                     <div class="col-md-3">
                        <asp:DropDownList ID="drpReviewedByEmpCode" runat="server" CssClass="form-control select2" AutoPostBack="True" OnSelectedIndexChanged="drpReviewedByEmpCode_SelectedIndexChanged" >
                            </asp:DropDownList>
                    </div>
            </div>
             <div class="row top-buffer">
                    <div class="col-md-3">
                        
                                     <asp:Label ID="lblReviewedByEmpName" runat="server" Text="Reviewed By(Emp Name)"></asp:Label> 


                    </div>
                     <div class="col-md-3">
                         <asp:DropDownList ID="drpReviewedByEmpName" runat="server" CssClass="form-control select2" AutoPostBack="True" OnSelectedIndexChanged="drpReviewedByEmpName_SelectedIndexChanged" >
                            </asp:DropDownList>
                        
                                     
                    </div>
                     
            </div>
            
            </div>
        </div><!--box-body-->
    </div> <!--box info-->


  <%--Items and Tool Wise Details--%>
    <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title">Item Wise and Tool Wise Details>
                       <div class="box-tools pull-right">
                             <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                              </button>
                        </div><!--box-tool -->
            </div><!--box-header -->


            <div class="box-body">
                     
             <div class="row top-buffer">
                    <div class="col-md-3">
                    <asp:Label ID="lblItemSubject" runat="server" Text="ItemSubject"></asp:Label>
                    </div>
                     <div class="col-md-3">
                     
                    <asp:TextBox ID="txtItemSubject" runat="server"></asp:TextBox>                                       

                    </div>
                     <div class="col-md-3">
                        
                     <asp:Label ID="lblItemTerms" runat="server" Text="Item Terms/Note"></asp:Label> 

                    </div>
                     <div class="col-md-3">
                        
                        <asp:TextBox ID="txtItemTerms"  Height="100px" Width="200px" runat="server"></asp:TextBox>   

                    </div>
            </div>
             <div class="row top-buffer">
                    <div class="col-md-3">
                        <asp:Label ID="lblToolSubject" runat="server" Text="ToolSubject"></asp:Label>
                    </div>
                     <div class="col-md-3">
                     <asp:TextBox ID="txtToolSubject" runat="server"></asp:TextBox>                                       
                    </div>
                     <div class="col-md-3">
                        <asp:Label ID="lblToolTerms" runat="server" Text="Tool Terms/Note"></asp:Label> 
                    </div>
                     <div class="col-md-3">
                          <asp:TextBox ID="txtToolTerms"  Height="100px" Width="200px" runat="server"></asp:TextBox>
                         <br />
                         <asp:Label ID="Lbl1" runat="server" Text="Label"></asp:Label>
                    </div>
            </div>
              
            
            </div><!--box-body-->
    </div>



        <div class="row">
            <center>

                <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn btn-success" 
                    ></asp:Button>
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" 
                    ></asp:Button>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                    CssClass="btn btn-warning" ></asp:Button>
                <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                    CssClass="btn btn-danger" ></asp:Button>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                    CssClass="btn btn-danger" ></asp:Button>
                <asp:Button ID="btnPreview" runat="server" Text="Preview" CssClass="btn btn-danger"></asp:Button>
                
            </center>
        </div>



</div>
</div>
    </div>
    </div>
&nbsp;
</asp:Content>
