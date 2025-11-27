<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMobile.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="jewellary.category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <br /><br />
    
            <center>
                <tr>
                    <td>
                        <asp:Label ID="lb1_msg" runat="server" Text="" CssClass="label" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <table align="center" border="3" class="table">
                    <tr>
                        <center><th style="color:black; font-family:'Poor Richard';">Add Category</th></center>
                    </tr>
            </center>
            <tr>   
             <td style="color:black; font-family:'Poor Richard';">
                 <asp:Label ID="Label1" runat="server" Text="category"></asp:Label>
                <asp:TextBox ID="Txt_cnm" runat="server" CssClass="textbox" Placeholder="category"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Category" ControlToValidate="Txt_cnm" Font-Bold="true" ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator>
            </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <%if(Request.QueryString["category_id"]==null)
                      { %>
                    <asp:Button ID="add" runat="server" Text="Add" CssClass="button" OnClick="add_Click"  />
                    <%}
                      else
                      {
                             %>
                    <asp:Button ID="edit" runat="server" Text="Edit" OnClick="edit_Click" CssClass="button"/>
                    <%
                    } %>
                    <asp:Button ID="reset" runat="server" Text="Cancle" CssClass="button" OnClick="reset_Click" />
                </td>
                </tr>
            </table><br />
            <td align="center" colspan="3"><a href="../viewcategory.aspx"></a></td>
       <br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>


