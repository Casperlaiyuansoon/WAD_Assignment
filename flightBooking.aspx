<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="flightBooking.aspx.cs" Inherits="Tarfly.page.flightCheckout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../flightBooking.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="left">
            <h3>Booking Details</h3>
            <!-- display flight details -->
            <div id="booking_details">
                <!-- depature details -->
                <div id="depart">
                    <div id="depart_date">
                        <img src="../icon/departures.png" alt="depart" />
                        <span>
                            <p>Depart date</p>
                            <asp:Label ID="Label1" runat="server" Text="04 Apr 2024"></asp:Label>
                        </span>
                    </div>
                    <div id="depart_details">
                        <div id="depart_route">
                            <!-- departure from -->
                            <asp:Label ID="Label2" runat="server" Text="Kuala Lumpur (KUL)"></asp:Label>
                            <img src="../icon/aircraft.png" alt="flight" />
                            <!-- destination -->
                            <asp:Label ID="Label3" runat="server" Text="Taipei - Taoyuan (TPE)"></asp:Label>
                        </div>
                        <div id="depart_route_details">
                            <!-- flight ID -->
                            <asp:Label ID="Label4" runat="server" Text="D7 378"></asp:Label>
                            <!-- flight time -->
                            <asp:Label ID="Label5" runat="server" Text="09:30 - 14:25"></asp:Label>
                            <!-- flight duration -->
                            <asp:Label ID="Label6" runat="server" Text="4h 55m"></asp:Label>
                        </div>
                    </div>
                </div>
                <!-- return details -->
                <div id="return">
                    <div id="return_date">
                        <img src="../icon/departures.png" alt="return" />
                        <span>
                            <p>Return date</p>
                            <asp:Label ID="Label10" runat="server" Text="04 Apr 2024"></asp:Label>
                        </span>
                    </div>
                    <div id="return_details">
                        <div id="return_route">
                            <asp:Label ID="Label11" runat="server" Text="Kuala Lumpur (KUL)"></asp:Label>
                            <img src="../icon/aircraft.png" alt="flight" />
                            <asp:Label ID="Label12" runat="server" Text="Taipei - Taoyuan (TPE)"></asp:Label>
                        </div>
                        <div id="return_route_details">
                            <asp:Label ID="Label13" runat="server" Text="D7 378"></asp:Label>
                            <asp:Label ID="Label14" runat="server" Text="09:30 - 14:25"></asp:Label>
                            <asp:Label ID="Label15" runat="server" Text="4h 55m"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- guest details -->
            <div class="guest">
                <asp:Label ID="Label7" runat="server" Text="Adult 1"></asp:Label>
                <div class="info1">
                    <div class="first_name inputC">
                        <div>
                            <p>First/Given name</p>
                            <asp:TextBox CssClass="textBox" ID="TextBox1" runat="server" placeholder="First/Given name" />
                        </div>
                    </div>
                    <div class="last_name inputC">
                        <div>
                            <p>Family name/Surname</p>
                            <asp:TextBox CssClass="textBox" ID="TextBox4" runat="server" placeholder="Family name/Surname" />
                        </div>
                    </div>
                </div>
                <div class="info2">
                    <div class="dob inputC">
                        <div>
                            <p>Date of birth</p>
                            <asp:TextBox CssClass="textBox" ID="TextBox2" runat="server" TextMode="Date" placeholder="Date of birth" />
                        </div>
                    </div>
                    <div class="passport inputC">
                        <div>
                            <p>Passport/ID number</p>
                            <asp:TextBox CssClass="textBox" ID="TextBox5" runat="server" placeholder="Passport/ID number" />
                        </div>
                    </div>
                    <div class="expiryDate inputC">
                        <div>
                            <p>Expiry date</p>
                            <asp:TextBox CssClass="textBox" ID="TextBox6" runat="server" TextMode="Date" placeholder="DD/MM/YYYY" />
                        </div>
                    </div>
                </div>
                <div class="gender">
                    <asp:HiddenField ID="HiddenField" runat="server" Value="male" />
                    <input type="button" name="gender_male" class="gender_male active" value="male" onclick="updateGender(0, this.value)" />
                    <input type="button" name="gender_female" class="gender_female" value="female" onclick="updateGender(0, this.value)" />
                </div>
            </div>

            <div class="guest">
                <asp:Label ID="Label25" runat="server" Text="Adult 2"></asp:Label>
                <div class="info1">
                    <div class="first_name inputC">
                        <div>
                            <p>First/Given name</p>
                            <asp:TextBox CssClass="textBox" ID="TextBox3" runat="server" placeholder="First/Given name" />
                        </div>
                    </div>
                    <div class="last_name inputC">
                        <div>
                            <p>Family name/Surname</p>
                            <asp:TextBox CssClass="textBox" ID="TextBox9" runat="server" placeholder="Family name/Surname" />
                        </div>
                    </div>
                </div>
                <div class="info2">
                    <div class="dob inputC">
                        <div>
                            <p>Date of birth</p>
                            <asp:TextBox CssClass="textBox" ID="TextBox10" runat="server" TextMode="Date" placeholder="Date of birth" />
                        </div>
                    </div>
                    <div class="passport inputC">
                        <div>
                            <p>Passport/ID number</p>
                            <asp:TextBox CssClass="textBox" ID="TextBox11" runat="server" placeholder="Passport/ID number" />
                        </div>
                    </div>
                    <div class="expiryDate inputC">
                        <div>
                            <p>Expiry date</p>
                            <asp:TextBox CssClass="textBox" ID="TextBox12" runat="server" TextMode="Date" placeholder="DD/MM/YYYY" />
                        </div>
                    </div>
                </div>
                <div class="gender">
                    <asp:HiddenField ID="HiddenField1" runat="server" Value="male" />
                    <input type="button" name="gender_male" class="gender_male active" value="male" onclick="updateGender(1, this.value)" />
                    <input type="button" name="gender_female" class="gender_female" value="female" onclick="updateGender(1, this.value)" />
                </div>
            </div>

            <!-- contact details -->
            <div id="contact_details">
                <p>Contact details</p>
                <asp:CheckBox ID="CheckBox1" runat="server" />
                <asp:Label ID="Label9" runat="server" Text="Nelson Ash is contact person"></asp:Label>
                <div>
                    <div class="expiryDate inputC">
                        <div>
                            <p>Email Address</p>
                            <asp:TextBox ID="TextBox7" runat="server" TextMode="Email" placeholder="Email address"></asp:TextBox>
                        </div>
                    </div>
                    <div class="expiryDate inputC">
                        <div>
                            <p>Phone Number</p>
                            <asp:TextBox ID="TextBox8" runat="server" TextMode="Phone" placeholder="Phone number"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <!-- food addon -->
            <div id="addon">
                <p>Add ons</p>
                <!-- ALL FOODS QUANTITY : HIDDEN ; format: qtyAddon1,qtyAddon2,qtyAddon3 -->
                <asp:HiddenField ID="addon_Qty" runat="server" Value="0,0,0" />
                <div class="product">
                    <div>
                        <asp:Image ID="Image1" ImageUrl="../image/chicken_rice.jpg" runat="server" />
                        <div class="productDetails">
                            <!-- food name -->
                            <asp:Label ID="Label20" Text="Chicken rice" runat="server" />
                            <!-- food price -->
                            <asp:Label ID="Label21" Text="RM 99.99" runat="server" />
                        </div>
                    </div>
                    <div class="qty">
                        <!-- quantity button : add -->
                        <input type="button" class="btn_minus" value="-" onclick="updateAddonNumber(0, this.value)" />
                        <p class="number">0</p>
                        <!-- quatity button : minus -->
                        <input type="button" class="btn_add" value="+" onclick="updateAddonNumber(0, this.value)" />
                    </div>
                </div>

                <div class="product">
                    <div>
                        <asp:Image ID="Image2" ImageUrl="../image/Bukhara_Chicken_Biryani__Americano.jpg" runat="server" />
                        <div class="productDetails">
                            <asp:Label ID="Label8" Text="Bukhara Chicken Biryani and Americano" runat="server" />
                            <asp:Label ID="Label22" Text="RM 99.99" runat="server" />
                        </div>
                    </div>
                    <div class="qty">
                        <input type="button" class="btn_minus" value="-" onclick="updateAddonNumber(1, this.value)" />
                        <p class="number">0</p>
                        <input type="button" class="btn_add" value="+" onclick="updateAddonNumber(1, this.value)" />
                    </div>
                </div>

                <div class="product">
                    <div>
                        <asp:Image ID="Image3" ImageUrl="../image/Coca_Cola.png" runat="server" />
                        <div class="productDetails">
                            <asp:Label ID="Label23" Text="Coca cola" runat="server" />
                            <asp:Label ID="Label24" Text="RM 99.99" runat="server" />
                        </div>
                    </div>
                    <div class="qty">
                        <input type="button" class="btn_minus" value="-" onclick="updateAddonNumber(2, this.value)" />
                        <p class="number">0</p>
                        <input type="button" class="btn_add" value="+" onclick="updateAddonNumber(2, this.value)" />
                    </div>
                </div>

            </div>
        </div>

        <div id="right">
            <div id="summary">
                <p>Fare summary</p>
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
            <!-- Continue button -->
            <asp:Button ID="continueCheckout" Text="Continue" runat="server" OnClick="continueCheckout_Click" />
        </div>
    </form>

    <script>
        function updateAddonNumber(index, type) {
            let addonQtyRaw = document.getElementById('addon_Qty');
            addonQty = addonQtyRaw.value.split(',').map(Number);

            switch (type) {
                case '-':
                    addonQty[index] = addonQty[index] > 0 ? addonQty[index] - 1 : 0;
                    break;
                case '+':
                    addonQty[index]++;
                    break;
            }

            document.getElementsByClassName("number")[index].innerHTML = addonQty[index];

            let updatedValueString = "";
            for (let i = 0; i < addonQty.length; i++) {
                updatedValueString += `${addonQty[i]},`;
            }

            addonQtyRaw.value = updatedValueString.substring(0, updatedValueString.length - 1);
            console.log(addonQtyRaw.value);
        }

        function updateGender(index, gender) {
            // index = which guest.
            let guestGender = document.getElementsByClassName('gender')[index];
            let maleElm = document.getElementsByClassName('gender_male')[index];
            let femaleElm = document.getElementsByClassName('gender_female')[index];
            let selectedGender;

            maleElm.classList.remove('active');
            femaleElm.classList.remove('active');

            switch (gender) {
                case 'male':
                    selectedGender = 'male';
                    maleElm.classList.add('active');
                    break;
                case 'female':
                    selectedGender = 'female';
                    femaleElm.classList.add('active');
                    break;
            }

            guestGender.querySelectorAll("input[type=hidden]")[0].value = selectedGender;
            console.log(guestGender.querySelectorAll("input[type=hidden]")[0].value);
        }
    </script>
</body>
</html>
