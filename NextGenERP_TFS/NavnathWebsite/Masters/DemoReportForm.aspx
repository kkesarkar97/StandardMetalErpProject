<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="DemoReportForm.aspx.cs" Inherits="NavnathWebsite.Masters.DemoReportForm" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
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
        function btnReport_onclick() {

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainBody" runat="server">
    <div>
        <asp:DropDownList ID="ddlItemCode" runat="server">
        </asp:DropDownList>
    </div>
    <div>
        <asp:Button ID="btnShowReport" runat="server" Text="Show Report" 
            onclick="btnShowReport_Click" />
    </div>
    <div>
<%--        <rsweb:ReportViewer ID="ReportViewer1" runat="server">
        </rsweb:ReportViewer>--%>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server">
        </rsweb:ReportViewer>
    </div>
</asp:Content>
