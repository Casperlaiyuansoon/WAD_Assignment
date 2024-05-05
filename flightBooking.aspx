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
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </span>
                    </div>
                    <div id="depart_details">
                        <div id="depart_route">
                            <!-- departure from -->
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                            <img src="../icon/aircraft.png" alt="flight" />
                            <!-- destination -->
                            <asp:Label ID="Label3" runat="server"></asp:Label>
                        </div>
                        <div id="depart_route_details">
                            <!-- flight ID -->
                            <asp:Label ID="Label4" runat="server"></asp:Label>
                            <br />
                            <!-- flight time -->
                            <asp:Label ID="Label5" runat="server"></asp:Label>
                            <br />
                            <!-- flight duration -->
                            <asp:Label ID="Label6" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
                <!-- return details -->
                <div id="returnDiv" runat="server" visible="false">
                    <div id="return_date">
                        <img src="../icon/departures.png" alt="return" />
                        <span>
                            <p>Return date</p>
                            <asp:Label ID="Label10" runat="server"></asp:Label>
                        </span>
                    </div>
                    <div id="return_details">
                        <div id="return_route">
                            <asp:Label ID="Label11" runat="server"></asp:Label>
                            <img src="../icon/aircraft.png" alt="flight" />
                            <asp:Label ID="Label12" runat="server"></asp:Label>
                        </div>
                        <div id="return_route_details">
                            <asp:Label ID="Label13" runat="server"></asp:Label>
                            <br />
                            <asp:Label ID="Label14" runat="server"></asp:Label>
                            <br />
                            <asp:Label ID="Label15" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- guest details -->
            <%-- 
            <div class="guest" runat="server">
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
            --%>

            <asp:Repeater ID="GuestRepeater" runat="server">
                <ItemTemplate>
                    <div class="guest">
                        <asp:Label ID="Label7" runat="server" Text='<%# "Adult " + (Container.ItemIndex + 1) %>'></asp:Label>
                        <div class="info1">
                            <div class="first_name inputC">
                                <div>
                                    <p>First/Given name</p>
                                    <asp:TextBox CssClass="textBox" ID="TextBox1" runat="server" Text='<%# Eval("FirstName") %>' placeholder="First/Given name" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="First name is required" ForeColor="Red" Display="Dynamic" CssClass="error" />
                                </div>
                            </div>
                            <div class="last_name inputC">
                                <div>
                                    <p>Family name/Surname</p>
                                    <asp:TextBox CssClass="textBox" ID="TextBox4" runat="server" Text='<%# Eval("LastName") %>' placeholder="Family name/Surname" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="Last name is required" ForeColor="Red" Display="Dynamic" CssClass="error" />
                                </div>
                            </div>
                        </div>
                        <div class="info2">
                            <div class="dob inputC">
                                <div>
                                    <p>Date of birth</p>
                                    <asp:TextBox CssClass="textBox" ID="TextBox2" runat="server" TextMode="Date" Text='<%# Eval("DateOfBirth") %>' placeholder="Date of birth" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="Date of birth is required" ForeColor="Red" Display="Dynamic" CssClass="error" />
                                </div>
                            </div>
                            <div class="passport inputC">
                                <div>
                                    <p>Passport/ID number</p>
                                    <asp:TextBox CssClass="textBox" ID="TextBox5" runat="server" Text='<%# Eval("PassportID") %>' placeholder="Passport/ID number" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="Passport/ID number is required" ForeColor="Red" Display="Dynamic" CssClass="error" />
                                </div>
                            </div>
                            <div class="expiryDate inputC">
                                <div>
                                    <p>Expiry date</p>
                                    <asp:TextBox CssClass="textBox" ID="TextBox6" runat="server" TextMode="Date" Text='<%# Eval("PassportExpiryDate") %>' placeholder="DD/MM/YYYY" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6" ErrorMessage="Expiry date is required" ForeColor="Red" Display="Dynamic" CssClass="error" />
                                </div>
                            </div>
                        </div>
                        <div class="gender">
                            <asp:HiddenField ID="HiddenField" runat="server" Value='<%# Eval("Gender") %>' />
                            <input type="button" name="gender_male" class="gender_male active" value="male" onclick="updateGender(<%# Container.ItemIndex %>, 'male')" />
                            <input type="button" name="gender_female" class="gender_female" value="female" onclick="updateGender(<%# Container.ItemIndex %>, 'female')" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>


            <!-- contact details -->
            <div id="contact_details">
                <p>Contact details</p>
                <asp:Label ID="Label9" runat="server" Text="Please add contact person"></asp:Label>
                <div>
                    <div class="expiryDate inputC">
                        <div>
                            <p>Email Address</p>
                            <asp:TextBox ID="TextBox7" runat="server" TextMode="Email" placeholder="Email address"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox7" ErrorMessage="Email address is required" ForeColor="Red" Display="Dynamic" CssClass="error" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox7" ErrorMessage="Invalid email address format" ForeColor="Red" Display="Dynamic" CssClass="error" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                        </div>
                    </div>
                    <div class="expiryDate inputC">
                        <div>
                            <p>Phone Number</p>
                            <asp:TextBox ID="TextBox8" runat="server" TextMode="Phone" placeholder="Phone number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox8" ErrorMessage="Phone number is required" ForeColor="Red" Display="Dynamic" CssClass="error" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox8" ErrorMessage="Invalid phone number format" ForeColor="Red" Display="Dynamic" CssClass="error" ValidationExpression="\d{10,11}" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- food addon -->
            <asp:HiddenField ID="HiddenField1" runat="server" Value="0,0,0" />
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
                            <asp:Label ID="Label21" Text="RM 10.00" runat="server" />
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
                            <asp:Label ID="Label22" Text="RM 20.00" runat="server" />
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
                            <asp:Label ID="Label24" Text="RM 5.00" runat="server" />
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
                        <asp:Label ID="Label16" runat="server" />
                    </div>
                    <div>
                        <p>Taxes, fees & surcharges</p>
                        <asp:Label ID="Label17" runat="server" />
                    </div>
                    <div>
                        <p>Add-ons</p>
                        <asp:Label ID="Label18" runat="server" />
                        <asp:HiddenField ID="HiddenAddon" runat="server" />
                    </div>
                </div>
                <div id="totalAmount">
                    <p>Total amount</p>
                    <asp:Label ID="Label19" runat="server" />
                    <asp:HiddenField ID="HiddenTotal" runat="server" />
                </div>
            </div>
            <!-- Continue button -->
            <asp:Button ID="continueCheckout" Text="Continue" runat="server" OnClick="continueCheckout_Click" Style="cursor: pointer;" />
        </div>
    </form>

    <script>
        function updateAddonNumber(index, type) {
            let addonQtyRaw = document.getElementById('addon_Qty');
            addonQty = addonQtyRaw.value.split(',').map(Number);
            let addonPrices = [10.00, 20.00, 5.00]; // Prices for each addon
            let baseFare = parseFloat(document.getElementById('<%= Label16.ClientID %>').innerText.replace("RM ", ""));
            let taxes = parseFloat(document.getElementById('<%= Label17.ClientID %>').innerText.replace("RM ", ""));


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
            document.getElementById('HiddenField1').value = addonQtyRaw.value;

            // Calculate total addon cost
            let totalAddonCost = 0;
            for (let i = 0; i < addonQty.length; i++) {
                totalAddonCost += addonQty[i] * addonPrices[i];
            }

            // Update Label18 with the total addon cost
            document.getElementById('Label18').innerText = "RM " + totalAddonCost.toFixed(2);
            document.getElementById('<%= HiddenAddon.ClientID %>').value = totalAddonCost.toFixed(2);

            let totalAmount = baseFare + taxes + totalAddonCost;
            document.getElementById('Label19').innerText = "RM " + totalAmount.toFixed(2);
            document.getElementById('<%= HiddenTotal.ClientID %>').value = totalAmount.toFixed(2);

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
