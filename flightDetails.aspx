<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="flightDetails.aspx.cs" Inherits="Tarfly.page.flightDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../flightDetails.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <!-- FLIGHT SEARCH -->
        <div id="flight_search">
            <div>
                <!-- first row of flight search: trip type, guest, promo code. -->
                <div id="top">

                    <!-- trip type drop down -->
                    <div id="trip_type">
                        <div>
                            <input type="button" name="btn_trip" id="btn_trip" value="Round-trip" onclick="triggerDropDownList('tripDropDownList')" />
                            <img src="../icon/downward-arrow.png" alt="Down arrow" />
                            <!-- TRIP TYPE SELECTION VALUE : HIDDEN -->
                            <asp:HiddenField ID="selected_trip" runat="server" Value="Round-trip" />
                        </div>

                        <!-- trip type selection/options list -->
                        <div id="tripDropDownList" class="ddlist" style="display: none">
                            <div class="option" id="round_trip" onclick="selectTrip(0)">Round-trip</div>
                            <div class="option" id="one_way" onclick="selectTrip(1)">One-way</div>
                        </div>
                    </div>

                    <!-- guest drop down -->
                    <div id="guest">
                        <div>
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
                        </div>
                    </div>

                </div>

                <!-- second row of flight search : departure, destination, departure date, return date, search button -->
                <div id="down">

                    <!-- departure input -->
                    <div id="fly_from">
                        <img src="../icon/pin.png" alt="flyfrom" />
                        <div>
                            <p>Flying from</p>
                            <asp:TextBox CssClass="textBox" ID="flyFrom" runat="server" placeholder="Flying from" />
                        </div>
                    </div>

                    <!-- destination input -->
                    <div id="fly_to">
                        <img src="../icon/pin.png" alt="flyto" />
                        <div>
                            <p>Going to</p>
                            <asp:TextBox CssClass="textBox" ID="flyTo" runat="server" placeholder="Flying to" />
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
                                <asp:TextBox CssClass="textBox" ID="depart" runat="server" TextMode="Date" />

                                <!-- return date : activate when trip type = round-trip -->
                                <asp:TextBox CssClass="textBox" ID="return" runat="server" TextMode="Date" />
                            </div>
                        </div>
                    </div>

                    <!-- search button -->
                    <div id="btn_search">
                        <asp:Button CssClass="searchButton" Text="Search" runat="server" />
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
                    <asp:RadioButtonList ID="cabinClass" runat="server">
                        <asp:ListItem Selected="True" Text="Economy" />
                        <asp:ListItem Text="Premium Economy" />
                        <asp:ListItem Text="Business" />
                        <asp:ListItem Text="First Class" />
                    </asp:RadioButtonList>
                </div>
            </div>

            <!-- DISPLAY FLIGHT RESULT -->
            <div id="flight_result">

                <!-- SELECTED DEPARTURE FLIGHT : SHOW AFTER SELECTED A DEPARTURE FLIGHT && IS ROUND-TRIP -->
                <div class="flight_record" id="selected_depart_flight" style="display: none">
                    <div class="r1">
                        <p>Economy</p>
                        <p>Selected</p>
                        <p class="price">RM <span>999.99</span></p>
                    </div>
                    <p class="r2">for 1 guest</p>
                    <div class="r3">
                        <div>
                            <span>
                                <p>01:45</p>
                                <p>KUL</p>
                            </span>
                            <span class="horizontalLine">
                                <img src="../icon/aircraft.png" alt="fly to" />
                            </span>
                            <span>
                                <p>10:00</p>
                                <p>NOP</p>
                            </span>
                            <span>37h 15m (+1)</span>
                            <span>2 stops (9h 15m at Dubai, 14h 5m at Istanbul)</span>
                        </div>
                        <asp:Button CssClass="btn_cancel" ID="Button3" Text="Cancel" runat="server" />
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
                    <h3>Departing flights</h3>

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
                <div class="flight_record">
                    <div class="r1">
                        <p>Economy</p>
                        <p class="price">RM <span>999.99</span></p>
                    </div>
                    <p class="r2">for 1 guest</p>
                    <div class="r3">
                        <div>
                            <span>
                                <p>01:45</p>
                                <p>KUL</p>
                            </span>
                            <span class="horizontalLine">
                                <img src="../icon/aircraft.png" alt="fly to" />
                            </span>
                            <span>
                                <p>10:00</p>
                                <p>NOP</p>
                            </span>
                            <span>37h 15m (+1)</span>
                            <span>2 stops (9h 15m at Dubai, 14h 5m at Istanbul)</span>
                        </div>
                        <asp:Button CssClass="btn_select" ID="btn_select_1" Text="Select" runat="server" PostBackUrl="~/flightBooking.aspx"/>
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
                <!-- end of this flight -->

                <div class="flight_record">
                    <div class="r1">
                        <p>Economy</p>
                        <p class="price">RM <span>999.99</span></p>
                    </div>
                    <p class="r2">for 1 guest</p>
                    <div class="r3">
                        <div>
                            <span>
                                <p>01:45</p>
                                <p>KUL</p>
                            </span>
                            <span class="horizontalLine">
                                <img src="../icon/aircraft.png" alt="fly to" />
                            </span>
                            <span>
                                <p>10:00</p>
                                <p>NOP</p>
                            </span>
                            <span>37h 15m (+1)</span>
                            <span>2 stops (9h 15m at Dubai, 14h 5m at Istanbul)</span>
                        </div>
                        <!-- select button -->
                        <asp:Button CssClass="btn_select" ID="Button1" Text="Select" runat="server" PostBackUrl="~/flightBooking.aspx" />
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

                <div class="flight_record">
                    <div class="r1">
                        <p>Economy</p>
                        <p class="price">RM <span>999.99</span></p>
                    </div>
                    <p class="r2">for 1 guest</p>
                    <div class="r3">
                        <div>
                            <span>
                                <p>01:45</p>
                                <p>KUL</p>
                            </span>
                            <span class="horizontalLine">
                                <img src="../icon/aircraft.png" alt="fly to" />
                            </span>
                            <span>
                                <p>10:00</p>
                                <p>NOP</p>
                            </span>
                            <span>37h 15m (+1)</span>
                            <span>2 stops (9h 15m at Dubai, 14h 5m at Istanbul)</span>
                        </div>
                        <asp:Button CssClass="btn_select" ID="Button2" Text="Select" runat="server" PostBackUrl="~/flightBooking.aspx" />
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
