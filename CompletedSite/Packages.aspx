<%@ Page Title="Packages" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="packages.aspx.vb" Inherits="packages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h1>Pay it Forward Packages:</h1>
    <h4>
        QuickSips (QS) is dedicated to alleviating any stress that might be associated with holiday seasons. To do so, during special seasons like Halloween, Thanksgiving, and Christmas we will be taking special orders for delivery to accomodate with anything going on in your life. These orders are month specific. For example, Thanksgiving packages will only be sold during the month of November and so on. In addition to normal holidays, we will also like to help out with special occasions. This includes birthdays and graduations, which will be available for sale every day of the year. We do this as our special way of paying it forward to the community to help those in need during the holiday seasons.
    </h4>
    <h3>Holiday and Celebration Packages:</h3>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="Type" DataValueField="Type">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetPackageType" TypeName="DataSetTableAdapters.PackageTypeTableAdapter"></asp:ObjectDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProductID" DataSourceID="ObjectDataSource2" ForeColor="#333333" GridLines="None" Width="1044px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="ProductID" DataNavigateUrlFormatString="PackagesView.aspx?ProductID={0}" HeaderText="View" Text="View" />
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
                <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" SortExpression="Price" />
                <asp:ImageField DataImageUrlField="Picture " HeaderText="Product">
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
    </p>
    <p>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataby" TypeName="DataSetTableAdapters.PackagesTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_PackagesID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="p1" Type="String" />
                <asp:Parameter Name="Brand" Type="String" />
                <asp:Parameter Name="Size" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Picture_" Type="String" />
                <asp:Parameter Name="Type" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Type" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="p1" Type="String" />
                <asp:Parameter Name="Brand" Type="String" />
                <asp:Parameter Name="Size" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Picture_" Type="String" />
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="Original_PackagesID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </p>
</asp:Content>

