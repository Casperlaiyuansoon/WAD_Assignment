<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentSuccess.aspx.cs" Inherits="Assignment.Payment_Sucess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" runat="server" media="all" href="/paymentSuccess.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="main">
            <div class="paymentSuccess">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <img alt="tick" src="image/tick.png" /></td>
                    </tr>
                    <tr>
                        <td><strong>Your Payment is Successfully Done!</strong></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="lnkHomepage" runat="server" EnableTheming="True" OnClick="lnkHomepage_Click">Back to Home Page</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
