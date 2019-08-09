Imports Microsoft.VisualBasic

Public Class Customer
    Private _LastName As String
    Private _FirstName As String
    Private _Address As String
    Private _City As String
    Private _State As String
    Private _ZipCode As String
    Private _PhoneNumber As String
    Private _Email As String

    Public Sub New()
    End Sub

    Public Sub New(ByVal LastName As String, _
            ByVal FirstName As String, _
            ByVal Address As String, _
            ByVal City As String, _
            ByVal State As String, _
            ByVal ZipCode As String, _
            ByVal PhoneNumber As String, _
            ByVal Email As String)
        Me.LastName = LastName
        Me.FirstName = FirstName
        Me.Address = Address
        Me.City = City
        Me.State = State
        Me.ZipCode = ZipCode
        Me.PhoneNumber = PhoneNumber
        Me.Email = Email
    End Sub

    Public Property LastName() As String
        Get
            Return _LastName
        End Get
        Set(ByVal value As String)
            _LastName = value
        End Set
    End Property

    Public Property FirstName() As String
        Get
            Return _FirstName
        End Get
        Set(ByVal value As String)
            _FirstName = value
        End Set
    End Property

    Public Property Address() As String
        Get
            Return _Address
        End Get
        Set(ByVal value As String)
            _Address = value
        End Set
    End Property

    Public Property City() As String
        Get
            Return _City
        End Get
        Set(ByVal value As String)
            _City = value
        End Set
    End Property

    Public Property State() As String
        Get
            Return _State
        End Get
        Set(ByVal value As String)
            _State = value
        End Set
    End Property

    Public Property ZipCode() As String
        Get
            Return _PhoneNumber
        End Get
        Set(ByVal value As String)
            _ZipCode = value
        End Set
    End Property

    Public Property Email() As String
        Get
            Return _Email
        End Get
        Set(ByVal value As String)
            _Email = value
        End Set
    End Property

    Public Property PhoneNumber() As String
        Get
            Return _PhoneNumber
        End Get
        Set(ByVal value As String)
            _PhoneNumber = value
        End Set
    End Property

End Class
