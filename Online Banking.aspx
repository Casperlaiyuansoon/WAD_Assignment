<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Online Banking.aspx.cs" Inherits="Assignment.Online_Banking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" runat="server" media="all" href="/Online Banking.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="main">
            <div class="Login">
                <table style="width: 100%;">
                    <tr>
                        <td><strong>Tarfly Online Banking Login&#128274;</strong></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtLoginID" runat="server" placeholder="Login ID" />
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" placeholder="Password" /><br>
                            <script>
                                function togglePasswordVisibility(RadioButton) {
                                    var passwordInput = document.getElementById("txtPassword");
                                    var toggleButton = document.getElementById("passwordChecking");

                                    if (passwordInput.type === "password") {
                                        passwordInput.type = "text";
                                        toggleButton.textContent = "Hide";
                                    } else {
                                        passwordInput.type = "password";
                                        toggleButton.textContent = "Show";
                                    }
                                }
                            </script>
                            
                            <asp:CheckBox ID="passwordChecking" runat="server" onclick="togglePasswordVisibility(this)"/><strong >Show Passwor</strong>d<br />
                            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                            </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="lnkConfirm" runat="server" OnClick="lnkConfirm_Click">Confirm</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="lnkCancel" runat="server" PostBackUrl="~/Payment.aspx">Cancel</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
