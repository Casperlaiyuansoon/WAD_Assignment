<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="tarfly.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tarfly | Login</title>
    <link rel="stylesheet" href="login.css" />
</head>
<body>

    <%
        if (Session["loginStatus"] != null && (bool)Session["loginStatus"] && Session["username"] != null) // If this session value is true (login success)
        {
            %>
                <script>
                    alert("You are now logged in as, <%= Session["username"].ToString() %>");
                    <%
                        Session["loginStatus"] = null;
                    %>
                    window.location.href = "Homepage.aspx";
                </script>
            <%
        }
    %>
    <div class="container">
    <div class="inner-container">


        <!-- LOGIN FORM -->
        <form id="login_form" runat="server">
            <div>

                <h2>LOGIN</h2>

                <hr />
                <br />

                <span>Email :
                    <asp:RequiredFieldValidator ID="email_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Email is required" ControlToValidate="login_email"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="email_regex_validate" runat="server" ErrorMessage="Invalid email format" ForeColor="Red" Text="*" ControlToValidate="login_email" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b"></asp:RegularExpressionValidator>
                </span> <!-- register email --> <br />
                <div class="inputField">
                    <asp:TextBox ID="login_email" class="textField" runat="server" placeholder="your email"></asp:TextBox><br />
                </div>

                <br />

                <span>Password :
                    <asp:RequiredFieldValidator ID="password_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Password is required" ControlToValidate="login_password"></asp:RequiredFieldValidator>
                </span> <!-- register password --> <br />
                <div class="inputField">
                    <asp:TextBox ID="login_password" class="textField" runat="server" TextMode="Password" placeholder="your password"></asp:TextBox><br />
                </div>

                <br />
                <br />

                <asp:CheckBox ID="rememberMe" runat="server" Text="Remember Me" />

                <br />

                <div class="inputField">
                    <asp:Button ID="login_submit" runat="server" Text="Login" OnClick="login_submit_Click" />
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
