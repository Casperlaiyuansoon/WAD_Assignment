<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="tarfly.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tarfly | Login</title>
    <link rel="stylesheet" href="login.css" />
</head>
<body>
    <div class="container">
    <div class="inner-container">


        <!-- LOGIN FORM -->
        <form id="login_form" runat="server">
            <div>

                <h2>LOGIN</h2>

                <hr />
                <br />

                <span>Email :</span> <!-- register email --> <br />
                <div class="inputField">
                    <asp:TextBox ID="login_email" class="textField" runat="server" placeholder="your email"></asp:TextBox><br />
                </div>

                <br />

                <span>Password :</span> <!-- register password --> <br />
                <div class="inputField">
                    <asp:TextBox ID="login_password" class="textField" runat="server" placeholder="your password"></asp:TextBox><br />
                </div>

                <br />

                <div class="inputField">
                    <asp:Button ID="login_submit" runat="server" Text="Login" OnClientClick="window.location.href='Homepage.aspx'; return false;"/>
                </div>

            </div>

            <div class="redirect"> <!-- redirect to login -->
                <p>Don't have an account? <asp:HyperLink ID="goto_register" runat="server" NavigateUrl="register.aspx">register</asp:HyperLink> here</p>
            </div>
        </form>
        <!-- END LOGIN FORM -->

        <img id="airplane-air" src="image/loginAirplane.png"/>
        <img id="cloud1" src="image/cloud1.png" />
        <img id="cloud2" src="image/cloud2.png" />
    </div>
</div>
</body>
</html>
