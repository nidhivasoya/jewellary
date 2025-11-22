<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMobile.Master" AutoEventWireup="true" CodeFile="viewproduct.aspx.cs" Inherits="jewellary.viewproduct" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />

<center>
<table class="table" border="1">
    <tr>
        <td><asp:Label ID="Label2" runat="server" Text="Category"></asp:Label></td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
        </td>
    </tr>
</table>
</center>

<asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:jw %>"
    SelectCommand="SELECT product_id, product_name, product_image, product_price, product_quantity, product_description, category_id 
                   FROM product WHERE (category_id = @category_id)">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="category_id" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>

<center>
<table class="table" border="1">
    <tr>
        <td align="center">
            <h2 style="color:black; font-family:'Poor Richard';"><i>Manage Product</i></h2>
            <a href="product1.aspx"><img src="../image/add.jfif" Height="30" Width="30" /></a>
        </td>
    </tr>

    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="5"
                AutoGenerateColumns="False" DataSourceID="SqlDataSource1">

                <Columns>
                    <asp:BoundField DataField="product_name" HeaderText="Name" />

                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image3" runat="server" Height="45px" 
                                ImageUrl='<%# Eval("product_image") %>' Width="49px" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="product_price" HeaderText="Price" />
                    <asp:BoundField DataField="product_quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="product_description" HeaderText="Description" />

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <a href='product1.aspx?product_id=<%# Eval("product_id") %>'>
                                <img src="../image/edt.Jfif" height="35" width="35" />
                            </a>

                            <a href='viewproduct.aspx?product_id=<%# Eval("product_id") %>'>
                                <img src="../image/dlt.jfif" height="35" width="35" />
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </td>
    </tr>
</table>

<a href="home2.aspx">Back</a>
</center>

<br />

</asp:Content>

