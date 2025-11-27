<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMobile.Master" AutoEventWireup="true" CodeBehind="viewcategory.aspx.cs" Inherits="jewellary.viewcategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="login_content" align="center">
            <table class="table" align="center" border="3">
                <th style="color:black; font-family:'Poor Richard';"><h2><i>Manage Category</i></h2></th>
                <center><br /><br />
                    <tr>
                        <td style="color:black;">
                            <center><a href="category.aspx"><img src="../image/add.jfif" Height="30" Width="30" /></a></center>
                               <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataKeyNames="category_id" DataSourceID="SqlDataSource1" Font-Size="15pt" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="true" PageSize="3">
                               <Columns>
                                   <asp:BoundField DataField="category_name" HeaderText="Category Name" SortExpression="category_name" />
                                   <asp:TemplateField HeaderText="Action">
                                   <ItemTemplate>
                                        <a href="category.aspx?category_id=<%#Eval("category_id")%>"><img  src="../image/edt.jfif" height="40" width="40" onclick="return upd();"/></a>
                                        <a href="viewcategory.aspx?product_id=<%#Eval("category_id")%>"><img src="../image/dlt.jfif" height="40" width="40" onclick="return del();" /></a>
                                   </ItemTemplate>
                                    </asp:TemplateField>    
                               </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\jk\jewellary\jewellary\App_Data\Database1.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
                        </td>
                    </tr>
                </center>
            </table>
        <align="center" colspan="3"><h1><a href="home2.aspx">Back</a></h1></div>
    </asp:Content>


