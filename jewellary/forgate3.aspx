<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="forgate3.aspx.cs" Inherits="jewellary.forgate3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <<br />
     <center>
         <asp:Label ID="Label3" runat="server" cssclass="error"></asp:Label>
        <table class="table" align="center" border="5"  Height="50px" width="200px">
                <th colspan="3" align="center">
                    <h2 Cssclass="label"><i>ForgetPassword</i></h2>
                </th>

             <tr>
                    <td>
                            <asp:Label ID="Label1" runat="server" Text="New Password" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="n_pwd" runat="server" TextMode="Password" CssClass="textbox" placeholder="enter password" CausesValidation="true"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" enter Password" ForeColor="" Display="Dynamic" ControlToValidate="n_pwd"></asp:RequiredFieldValidator>
                    </td>
                </tr>

             <tr>
                    <td>
                            <asp:Label ID="Label2" runat="server" Text="Confirm Password" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="c_pwd" runat="server" TextMode="Password" CssClass="textbox" placeholder="enter password" CausesValidation="true"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" enter Password" ForeColor="" Display="Dynamic" ControlToValidate="c_pwd"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            <tr>
                    <td align="center" colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="button" OnClick="Button1_Click"></asp:Button>
                        <asp:Button ID="Button2" runat="server" Text="Reset" CssClass="button" OnClick="Button2_Click"></asp:Button>
                    </td>
                </tr>

            </table><br /><br /><br>
</asp:Content>


