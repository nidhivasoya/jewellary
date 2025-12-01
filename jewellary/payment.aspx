<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="jewellary.payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Online Payment</title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <br /><br />
            <h2>Online Payment</h2>

            <asp:Label ID="lblAmt" runat="server" Text=""></asp:Label>
            <br /><br />

            <asp:TextBox ID="txtCard" runat="server" placeholder="Enter Card Number"
                MaxLength="16"></asp:TextBox>
            <br /><br />

            <asp:Button ID="btnSubmit" runat="server" Text="Pay Now" 
                CssClass="btn btn-success" OnClick="btnSubmit_Click" />
        </center>
    </form>
</body>
</html>

</asp:Content>
