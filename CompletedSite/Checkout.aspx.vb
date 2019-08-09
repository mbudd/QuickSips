Partial Class CheckOut
    Inherits System.Web.UI.Page

    Private order As Order
    Private cust As Customer
    Private cart As ShoppingCart

    Dim con As New Data.SqlClient.SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\qs.mdf;Integrated Security=True")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cart = Session("cart")

        If Session("order") Is Nothing Then
            order = New Order(DateTime.Now, _
                Nothing, Session("cart"))
            Session("order") = order
        Else
            order = Session("order")
            cart = order.Cart
        End If

        cust = New Customer(txtFirst.Text, _
            txtLast.Text, _
            txtAddress.Text, _
            txtCity.Text, _
            ddlState.SelectedValue, _
            txtZipCode.Text, _
            txtPhoneNumber.Text, _
            txtEmail.Text)
        order.Cust = cust

        lblSubtotal.Text = order.SubTotal.ToString("c")
        lblSalesTax.Text = order.SalesTax.ToString("c")
        lblShipping.Text = order.Shipping.ToString("c")
        lblTotal.Text = order.Total.ToString("c")
    End Sub

    Protected Sub Wizard1_FinishButtonClick( _
        ByVal sender As Object, _
        ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) _
        Handles Wizard1.FinishButtonClick

        ' process credit card information here

        con.Open()
        Dim aut As New Data.SqlClient.SqlCommand(("INSERT INTO Customers (email, lastname, firstname, DOB, Age, address, city, state, zipcode, phone, CardType, CardName, CardNumber, ExpirationMonth, ExpirationYear) VALUES ('" & txtEmail.Text & "','" & txtLast.Text & "','" & txtFirst.Text & "','" & txtDate.Text & "','" & txtAge.Text & "','" & txtAddress.Text & "','" & txtCity.Text & "','" & ddlState.Text & "','" & txtZipCode.Text & "','" & txtPhoneNumber.Text & "','" & ddlCardType.Text & "','" & txtName.Text & "','" & txtCardNumber.Text & "','" & ddlExpirationMonth.Text & "','" & txtExpirationYear.Text & "')"), con)

        aut.ExecuteNonQuery()
        con.Close()
        

        Dim success As Boolean
        success = OrderDB.WriteOrder(order)
        Session("cart") = Nothing
        Session("order") = Nothing
        If success Then
            Response.Redirect("Completed.aspx")
        Else
            Response.Redirect("Completed.aspx?Error=1")
        End If
    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        txtOrder.Text = Calendar1.SelectedDate.ToShortDateString()
    End Sub

    Protected Sub ibtnDate_Click(sender As Object, e As ImageClickEventArgs) Handles ibtnDate.Click
        ibtnDate.Visible = False
        If Calendar1.Visible = False Then
            Calendar1.Visible = True
        Else
            Calendar1.Visible = False
        End If
    End Sub

    Protected Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        'set to default
        Dim d As DateTime = DateTime.Now
        txtOrder.Text = d.ToShortDateString

        If ibtnDate.Visible = False Then
            ibtnDate.Visible = True
        End If

        If Calendar1.Visible = True Then
            Calendar1.Visible = False
        End If


        'clear inputs
        txtFirst.Text = ""
        txtLast.Text = ""
        txtDate.Text = ""
        txtAge.Text = ""
        txtEmail.Text = ""
        txtAddress.Text = ""
        txtCity.Text = ""
        txtZipCode.Text = ""
        txtPhoneNumber.Text = ""
    End Sub

    Protected Sub txtDate0_TextChanged(sender As Object, e As EventArgs) Handles txtOrder.TextChanged

    End Sub
End Class
