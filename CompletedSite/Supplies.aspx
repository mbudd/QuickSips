<%@ Page Title="Supplies" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="supplies.aspx.vb" Inherits="supplies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h2>Range of Supplies:</h2>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="Type" DataValueField="Type">
    </asp:DropDownList>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetSuppliesType" TypeName="DataSetTableAdapters.SuppliesTypeTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DataSetTableAdapters.SuppliesTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SuppliesID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="p1" Type="String" />
            <asp:Parameter Name="Size" Type="String" />
            <asp:Parameter Name="Quantity" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Type" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="p1" Type="String" />
            <asp:Parameter Name="Size" Type="String" />
            <asp:Parameter Name="Quantity" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Original_SuppliesID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="ObjectDataSource2" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" Width="1044px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ProductID" DataNavigateUrlFormatString="SuppliesView.aspx?ProductID={0}" HeaderText="View" Text="View" />
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
            <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" SortExpression="Price" />
            <asp:ImageField DataImageUrlField="Picture" HeaderText="Product">
            </asp:ImageField>
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
</asp:Content>

