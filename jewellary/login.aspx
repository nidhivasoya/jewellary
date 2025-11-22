<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="jewellary.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>
   <table class="table" align="center" border="5"  Height="50px" width="200px">
           <th colspan="3" align="center">
               <h2 style="color:black; font-family:'Poor Richard';">Login Page</h2>
           </th>
   
           <tr>
               <td>
                   <asp:Label ID="username" runat="server" Text="Username" CssClass="label" ForeColor="Black"></asp:Label>
               </td>
               <td>
                    <asp:TextBox ID="r_username" runat="server" CssClass="textbox"  placeholder="enter username" CausesValidation="true"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="enter Username" ForeColor="red" Display="Dynamic" ControlToValidate="r_username"></asp:RequiredFieldValidator>
               </td>
           </tr>

           <tr>
               <td>
                       <asp:Label ID="Label3" runat="server" Text="Password" CssClass="label" ForeColor="Black"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="r_password" runat="server" TextMode="Password" CssClass="textbox" placeholder="enter password" CausesValidation="true"></asp:TextBox>

                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" enter Password" ForeColor="red" Display="Dynamic" ControlToValidate="r_password"></asp:RequiredFieldValidator>
               </td>
           </tr>

       <tr>
               <td colspan="2" align="center">

                  <asp:Button ID="Button1" runat="server" Text="Login" CssClass="button" OnClick="Button1_Click"></asp:Button>
                   <asp:Button ID="Button2" runat="server" Text="Reset" CssClass="button" OnClick="Button2_Click" ></asp:Button>

               </td>
           </tr>
       <tr>
           <td colspan="2" class="center" align="center">
              <asp:HyperLink ID="HyperLink1" NavigateUrl="~/registration.aspx" runat="server">Not A Member?SignUp Now..!!</asp:HyperLink>
           </td>
       </tr>

       <tr>
           <td colspan="2" class="center" align="center">
               <asp:HyperLink ID="HyperLink2" NavigateUrl="~/forgate1.aspx" runat="server">Forgot Password??</asp:HyperLink>
           </td>
       </tr>
       <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
       </table><br /><br><br />
</asp:Content>
