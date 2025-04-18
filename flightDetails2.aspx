﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="flightDetails2.aspx.cs" Inherits="WAD_Assignment.flightDetails2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../flightDetails2.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- FLIGHT SEARCH jeremy  -->
        <div id="flight_search">
            <div>
                <!-- first row of flight search: trip type, guest, promo code. -->
                <div id="top">


                    <div id="trip_type">
                        <div>
                            <!-- trip type textbox -->
                            <asp:TextBox ID="txtTripType" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>

                        <!-- trip type drop down (old one change to txetbox already)-->
                        <%--<div>
                        <input type="button" name="btn_trip" id="btn_trip" value="Round-trip" onclick="triggerDropDownList('tripDropDownList')" />
                        <img src="../icon/downward-arrow.png" alt="Down arrow" />
                        <!-- TRIP TYPE SELECTION VALUE : HIDDEN -->
                        <asp:HiddenField ID="selected_trip" runat="server" Value="Round-trip" />
                    </div>--%>

                        <!-- trip type selection/options list (old one change to txetbox already)-->
                        <%--<div id="tripDropDownList" class="ddlist" style="display: none">
                        <div class="option" id="round_trip" onclick="selectTrip(0)">Round-trip</div>
                        <div class="option" id="one_way" onclick="selectTrip(1)">One-way</div>
                    </div>--%>
                    </div>

                    <!-- guest drop down -->
                    <div id="guest">
                        <div>
                            <!-- Passeger textbox -->
                            <asp:TextBox ID="txtPasseger" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                        <%-- <div>
                        <input type="button" name="btn_guest" id="btn_guest" value="1 Guest" onclick="triggerDropDownList('guestDropDownList')" />
                        <img src="../icon/downward-arrow.png" alt="Down arrow" />
                        <!-- GUEST NUMBER VALUE: HIDDEN; format:  adult,child,infant  -->
                        <asp:HiddenField ID="guest_number" runat="server" Value="1,0,0" />
                    </div>
                    <!-- guest number add/minus  -->
                    <div id="guestDropDownList" class="ddlist guestList" style="display: none">
                        <!-- adult number  -->
                        <div id="adult_guest">
                            <div>
                                <p class="guestType">Adult</p>
                                <p class="description">Above 12 years</p>
                            </div>
                            <!-- add/minus buttons  -->
                            <div>
                                <input type="button" class="btn_minus" value="-" onclick="updateGuestNumber(0, this.value)" />
                                <p class="number">1</p>
                                <input type="button" class="btn_add" value="+" onclick="updateGuestNumber(0, this.value)" />
                            </div>
                        </div>
                        <!-- child number -->
                        <div id="child_guest">
                            <div>
                                <p class="guestType">Child</p>
                                <p class="description">2 - 11 years on travel date</p>
                            </div>
                            <!-- add/minus buttons -->
                            <div>
                                <input type="button" class="btn_minus" value="-" onclick="updateGuestNumber(1, this.value)" />
                                <p class="number">0</p>
                                <input type="button" class="btn_add" value="+" onclick="updateGuestNumber(1, this.value)" />
                            </div>
                        </div>
                        <!-- infant number -->
                        <div id="infant_guest">
                            <div>
                                <p class="guestType">Infant</p>
                                <p class="description">Below 2 year on travel date.</p>
                                <p class="description">Seated on lap</p>
                            </div>
                            <!-- add/minus buttons -->
                            <div>
                                <input type="button" class="btn_minus" value="-" onclick="updateGuestNumber(2, this.value)" />
                                <p class="number">0</p>
                                <input type="button" class="btn_add" value="+" onclick="updateGuestNumber(2, this.value)" />
                            </div>
                        </div>
                    </div>--%>
                    </div>

                </div>

                <!-- second row of flight search : departure, destination, departure date, return date, search button -->
                <div id="down">

                    <!-- departure input -->
                    <div id="fly_from">
                        <img src="../icon/pin.png" alt="flyfrom" />
                        <div>
                            <p>Flying from</p>
                            <asp:TextBox CssClass="textBox" ID="txtFlightFrom" runat="server" placeholder="Flying from" ReadOnly="true" />
                        </div>
                    </div>

                    <!-- destination input -->
                    <div id="fly_to">
                        <img src="../icon/pin.png" alt="flyto" />
                        <div>
                            <p>Going to</p>
                            <asp:TextBox CssClass="textBox" ID="txtFlightTo" runat="server" placeholder="Flying to" ReadOnly="true" />
                        </div>
                    </div>

                    <!-- departure date selector -->
                    <div id="dateDepart">
                        <img src="../icon/calendar.png" alt="depart" />
                        <div>
                            <div>
                                <p>Depart</p>
                                <p id="returnLabel">Return</p>
                            </div>
                            <div>
                                <asp:TextBox CssClass="textBox" ID="txtDepart" runat="server" TextMode="Date" ReadOnly="true" />

                                <!-- return date : activate when trip type = round-trip -->
                                <asp:TextBox CssClass="textBox" ID="txtReturn" runat="server" TextMode="Date" ReadOnly="true" />
                            </div>
                        </div>
                    </div>


                    <div id="btn_search">
                    </div>
                </div>
            </div>
        </div>

        <!-- SEARCHED FLIGHTS -->
        <div id="result">
            <!-- FILTER -->
            <div id="flight_filter">
                <div>
                    <h3>Filter by</h3>
                    <!-- clear all button -->
                    <asp:Button ID="clearAll" Text="Clear all" runat="server" />
                </div>



                <!-- cabin class radio button list -->
                <div>
                    <p>Cabin class</p>
                    <asp:RadioButtonList ID="cabinClass" runat="server" OnSelectedIndexChanged="cabinClass_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Text="Economy" Value="1" />
                        <asp:ListItem Text="Premium Economy" Value="2" />
                        <asp:ListItem Text="Business" Value="3" />
                        <asp:ListItem Text="First Class" Value="4" />
                    </asp:RadioButtonList>
                </div>
            </div>

            <!-- DISPLAY FLIGHT RESULT -->
            <div id="flight_result">

                <!-- SELECTED DEPARTURE FLIGHT : SHOW AFTER SELECTED A DEPARTURE FLIGHT && IS ROUND-TRIP -->
                <div class="flight_record" id="selected_depart_flight">
                    <div class="r1">
                        <p><%= GetSelectedCabinClassText(Request.QueryString["cabinClassOption"]) %></p>
                        <p>Selected</p>
                        <p class="price">RM <span><%= Request.QueryString["departurePrice"] %></span></p>
                    </div>
                    <p class="r2">for <%= Request.QueryString["passengerOption"].Split()[0] %> guest(s)</p>
                    <div class="r3">
                        <div>
                            <span>
                                <p><%= DisplayDepartureTime() %></p>
                                <p><%= Request.QueryString["departureCity"] %></p>
                            </span>
                            <span class="horizontalLine">
                                <img src="../icon/aircraft.png" alt="fly to" />
                            </span>
                            <span>
                                <p><%= DisplayArrivalTime() %></p>
                                <p><%= Request.QueryString["destinationCity"] %></p>
                            </span>
                            <span><%= DisplayDuration() %></span>
                        </div>
                        <asp:Button CssClass="btn_cancel" ID="Button3" Text="Cancel" runat="server" Style="cursor: pointer;" OnClick="Button3_Click" />
                    </div>
                    <div class="r4">
                        <div>
                            <p>View details</p>
                            <img src="../icon/down.png" alt="viewDetails" />
                        </div>
                    </div>
                    <div class="r5">
                        <p>30 kg <span>per guest</span></p>
                    </div>
                </div>

                <!-- FLIGHT RESULT HEADER -->
                <div id="result_header">
                    <h3>Returning flights</h3>

                    <!-- sortby drop down -->
                    <div id="sort_by">
                        <div onclick="triggerDropDownList('sortByDropDownList')">
                            <input type="button" name="btn_sort" id="btn_sort" value="Sort by: Cheapest" />
                            <img src="../icon/downward-arrow.png" alt="Down arrow" />
                            <!-- SORT BY SELECTION VALUE: HIDDEN -->
                            <asp:HiddenField ID="SortBy" runat="server" Value="Cheapest" />
                        </div>
                        <!-- sortby selection/options list -->
                        <div id="sortByDropDownList" class="ddlist" style="display: none">
                            <div class="option" id="cheapest" onclick="selectSortBy(0)">Cheapest</div>
                            <div class="option" id="fastest" onclick="selectSortBy(1)">Fastest</div>
                            <div class="option" id="earlier" onclick="selectSortBy(2)">Earlier</div>
                        </div>
                    </div>
                </div>

                <!-- AVAILABLE FLIGHTS -->
                <!-- start of this flight -->
                <asp:Repeater ID="rptFlight" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="flight_record">
                            <div class="r1">
                                <p><%# GetSelectedCabinClassText(cabinClass.SelectedValue) %></p>
                                <!-- get from search -->
                                <p class="price">RM <span><%# CalculatePrice(cabinClass.SelectedValue, Convert.ToDecimal(Eval("economy_price")), Convert.ToDecimal(Eval("premium_economy_price")), Convert.ToDecimal(Eval("business_price")), Convert.ToDecimal(Eval("first_class_price")))%></p>
                                <!-- need to calculate based on pax-->
                            </div>
                            <p class="r2">for <%# Request.QueryString["passengerOption"].Split()[0] %> guest(s)</p>
                            <!-- get from search -->
                            <div class="r3">
                                <div>
                                    <span>
                                        <p><%# Eval("departure_date_time", "{0:hh:mm tt}") %></p>
                                        <p><%# Eval("departure_city") %></p>
                                    </span>
                                    <span class="horizontalLine">
                                        <img src="../icon/aircraft.png" alt="fly to" />
                                    </span>
                                    <span>
                                        <p><%# CalculateArrivalTime((DateTime)Eval("departure_date_time"), Eval("duration").ToString()) %></p>
                                        <p><%# Eval("destination_city") %></p>
                                    </span>
                                    <span><%# FormatDuration(Eval("duration").ToString()) %></span>
                                </div>
                                <asp:Button CssClass="btn_select" ID='Button2' Text="Select" runat="server" CommandName="SelectFlight" CommandArgument='<%# Eval("flight_id") + "|" + Eval("plane_id")+ "|" + Eval("departure_date_time") + "|" + Eval("duration") + "|" + Eval("economy_price") + "|" + Eval("premium_economy_price") + "|" + Eval("business_price") + "|" + Eval("first_class_price")%>' OnClick="btnSelect_Click" Style="cursor: pointer;" />
                            </div>
                            <div class="r4">
                                <div>
                                    <p>View details</p>
                                    <img src="../icon/down.png" alt="viewDetails" />
                                </div>
                            </div>
                            <div class="r5">
                                <p>30 kg<span>per guest</span></p>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        <% if (rptFlight.Items.Count == 0)
                            { %>
                        <div style="text-align: center; padding: 20px; font-size: 24px">No flights available</div>
                        <% } %>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TarFly_Database %>"
                    SelectCommand="SELECT * FROM Flight WHERE departure_city = @departureCity AND destination_city = @destinationCity AND CAST(departure_date_time AS DATE) = @departureDate">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="departureCity" QueryStringField="destinationCity" Type="String" />
                        <asp:QueryStringParameter Name="destinationCity" QueryStringField="departureCity" Type="String" />
                        <asp:QueryStringParameter Name="departureDate" QueryStringField="returnDate" Type="DateTime" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <!-- end of this flight -->
                <!-- end of all available flights -->

            </div>
        </div>
    </form>

    <script>
        // trigger the drop down list to show or hide.
        function triggerDropDownList(elm) {
            // get the drop down selection/options list.
            let dropDownList = document.getElementById(elm);
            let isHide = dropDownList.style.display == "none";

            if (isHide)
                dropDownList.style.setProperty("display", "block");
            else
                dropDownList.style.setProperty("display", "none");
        }

        // user select a trip type
        function selectTrip(trip) {
            let _trip;
            let returnTrip = document.getElementById('return');
            let returnLabel = document.getElementById('returnLabel');

            switch (trip) {
                case 0:
                    _trip = "Round-trip";
                    // display the return date when trip == round-trip
                    returnTrip.style.display = 'block';
                    returnLabel.style.display = 'block';
                    break;
                case 1:
                    _trip = "One-way"
                    // hide the return date when trip == single-trip
                    returnTrip.style.display = 'none';
                    returnLabel.style.display = 'none';
                    break;
            }

            // update hidden field value for trip type.
            document.getElementById('selected_trip').value = _trip;
            // update the drop down button value.
            document.getElementById('btn_trip').value = _trip;
            //hide the drop down list after selection.
            document.getElementById('tripDropDownList').style.setProperty("display", "none");
        }

        // user select a sort option.
        function selectSortBy(sortBy) {
            let _sortBy;

            switch (sortBy) {
                case 0:
                    _sortBy = "Cheapest";
                    break;
                case 1:
                    _sortBy = "Fastest";
                    break;
                case 2:
                    _sortBy = "Earlier";
                    break;
            }

            // update hidden field value for sort by
            document.getElementById('SortBy').value = _sortBy;
            // update drop down button value.
            document.getElementById('btn_sort').value = `Sort by: ${_sortBy}`;
            // hide the drop down list.
            document.getElementById('sortByDropDownList').style.setProperty("display", "none");
        }

        // user update the adult, child, infant number.
        function updateGuestNumber(index, type) {
            // get the current guests number from the hidden field for guest number.
            let guestNumberRaw = document.getElementById('guest_number');
            guestNumber = guestNumberRaw.value.split(',').map(Number);

            switch (type) {
                // adult: 1 to unlimited.
                // child & infant: 0 to unlimited.
                case '-':
                    // decrease the guest number
                    guestNumber[index] = guestNumber[index] > 0 ? (index == 0 && guestNumber[index] == 1 ? 1 : guestNumber[index] - 1) : 0;
                    break;
                case '+':
                    // increase the guest number
                    guestNumber[index]++;
                    break;
            }

            // calculate total guest number.
            let totalGuest = 0;
            for (let i = 0; i < 3; i++) {
                totalGuest += guestNumber[i];
            }

            // update the new number of the guest in the drop down list.
            document.getElementsByClassName("number")[index].innerHTML = guestNumber[index];
            // update the hidden field value for guest number.
            guestNumberRaw.value = `${guestNumber[0]},${guestNumber[1]},${guestNumber[2]}`;
            // update the total guest number.
            document.getElementById('btn_guest').value = totalGuest + ' Guest' + (totalGuest > 1 ? 's' : '');
        }
    </script>
</body>
</html>
