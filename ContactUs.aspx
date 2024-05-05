<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="WAD_Assignment.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 21%;
            height: 249px;
        }
        .auto-style2 {
            left: 1px;
            top: 4px;
        }
    </style>

      <head>
      <meta charset="utf-8" />
      <meta http-equiv="X-UA-Compaatible" content="IE=edge" />
      <meta name="viewpoint" content="width=device-width, initial-scale=1.0" />
      <link rel="stylesheet" href="ContactUs.css" />
      <title>Contact Us</title>
  </head>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
    <body>
        <div class="container">
            <div class="contact-box">
                <div class="left">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d127482.66733727841!2d101.60458850246842!3d3.1386740719304393!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc49c701efeae7%3A0xf4d98e5b2f1c287d!2sKuala%20Lumpur%2C%20Federal%20Territory%20of%20Kuala%20Lumpur!5e0!3m2!1sen!2smy!4v1711448712571!5m2!1sen!2smy" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" class="auto-style1"></iframe>
                </div>
                <div class="right">
                    <h2 class="auto-style2">Contact Us</h2>
                    <asp:TextBox ID="txtName" CssClass="field" runat="server" Placeholder="Enter your name"></asp:TextBox>
                    <asp:TextBox ID="txtEmail" CssClass="field" runat="server" Placeholder="Enter your email"></asp:TextBox>
                    <asp:TextBox ID="txtPhone" CssClass="field" runat="server" Placeholder="Enter your phone"></asp:TextBox>
                    <textarea id="txtaMessage" cssclass="field" cols="90" name="S1" rows="15"></textarea>
                    <asp:Button ID="btnSend" CssClass="button" runat="server" Text="Send" />

                </div>
            </div>
        </div>


    </body>
</asp:Content>


