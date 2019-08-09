<%@ Page Title="Cart" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="cart.aspx.vb" Inherits="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <p>
    </p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <br />
    <h3 style="color: #262B33">Your Shopping Cart</h3>
    <p style="color: #262B33">
        &nbsp;</p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="Your shopping cart is empty." Width="637px" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
             <asp:BoundField DataField="ID" 
                HeaderText="Product" 
                ReadOnly="True" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="name" HeaderText="Name" ReadOnly="True">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
          <asp:BoundField DataField="Price" 
                HeaderText="Price" 
                ReadOnly="True" 
                DataFormatString="{0:c}" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Quantity" HeaderText="Quantity">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Total" DataFormatString="{0:c}" HeaderText="Total" ReadOnly="True">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:CommandField EditText="Change" ShowDeleteButton="True" ShowEditButton="True">
            <ItemStyle BorderStyle="None" />
            <HeaderStyle BorderStyle="None" />
            </asp:CommandField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />
    <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" />
&nbsp;<asp:Button ID="btnCheckOut" runat="server" PostBackUrl="~/CheckOut.aspx" Text="Check Out" />
</asp:Content>

