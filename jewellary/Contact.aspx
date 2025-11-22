<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="jewellary.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <div style="text-align: center; padding: 20px;">
     <!-- Contact Image -->
     <img src="../image/contactus.jpg" style="height: 160px; width: 200px; margin-bottom: 20px;" alt="Contact Image"/>

     <!-- Contact Information in Table -->
     <div style="color: black; font-family: 'Poor Richard', serif; font-size: 20px; line-height: 1.8;">


         <!-- Table for Contact Details -->
         <table style="margin: 0 auto; border: 1px solid black; border-collapse: collapse; width: 80%;">
             <thead>
                 <tr >
                     <th style="color:black; padding: 8px; text-align: center; border: 1px solid;">Name</th>
                     <th style="color:black; padding: 8px; text-align: center; border: 1px solid;">Email</th>
                     <th style="color:black; padding: 8px; text-align: center; border: 1px solid;">Mobile No</th>
                 </tr>
             </thead>
             <tbody>
                 <tr>
                     <td style="color:black; padding: 8px; text-align: left; border: 1px solid;">nidhi vasoya</td>
                     <td style="color:black; padding: 8px; text-align: left; border: 1px solid;">nvasoya@gmail.com</td>
                     <td style="color:black; padding: 8px; text-align: left; border: 1px solid;">9978117220</td>
                 </tr>
                 <tr>
                     <td style="color:black; padding: 8px; text-align: left; border: 1px solid;">banshi antala</td>
                     <td style="color:black; padding: 8px; text-align: left; border: 1px solid;">bi@gamil.com</td>
                     <td style="color:black; padding: 8px; text-align: left; border: 1px solid;">8520147963</td>
                 </tr>
             </tbody>
         </table>
     </div>
 </div>
</asp:Content>
