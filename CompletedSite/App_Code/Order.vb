Imports Microsoft.VisualBasic
Imports System.Data

Public Class Order
    Private _orderDate As DateTime
    Private _cust As Customer
    Private _cart As ShoppingCart

    Public Sub New()
        _cust = New Customer()
        _cart = New ShoppingCart()
    End Sub

    Public Sub New(ByVal orderDate As DateTime, _
            ByVal Cust As Customer, _
            ByVal Cart As ShoppingCart)
        Me.OrderDate = orderDate
        Me.Cust = Cust
        Me.Cart = Cart
    End Sub

    Public Property OrderDate() As DateTime
        Get
            Return _orderDate
        End Get
        Set(ByVal value As DateTime)
            _orderDate = value
        End Set
    End Property

    Public Property Cust() As Customer
        Get
            Return _cust
        End Get
        Set(ByVal value As Customer)
            _cust = value
        End Set
    End Property

    Public Property Cart() As ShoppingCart
        Get
            Return _cart
        End Get
        Set(ByVal value As ShoppingCart)
            _cart = value
        End Set
    End Property

    Public ReadOnly Property SubTotal() As Decimal
        Get
            Dim d As Decimal = 0D
            For Each item As CartItem In _cart.GetItems()
                d += item.Total
            Next
            Return d
        End Get
    End Property

    Public ReadOnly Property SalesTax() As Decimal
        Get
            If Me.Cust.State = ("CA") Then
                Return Me.SubTotal * 0.0775D
            Else
                Return Me.SubTotal * 0.0775D
            End If
        End Get
    End Property

    Public ReadOnly Property Shipping() As Decimal
        Get
            Dim count As Integer = 0
            For Each item As CartItem In _cart.GetItems()
                count += item.Quantity
            Next
            Return count * 2D
        End Get
    End Property

    Public ReadOnly Property Total() As Decimal
        Get
            Return Me.SubTotal + Me.Shipping _
                + Me.SalesTax
        End Get
    End Property

End Class
