<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="jewellary.addproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
             <tr>
                 <td>
                     <asp:Label ID="lbl_msg1" runat="server" Text="" CssClass="label" ForeColor="Red"></asp:Label>
                 </td>
             </tr>
   <table>
       <tr>
         <h2 style="color:black; font-family:'Poor Richard';"><center>Add product</center></h2></tr>

        <tr>
            <td style="color:black; font-family:'Poor Richard';">
                <asp:Label ID="lbl_fname" runat="server" Text="Category" style="color:black;" CssClass="label"></asp:Label>
            </td>
             <td>
                 <asp:DropDownList ID="category" runat="server"  AutoPostBack="True"></asp:DropDownList>
             </td>
        </tr>

        <tr>
            <td >
                <asp:Label ID="product_image" runat="server" style="color:black;" Text="Image" CssClass="label"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload><br/>
               <%if (Request.QueryString["product_id"] != null)
                 {%>
                     <asp:Image ID="Image1" runat="server" Height ="200" Width ="250"></asp:Image>
            </td>
        </tr>
               <%}%>

        <tr>
            <td>
                <asp:Label ID="product_name" runat="server" style="color:black;" Text="Name" CssClass="label"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_name" runat="server" CssClass="textbox" ></asp:TextBox>
               <asp:RequiredFieldValidator ID="req_uname" runat="server" ErrorMessage="Name can't be blank" ValidationGroup="product" ForeColor="red" Display="Dynamic" ControlToValidate="txt_name" ></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="product_price" runat="server" style="color:black;" Text="Price" CssClass="label"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_price" runat="server" CssClass="textbox" pattern="^[0-9]+$"></asp:TextBox>
               <asp:RequiredFieldValidator ID="req_con" runat="server" ErrorMessage="Price must be in a particulir formate." ForeColor="red" Display="Dynamic" ControlToValidate="txt_price" ValidationGroup="product"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>
               <asp:Label ID="product_quantity" runat="server" style="color:black;" Text="Quantity" CssClass="label"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_quantity" runat="server" CssClass="textbox" pattern="^[0-9]+$"></asp:TextBox>
                <asp:RequiredFieldValidator ID="req_quantity" runat="server" ErrorMessage="Quantity must be in a particulir formate." ForeColor="red" Display="Dynamic" ControlToValidate="txt_quantity" ValidationGroup="product"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" style="color:black;" Text="Description" CssClass="label"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox" pattern="^[a-z A-Z]+$" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Description can't be blank" ValidationGroup="product" ForeColor="red" Display="Dynamic" ControlToValidate="TextBox1" ></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>

        <tr align="center">
            <td colspan="2" align="center">
                <%if(Request.QueryString["product_id"]!=null)
                {%>
                    <asp:Button ID="btn_edit" runat="server" class="btn btn-primary"  Text="Edit" Font-Italic="false" Font-Bold="true" ValidationGroup="product"  OnClick="btn_edit_Click" ForeColor="black"/>
                <%}
                else
                {%>
                    <asp:Button ID="btn_add" runat="server" class="btn btn-primary"  Text="Add" Font-Italic="true" Font-Bold="true"  ForeColor="black" OnClick="btn_add_Click" ValidationGroup="product"/>
              <%}%>
            </td>
        </tr>
      </center>
        </table><br /><br />
</asp:Content>

