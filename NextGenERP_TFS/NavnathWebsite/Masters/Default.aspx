<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NavnathWebsite.Demo.Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

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
                    <h3 class="box-title">Dashboard</h3>
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
                        <th width="50%">
                        <h4>Supplier Wise Items ( <asp:Label ID="lblSuppWiseItem" runat="server"></asp:Label> )</h4>
                        </th>
                        <th width="50%">
                        <h4>Customer Wise Items ( <asp:Label ID="lblCustwiseItem" runat="server"></asp:Label> )</h4>
                        </th>
                        </tr>

                        <tr>
                            <td width="50%">
                                <asp:GridView ID="grdItemVsSuppCount" runat="server" 
                                          AutoGenerateColumns="false" EmptyDataText="No Data Found" 
                                      ShowHeaderWhenEmpty="true" Width="100%" AllowSorting="true" 
                                          Caption=""
                                           BorderColor="Black" 
                                          BorderStyle="Double" ShowFooter="True">
                                          <AlternatingRowStyle Wrap="false"/>
                                          <HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" Wrap="True" />
                                          <RowStyle BackColor="White" Wrap="False" />
                                          <SelectedRowStyle Wrap="False" />
                                          <Columns>
                                            <asp:TemplateField HeaderText="Supplier Name ">
                                                <ItemTemplate>
                                                    <asp:Label ID="SuppName" runat="server" Text='<%#Bind("SuppName") %>'></asp:Label>
                                                </ItemTemplate>
                                                
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="No of Items">
                                                <ItemTemplate>
                                                    <asp:Label ID="ID1" runat="server" Text='<%#Bind("No_Of_Items") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalSupp" runat="server"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                          </Columns>

                                    </asp:GridView>
                            </td>
                            <td width="50%">
                                <asp:GridView ID="grdItemVsCustCount" runat="server" 
                                        AutoGenerateColumns="false" EmptyDataText="No Data Found" 
                                      ShowHeaderWhenEmpty="true" Width="100%" AllowSorting="true" 
                                        Caption=""
                                        BorderColor="Black" BorderStyle="Double" ShowFooter="True">
                                          <AlternatingRowStyle Wrap="false"/>
                                          <HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" Wrap="True" />
                                          <RowStyle BackColor="White" Wrap="False" />
                                          <SelectedRowStyle Wrap="False" />
                                          <Columns>
                                            <asp:TemplateField HeaderText="Customer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="CustName" runat="server" Text='<%#Bind("CustName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="No of Items">
                                                <ItemTemplate>
                                                    <asp:Label ID="ID2" runat="server" Text='<%#Bind("No_Of_Items") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalCust" runat="server"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                          </Columns>
                                    </asp:GridView>
                            </td>
                        </tr>

              </tbody>
                   </table> 
                </div><!--box-body-->



<!--
    <asp:Chart ID="Chart1" runat="server" BackColor="0, 0, 64" BackGradientStyle="LeftRight" BorderlineWidth="0" Height="360px" Palette="None" PaletteCustomColors="Maroon" Width="380px" BorderlineColor="64, 0, 64">  
        <Titles>
            <asp:Title ShadowOffset="10" Name="Items" />  
        </Titles>  
        <Legends>  
            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default" LegendStyle="Row" />  
        </Legends>  
        <Series>  
            <asp:Series Name="Default" />  
        </Series>  
        <ChartAreas>  
            <asp:ChartArea Name="ChartArea1" BorderWidth="0" />  
        </ChartAreas>  
    </asp:Chart> 

-->



            </div> <!--box info-->
            
        </div>
    </section>
</div>


</asp:Content>
