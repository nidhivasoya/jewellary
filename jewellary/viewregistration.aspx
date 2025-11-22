<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMobile.Master" AutoEventWireup="true" CodeBehind="viewregistration.aspx.cs" Inherits="jewellary.viewregistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><div>
    <center>
        <table class="border" align="center" border="5" height="50px" width="200px" cellpadding="10">
            <tr>
                <th colspan="3" align="center" class="auto-style3" >
                    <h2 style="color:black; font-family:'Poor Richard';" ><i>View Registration</i></h2>
                </th>
            <tr>
                <td class="auto-style2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="3" DataKeyNames="registration_id" DataSourceID="SqlDataSource1" >
                    <Columns>
           
                        <asp:BoundField DataField="registration_username" HeaderText="Username" SortExpression="registration_username" />
                        <asp:BoundField DataField="registration_fullname" HeaderText="Fullname" SortExpression="registration_fullname" />
                        <asp:BoundField DataField="registration_address" HeaderText="Address" SortExpression="registration_address" />
                        <asp:BoundField DataField="registration_city" HeaderText="City" SortExpression="registration_city" />
                        <asp:BoundField DataField="registration_emailid" HeaderText="Email id" SortExpression="registration_emailid" />
                        <asp:BoundField DataField="registration_contactno" HeaderText="Contact no" SortExpression="registration_contactno" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <a href="viewregistration.aspx?registration_id=<%#Eval("registration_id") %>"><img src="../image/dlt.jfif" height="20px" width="20px"></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\jk\jewellary\jewellary\App_Data\Database1.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [registration]"></asp:SqlDataSource>
                </td>
            </tr>
                   </table>  
      <td align="center" colspan="3" class="auto-style2"><a href="home2.aspx">Back</a></td></center>
         
    <br /><br /></div>
</asp:Content>

