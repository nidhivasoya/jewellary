<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="jewellary.registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">    <br />
     <center border="1">
        <table>
                <th colspan="3" align="center">
                    <h2>Registration</h2>
                </th>
            
               
              
                <tr>
                    <td>
                        <asp:Label ID="username" runat="server" Text="Username" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                         <asp:TextBox ID="r_username" runat="server" CssClass="textbox"  placeholder="enter username" CausesValidation="true"></asp:TextBox>

                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="enter Username" ForeColor="" Display="Dynamic" ControlToValidate="r_username"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                            <asp:Label ID="Label3" runat="server" Text="Password" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="r_password" runat="server" TextMode="Password" CssClass="textbox" placeholder="enter password" CausesValidation="true"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" enter Password" ForeColor="" Display="Dynamic" ControlToValidate="r_password"></asp:RequiredFieldValidator>
                    </td>
                </tr>

              <tr>
                    <td>
                        <asp:Label ID="name" runat="server" Text="fullName" CssClass="label" ForeColor="Black" Width="100px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="r_fullname" runat="server" CssClass="textbox" placeholder="enter name" CausesValidation="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="enter name" ForeColor="Black" Display="Dynamic" ControlToValidate="r_fullname"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                 <tr>
                    <td>
                        <asp:Label ID="address" runat="server" Text="Address" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                         <asp:TextBox ID="r_address" runat="server" CssClass="textbox"  placeholder="enter address" CausesValidation="true"></asp:TextBox>

                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="enter address" ForeColor="" Display="Dynamic" ControlToValidate="r_address"></asp:RequiredFieldValidator>
                    </td>
                </tr>

             <tr>
                    <td>
                        <asp:Label ID="city" runat="server" Text="city" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                         <asp:TextBox ID="r_city" runat="server" CssClass="textbox"  placeholder="enter city" CausesValidation="true"></asp:TextBox>

                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="enter address" ForeColor="" Display="Dynamic" ControlToValidate="r_city"></asp:RequiredFieldValidator>
                    </td>
                </tr>

               <tr>
                    <td>
                        <asp:Label ID="email" runat="server" Text="EmailId" CssClass="label" ForeColor="Black"></asp:Label>
                        <td>
                            <asp:TextBox ID="r_emailid" runat="server" CssClass="textbox" placeholder="enter email" TextMode="email"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="enter email" Display="Dynamic" ControlToValidate="r_emailid" ForeColor="Black"></asp:RequiredFieldValidator>
                        </td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="contact" runat="server" Text="Contact No" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="r_contactno" runat="server" CssClass="textbox" pattern="^[0-9]+$" placeholder="enter contactno" CausesValidation="true"></asp:TextBox>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="enter only 10 digit" ControlToValidate="r_contactno" ValidationExpression="\d{10}" ForeColor="Black" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="security_que" runat="server" Text="Sequrity Que" CssClass="label" ForeColor="Black"></asp:Label>
                    </td>
                    <td><asp:DropDownList ID="r_sq" runat="server" CssClass="dropdownlist" CausesValidation="true" Width="185px">
                        <asp:ListItem Value="">---Select---</asp:ListItem>
                        <asp:ListItem Value="Favourite Food">Favourite Food?</asp:ListItem>
                        <asp:ListItem Value="Favourite Place">Favourite Place?</asp:ListItem>
                        <asp:ListItem Value="Favourite Color">Favourite Color?</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="enter sequrity que" Display="Dynamic" ControlToValidate="r_sq" ForeColor=""></asp:RequiredFieldValidator>
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
                 <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Reset" OnClick="Button2_Click" />
                    </td>
                </tr>
            </center>                
</table>
</asp:Content>


