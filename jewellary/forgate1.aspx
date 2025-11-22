<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="forgate1.aspx.cs" Inherits="jewellary.forgate1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <br />
     <center>
         <asp:Label ID="Label2" runat="server" cssclass="error"></asp:Label>
        <table class="table" align="center" border="5"  Height="50px" width="200px">
                <th colspan="3" align="center">
                    <h2 Cssclass="label"><i>ForgetPassword</i></h2>
                </th>
          
              

                <tr>
                    <td>
                        <asp:Label ID="label1" runat="server" Text="Username" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                         <asp:TextBox ID="r_username" runat="server" CssClass="textbox"  placeholder="enter username" CausesValidation="true"></asp:TextBox>

                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="enter Username" ForeColor="" Display="Dynamic" ControlToValidate="r_username"></asp:RequiredFieldValidator>
                    </td>
                </tr>
             <tr>
                    <td align="center" colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="Next" CssClass="button" OnClick="Button1_Click" ></asp:Button>
                       <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click1"></asp:Button>
                    </td>
                </tr>
            </table><br /><br /><br /><br /><br /><br />
</asp:Content>

