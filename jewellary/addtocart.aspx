<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addtocart.aspx.cs" Inherits="jewellary.addtocart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <br />
    <center>
     <tr>
      <h2 style="color:black; font-family:'Poor Richard';"><center>Addtocart</center></h2><br>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jw %>" SelectCommand="SELECT addtocart.addtocart_id, addtocart.registration_id, addtocart.a_quantity, product.product_name, product.product_price, product.product_image, product.product_description, product.product_quantity FROM addtocart INNER JOIN product ON addtocart.product_id = product.product_id WHERE (addtocart.registration_id = @registration_id)">
              <SelectParameters>
                    <asp:SessionParameter Name="registration_id" SessionField="registration_id" Type="Int32" />
         </SelectParameters>
         </asp:SqlDataSource>
         <tr><td class="auto-style1">
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="addtocart_id" DataSourceID="sqlDataSource1" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound" BackColor="White" BorderColor="#CC9966" BorderStyle="None" >
                  <columns>
                      <asp:BoundField DataField="a_quantity" HeaderText="quantity" SortExpression="a_quantity"/>
                      <asp:BoundField  DataField="product_price" HeaderText="price" SortExpression="product_price"/>
                      <asp:TemplateField HeaderText="image" SortExpression="product_image">
                           <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("product_image")%>'></asp:TextBox>
                           </EditItemTemplate>
                           <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="42px" ImageUrl='<%#Eval("product_image")%>' Width="56px" />
                           </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Action">
                           <ItemTemplate>
                                <a href="addtocart.aspx?addtocart_id=<%#Eval("addtocart_id") %>" onclick="return del();"><img src="../image/dlt.jfif" height="40" width="40" onclick="return del();" /></a>
                           </ItemTemplate>
                      </asp:TemplateField>
                  </columns>
             </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\dryfruit.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [a_quantity], [produc_price] FROM [addtocart]"></asp:SqlDataSource>
                   Total:- <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red" CssClass="label" ></asp:Label>
        <br />
        <asp:Button ID="Button2" runat="server" Text="Continue shopping" CssClass="button" Height="50px" Width="150px" OnClick="Button2_Click"></asp:Button>
        <br />
        <asp:Label ID="Label2" runat="server" ForeColor="red"></asp:Label>
             <asp:Button ID="Button1" runat="server" Text="Check out" CssClass="button" Height="40px" Width="100px" OnClick="Button1_Click"></asp:Button><br />
        <a href="home.aspx">back</a> </td></tr>

    </center><br />
</asp:Content>


