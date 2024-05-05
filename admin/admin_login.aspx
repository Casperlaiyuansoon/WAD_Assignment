<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_login.aspx.cs" Inherits="tarfly.admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tarfly | Admin Login</title>
    <link rel="stylesheet" href="admin_login.css" />
</head>
<body>
    <%
        if (Session["adminLoginStatus"] != null && (bool)Session["adminLoginStatus"] && Session["admin_name"] != null) // If this session value is true (login success)
        {
            %>
                <script>
                    alert("You are now logged in as, <%= Session["admin_name"].ToString() %>");
                    <%
                        Session["adminLoginStatus"] = null;
                    %>
                    window.location.href = "admin_dashboard.aspx";
                </script>
            <%
        }
    %>
    <div class="container">

        <div class="inner-container">

            <!-- LOGIN FORM -->
            <form id="admin_login_form" runat="server">
                <div>

                    <h2>LOGIN</h2>

                    <hr />
                    <br />

                    <span>Email :
                        <asp:RequiredFieldValidator ID="admin_email_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Email is required" ControlToValidate="admin_login_email"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="admin_email_regex_validate" runat="server" ErrorMessage="Invalid email format" ForeColor="Red" Text="*" ControlToValidate="admin_login_email" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b"></asp:RegularExpressionValidator>
                    </span> <!-- register email --> <br />
                    <div class="inputField">
                        <asp:TextBox ID="admin_login_email" class="textField" runat="server" placeholder="your email"></asp:TextBox><br />
                    </div>

                    <br />

                    <span>Password :
                        <asp:RequiredFieldValidator ID="admin_password_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Password is required" ControlToValidate="admin_login_password"></asp:RequiredFieldValidator>
                    </span> <!-- register password --> <br />
                    <div class="inputField">
                        <asp:TextBox ID="admin_login_password" class="textField" TextMode="Password" runat="server" placeholder="your password"></asp:TextBox><br />
                    </div>

                    <br />

                    <div class="inputField">
                        <asp:Button ID="admin_login_submit" runat="server" Text="Login" OnClick="admin_login_submit_Click" />
                    </div>

                </div>

                <div class="redirect"> <!-- redirect to login -->
                    <p>Don't have an account? <asp:HyperLink ID="goto_admin_register" runat="server" NavigateUrl="admin_register.aspx">register</asp:HyperLink> here</p>
                </div>
            </form>
            <!-- END LOGIN FORM -->

        </div>
    </div>
</body>
</html>