Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Web.Configuration

Public Class OrderDB

    Shared tran As SqlTransaction
    Shared con As SqlConnection

    Public Shared Function WriteOrder( _
            ByVal o As Order) As Boolean
        Dim cs As String
        cs = WebConfigurationManager _
            .ConnectionStrings("ConnectionString") _
                .ConnectionString
        con = New SqlConnection(cs)
        con.Open()
        tran = con.BeginTransaction()
        Try
            InsertCustomer(o.Cust)
            Dim oNum As Integer
            oNum = InsertOrder(o)
            For Each item As CartItem _
                    In o.Cart.GetItems()
                InsertItem(item, oNum)
            Next
            tran.Commit()
            con.Close()
            Return True
        Catch ex As Exception
            tran.Rollback()
            Return False
        End Try
    End Function

    Private Shared Sub InsertCustomer( _
            ByVal cust As Customer)
        Dim cmd As New SqlCommand()
        cmd.Connection = con
        cmd.Transaction = tran
        ' Try
        'cmd.CommandText = "INSERT INTO Customers " _
        '   + "(lastname, firstname, " _
        '  + "address, city, state, zipcode," _
        ' + "phone, email) " _
        '+ "VALUES (@LastName, @FirstName, " _
        '+ "@Address, @City, @State, @ZipCode," _
        '+ "@PhoneNumber, @Email)"
        'cmd.Parameters.AddWithValue( _
        '   "@LastName", cust.LastName)
        'cmd.Parameters.AddWithValue( _
        '   "@FirstName", cust.FirstName)
        'cmd.Parameters.AddWithValue( _
        '   "@Address", cust.Address)
        'cmd.Parameters.AddWithValue( _
        '   "@City", cust.City)
        'cmd.Parameters.AddWithValue( _
        '   "@State", cust.State)
        'cmd.Parameters.AddWithValue( _
        '   "@ZipCode", cust.ZipCode)
        'cmd.Parameters.AddWithValue( _
        '   "@PhoneNumber", cust.PhoneNumber)
        'cmd.Parameters.AddWithValue( _
        '   "@Email", cust.Email)
        'cmd.ExecuteNonQuery()
        'Catch ex As SqlException
        'If ex.Number = 2627 Then 'Duplicate Key
        'cmd.CommandText = "UPDATE Customers " _
        '   + "SET lastname = @LastName, " _
        '  + "firstname = @FirstName, " _
        ' + "address = @Address, " _
        ' + "city = @City, " _
        ' + "state = @State, " _
        ' + "zipcode = @ZipCode, " _
        ' + "phone = @PhoneNumber " _
        ' + "WHERE email = @Email "
        ' cmd.ExecuteNonQuery()
        ' Else
        'Throw ex
        ' End If
        ' End Try
    End Sub

    Private Shared Function InsertOrder( _
            ByVal o As Order) As Integer
        Dim cmd As New SqlCommand()
        cmd.Connection = con
        cmd.Transaction = tran
        cmd.CommandText = "INSERT INTO Orders " _
            + "(orderdate, custemail, " _
            + "subtotal, salestax, " _
            + "shipping) " _
            + "VALUES (@OrderDate, @Custemail, " _
            + "@subtotal, @salestax, " _
            + "@shipping)"
        cmd.Parameters.AddWithValue( _
            "@OrderDate", DateTime.Now)
        cmd.Parameters.AddWithValue( _
            "@Custemail", o.Cust.Email)
        cmd.Parameters.AddWithValue( _
            "@subtotal", o.SubTotal)
        cmd.Parameters.AddWithValue( _
            "@salestax", o.SalesTax)
        cmd.Parameters.AddWithValue( _
            "@shipping", o.Shipping)
        cmd.ExecuteNonQuery()
        cmd.CommandText = "SELECT @@IDENTITY"
        Return Convert.ToInt32(cmd.ExecuteScalar())
    End Function

    Private Shared Sub InsertItem( _
            ByVal item As CartItem, _
            ByVal oNum As Integer)
        Dim cmd As New SqlCommand()
        cmd.Connection = con
        cmd.Transaction = tran
        cmd.CommandText = "INSERT INTO OrderItems " _
            + "(ordernum, productid, " _
            + "name, price, quantity) " _
            + "VALUES (@OrderNum, @ProductID, " _
            + "@Name, @Price, @Quantity)"
        cmd.Parameters.AddWithValue( _
            "@OrderNum", oNum)
        cmd.Parameters.AddWithValue( _
            "@ProductID", item.ID)
        cmd.Parameters.AddWithValue( _
            "@Name", item.Name)
        cmd.Parameters.AddWithValue( _
            "@Price", item.Price)
        cmd.Parameters.AddWithValue( _
            "@Quantity", item.Quantity)
        cmd.ExecuteNonQuery()
    End Sub

End Class
