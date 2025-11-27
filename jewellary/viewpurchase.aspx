<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewpurchase.aspx.cs" Inherits="jewellary.viewpurchase" MasterPageFile="~/SiteMobile.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <br /><br /><br />
    <table align="center" border="0" >
     <td class="label1" colspan="1"  style="text-align:center; font-family :'Times New Roman' ">       
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:jw %>"  SelectCommand="select [bill1_id],[registration_id],[bill1_name],[bill1_email],[bill1_city],[bil1l_contact],[bill1_total] from [ordermaster] )">
    <SelectParameters>
    <asp:Parameter DefaultValue="0" Name="bill1_status" Type="Int32" /> </SelectParameters>
    </asp:SqlDataSource></table> 
       <table class="border" align="center" border="5" height="50px" width="200px" cellpadding="10">
            <tr>
                <th colspan="3" align="center" class="auto-style3" >
                    <h2 style="color:black; font-family:'Poor Richard';"><i> View Purchase</i></h2>
                </th>
            </tr>
       <tr><td style="text-align:center;">
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="bill1_id" DataSourceID="SqlDataSource2" AllowPaging="true" PageSize="3">
               <Columns>
                   <%--<asp:BoundField DataField="bill1_id" HeaderText="bill1_id" InsertVisible="False" ReadOnly="True" SortExpression="bill1_id" />
                   <asp:BoundField DataField="registration_id" HeaderText="registration_id" SortExpression="registration_id" />--%>
                   <asp:BoundField DataField="bill1_name" HeaderText="Name" SortExpression="bill1_name" />
                   <asp:BoundField DataField="bill1_email" HeaderText="Email" SortExpression="bill1_email" />
                   <asp:BoundField DataField="bill1_city" HeaderText="City" SortExpression="bill1_city" />
                   <asp:BoundField DataField="bill1_contact" HeaderText="Contact No" SortExpression="bill1_contact" />
                   <asp:BoundField DataField="bill1_total" HeaderText="Total" SortExpression="bill1_total" />
                   <%--<asp:BoundField DataField="bill1_status" HeaderText="bill1_status" SortExpression="bill1_status" />--%>
                   <asp:TemplateField HeaderText="Actoin">
                        <ItemTemplate>
                                <a href="viewpurchasedetail.aspx?bill1_id=<%# Eval("bill1_id") %>">View</a>
                                <%--<a href="viewpurchase.aspx?bill1_id=<%# Eval("bill1_id") %>">delete</a>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
               </Columns>
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\jk\jewellary\jewellary\App_Data\Database1.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [ordermaster]"></asp:SqlDataSource>
             </table>
   <center><a href="home2.aspx">back</a></center><br /><br />
</asp:Content>

