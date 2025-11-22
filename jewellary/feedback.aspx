<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="jewellary.feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <center>
         <table class="border" align="center"  border="5" height="50px" width="200px"cellpadding="10">
             <tr>
                 <th colspan="2" align="center">
                     <h2 style="color:black; font-family:'Poor Richard';"><i>Feedback</i></h2>
                 </th>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="Label1" runat="server" Text="Username" CssClass="label" ForeColor="Black"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="r_username" runat="server" CssClass="textbox" pattern="^[a-zA-Z]+$" placeholder="enter username" CausesValidation="true"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="enter username" ControlToValidate="r_username"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="Label2" runat="server" Text="Comment" CssClass="label" ForeColor="Black"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="f_comment" runat="server" CssClass="textbox" placeholder="enter feedback" CausesValidation="true"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="enter feedback" ControlToValidate="f_comment"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <td align="center" colspan="2">
                 <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="button" OnClick="Button1_Click"></asp:Button>
                 <asp:Button ID="Button2" runat="server" Text="Reset" CssClass="button" OnClick="Button2_Click"></asp:Button>
             </td>
             </table>
    </center><br />
</asp:Content>

