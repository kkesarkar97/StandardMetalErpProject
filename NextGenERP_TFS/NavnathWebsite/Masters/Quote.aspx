<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Quote.aspx.cs" Inherits="NavnathWebsite.Demo.WebForm1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="Server">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">Quote Search</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                    <i class="fa fa-minus"></i>
                </button>
            </div>
            <!-- /.box-tools -->
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <div class="col-md-6">
                <table class="table-condensed table-hover table-responsive" style="width: 100%">
                    <tbody>
                        <tr>
                            <td colspan="3">

                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                    ShowSummary="False" DisplayMode="List" ValidationGroup="Errormsg1" />
                                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True"
                                    ShowSummary="False" DisplayMode="List" ValidationGroup="Errormsg2" />
                                <%--<cc1:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="txtInvDate"
                                    TargetControlID="txtInvDate" PopupPosition="BottomRight" Format="dd/MM/yyyy">
                                </cc1:CalendarExtender>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Mask="99/99/9999"
                                    MaskType="Date" TargetControlID="txtInvDate">
                                </cc1:MaskedEditExtender>--%>
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 25%"><strong>Quote Number</strong></th>
                            <td style="width: 60%">
                                <asp:DropDownList Width="70%" ID="drpQuoteNumber" runat="server" CssClass="form-control select2"   AutoPostBack="true">
                                 
                                </asp:DropDownList>
                            </td>
                            <td style="width: 15%">
                                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-success" Text="Search"  Visible="false" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-2">
            </div>
        </div>
        <!-- /.box-body -->
    </div>
    <div class="box box-warning">
        <div class="box-header with-border">
            <h3 class="box-title">Quote Details</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                    <i class="fa fa-minus"></i>
                </button>
            </div>
            <!-- /.box-tools -->
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table-condensed table-hover table-responsive" style="width: 100%">
                <tbody>
                    <tr>
                        <th style="width: 15%">Quote Number</th>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtQuoteNumber" runat="server" CssClass="form-control input-sm" Enabled="false" Width="200px"></asp:TextBox></td>
                        <th style="text-align: right; width: 15%">Quote Date</th>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtQuoteDate" runat="server" CssClass="form-control input-sm"  Width="200px" ></asp:TextBox>
                            <cc1:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" TargetControlID="txtQuoteDate" Format="dd/MM/yyyy"> </cc1:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <th style="width: 15%"></th>
                        <td style="width: 35%"></td>
                        <th style="text-align: right; width: 15%">Valid Till</th>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtValidity" runat="server" CssClass="form-control input-sm"  Width="200px" ></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtender1" PopupButtonID="imgPopup" runat="server" TargetControlID="txtValidity" Format="dd/MM/yyyy"> </cc1:CalendarExtender>
                        </td>


                    </tr>
                </tbody>
            </table>
            <h4 class="box-title text-blue">Quote To</h4>
            <table class="table-condensed table-hover table-responsive" style="width: 100%">
                <tbody>
                    <tr>
                        <th style="width: 15%">Customer Name</th>
                        <td style="width: 35%">
                            <asp:DropDownList ID="drpQuoteCxName" runat="server" CssClass="form-control select2"  AutoPostBack="true">
                            </asp:DropDownList>
                        </td>
                        <th style="text-align: right; width: 15%">Customer Code</th>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtQuoteCxCode" runat="server" CssClass="form-control input-sm" Enabled="false" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <th style="width: 15%">Address</th>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtQuoteToAddress" runat="server" CssClass="form-control input-sm" Enabled="false" TextMode="MultiLine"></asp:TextBox></td>
                        <th style="text-align: right; width: 15%">Contact Person</th>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtQuoteToContactPerson" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <th style="width: 15%">Contact Number</th>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtQuoteContactNo" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox></td>
                        <th style="width: 15%">Email</th>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtQuoteEmail" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox></td>

                    </tr>
                </tbody>
            </table>



        </div>
        <!-- /.box-body -->
    </div>
    <div class="box box-danger">
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

            <table class="table-condensed table-hover table-responsive" style="width: 100%">
                <tbody>
                    <tr>
                        <th style="width: 15%">Item Code</th>
                        <td style="width: 35%">
                            <asp:DropDownList ID="drpItemCode" runat="server" CssClass="form-control select2"  AutoPostBack="true">
                            </asp:DropDownList>
                        </td>
                        <th style="text-align: right; width: 15%">Item Name</th>
                        <td style="width: 35%">
                            <asp:DropDownList ID="drpItemName" runat="server" CssClass="form-control select2"  AutoPostBack="true">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <th style="width: 15%">UoM</th>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtItemUoM" runat="server" CssClass="form-control input-sm" Enabled="false" Width="140px">NA</asp:TextBox></td>
                        <th style="text-align: right; width: 15%">Qty</th>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtItemQty" runat="server" CssClass="form-control input-sm" Width="100px" AutoPostBack="true" >0.0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th style="width: 15%">Rate</th>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtItemRate" runat="server" CssClass="form-control input-sm" Enabled="true"   Width="120" Text="200"  AutoPostBack="true">0.0</asp:TextBox>

                        </td>
                        <th style="text-align: right; width=15%">Amount</th>
                        <td style="width: 35%">
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control input-sm"   Enabled="false" Width="120px">0.0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th style="width: 15%"></th>
                        <td style="width: 35%">
                            

                        </td>
                        <th style="text-align: right; width=15%">Total Amount</th>
                        <td style="width: 35%">
                            <asp:TextBox ID="txttotalAmt" runat="server" CssClass="form-control input-sm"   Enabled="false" Width="120px">0.0</asp:TextBox>
                        </td>
                    </tr>

                </tbody>
            </table>
            <center>
                    <asp:Button ID="btnAddItem" runat="server"  CssClass="btn btn-info" Text="Add" ValidationGroup="Errormsg2" />
               
            </center>

            <div style="overflow: scroll; width: 100%">
                <br />
                <br />
                <asp:GridView ID="grdInvoiceItemDetails" runat="server" AutoGenerateColumns="false" EmptyDataText="NO DATA FOUND"
                    EnableSortingAndPagingCallbacks="false" ForeColor="Black" HorizontalAlign="Center" 
                    ShowHeaderWhenEmpty="true" Width="100%">
                    <AlternatingRowStyle Wrap="false" BackColor="#DFFFDE" />
                    <Columns>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkupdate" runat="server" AutoPostBack="true"  />
                            </ItemTemplate>
                        </asp:TemplateField>

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
                        <asp:TemplateField HeaderText="UoM">
                            <ItemTemplate>
                                <asp:Label ID="ID3" runat="server" Text='<%#Eval("ID3") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Qty">
                            <ItemTemplate>
                                <asp:Label ID="ID4" runat="server" Text='<%#Eval("ID4") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Rate">
                            <ItemTemplate>
                                <asp:Label ID="ID5" runat="server" Text='<%#Eval("ID5") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Amount">
                            <ItemTemplate>
                                <asp:Label ID="ID6" runat="server" Text='<%#Eval("ID6") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Select">
                            <ItemTemplate>
                                <asp:LinkButton ID="Button1" runat="server" Text="Select" CommandName="Select"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <HeaderStyle BackColor="#36752D" ForeColor="White" />
                </asp:GridView>
            </div>

        </div>
        <!-- /.box-body -->
    </div>
    <%--<div class="box box-danger">
        <div class="box-header with-border">
            <h3 class="box-title">Terms & Conditions</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                    <i class="fa fa-minus"></i>
                </button>
            </div>
            <!-- /.box-tools -->
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <asp:TextBox ID="txtTerms" runat="server" TextMode="MultiLine" Width="100%" Rows="7">
               
            </asp:TextBox>


        </div>
        <!-- /.box-body -->
    </div>--%>
    <div class="row">
        <center>
                    <asp:Button ID="btnNewItem" runat="server" CssClass="btn btn-success" Text="New Item" />
                    <asp:Button ID="btnSaveItem" runat="server" CssClass="btn btn-primary" Text="Save" ValidationGroup="Errormsg1" />
                    <asp:Button ID="btnCancelItem" runat="server" CssClass="btn btn-danger" Text="Cancel"   />
                    <asp:Button id="btnpreview" runat="server" CssClass="btn btn-primary" Text="Preview"  />
        </center>
    </div>
</asp:Content>


