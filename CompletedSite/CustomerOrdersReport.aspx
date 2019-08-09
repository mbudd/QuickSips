﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CustomerOrdersReport.aspx.vb" Inherits="CustomerOrdersReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1090px">
    <LocalReport ReportPath="CustomerOrdersReport.rdlc">
        <DataSources>
            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
        </DataSources>
    </LocalReport>
</rsweb:ReportViewer>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDataCustomerItems" TypeName="DataSetTableAdapters.CustomerItemsTableAdapter"></asp:ObjectDataSource>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
</asp:Content>

