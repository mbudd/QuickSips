Partial Class Completed
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("Error") Is Nothing Then
            lblMessage.Text _
                = "Thank you for your order. " _
                + "It will be delivered as soon as possible." _
                + " Order is not final until age is verified upon delivery."
        Else
            lblMessage.Text _
                = "There was a problem with your order. " _
                + "Please try again later."
        End If
    End Sub

End Class
