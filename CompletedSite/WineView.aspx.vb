Imports System.Data

Partial Class WineView
    Inherits System.Web.UI.Page


    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        ' get values from data source
        Dim dv As DataView
        dv = SqlDataSource1.Select( _
             DataSourceSelectArguments.Empty)
        Dim dr As DataRowView = dv(0)
        Dim ID As String = dr("ProductID")
        Dim Brand As String = dr("Brand")
        Dim Price As Decimal
        If TypeOf (dr("Price")) Is DBNull Then
            Price = dr("Price")
        Else
            Price = dr("Price")
        End If

        ' get or create shopping cart
        Dim cart As ShoppingCart
        If Session("cart") Is Nothing Then
            cart = New ShoppingCart()
            Session("cart") = cart
        Else
            cart = Session("cart")
        End If

        ' add item to cart
        cart.AddItem(ID, Brand, Price)


        ' redirect to cart page
        Dim ProductID As String
        ProductID = Request.QueryString("Wine")
        Response.Redirect(
            "Cart.aspx?prod=" + ProductID)
    End Sub

    Protected Sub btnBack_Click(sender As Object, e As EventArgs) Handles btnBack.Click
        Response.Redirect("Wine.aspx")
    End Sub
End Class
