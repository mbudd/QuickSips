
Partial Class Cart
    Inherits System.Web.UI.Page

    Private cart As ShoppingCart

    Protected Sub Page_Load( _
            ByVal sender As Object, _
            ByVal e As System.EventArgs) _
            Handles Me.Load
        CheckTimeStamps()
        If Session("cart") Is Nothing Then
            cart = New ShoppingCart()
            Session("cart") = cart
        Else
            cart = Session("cart")
        End If
        GridView1.DataSource = cart.GetItems()
        If Not IsPostBack Then
            GridView1.DataBind()
        End If
        btnCheckOut.Enabled = (cart.Count > 0)
    End Sub

    Protected Sub GridView1_RowDeleting( _
            ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) _
            Handles GridView1.RowDeleting
        cart.DeleteItem(e.RowIndex)
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowEditing( _
            ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) _
            Handles GridView1.RowEditing
        GridView1.EditIndex = e.NewEditIndex
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowUpdating( _
            ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) _
        Handles GridView1.RowUpdating
        Dim cell As DataControlFieldCell
        cell = GridView1.Rows(e.RowIndex) _
            .Controls(3)
        Dim t As TextBox = cell.Controls(0)
        Try
            Dim q As Integer
            q = Integer.Parse(t.Text)
            cart.UpdateQuantity(e.RowIndex, q)
        Catch ex As FormatException
            e.Cancel = True
        End Try
        GridView1.EditIndex = -1
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowCancelingEdit( _
            ByVal sender As Object, _
            ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) _
            Handles GridView1.RowCancelingEdit
        e.Cancel = True
        GridView1.EditIndex = -1
        GridView1.DataBind()
    End Sub

    Protected Sub btnContinue_Click( _
            ByVal sender As Object, _
            ByVal e As System.EventArgs) _
            Handles btnContinue.Click
        Dim ProductID As String
        ProductID = Request.QueryString("prod")
        Dim CatID As String
        CatID = Request.QueryString("cat")
        If ProductID Is Nothing Then
            If CatID Is Nothing Then
                Response.Redirect("Products.aspx")
            Else
                Response.Redirect( _
                "Products.aspx")
            End If
        Else
            Response.Redirect( _
                "Products.aspx")
        End If
    End Sub

    Private Sub CheckTimeStamps()
        If IsExpired() Then
            Response.Redirect(Request.Url.OriginalString)
        Else
            Dim t As DateTime
            t = DateTime.Now
            ViewState.Add("$$TimeStamp", t)
            Dim page As String
            page = Request.Url.AbsoluteUri
            Session.Add(page + "_TimeStamp", t)
        End If
    End Sub

    Private Function IsExpired() As Boolean
        Dim page As String
        page = Request.Url.AbsoluteUri
        If Session(page + "_TimeStamp") Is Nothing Then
            Return False
        ElseIf ViewState("$$TimeStamp") Is Nothing Then
            Return False
        ElseIf Session(page + "_TimeStamp").ToString() _
              = ViewState("$$TimeStamp").ToString() Then
            Return False
        Else
            Return True
        End If
    End Function

End Class
