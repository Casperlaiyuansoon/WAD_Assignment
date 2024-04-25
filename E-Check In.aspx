<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="E-Check In.aspx.cs" Inherits="Assignment.E_ChechIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" runat="server" media="all" href="/E-checkIn.css" />
    <title>E-Check In</title>
    <style type="text/css">
        .auto-style1 {
            width: 20px;
        }
        .auto-style2 {
            width: 230px;
        }
        .auto-style3 {
            width: 230px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Main">
        <div class="checkIn">
            <strong>E-Check In</strong>
            <table>
                <tr>
                    <td class="auto-style2">First Name</td>
                    <td class="auto-style1">:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtfName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Last Name</td>
                    <td class="auto-style1">:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtlName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Flight Number</td>
                    <td class="auto-style1">:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtBookingNo" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
            <asp:LinkButton ID="lnkSearch" CssClass="lnkSearch" runat="server" PostBackUrl="~/E-CheckIn VAL.aspx">Search</asp:LinkButton>
        </div>
            
    </form>
</body>
</html>
