<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="purchase.aspx.cs" Inherits="jewellary.purchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <br ><center>
     <tr><%--<table border="1" align="center" class="table">--%>

         <table align="center">
        <center><h2><span class="text-primary font-weight-bold">Userpurchase</span></h2></center>
 </tr>
    
        <td>
            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                <asp:TextBox ID="bill_name" runat="server" CssClass="textbox" pattern="^[a-z A-Z]+$" placeholder="CustomerName"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="req_username" runat="server" ErrorMessage="Enter name" ControlToValidate="bill_name" Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

             </td></tr><br />
    
        <td>
            <asp:Label ID="Label2" runat="server" Text="city"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="bill_city" runat="server" CssClass="textbox" placeholder="City"></asp:TextBox>
            <asp:RequiredFieldValidator ID="req_city" runat="server" ErrorMessage="Enter city" ControlToValidate="bill_city" Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="reqcity" runat="server" ControlToValidate="bill_city" ErrorMessage="Enter only Character" Font-Bold="True" ForeColor="Red" ValidationExpression="^[a-z A-Z]+$" Display="Dynamic"></asp:RegularExpressionValidator>
           </td></tr><br />

          
    
        <td>
            <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txt_mail" runat="server" CssClass="textbox" placeholder="E-mail"></asp:TextBox>
            <asp:RequiredFieldValidator ID="req_emailid" runat="server" ErrorMessage="Enter email-id" ControlToValidate="txt_mail" Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator> 
           <asp:RegularExpressionValidator ID="regemailid" runat="server" ControlToValidate="txt_mail" ErrorMessage="Not a Valid EmailId" Font-Bold="True" ForeColor="Red" ValidationExpression="\S+@\S+\.\S+" Display="Dynamic"></asp:RegularExpressionValidator>
           </td></tr>
    <br />
        <td>
            <asp:Label ID="Label4" runat="server" Text="Contact"></asp:Label>
           &nbsp; <asp:TextBox ID="txt_contactno" runat="server" MaxLength="10" CssClass="textbox" placeholder="ContactNo"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter contactno" Font-Bold="True" ForeColor="Red" ControlToValidate="txt_contactno" Display="Dynamic"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="enter only 10  digit" Font-Bold="True" ControlToValidate="txt_contactno" ValidationExpression="\d{10}" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
            <br />
            <br>
        </td></tr><br>
     <tr><td align="center" colspan="2">
         <asp:Button ID="Button1" runat="server" Text="Payment" Font-Italic="false" Font-Bold="true" class="btn btn-primary" OnClick="Button1_Click" ForeColor="black" Width="87px"></asp:Button>
         <asp:Button ID="Button2" runat="server" Text="Clear" Font-Italic="false" Font-Bold="true" class="btn btn-primary" OnClick="Button2_Click" ForeColor="black" Width="64px"></asp:Button>
     </td></tr>
</table><br/></center>
    <center> <a href="home.aspx">back</a></center>
</asp:Content>


