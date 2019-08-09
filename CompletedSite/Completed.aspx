<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Completed.aspx.vb" Inherits="Completed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <br />
    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="Georgia" Font-Size="X-Large" />
    <br /><br />
    <asp:Button ID="btnContinue" runat="server" 
        Text="Continue" 
   
 PostBackUrl="~/products.aspx" /> </asp:Content>

