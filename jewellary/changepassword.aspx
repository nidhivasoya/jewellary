<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="jewellary.changepassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <br />
     <center>
        <table class="table" align="center" border="5"  Height="50px" width="200px">
                <th colspan="3" align="center">
                    <h3 style="color:black; font-family:Poor Richard;">Change Password</h3>
                </th>

            <tr>
                    <td>
                            <asp:Label ID="Label1" runat="server" Text="Old Password" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="old_pwd" runat="server" TextMode="Password" CssClass="textbox" placeholder="enter password" CausesValidation="true"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" enter Password" ForeColor="" Display="Dynamic" ControlToValidate="old_pwd"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            <tr>
                    <td>
                            <asp:Label ID="Label2" runat="server" Text="New Password" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="n_pwd" runat="server" TextMode="Password" CssClass="textbox" placeholder="enter password" CausesValidation="true"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="enter Password" ForeColor="" Display="Dynamic" ControlToValidate="n_pwd"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            <tr>
                    <td>
                            <asp:Label ID="Label3" runat="server" Text="Conform Password" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="c_pwd" runat="server" TextMode="Password" CssClass="textbox" placeholder="enter password" CausesValidation="true"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" enter Password" ForeColor="" Display="Dynamic" ControlToValidate="c_pwd"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            <tr>
                <td align="center" colspan="2">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="new & conform password must be not same" ControlToValidate="c_pwd" ControlToCompare="n_pwd" ForeColor="Red" Font-Bold="True"></asp:CompareValidator>
                    <asp:Button ID="Button1" runat="server" Text="login" CssClass="button" OnClick="Button1_Click"></asp:Button>
                </td>
            </tr>
         
            </table>
         <center><a href="home.aspx">Back</a></center>
</asp:Content>


