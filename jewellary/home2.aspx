<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMobile.Master" AutoEventWireup="true" CodeBehind="home2.aspx.cs" Inherits="jewellary.home2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="home">
        <center><h2 style="color:black; font-family:'Poor Richard';"><i>jewellary</i></h2></center>
        <center><br />
           <marquee direction="left"scrolldelay="150" style="height: 150px; width: 457px;"> 
                <tr>
                    <td>
                        <img src="../image/img1.jpg" height="190" width="190" />
                    </td>
                    <td>
                        <img src="../image/img2.jpg" height="190" width="190" />
                    </td>
                    <td>
                        <img src="../image/img3.jpg" height="190" width="190" />
                    </td>
                    <td>
                        <img src="../image/img4.jpg" height="190" width="190" />
                    </td> 
                    <td>
                        <img src="../image/img5.jpg" height="190" width="190" />
                    </td>   
                </tr></marquee>

            <asp:Image src="../image/pista14.jfif" runat="server" Width="250" Height="250"></asp:Image>

            <marquee direction="right" scrolldelay="150" style=" height:150px; width:457px;">  
            <tr>
                    <td>
                        <img src="../image/img6.jfif" height="190" width="190" />
                    </td>
                    <td>
                        <img src="../image/img7.jfif" height="190" width="190" />
                    </td>
                    <td>
                        <img src="../image/img8.jfif" height="190" width="190" />
                    </td>
                    <td>
                        <img src="../image/img9.jfif" height="190" width="190" />
                    </td>
                  <td>
                        <img src="../image/img10.jfif" height="190" width="190" />
                    </td>
                    </tr></marquee>
        </center>
    </div><br /><br />
</asp:Content>


