<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMobile.Master" AutoEventWireup="true" CodeBehind="logine.aspx.cs" Inherits="jewellary.logine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br /><br /><br />
    <br /><br /><br />
     <center>
        <table class="table" align="center" border="5"  >
                <th colspan="3" align="center">
                    <h2 style="color:black; font-family:'Poor Richard';"><i>Login</i></h2>
                </th>
   
                <tr>
                    <td>
                        <asp:Label ID="username" runat="server" Text="Username" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                         <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox"  placeholder="enter username" CausesValidation="true"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="enter Username" ForeColor="red" Display="Dynamic" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                            <asp:Label ID="Label3" runat="server" Text="Password" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="textbox" placeholder="enter password" CausesValidation="true"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" enter Password" ForeColor="red" Display="Dynamic" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="Button1" runat="server" Text="Login" CssClass="button" OnClick="Button1_Click"></asp:Button>
                        <%--<asp:Button ID="Button2" runat="server" Text="Reset" CssClass="button" OnClick="Button2_Click" ></asp:Button>--%>
                    </td>
                </tr>
            
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </table><br /><br><br /><br /><br /><br /><br />

</asp:Content>





