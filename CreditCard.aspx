<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreditCard.aspx.cs" Inherits="WAD_Assignment.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" runat="server" media="all" href="/CreditCard.css" />
    <%--Css File--%>

    <title>Credit Card</title>
</head>


<body>
    <div class="container">

        <div class="card-container">

            <div class="front">
                <div class="image">
                    <img src="image/chip.png" alt="">
                    <img src="image/visa.png" alt="">
                </div>

                <%-- Image Card number--%>
                <div class="card-number-box">################</div>
                <div class="flexbox">
                    <div class="box">
                        <%-- Image Card nholder--%>
                        <span>card holder</span>
                        <div class="card-holder-name">full name</div>
                    </div>
                    <div class="box">
                        <%--Card expires date--%>
                        <span>expires</span>
                        <div class="expiration">
                            <span class="exp-month">mm</span>
                            <span class="exp-year">yy</span>
                        </div>
                    </div>
                </div>
            </div>

            <%--Card backward data--%>
            <div class="back">
                <div class="stripe"></div>
                <div class="box">
                    <span>cvv</span>
                    <div class="cvv-box"></div>
                    <img src="image/visa.png" alt="">
                </div>
            </div>

        </div>

        <form id="form1" runat="server">
            <%------Card Number Input-------%>
            <div class="inputBox">
                <span>card number</span>
                <asp:TextBox ID="txtCardNumber" runat="server" required="required" MaxLength="16" placeholder="xxxxxxxxxxxxxxxx" CssClass="card-number-input"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regexCreditCardNumber" runat="server"
                    ControlToValidate="txtCardNumber"
                    ValidationExpression="^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$"
                    ErrorMessage="Invalid credit card number.[E.g. 4xxx xxxx xxxx xxxx]"
                    Display="Dynamic">
                </asp:RegularExpressionValidator>
            </div>

            <%------Card Holder Input-------%>
            <div class="inputBox">
                <span>card holder</span>
                <asp:TextBox ID="txtCardHolder" runat="server" required="required" MaxLength="25" CssClass="card-holder-input"></asp:TextBox>
            </div>

            <%------Card Date Input-------%>
            <div class="flexbox">
                <div class="inputBox">
                    <span>expiration mm</span>
                    <select name="" id="ddlMonth" class="month-input" required="required">
                        <option value="month" selected disabled>month</option>
                        <option value="01">01</option>
                        <option value="02">02</option>
                        <option value="03">03</option>
                        <option value="04">04</option>
                        <option value="05">05</option>
                        <option value="06">06</option>
                        <option value="07">07</option>
                        <option value="08">08</option>
                        <option value="09">09</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                </div>
                <div class="inputBox">
                    <span>expiration yy</span>
                    <select name="" id="ddlYear" class="year-input" required="required">
                        <option value="year" selected disabled>year</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                        <option value="2026">2026</option>
                        <option value="2027">2027</option>
                        <option value="2028">2028</option>
                        <option value="2029">2029</option>
                        <option value="2030">2030</option>
                        <option value="2031">2031</option>
                        <option value="2032">2032</option>
                        <option value="2033">2033</option>
                        <option value="2034">2034</option>
                    </select>
                </div>
                <asp:HiddenField ID="hdnSelectedOption" runat="server" />
                <asp:HiddenField ID="hdnSelectedOption1" runat="server" />
                <script>
                    function captureSelectedOption() {
                        var selectedOption = document.getElementById("ddlYear").value;
                        document.getElementById('<%= hdnSelectedOption.ClientID %>').value = selectedOption;
                        var selectedOption = document.getElementById("ddlMonth").value;
                        document.getElementById('<%= hdnSelectedOption1.ClientID %>').value = selectedOption;
                    }
                </script>

                <div class="inputBox">
                    <span>cvv</span>
                    <asp:TextBox ID="txtCvv" runat="server" required="required" MaxLength="3" placeholder="xxx" CssClass="cvv-input"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regexCVV" runat="server"
                        ControlToValidate="txtCVV"
                        ValidationExpression="^\d{3}$"
                        ErrorMessage="Invalid CVV code"
                        Display="Dynamic">
                    </asp:RegularExpressionValidator>
                </div>
            </div>
            <br />
            <asp:Label ID="lblError" runat="server"></asp:Label>
            <br />
            <asp:Button ID="btnCreditCardSubmit" runat="server" Text="Submit" CssClass="submit-btn" OnClientClick="captureSelectedOption();" OnClick="btnCreditCardSubmit_Click" />
        </form>

    </div>






    <%-------------------------------JavaScript File-----------------------------------------------%>
    <script>
        document.querySelector('.card-number-input').oninput = () => {
            document.querySelector('.card-number-box').innerText = document.querySelector('.card-number-input').value;
        }

        document.querySelector('.card-holder-input').oninput = () => {
            document.querySelector('.card-holder-name').innerText = document.querySelector('.card-holder-input').value;
        }

        document.querySelector('.month-input').oninput = () => {
            document.querySelector('.exp-month').innerText = document.querySelector('.month-input').value;
        }

        document.querySelector('.year-input').oninput = () => {
            document.querySelector('.exp-year').innerText = document.querySelector('.year-input').value;
        }

        document.querySelector('.cvv-input').onmouseenter = () => {
            document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(-180deg)';
            document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(0deg)';
        }

        document.querySelector('.cvv-input').onmouseleave = () => {
            document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(0deg)';
            document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(180deg)';
        }

        document.querySelector('.cvv-input').oninput = () => {
            document.querySelector('.cvv-box').innerText = document.querySelector('.cvv-input').value;
        }
    </script>


</body>
</html>
