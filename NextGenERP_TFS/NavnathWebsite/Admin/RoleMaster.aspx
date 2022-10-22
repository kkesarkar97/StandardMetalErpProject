<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoleMaster.aspx.cs" Inherits="NavnathWebsite.Admin.RoleMaster" %>



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
                        <asp:DropDownList ID="drpSearchRole" runat="server" 
                            CssClass="form-control select2" 
                                
                            >
                        </asp:DropDownList>
                    </div>
                      
                      <div class="col-md-4">
                       <%-- <strong>Item SubType</strong>--%>
                       
                          <asp:Button runat="server" ID="btnSearch" Text="Search" 
                              CssClass="btn btn-sm- btn-primary" onclick="btnSearch_Click"
                               /> 
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
                    <h3 class="box-title"> <asp:Label ID="lblRoleDetail" runat="server" Text="Role Detail"></asp:Label> </h3>

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
                                <th width="15%"> <asp:Label ID="lblRoleName" runat="server" Text="Role Name"></asp:Label> </th>
                                <td width="35%">
                                    <asp:TextBox ID="txtRoleName" runat="server" CssClass="form-control input-sm" 
                                        ></asp:TextBox></td>
                                <th width="15%"> <asp:Label ID="lblIsActive" runat="server" Text="IsActive"></asp:Label></th>
                                <td width="35%">
                                  
                                  <asp:CheckBox ID="chkIsActive"  Checked="true" runat="server" Text="" 
                                         
                                          />

                                     </td>
                            </tr>
                               

                        </tbody>
                    </table>

                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->

            
             <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title"><asp:Label ID="lblRoleAccessDtl" runat="server" Text="Role Access Detail"></asp:Label></h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse">
                            <i class="fa fa-minus"></i>
                        </button>
                    </div><!--box-tool -->
                </div><!--box-header -->
              <div class="box-body">
                
              
                                        
                                                
                                        
                                          <div style="width: 100%; height: 400px;  overflow:scroll; clear: both; border: 1px solid #808080;">

                                                 <asp:GridView  runat="server" ID="grvBindRole"  AutoGenerateColumns="False" EmptyDataText="NO DATA FOUND"
                                                ShowHeaderWhenEmpty="True" Width="100%"  TabIndex="7" 
                                                CellPadding="4"   AllowSorting="True" 
                                                 
                                                style="margin-top: 0px"  
                                                     >
                                                <AlternatingRowStyle Wrap="False" />
                                                <HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" Wrap="True" />
                                                <RowStyle BackColor="White" Wrap="False" />
                                                <SelectedRowStyle Wrap="False" />
                                                <Columns >

                                                <asp:TemplateField HeaderText="Check"   meta:resourcekey="TemplateFieldResource1">
                                                    <ItemTemplate>
                                                            
                                                       <asp:CheckBox ID="chkRoles" Checked='<%# Eval("ID9") %>' runat="server"></asp:CheckBox>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="Form Names" 
                                                        meta:resourcekey="TemplateFieldResource2">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID1" runat="server" Text='<%# Eval("ID1") %>' 
                                                                meta:resourcekey="ID2Resource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                      <asp:TemplateField HeaderText="SubModuleId"  Visible="false"
                                                        meta:resourcekey="TemplateFieldResource2">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID2" runat="server" Text='<%# Eval("ID2") %>' 
                                                                meta:resourcekey="ID2Resource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText=" Module Name" 
                                                        meta:resourcekey="TemplateFieldResource3">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID3" runat="server" Text='<%# Eval("ID3") %>' 
                                                                meta:resourcekey="ID3Resource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    
                                                      <asp:TemplateField HeaderText="ModuleId" Visible="false"
                                                        meta:resourcekey="TemplateFieldResource2">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID4" runat="server" Text='<%# Eval("ID4") %>' 
                                                                ></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Add" 
                                                        meta:resourcekey="TemplateFieldResource11">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkAdd" runat="server"  Checked='<%# Eval("ID5") %>' 
                                                                meta:resourcekey="chkApprovedResource1"></asp:CheckBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                       
                                                    <asp:TemplateField HeaderText="Update" 
                                                        meta:resourcekey="TemplateFieldResource11">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkUpdate" runat="server"  Checked='<%# Eval("ID6") %>' 
                                                                meta:resourcekey="chkApprovedResource1"></asp:CheckBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delete" 
                                                        meta:resourcekey="TemplateFieldResource11">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkDelete" runat="server"  Checked='<%# Eval("ID7") %>' 
                                                                meta:resourcekey="chkApprovedResource1"></asp:CheckBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Search" 
                                                        meta:resourcekey="TemplateFieldResource11">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSearch" runat="server"  Checked='<%# Eval("ID8") %>' 
                                                                meta:resourcekey="chkApprovedResource1"></asp:CheckBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                      
                                              </Columns>
                                              
                                            </asp:GridView>


                                                
                                                
                                            </div>
                                     
                   
                </div><!--box-body----%>
            </div> <!--box info-->

              <div class="box-body">
                   
                   <div class="row">
                        <center>
                               <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn btn-success" 
                                     ></asp:Button>
                               <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" onclick="btnSave_Click" 
                                  ></asp:Button>
                               <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                                   CssClass="btn btn-warning" onclick="btnUpdate_Click" ></asp:Button>
                               
                               <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                   CssClass="btn btn-danger"
                                   ></asp:Button>
                             
                        </center>
                    </div>
                </div><!--box-body-->



        </div>


        </div>
    </section>

    
    </div>
 </div>


</asp:Content>


