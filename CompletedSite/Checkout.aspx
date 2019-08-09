<%@ Page Title="Checkout" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <h3>
        Checkout</h3>
   <asp:Wizard ID="Wizard1" runat="server" 
      Width="425px" ActiveStepIndex="0" 
      FinishCompleteButtonText="Submit Order" >
    <WizardSteps>
      <asp:WizardStep ID="WizardStep1" runat="server" Title="Shipping/Delivery">
          <div class="text-left">
              <br />
&nbsp;<asp:Label ID="Label19" runat="server" BorderStyle="None" Text="Order Date:" Width="100px"></asp:Label>
              <asp:TextBox ID="txtOrder" runat="server"></asp:TextBox>
              <asp:ImageButton ID="ibtnDate" runat="server" AlternateText="Calander" CausesValidation="False" ImageUrl="~/img/SpotlightImages/Calendar.bmp" />
              &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Order Date Required" ForeColor="Red" ControlToValidate="txtOrder">*</asp:RequiredFieldValidator>
               <br />
              <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Visible="False" Width="200px">
                  <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                  <NextPrevStyle VerticalAlign="Bottom" />
                  <OtherMonthDayStyle ForeColor="Gray" />
                  <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                  <SelectorStyle BackColor="#CCCCCC" />
                  <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                  <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                  <WeekendDayStyle BackColor="#FFFFCC" />
              </asp:Calendar>
              <br />
              Where do you want this order delivered?<br />
              <br />
              <asp:Label runat="server" Text="First Name:" BorderStyle="None" Width="100px" ID="Label1"></asp:Label>

              <asp:TextBox ID="txtFirst" runat="server"></asp:TextBox>

              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="First Name Required" ControlToValidate="txtFirst">*</asp:RequiredFieldValidator>

              <br />
              <asp:Label ID="Label2" runat="server" BorderStyle="None" Height="20px" Text="Last Name:" Width="100px"></asp:Label>
              <asp:TextBox ID="txtLast" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="Last Name Required" ControlToValidate="txtLast">*</asp:RequiredFieldValidator>
              <br />
              <asp:Label ID="Label17" runat="server" BorderStyle="None" Height="20px" Text="DOB:" Width="100px"></asp:Label>
              <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="Date of Birth Required" ControlToValidate="txtDate">*</asp:RequiredFieldValidator>
              <br />
              <asp:Label ID="Label18" runat="server" BorderStyle="None" Height="20px" Text="Age:" Width="100px"></asp:Label>
              <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Age Required" ControlToValidate="txtAge" ForeColor="Red">*</asp:RequiredFieldValidator>
              <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtAge" ErrorMessage="Age must be between 21 and 100" ForeColor="Red" MaximumValue="100" MinimumValue="21" Type="Integer">*</asp:RangeValidator>
              <br />
              <asp:Label ID="Label8" runat="server" BorderStyle="None" Text="Email:" Width="100px"></asp:Label>
              <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="Email Required" ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email must be in the correct format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
              <br />
              <asp:Label ID="Label3" runat="server" BorderStyle="None" Text="Address:" Width="100px"></asp:Label>
              <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ErrorMessage="Address Required" ControlToValidate="txtAddress">*</asp:RequiredFieldValidator>
              <br />
              <asp:Label ID="Label4" runat="server" BorderStyle="None" Text="City:" Width="100px"></asp:Label>
              <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red" ErrorMessage="City Required" ControlToValidate="txtCity">*</asp:RequiredFieldValidator>
              <br />
              <asp:Label ID="Label5" runat="server" BorderStyle="None" Text="State:" Width="100px"></asp:Label>
              <asp:DropDownList ID="ddlState" runat="server">
                  <asp:ListItem Value="AL">Alabama</asp:ListItem>
                  <asp:ListItem Value="AK">Alaska</asp:ListItem>
                  <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                  <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                  <asp:ListItem Value="CA">California</asp:ListItem>
                  <asp:ListItem Value="CO">Colorado</asp:ListItem>
                  <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                  <asp:ListItem Value="DE">Deleware</asp:ListItem>
                  <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                  <asp:ListItem Value="FL">Florida</asp:ListItem>
                  <asp:ListItem Value="GA">Georgia</asp:ListItem>
                  <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                  <asp:ListItem Value="ID">Idaho</asp:ListItem>
                  <asp:ListItem Value="IL">Illinois</asp:ListItem>
                  <asp:ListItem Value="IA">Iowa</asp:ListItem>
                  <asp:ListItem Value="KS">Kansas</asp:ListItem>
                  <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                  <asp:ListItem Value="LA">Louisianna</asp:ListItem>
                  <asp:ListItem Value="ME">Maine</asp:ListItem>
                  <asp:ListItem Value="MD">Maryland</asp:ListItem>
                  <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                  <asp:ListItem Value="MI">Michigan</asp:ListItem>
                  <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                  <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                  <asp:ListItem Value="MO">Missouri</asp:ListItem>
                  <asp:ListItem Value="MT">Montana</asp:ListItem>
                  <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                  <asp:ListItem Value="NV">Nevada</asp:ListItem>
                  <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                  <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                  <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                  <asp:ListItem Value="NY">New York</asp:ListItem>
                  <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                  <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                  <asp:ListItem Value="OH">Ohio</asp:ListItem>
                  <asp:ListItem Value="OR">Oregon</asp:ListItem>
                  <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                  <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                  <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                  <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                  <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                  <asp:ListItem Value="TX">Texas</asp:ListItem>
                  <asp:ListItem Value="UT">Utah</asp:ListItem>
                  <asp:ListItem Value="VT">Vermont</asp:ListItem>
                  <asp:ListItem Value="VA">Virginia</asp:ListItem>
                  <asp:ListItem Value="WA">Washington</asp:ListItem>
                  <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                  <asp:ListItem Value="WY">Wyoming</asp:ListItem>
              </asp:DropDownList>
              <br />
              <asp:Label ID="Label6" runat="server" BorderStyle="None" Text="Zip Code:" Width="100px"></asp:Label>
              <asp:TextBox ID="txtZipCode" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtZipCode" ErrorMessage="Zip Code Required" ForeColor="Red">*</asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtZipCode" ErrorMessage="Zip Code must be 5 numbers" ForeColor="Red" ValidationExpression="\d{5}(-\d{4})?">*</asp:RegularExpressionValidator>
              <br />
              <asp:Label ID="Label7" runat="server" BorderStyle="None" Text="Phone Number:" Width="100px"></asp:Label>
              <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number Required" ForeColor="Red">*</asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number must be in the correct format" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
              <br />
              <br />
              <asp:Button ID="btnClear" runat="server" Text="Clear " Width="139px" />
              <br />
          </div>
           
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
           
          <br />
      </asp:WizardStep>
      <asp:WizardStep ID="WizardStep2" runat="server" Title="Billing">
        How do you want to pay for this order?<br />
        <br />
        <asp:Label runat="server" Text="Card type:" BorderStyle="None" Width="100px" ID="Label11"></asp:Label>

        <asp:DropDownList ID="ddlCardType" 
            runat="server">
          <asp:ListItem Value="VISA">Visa</asp:ListItem>
          <asp:ListItem Value="MC">MasterCard</asp:ListItem>
          <asp:ListItem Value="AMEX">American Express</asp:ListItem>
        </asp:DropDownList>
          <br />
        <asp:Label ID="Label20" runat="server" 
            BorderStyle="None" Text="Name as it appears on the card:" 
            Width="126px" />
        <asp:TextBox ID="txtName" runat="server" />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" Forecolor="red" controltovalidate="txtName" ErrorMessage="Name on Card Required">*</asp:RequiredFieldValidator>
           <br />
        <asp:Label runat="server" Text="Card number:" BorderStyle="None" Width="100px" ID="Label13"></asp:Label>

          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:TextBox runat="server" ID="txtCardNumber"></asp:TextBox>
          
          <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtCardNumber" ErrorMessage="Credit Card Number Required" ForeColor="Red">*</asp:RequiredFieldValidator>
       <br /><br />
        <asp:Label ID="Label15" runat="server" 
            BorderStyle="None" Text="Exp. Month:" 
            Width="100px" />
        <asp:DropDownList ID="ddlExpirationMonth" 
            runat="server" Height="22px">
          <asp:ListItem Value="1">January</asp:ListItem>
          <asp:ListItem Value="2">February</asp:ListItem>
          <asp:ListItem Value="3">March</asp:ListItem>
          <asp:ListItem Value="4">April</asp:ListItem>
          <asp:ListItem Value="5">May</asp:ListItem>
          <asp:ListItem Value="6">June</asp:ListItem>
          <asp:ListItem Value="7">July</asp:ListItem>
          <asp:ListItem Value="8">August</asp:ListItem>
          <asp:ListItem Value="9">September</asp:ListItem>
          <asp:ListItem Value="10">October</asp:ListItem>
          <asp:ListItem Value="11">November</asp:ListItem>
          <asp:ListItem Value="12">December</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label16" runat="server" 
            BorderStyle="None" Text="Exp. Year:" 
            Width="100px" />
        <asp:TextBox ID="txtExpirationYear" runat="server" 
            Width="82px" />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" controltovalidate="txtExpirationYear" Forecolor="red" ErrorMessage="Expiration Year Required">*</asp:RequiredFieldValidator>
          <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="Year must be between 2016-2026" ControlToValidate="txtExpirationYear" ForeColor="Red" MaximumValue="2026" MinimumValue="2016" Type="Integer">*</asp:RangeValidator>
          <br />
          <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" />
      </asp:WizardStep>
      <asp:WizardStep ID="WizardStep3" runat="server" Title="Confirmation">
        Your order is ready to be processed.<br />
        <br />
        <asp:Label ID="Label9" runat="server" 
            BorderStyle="None" Text="Subtotal:" 
            Width="80px" />
        <asp:Label ID="lblSubtotal" runat="server" />
        <br />
        <asp:Label ID="Label10" runat="server" 
            BorderStyle="None" Text="Sales Tax:" 
            Width="80px" />
        <asp:Label ID="lblSalesTax" runat="server" />
        <br />
        <asp:Label ID="Label12" runat="server" 
            BorderStyle="None" Text="Shipping:" 
            Width="80px" />
        <asp:Label ID="lblShipping" runat="server" />
        <br />
        <asp:Label ID="Label14" runat="server" 
            BorderStyle="None" Text="Total:" 
            Width="80px" />
        <asp:Label ID="lblTotal" runat="server" />
        <br /><br />
        Click Submit Order to complete your order.<br />
      </asp:WizardStep>
    </WizardSteps>
    <SideBarStyle VerticalAlign="Top" />
  </asp:Wizard>
</asp:Content>


