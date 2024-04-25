<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckIn Success.aspx.cs" Inherits="Assignment.CheckIn_Success" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" runat="server" media="all" href="/E-CheckIn Success.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="main">
            <div class="CheckInSuccess">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <img alt="tick" src="image/tick.png" /></td>
                    </tr>
                    <tr>
                        <td>E-Check In Successfully!</td>
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
