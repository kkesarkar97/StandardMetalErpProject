<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EnquiryMaster.aspx.cs" Inherits="NavnathWebsite.Marketing.EnquiryMaster" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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



<section id = "Search">

<div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="G1"></asp:ValidationSummary>
    </div>

    <div>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="G2"></asp:ValidationSummary>
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
                       <strong>Enquiry Number</strong>
                       <asp:DropDownList ID="drpEnquiryNumber" runat="server" 
                            CssClass="form-control select2" 
                            onselectedindexchanged="drpEnquiryNumber_SelectedIndexChanged" 
                            AutoPostBack="True" >
                        </asp:DropDownList>
                    </div>
                   </div>
                 </div>
               </div>

</section>

<section id = "Enquiry Details">
<div class="col-lg-12 col-md-12">
            <div class="box box-info">

             <div class="box-header with-border">
                    <h3 class="box-title">Enquiry Details</h3>

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
                        <th width="15%"><asp:Label ID="lblEnquiryNumber" runat="server" Text="Enquiry Number"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="txtEnquiryNumber" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ErrorMessage="Enquiry Number not mentioned" ControlToValidate="txtEnquiryNumber" ForeColor="Red" 
                                        ValidationGroup="G1">*</asp:RequiredFieldValidator>--%></td>

                        <th width="15%"><asp:Label ID="lblEnquiryDate" runat="server" Text="Enquiry Date"></asp:Label></th>
                                <td width="35%">
                                    <asp:TextBox ID="txtEnquiryDate" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtEnquiryDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ErrorMessage="Enquiry Date is not mentioned" ControlToValidate="txtEnquiryDate" ForeColor="Red" 
                                        ValidationGroup="G1">*</asp:RequiredFieldValidator></td>
                        </tr> 
                        
                        <tr>
                                <th width="15%"><asp:Label ID="lblEnquiryRefNo" runat="server" Text="Enquiry Ref. No"></asp:Label></th>
                                <td width="35%">
                                    <asp:TextBox ID="txtEnquiryRefNo" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ErrorMessage="Enquiry Ref Number is not mentioned" ControlToValidate="txtEnquiryRefNo" ForeColor="Red" 
                                        ValidationGroup="G1">*</asp:RequiredFieldValidator></td>
                                                      
                                <th width="15%"><asp:Label ID="lblMedOfEnquiry" runat="server" Text="Medium Of Enquiry"></asp:Label></th>
                                <td width="35%">                                    
                                     <asp:DropDownList ID="drpMedOfEnquiry" runat="server" 
                                         CssClass="form-control select2"> </asp:DropDownList>
                                 <asp:CompareValidator ID="CompareValidator8" runat="server" 
                             ErrorMessage="Medium Of Enquiry Must be Selected " ControlToValidate="drpMedOfEnquiry" 
                             ForeColor="Red" Operator="NotEqual" 
                                     ValidationGroup="G1" Display="Dynamic" ValueToCompare="Select"></asp:CompareValidator> 
                                    
                                    </td>

                            </tr>                       
                        </tbody>
                        </table>
                        </div>
                        </div>
                        </div>
                        


</section>

<section id = "Customer Details">

<div class="col-lg-12 col-md-12">
            <div class="box box-info">

             <div class="box-header with-border">
                    <h3 class="box-title">Customer Details</h3>

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
                        <th width="15%"><asp:Label ID="lblNewCustomer" runat="server" Text="New Customer"></asp:Label></th>
                                <td width="35%">    
                        <asp:CheckBox ID="chkIsNewCustomer" runat="server" 
                                        oncheckedchanged="chkIsNewCustomer_CheckedChanged" AutoPostBack="True" ></asp:CheckBox></td>
                        
                        </tr>

                         <tr>
                                <th width="15%"><asp:Label ID="lblCustomerName" runat="server" Text="Customer Name"></asp:Label></th>
                                <td width="35%">
                                    <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="rqCustomerName" runat="server" 
                                        ErrorMessage="Customer Name is not mentioned" ControlToValidate="txtCustomerName" ForeColor="Red" 
                                        ValidationGroup="G1">*</asp:RequiredFieldValidator>
                                 <asp:DropDownList ID="drpCustomerName" runat="server" 
                                         CssClass="form-control select2" AutoPostBack="True" 
                                         onselectedindexchanged="drpCustomerName_SelectedIndexChanged"> </asp:DropDownList>
                                 <asp:CompareValidator ID="cmpdrpDownCustName" runat="server" 
                             ErrorMessage="Customer Name Must be Selected " ControlToValidate="drpCustomerName" 
                             ForeColor="Red" Operator="NotEqual" 
                                     ValidationGroup="G1" Display="Dynamic" ValueToCompare="Select">  </asp:CompareValidator>  </td>


                                        <th width="15%"><asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code"></asp:Label></th>
                                <td width="35%">
                                    <asp:TextBox ID="txtCustomerCode" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="rqCustomerCode" runat="server" 
                                        ErrorMessage="Customer Code is not mentioned" ControlToValidate="txtCustomerCode" ForeColor="Red" 
                                        ValidationGroup="G1">*</asp:RequiredFieldValidator>
                                        
                                 <asp:DropDownList ID="drpCustomerCode" runat="server" 
                                         CssClass="form-control select2" AutoPostBack="True" 
                                         onselectedindexchanged="drpCustomerCode_SelectedIndexChanged"> </asp:DropDownList>
                                 <asp:CompareValidator ID="cmpdrpDownCustCode" runat="server" 
                             ErrorMessage="Customer Code Must be Selected " ControlToValidate="drpCustomerCode" 
                             ForeColor="Red" Operator="NotEqual" 
                                     ValidationGroup="G1" Display="Dynamic" ValueToCompare="Select"></asp:CompareValidator> 
                                     </td>
                           </tr>             

                        <tr>
                        <th width="15%"><asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ErrorMessage="Address is not mentioned" ControlToValidate="txtAddress" ForeColor="Red" 
                                        ValidationGroup="G1">*</asp:RequiredFieldValidator></td>

                        <th width="15%"><asp:Label ID="lblContactPerson" runat="server" Text="Contact Person"></asp:Label></th>
                                <td width="35%">
                                    <asp:TextBox ID="txtContactPerson" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ErrorMessage="Contact Person Name is not mentioned" ControlToValidate="txtContactPerson" ForeColor="Red" 
                                        ValidationGroup="G1">*</asp:RequiredFieldValidator></td>
                        </tr> 
                        </tbody>
                        </table>
                        </div>
                        </div>
                        </div>
                        

</section>

<section id = "Part Details">

<div class="col-lg-12 col-md-12">
            <div class="box box-info">

             <div class="box-header with-border">
                    <h3 class="box-title">Item Details</h3>

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
                        <th width="15%"><asp:Label ID="lblNewItemCode" runat="server" Text="New Item Code"></asp:Label></th>
                                <td width="35%">    
                        <asp:CheckBox ID="IsNewItemCode" runat="server" 
                                        oncheckedchanged="IsNewItemCode_CheckedChanged" AutoPostBack="True"></asp:CheckBox></td>                        
                        </tr>

                        <tr>
                        <th width="15%"><asp:Label ID="lblItemName1" runat="server" Text="Item Name"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rdqItemNameText" runat="server" 
                                        ErrorMessage="Item Name is not mentioned" ControlToValidate="txtItemName" ForeColor="Red" 
                                        ValidationGroup="G2">*</asp:RequiredFieldValidator>

                        <asp:DropDownList ID="drpItemName" runat="server" 
                                         CssClass="form-control select2" AutoPostBack="True" 
                                         onselectedindexchanged="drpItemName_SelectedIndexChanged"> </asp:DropDownList>

                        <asp:CompareValidator ID="cmpItemNameDropDown" runat="server" 
                                                     ErrorMessage="Item Name Must be Selected " ControlToValidate="drpItemName" 
                                                     ForeColor="Red" Operator="NotEqual" 
                                                             ValidationGroup="G2" Display="Dynamic" ValueToCompare="Select"></asp:CompareValidator></td>



                        <th width="15%"><asp:Label ID="lblItemCode1" runat="server" Text="Item Code"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rdqItemCodeText" runat="server" 
                                        ErrorMessage="Item Code not mentioned" ControlToValidate="txtItemCode" ForeColor="Red" 
                                        ValidationGroup="G2">*</asp:RequiredFieldValidator>
                        <asp:DropDownList ID="drpItemCode" runat="server" 
                                         CssClass="form-control select2" AutoPostBack="True" 
                                         onselectedindexchanged="drpItemCode_SelectedIndexChanged"> </asp:DropDownList>                      
                         <asp:CompareValidator ID="cmpItemCodeDropDown" runat="server" 
                                                     ErrorMessage="Item Code Must be Selected " ControlToValidate="drpItemCode" 
                                                     ForeColor="Red" Operator="NotEqual" 
                                                             ValidationGroup="G2" Display="Dynamic" ValueToCompare="Select"></asp:CompareValidator></td>
                        </tr>

                        <tr>
                       <th width="15%"><asp:Label ID="lblUnit" runat="server" Text="Unit"></asp:Label></th>
                                <td width="35%">                                    
                                     <asp:DropDownList ID="drpUnit" runat="server" CssClass="form-control select2" Visible = "True"> </asp:DropDownList>
                                 <asp:CompareValidator ID="CompareValidator5" runat="server" 
                             ErrorMessage="Unit Must be Selected " ControlToValidate="drpUnit" 
                             ForeColor="Red" Operator="NotEqual" 
                                     ValidationGroup="G2" Display="Dynamic" ValueToCompare="Select"></asp:CompareValidator></td>

                        <th width="15%"><asp:Label ID="lblQuantity" runat="server" Text="Quantity"></asp:Label></th>
                                <td width="35%">
                                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                        ErrorMessage="Quantity is not mentioned" ControlToValidate="txtQuantity" ForeColor="Red" 
                                        ValidationGroup="G2">*</asp:RequiredFieldValidator></td>
                        </tr>                        
                        </tbody>
                        </table>
                        </div>
                        <div class="row">
                        <center>
                               <asp:Button ID="btnAddItem" runat="server" Text="Add" 
                                   CssClass="btn btn-success" ValidationGroup="G2" onclick="btnAddItem_Click"></asp:Button>
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

                                                 <asp:GridView  runat="server" ID="grdEnquiryMaster"  
                                                     AutoGenerateColumns="False" EmptyDataText="NO DATA FOUND"
                                                ShowHeaderWhenEmpty="True" Width="100%"  TabIndex="7" 
                                                CellPadding="4"   AllowSorting="True" 
                                                 
                                                style="margin-top: 0px" onrowcommand="grdEnquiryMaster_RowCommand" 
                                                     onselectedindexchanged="grdEnquiryMaster_SelectedIndexChanged">                                                     
                                                <AlternatingRowStyle Wrap="False" />
                                                <HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" Wrap="True" />
                                                <RowStyle BackColor="White" Wrap="False" />
                                                <SelectedRowStyle Wrap="False" />
                                                <Columns >
                                                <asp:TemplateField HeaderText="New Item Code">
                                                    <ItemTemplate>
                                                            <asp:Label ID="ID1" runat="server" Text='<%#Eval("ID1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="New Item Name">
                                                    <ItemTemplate>
                                                            <asp:Label ID="ID2" runat="server" Text='<%#Eval("ID2") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Item Code">
                                                    <ItemTemplate>
                                                            <asp:Label ID="ID3" runat="server" Text='<%#Eval("ID3") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Item Name">
                                                    <ItemTemplate>
                                                            <asp:Label ID="ID4" runat="server" Text='<%#Eval("ID4") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--<asp:TemplateField HeaderText="Customer Item Code">
                                                    <ItemTemplate>
                                                            <asp:Label ID="ID5" runat="server" Text='<%#Eval("ID5") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                    <%--<asp:TemplateField HeaderText="Customer Item Name">
                                                    <ItemTemplate>
                                                            <asp:Label ID="ID6" runat="server" Text='<%#Eval("ID6") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <%--<asp:TemplateField HeaderText="Unit">
                                                    <ItemTemplate>
                                                            <asp:Label ID="ID7" runat="server" Text='<%#Eval("ID7") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Quantity">
                                                    <ItemTemplate>
                                                            <asp:Label ID="ID8" runat="server" Text='<%#Eval("ID8") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="IsNewItem">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkIsNewItem" runat="server"></asp:CheckBox>
                                                            <asp:Label ID="ID10" runat="server" Text='<%#Eval("ID10") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>                                                  

                                                    <asp:TemplateField HeaderText="Edit">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnEdit" runat="server" Text="<i class='fa fa-pencil-square-o' aria-hidden='true' style='font-size:20px;'></i>" CommandName="RowEditing"
                                                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"></asp:LinkButton>                                                         
                                                    </ItemTemplate>
                                                </asp:TemplateField> 
                                                <asp:TemplateField HeaderText="Remove">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnRemove" runat="server" Text="<i class='fa fa-trash-o' aria-hidden='true' style='font-size:20px;'></i>" CommandName="Remove"
                                                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                    </Columns>
                                              
                                            </asp:GridView>                                              
                                                
                                            </div>                                   
                   
                </div>
                </div>
                </div>
                </div>
                

</section>

<section id="Other Details">

<div class="col-lg-12 col-md-12">
            <div class="box box-info">

             <div class="box-header with-border">
                    <h3 class="box-title">Other Details</h3>

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
                                <th width="15%"><asp:Label ID="lblDelivery" runat="server" Text="Delivery"></asp:Label></th>
                                <td width="35%">                                    
                                     <asp:DropDownList ID="drpDelivery" runat="server" 
                                         CssClass="form-control select2"> </asp:DropDownList>                                                                   
                                    </td>
                                                      
                                <th width="15%"><asp:Label ID="lblProductCategory" runat="server" Text="Product Category"></asp:Label></th>
                                <td width="35%">                                    
                                     <asp:DropDownList ID="drpProductCategory" runat="server" 
                                         CssClass="form-control select2"> </asp:DropDownList>
                                 </td>

                            </tr>   

                             <tr>
                                <th width="15%"><asp:Label ID="lblAuthPerName" runat="server" Text="Authorised Person Name"></asp:Label></th>
                                <td width="35%">                                    
                                     <asp:DropDownList ID="drpAuthPerName" runat="server" 
                                         CssClass="form-control select2" AutoPostBack="True" 
                                         onselectedindexchanged="drpAuthPerName_SelectedIndexChanged"> </asp:DropDownList>                                                                   
                                    </td>
                                                      
                                <th width="15%"><asp:Label ID="lblAuthPerCode" runat="server" Text="Authorised Person Code"></asp:Label></th>
                                <td width="35%">                                    
                                     <asp:DropDownList ID="drpAuthPerCode" runat="server" 
                                         CssClass="form-control select2" AutoPostBack="True" 
                                         onselectedindexchanged="drpAuthPerCode_SelectedIndexChanged"> </asp:DropDownList>
                                 </td>
                            </tr>
                            
                            <tr>
                        <th width="15%"><asp:Label ID="lblRemark" runat="server" Text="Remark"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                    
                        <th width="15%"><asp:Label ID="lblSampleStatus" runat="server" Text="Sample Status"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="txtSampleStatus" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                        </tr>

                         <tr>
                                <th width="15%"><asp:Label ID="lblConclusion" runat="server" Text="Conclusion"></asp:Label></th>
                                <td width="35%">                                    
                                     <asp:DropDownList ID="drpConclusion" runat="server" CssClass="form-control select2"> </asp:DropDownList>                                                                   
                                    </td>
                         </tr>                             
                          <tr>      
                                
                                <th width="15%"><asp:Label ID="lblQuatationNumber" runat="server" Text="Quatation Number"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="txtQuatationNumber" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                 
                                 <th width="15%"><asp:Label ID="lblQuatationDate" runat="server" Text="Quatation Date"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="txtQuatationDate" runat="server" CssClass="form-control input-sm"></asp:TextBox></td>
                                                                 
                            </tr>   

                             <tr>      
                                
                                <th width="15%"><asp:Label ID="lblSampleReqDate" runat="server" Text="Sample Required Date"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="txtSampleReqDate" runat="server" CssClass="form-control input-sm" Visible="True"></asp:TextBox></td>
                                 
                                 <th width="15%"><asp:Label ID="lblSampleProdDate" runat="server" Text="Sample Production Date"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="txtSampleProdDate" runat="server" CssClass="form-control input-sm" Visible="True"></asp:TextBox></td>
                                                                 
                            </tr>   

                            <tr>      
                                
                                <th width="15%"><asp:Label ID="lblSampleSubQty" runat="server" Text="Sample Submission Qtye"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="txtSampleSubQty" runat="server" CssClass="form-control input-sm" Visible="True"></asp:TextBox></td>
                                 
                                 <th width="15%"><asp:Label ID="lblSampleSubDate" runat="server" Text="Sample Submission Date"></asp:Label></th>
                        <td width="35%"> 
                        <asp:TextBox ID="txtSampleSubDate" runat="server" CssClass="form-control input-sm" Visible="True"></asp:TextBox></td>
                                                                 
                            </tr>   
                        </tbody>
                        </table>

                        <div class="row">
                        <center>
                               <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn btn-success" onclick="btnNew_Click" 
                                   ></asp:Button>
                               <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" 
                                   ValidationGroup="G1" onclick="btnSave_Click" 
                                  ></asp:Button>
                               <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                                   CssClass="btn btn-warning" onclick="btnUpdate_Click" ></asp:Button>
                               <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger"></asp:Button>
                               <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                   CssClass="btn btn-danger" onclick="btnCancel_Click"></asp:Button>
                               <asp:Button ID="btnPreview" runat="server" Text="Preview" CssClass="btn btn-danger"></asp:Button>


                        </center>
                    </div>
                        </div>
                        </div>
                        </div>
                        

</section>

<section id = "All Details">

<div class="col-lg-12 col-md-12">
            <div class="box box-info">

             <div class="box-header with-border">
                    <h3 class="box-title">All Details</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                    </div>
                    <!-- /.box-tools -->
                </div>
                <div>
                <table>
                <tr>
                <td>
                <asp:TextBox ID="txtSearch" runat="server" ontextchanged="txtSearch_TextChanged"></asp:TextBox>
                </td>
                <td>
                <asp:Button ID="btnSearch" runat="server" Text="Search"></asp:Button>

                </td>
                </tr>
                </table>
                </div>
                <br/>
                <div>
                <div style="width: 100%; height: 150px;  overflow:scroll; clear: both; border: 1px solid #808080;">

                                                 <asp:GridView  runat="server" ID="grdMasterEntries"  
                                                     AutoGenerateColumns="False" EmptyDataText="NO DATA FOUND"
                                                ShowHeaderWhenEmpty="True" Width="100%"  TabIndex="7" 
                                                CellPadding="4"   AllowSorting="True" 
                                                 
                                                style="margin-top: 0px">                                                     
                                                <AlternatingRowStyle Wrap="False" />
                                                <HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" Wrap="True" />
                                                <RowStyle BackColor="White" Wrap="False" />
                                                <SelectedRowStyle Wrap="False" />
                                                <Columns >
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                               <asp:RadioButton ID="rdbEnquiryMaster" runat="server"  AutoPostBack="true" OnCheckedChanged="rdbEnquiryMaster_OnCheckedChanged" />
                                                               
                                                               <%--<input name="MyRadioButton" type="radio"  value='<%# Eval("EnquiryId") %>' OnCheckedChanged="rdbEnquiryMaster_OnCheckedChanged" CommandName="Check"
                                                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"/>--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                       
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="EnquiryId" HeaderText="EnquiryID" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="EnquiryNumber" HeaderText="EnquiryNumber" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="EnquiryDate" HeaderText="EnquiryDate" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="EnqRefNumber" HeaderText="EnqRefNumber" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="IsNewCustomer" HeaderText="NewCustomer" />
                                                    <%--<asp:BoundField ItemStyle-Width="150px" DataField="CustomerId" HeaderText="CustomerID" />--%>
                                                    <%--<asp:BoundField ItemStyle-Width="150px" DataField="CategoryID" HeaderText="CategoryID" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="SuppTypeId" HeaderText="SuppTypeID" />--%>
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="NewCustName" HeaderText="NewCustName" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="NewCustCode" HeaderText="NewCustCode" />
                                                    <%--<asp:BoundField ItemStyle-Width="150px" DataField="Address1" HeaderText="Address" />--%>
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="ContactPerson" HeaderText="ContactPerson" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="SystemEntryDate" HeaderText="SystemEntryDate" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="Remark" HeaderText="Remark" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="QuotationNumber" HeaderText="QuotationNumber" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="QuotationDate" HeaderText="QuotationDate" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="SampleStatus" HeaderText="SampleStatus" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="SampleRequiredDate" HeaderText="SampleRequiredDate" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="SampleProductionDate" HeaderText="SampleProductionDate" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="SampleSubmissionQuantity" HeaderText="SampleSubmissionQuantity" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="SampeSubmissionDate" HeaderText="SampeSubmissionDate" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="MedOfEnqId" HeaderText="MedOfEnqId" />
                                                    <%--<asp:BoundField ItemStyle-Width="150px" DataField="EmpId" HeaderText="EmpId" />--%>
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="CustomerCode" HeaderText="CustomerCode" />


                                                </Columns>
                                                </asp:GridView>
                                                </div>
                                                </div>
                                                <br/>
                <div>
                <div style="width: 100%; height: 150px;  overflow:scroll; clear: both; border: 1px solid #808080;">

                                                 <asp:GridView  runat="server" ID="grdDetailMasterEntries"  
                                                     AutoGenerateColumns="False" EmptyDataText="NO DATA FOUND"
                                                ShowHeaderWhenEmpty="True" Width="100%"  TabIndex="7" 
                                                CellPadding="4"   AllowSorting="True" 
                                                 
                                                style="margin-top: 0px">                                                     
                                                <AlternatingRowStyle Wrap="False" />
                                                <HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" Wrap="True" />
                                                <RowStyle BackColor="White" Wrap="False" />
                                                <SelectedRowStyle Wrap="False" />
                                                <Columns >                                                
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="EnqDetailId" HeaderText="EnquiryDetailId" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="EnquiryId" HeaderText="EnquiryId" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="ItemId" HeaderText="ItemId" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="Quantity" HeaderText="Quantity" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="IsNewItem" HeaderText="NewItem" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="NewItemCode" HeaderText="NewItemCode" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="NewItemName" HeaderText="NewItemName" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="SystemEntryDate" HeaderText="SystemEntryDate" />
                                                    <%--<asp:BoundField ItemStyle-Width="150px" DataField="Unit" HeaderText="Unit" />--%>
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="ItemName" HeaderText="ItemName" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="ItemCode" HeaderText="ItemCode" />
                                                </Columns>
                                                </asp:GridView>
                                                </div>



    </div>
    </div>
    </div>
</asp:Content>
