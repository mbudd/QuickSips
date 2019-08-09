<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Report.aspx.vb" Inherits="Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <h1>Reports</h1>
    <ol>
        <li><a href="CustomerOrdersReport.aspx">Customer Orders Report</a></li>
        <li><a href="CustomerReport.aspx">Customer Report</a></li>
        <li><a href="ProductReport.aspx">Products Report</a></li>
        <li><a href="ItemsOrderedReport.aspx">Ordered Items Report</a></li>
    </ol>

</asp:Content>

