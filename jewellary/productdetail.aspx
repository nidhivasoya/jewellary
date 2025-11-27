<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="productdetail.aspx.cs" Inherits="jewellary.productdetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <center>
    <tr>
        <td><asp:Label ID="lbl_msg" runat="server" Text="" CssClass="label" ForeColor="black"></asp:Label></td>
    </tr><br />
    <table align="center" border="0" class="login">
     
        <h2 style="color:black; font-family:'Poor Richard';"><span class="text-primary font-weight-bold">Product detail</span></h2>

    <tr><td style="color:black;">
         <asp:Label ID="lbl_img" runat="server" style="color:black;" Text="Image" CssClass="label"></asp:Label></td>
        <td><asp:Image ID="Image1" runat="server" Height="150" Width="230"></asp:Image></td></tr>
    <tr><td><asp:Label ID="lbl_nm" runat="server" Text="Name" style="color:black;" CssClass="label"></asp:Label></td>
        <td><asp:Label ID="lbl_name" runat="server" Text="" style="color:black;" CssClass="label"></asp:Label></td></tr>
    <tr><td><asp:Label ID="lbl1_price" runat="server" Text="Price" style="color:black;" CssClass="label"></asp:Label></td>
        <td><asp:Label ID="lbl_price" runat="server" Text="" style="color:black;" CssClass="label"></asp:Label></td></tr>
    <tr><td><asp:Label ID="lbl1_quantity" runat="server" Text="Stock" style="color:black;" CssClass="label"></asp:Label></td>
        <td><asp:Label ID="lbl_quantity" runat="server" Text="" style="color:black;" CssClass="label"></asp:Label></td></tr>
    <tr><td><asp:Label ID="lbl2_qua" runat="server" Text="Quantity" style="color:black;" CssClass="label"></asp:Label></td>
        <td><asp:TextBox ID="txt_quantity" runat="server" style="color:black;" CssClass="textbox" pattern="^[0-9]+$"></asp:TextBox>
            <asp:RequiredFieldValidator ID="req_qua" runat="server" ErrorMessage="Enter Quantity" ControlToValidate="txt_quantity" Display="Dynamic" ForeColor="Red" ValidationGroup="product"></asp:RequiredFieldValidator></td></tr>
    <tr><td align="center" colspan="2" style="color:teal;">
      <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="OK" Font-Italic="false" Font-Bold="true"  ForeColor="black" ValidationGroup="product" OnClick="Button1_Click"/></td></tr>
</table><br />
  </center>
    <center> <a href="product.aspx">back</a></center>
</asp:Content>


