<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="jewellary.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <style>
      div.scrl{
          height:250px;
          overflow-y:scroll;
      }
  </style>
  <h2 style="color:black; font-family:'Poor Richard';"><center>Product</center></h2>
    <asp:SqlDataSource ID="ds_product" runat="server" ConnectionString="<%$ConnectionStrings:jw %>" SelectCommand="SELECT  product_id,category_id,product_name,product_image,product_price,product_quantity,product_description  FROM product WHERE(category_id=@category_id)" ProviderName="<%$ConnectionStrings:jw.ProviderName %>">
        <SelectParameters>  
            <asp:ControlParameter ControlID="category_name" DefaultValue="0" Name="category_id" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
<center>    
      <table class="table">
          <tr>
              <td>
                 <center>
                     <span class="text-primary font-weight-bold">
                  <asp:Label ID="lbl_cat" runat="server" Text="Category" CssClass="label"></asp:Label>
          <asp:DropDownList ID="category_name" runat="server" AutoPostBack="true"></asp:DropDownList>
                         </span>
             </center>
              </td>
              </tr>
      </table>
    <div class="scrl">
      <asp:DataList ID="datalist_category" runat="server"  DataSourceID="ds_product" DataKeyField="category_id" RepeatColumns="5" >
          <ItemTemplate>
              <table class="table" border="4" >
                  <tr>
                      <td>
                          <asp:Image ID="Image1" runat="server" Height="150" Width="150" ImageUrl='<%#Eval("product_image") %>'></asp:Image>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <asp:Label ID="name" runat="server" Text="Name:" CssClass="label"  Font-Bold="true"></asp:Label>
                          <asp:Label ID="product_name" runat="server" Text='<%#Eval("product_name") %>' CssClass="label" ></asp:Label>
                      </td>
                  </tr>
                   
                 <%-- <tr>
                      <td>
                          <asp:Label ID="price" runat="server" Text="Price:" CssClass="label" Font-Bold="true"></asp:Label>
                          <asp:Label ID="product_price" runat="server" Text='<%#Eval("product_price") %>' CssClass="label"></asp:Label>
                      </td>
                  </tr>

                   <tr>
                      <td>
                          <asp:Label ID="stock" runat="server" Text="Stock:" CssClass="label" Font-Bold="true"></asp:Label>
                          <asp:Label ID="product_stock" runat="server" Text='<%#Eval("product_stock") %>' CssClass="label"></asp:Label>
                      </td>
                  </tr>

                   <tr>
                      <td>
       
                  </tr>--%>
                  <tr>
                      <td>
                          <center>
                             <a href="productdetail.aspx?product_id=<%#Eval("product_id") %>">detail</a>
                          </center>
                      </td>
                  </tr>
              </table>
          </ItemTemplate>
      </asp:DataList>
        </div>
  <center> <a href="home.aspx">back</a></center>   
  </center>
</asp:Content>


