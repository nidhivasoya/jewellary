<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMobile.Master" AutoEventWireup="true" CodeBehind="product1.aspx.cs" Inherits="jewellary.product1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style="text-align:center;">
    <asp:Label ID="lbl_msg1" runat="server" Text="" ForeColor="Red"></asp:Label>
</div>

<h2 style="text-align:center; color:black; font-family:'Poor Richard';">Add Product</h2>

<table align="center">

    <tr>
        <td><asp:Label ID="LabelCat" runat="server" Text="Category" /></td>
        <td>
            <asp:DropDownList ID="category" runat="server" AutoPostBack="true"></asp:DropDownList>
        </td>
    </tr>

    <tr>
        <td><asp:Label ID="LabelImg" runat="server" Text="Image" /></td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />

            <% if (Request.QueryString["product_id"] != null) { %>
                <asp:Image ID="Image1" runat="server" Height="200" Width="250" />
            <% } %>

        </td>
    </tr>

    <tr>
        <td><asp:Label ID="LabelName" runat="server" Text="Name" /></td>
        <td>
            <asp:TextBox ID="txt_name" runat="server" />
            <asp:RequiredFieldValidator ID="req_name" runat="server"
                ErrorMessage="Name can't be blank"
                ControlToValidate="txt_name" ForeColor="Red" />
        </td>
    </tr>

    <tr>
        <td><asp:Label ID="LabelPrice" runat="server" Text="Price" /></td>
        <td>
            <asp:TextBox ID="txt_price" runat="server" />
            <asp:RequiredFieldValidator ID="req_price" runat="server"
                ErrorMessage="Price is required"
                ControlToValidate="txt_price" ForeColor="Red" />
        </td>
    </tr>

    <tr>
        <td><asp:Label ID="LabelQty" runat="server" Text="Quantity" /></td>
        <td>
            <asp:TextBox ID="txt_quantity" runat="server" />
            <asp:RequiredFieldValidator ID="req_qty" runat="server"
                ErrorMessage="Quantity required"
                ControlToValidate="txt_quantity" ForeColor="Red" />
        </td>
    </tr>

    <tr>
        <td><asp:Label ID="LabelDesc" runat="server" Text="Description" /></td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" />
            <asp:RequiredFieldValidator ID="req_desc" runat="server"
                ErrorMessage="Description required"
                ControlToValidate="TextBox1" ForeColor="Red" />
        </td>
    </tr>

    <tr>
        <td colspan="2" style="text-align:center;">
            <% if (Request.QueryString["product_id"] != null) { %>
                <asp:Button ID="btn_edit" runat="server" Text="Edit" CssClass="btn btn-primary"
                    OnClick="btn_edit_Click" />
            <% } else { %>
                <asp:Button ID="btn_add" runat="server" Text="Add" CssClass="btn btn-primary"
                    OnClick="btn_add_Click" />
            <% } %>
        </td>
    </tr>

</table>

</asp:Content>
