<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Assignment.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" runat="server" media="all" href="payment.css" />
    <title>SECURE CHECKOUT</title>
    <style type="text/css">
        .auto-style1 {
            height: 21px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="Main">
            <div class="Checkout">
                <table class="title" style="border: none;">
                    <tr>
                        <td><strong>SECURE CHECKOUT</strong></td>
                        <td>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:Timer ID="countdownTimer" runat="server" Interval="900000" OnTick="CountdownTimer_Tick"></asp:Timer>
                            
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="countdownLabel" runat="server" Text="15"></asp:Label>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="countdownTimer" EventName="Tick" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="locationTime">
                    <tr>
                        <td class="auto-style7">Kuala Lumpur - London</td>
                        <td class="auto-style2">
                            <img alt="plane Logo" src="Image/logo.jpg" /></td>
                        <td class="auto-style12">London - Kuala Lumpur</td>
                    </tr>
                    <tr>
                        <td class="auto-style7">Fri, 29 Mar | 06:00 - 17:15 | 1 stops</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style12">Fri, 06 Apr | 10:55 - 21:10 | 1 stops</td>
                    </tr>
                </table>
                <br />
                <div class="paymentType">
                    <strong>Please Select Your Payment Type :</strong>
                    <asp:RadioButtonList ID="RadioButtonList1" CssClass="radiobtnPayment" runat="server" AutoPostBack="False">
                        <asp:ListItem>&#128179;Credit/Debit Card</asp:ListItem>
                        <asp:ListItem>&#127974;Online Banking</asp:ListItem>
                    </asp:RadioButtonList>

                </div>
                <br />
                <div class="txtCheckbox">
                    <strong>
                        <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" required="required" Text="I have read, acknowledge and accept the Terms and Condition, Terms of Use, and the Privacy Statement of this site, including the Terms of Carriage of my selected carrier(s)" />
                        <br />
                        <br />
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </strong>
                </div>
            </div>
            <div class="Checkout">
                <div id="summary">
                    <p>Payment Details</p>
                    <div>
                        <div>
                            <p>Base fare</p>
                            <asp:Label ID="Label16" Text="RM 999.99" runat="server" />
                        </div>
                        <div>
                            <p>Taxes, fees & surcharges</p>
                            <asp:Label ID="Label17" Text="RM 999.99" runat="server" />
                        </div>
                        <div>
                            <p>Add-ons</p>
                            <asp:Label ID="Label18" Text="RM 999.99" runat="server" />
                        </div>
                    </div>
                    <div id="totalAmount">
                        <p>Total amount</p>
                        <asp:Label ID="Label19" Text="RM 999.99" runat="server" />
                    </div>
                </div>
                <br />
                <table class="paymentProceed" style="border: none;">
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" CssClass="lnkProceed" runat="server" OnClick="LinkButton1_Click">Proceed</asp:LinkButton>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
        </div>
    </form>
</body>
</html>
