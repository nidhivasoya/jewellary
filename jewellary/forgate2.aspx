<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="forgate2.aspx.cs" Inherits="jewellary.forgate2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>
   <br />
     <br />
     <center>
         <asp:Label ID="Label2" runat="server" cssclass="error"></asp:Label>
        <table class="table" align="center" border="5"  Height="50px" width="200px">
                <th colspan="3" align="center">
                    <h2 Cssclass="label"><i>Forgate Password2</i></h2>
                </th>
            <tr>
            <td class ="td">
            <asp:Label ID="Label1" runat="server" Text="Security_Question"  CssClass="label" ForeColor="Black"></asp:Label>
                 </td>
            <td>
                <asp:TextBox ID="r_sq" runat="server" CssClass="textbox" Width="130px"></asp:TextBox>
            </td>

            </tr>
            <tr>
                    <td>
                        <asp:Label ID="answer" runat="server" Text="Answer" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                     <asp:TextBox ID="r_answer" runat="server" CssClass="textbox" pattern="^[a-z A-Z]+$" placeholder="enter answer" CausesValidation="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="enter answer" Display="Dynamic" ControlToValidate="r_answer" ForeColor=""></asp:RequiredFieldValidator>
                        </td>
                </tr>

             <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Next" CssClass="button" OnClick="Button1_Click"></asp:Button>
                    <asp:Button ID="Button2" runat="server" Text="Reset" CssClass="Button" OnClick="Button2_Click"></asp:Button>
                    </td>
                </tr>
            </table>
        </br>
            </tr>
        </table>
    </center><br /><br />
</asp:Content>


