<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMobile.Master" AutoEventWireup="true" CodeFile="viewfeedback.aspx.cs" Inherits="jewellary.viewfeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br /><br /><br>
    <center>
        <table class="table" align="center" border="5"  Height="50px" width="200px">
                <th colspan="3" align="center">
                    <h2 style="color:black; font-family:'Poor Richard';"><i>View Feedback</i></h2>
                </th>
            <tr>
                <td style="color:black; font-family:'Poor Richard';">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="f_id" DataSourceID="SqlDataSource1" AllowPaging="true" PageSize="3">
                        <Columns>
                            
                            <asp:BoundField DataField="registration_username" HeaderText="Username" SortExpression="registration_username" />
                            <asp:BoundField DataField="f_comment" HeaderText="Comment" SortExpression="f_comment" />
                            <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <a href="viewfeedback.aspx?f_id=<%#Eval("f_id")%>"><img src="../image/dlt.jfif" height="40" width="40" onclick="return del();" /></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\jk\jewellary\jewellary\App_Data\Database1.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [feedback]"></asp:SqlDataSource>
                </td>
            </tr>
             </center>
    </table>
     <td align="center" colspan="3"><a href="home2.aspx">Back</a></td></center><br /><br /><br />
</asp:Content>

