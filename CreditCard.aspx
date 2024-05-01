<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreditCard.aspx.cs" Inherits="WAD_Assignment.WebForm4" %>

<!DOCTYPE html>

            <html xmlns="http://www.w3.org/1999/xhtml">
            <head runat="server">
                 <link rel="stylesheet" runat="server" media="all" href="/CreditCard.css" />
                <%--Css File--%>
                <link rel="stylesheet" href="CreditCard.css">
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

        <form runat="server" action="">
            <%------Card Number Input-------%>
            <div class="inputBox">
                <span>card number</span>
                <asp:TextBox ID="txtCardNumber" runat="server" required="required" maxLength="16" CssClass="card-number-input"></asp:TextBox>
            </div>

             <%------Card Holder Input-------%>
            <div class="inputBox">
                <span>card holder</span>
                <asp:TextBox ID="txtCardHolder" runat="server" required="required" maxLength="25" CssClass="card-holder-input"></asp:TextBox>
            </div>

             <%------Card Date Input-------%>
            <div class="flexbox">
                <div class="inputBox">
                    <span>expiration mm</span>
                    <select name="" id="" class="month-input" required="required">
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
                    <select name="" id="" class="year-input" required="required">
                        <option value="year" selected disabled>year</option>
                        <option value="2021">2021</option>
                        <option value="2022">2022</option>
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                        <option value="2026">2026</option>
                        <option value="2027">2027</option>
                        <option value="2028">2028</option>
                        <option value="2029">2029</option>
                        <option value="2030">2030</option>
                    </select>
                </div>
                <div class="inputBox">
                    <span>cvv</span>
                    <asp:TextBox ID="txtCvv" runat="server" required="required" maxLength="3" CssClass="cvv-input"></asp:TextBox> 
                </div>
            </div>
            <asp:Button ID="btnCreditCardSubmit" runat="server" Text="Submit" CssClass="submit-btn" OnClick="btnCreditCardSubmit_Click" />  
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
