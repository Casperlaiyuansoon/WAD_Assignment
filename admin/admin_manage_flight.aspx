<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin_manage_flight.aspx.cs" Inherits="WAD_Assignment.admin.admin_manage_flight" EnableViewState="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Tarfly | Admin Flight Management</title>
    <link rel="stylesheet" href="admin_manage_flight.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

    <script>
        function displayForm()
        {
            var btn = document.getElementById("add_flight_btn");
            var form = document.getElementById("add_flight_form_id");

            if (form.style.display === "none" || form.style.display === "")
            {
                form.style.display = "block";
            }
            else
            {
                form.style.display = "none";
            }
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%
        if (Session["flightAdded"] != null && (bool)Session["flightAdded"]) // Added flight
        {
            %>
                <script>alert("New flight added successfully");</script>
            <%
            Session["flightAdded"] = null;
        }

        if (Session["flightDeleted"] != null && (bool)Session["flightDeleted"]) // Deleted flight
        {
            %>
                <script>alert("Flight successfully deleted");</script>
            <%
            Session["flightDeleted"] = null;
        }

        if (Session["flightModified"] != null && (bool)Session["flightModified"]) // Modified flight
        {
            %>
                <script>alert("Flight successfully modified");</script>
            <%
            Session["flightModified"] = null;
        }

        if (Request.QueryString["fId"] != null) // If data if found and appear in the address bar
        {
            %>
                <div class="show-flight-info">
                    <div class="inner-flight-info">

                        <div style="text-align:right;">
                            <button type="button" class="fa fa-close" style="color:red" onClick="window.location.href='admin_manage_flight.aspx'"></button><br />
                        </div>

                        <!-- Flight ID -->
                        <asp:Label ID="Label1" runat="server" Text="Flight ID"></asp:Label>
                        <br />
                        <asp:TextBox runat="server" ID="flight_id_modify" Text="" ReadOnly="true"></asp:TextBox><br><br />

                        <!-- Plane ID -->
                        <asp:Label ID="Label2" runat="server" Text="Plane ID"></asp:Label>
                        <asp:RequiredFieldValidator ID="plane_id_required" runat="server" ErrorMessage="Plane ID is required" Text="*" ForeColor="Red" ControlToValidate="plane_id_modify" ValidationGroup="flight_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="plane_id_modify" TextMode="Number" Text=""></asp:TextBox><br><br />

                        <!-- Departure Date Time -->
                        <asp:Label ID="Label3" runat="server" Text="Depart Date & Time"></asp:Label>
                        <asp:RequiredFieldValidator ID="depart_dt_required" runat="server" ErrorMessage="Depart Date and Time is required" Text="*" ForeColor="Red" ControlToValidate="departure_time_modify" ValidationGroup="flight_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="departure_time_modify" Text=""></asp:TextBox><br><br />

                        <!-- Deprature City -->
                        <asp:Label ID="Label4" runat="server" Text="Depart City"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Departure City is required" Text="*" ForeColor="Red" ControlToValidate="departure_city_modify" ValidationGroup="flight_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="departure_city_modify" Text=""></asp:TextBox><br><br />

                        <!-- Destination City -->
                        <asp:Label ID="Label5" runat="server" Text="Destination City"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Destination City is required" Text="*" ForeColor="Red" ControlToValidate="destination_city_modify" ValidationGroup="flight_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="destination_city_modify" Text=""></asp:TextBox><br><br />

                        <!-- Duration -->
                        <asp:Label ID="Label6" runat="server" Text="Duration"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Duration is required" Text="*" ForeColor="Red" ControlToValidate="duration_modify" ValidationGroup="flight_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="duration_modify" Text=""></asp:TextBox><br><br />
        
                        <!-- Economy Price -->
                        <asp:Label ID="Label7" runat="server" Text="Economy Price"></asp:Label>
                        <asp:RequiredFieldValidator ID="economy_price_required" runat="server" ErrorMessage="Economy price is required" Text="*" ForeColor="Red" ControlToValidate="economy_price_modify" ValidationGroup="flight_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="economy_price_modify" TextMode="Number" Text=""></asp:TextBox><br><br />

                        <!-- Premium Economy Price -->
                        <asp:Label ID="Label8" runat="server" Text="Premium Economy Price"></asp:Label>
                        <asp:RequiredFieldValidator ID="prem_economy_price_required" runat="server" ErrorMessage="Premium economy price is required" Text="*" ForeColor="Red" ControlToValidate="premium_economy_price_modify" ValidationGroup="flight_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="premium_economy_price_modify" TextMode="Number" Text=""></asp:TextBox><br><br />

                        <!-- Business Price -->
                        <asp:Label ID="Label9" runat="server" Text="Business Price"></asp:Label>
                        <asp:RequiredFieldValidator ID="business_price_required" runat="server" ErrorMessage="Business price is required" Text="*" ForeColor="Red" ControlToValidate="business_price_modify" ValidationGroup="flight_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="business_price_modify" TextMode="Number" Text=""></asp:TextBox><br><br />

                        <!-- First Class Price -->
                        <asp:Label ID="Label10" runat="server" Text="First Class Price"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="First Class price is required" Text="*" ForeColor="Red" ControlToValidate="fclass_price_modify" ValidationGroup="flight_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="fclass_price_modify" TextMode="Number" Text=""></asp:TextBox><br><br />

                        <asp:Button ID="save_modify_btn" class="save_btn" runat="server" Text="Save" OnClick="save_modify_btn_Click" ValidationGroup="flight_modify_validation" />

                    </div>
                </div>
            <%
        }
    %>

    <div class="container">

        <h1 style="color:white;">FLIGHT MANAGEMENT</h1>

        <hr class="title" />
        <br />

        <div class="inner-container">

                <h2 class="section">Add Flight</h2>

                <button type="button" id="add_flight_btn" class="add_btn" onclick="displayForm()">+ Add New Flight</button>

                <div id="add_flight_form_id" class="add_flight_form">

                    <h3 class="title-pi">Flight Info</h3>

                    <div class="flex-form">

                        <!-- FIRST ROW -->
                        <div class="inner-flex-form">
                            <div class="inner-flex-content">
                                <span>Departure Date Time:
                                    <asp:RequiredFieldValidator ID="departure_date_time_required" runat="server" ErrorMessage="Departure Date and Time is required" Text="*" ForeColor="Red" ControlToValidate="departure_date" ValidationGroup="add_flight_validation"></asp:RequiredFieldValidator>
                                </span>
                                <!-- register name -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="departure_date" class="textField" runat="server" TextMode="DateTimeLocal" ClientIDMode="Static"></asp:TextBox><br />

                                    <script>
                                        var departureDateTextbox = document.getElementById('departure_date');
                                        var currentDate = new Date();
                                        var utcDateTime = new Date(currentDate.getTime() - currentDate.getTimezoneOffset() * 60000);
                                        var currentDateTimeString = utcDateTime.toISOString().slice(0, 16);
                                        departureDateTextbox.value = currentDateTimeString;

                                        departureDateTextbox.addEventListener('change', function ()
                                        {
                                            var selectedDateTime = new Date(this.value);

                                            if (selectedDateTime < utcDateTime)
                                            {
                                                this.value = currentDateTimeString;
                                            }
                                        });
                                    </script>

                                </div>
                            </div>

                            <br />

                            <div class="inner-flex-content">
                                <span>Airplane ID:
                                    <asp:RequiredFieldValidator ID="airplane_id_required" runat="server" ErrorMessage="Aieplane ID is required" Text="*" ForeColor="Red" ControlToValidate="airplane_id" ValidationGroup="add_flight_validation"></asp:RequiredFieldValidator>
                                </span>
                                <!-- register name -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="airplane_id" class="textField" runat="server" TextMode="Number" placeholder="e.g. 2"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                        <!-- END FIRST ROW -->

                        <br />

                        <!-- SECOND ROW -->
                        <div class="inner-flex-form">
                            <div class="inner-flex-content">
                                <span>Departure City :
                                    <asp:RequiredFieldValidator ID="departure_city_required" runat="server" ErrorMessage="Departure city is required" Text="*" ForeColor="Red" ControlToValidate="departure_city" ValidationGroup="add_flight_validation"></asp:RequiredFieldValidator>
                                </span>
                                <!-- register password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="departure_city" class="textField" runat="server" placeholder="e.g. Kuala Lumpur"></asp:TextBox><br />
                                </div>
                            </div>

                            <br />

                            <div class="inner-flex-content">
                                <span>Destination City :
                                    <asp:RequiredFieldValidator ID="destination_city_required" runat="server" ErrorMessage="Destination city is required" Text="*" ForeColor="Red" ControlToValidate="destination_city" ValidationGroup="add_flight_validation"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="departure_destination_compare" runat="server" ErrorMessage="Departure city and destination city cannot be the same" Text="*" ForeColor="Red" ControlToValidate="destination_city" ControlToCompare="departure_city" Operator="NotEqual" ValidationGroup="add_flight_validation"></asp:CompareValidator>
                                </span>
                                <!-- register confirm password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="destination_city" class="textField" runat="server" placeholder="e.g. Tokyo"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                        <!-- END SECOND ROW -->

                        <br />

                        <!-- THIRD ROW -->
                        <div class="inner-flex-form">
                            <div class="inner-flex-content">
                                <span>Duration :
                                    <asp:RequiredFieldValidator ID="duration_required" runat="server" ErrorMessage="Duration city is required" Text="*" ForeColor="Red" ControlToValidate="flight_duration" ValidationGroup="add_flight_validation"></asp:RequiredFieldValidator>
                                </span>
                                <!-- register confirm password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="flight_duration" class="textField" runat="server" TextMode="Number" placeholder="e.g. 0800"></asp:TextBox><br />
                                </div>
                            </div>

                            <br />

                            <div class="inner-flex-content">
                                <span>Economy Price :
                                    <asp:RequiredFieldValidator ID="eco_price_required" runat="server" ErrorMessage="Economy price is required" Text="*" ForeColor="Red" ControlToValidate="eco_price" ValidationGroup="add_flight_validation"></asp:RequiredFieldValidator>
                                </span>
                                <!-- register confirm password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="eco_price" class="textField" runat="server" TextMode="Number" placeholder="200"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                        <!-- END THIRD ROW -->

                        <br />

                        <!-- THIRD ROW -->
                        <div class="inner-flex-form">
                            <div class="inner-flex-content">
                                <span>Premium Economy Price :
                                    <asp:RequiredFieldValidator ID="prem_eco_price_required" runat="server" ErrorMessage="Premium Economy price is required" Text="*" ForeColor="Red" ControlToValidate="prem_eco_price" ValidationGroup="add_flight_validation"></asp:RequiredFieldValidator>
                                </span>
                                <!-- register confirm password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="prem_eco_price" class="textField" runat="server" TextMode="Number" placeholder="300"></asp:TextBox><br />
                                </div>
                            </div>

                            <br />

                            <div class="inner-flex-content">
                                <span>Business Price :
                                    <asp:RequiredFieldValidator ID="buss_price_required" runat="server" ErrorMessage="Business price is required" Text="*" ForeColor="Red" ControlToValidate="bus_price" ValidationGroup="add_flight_validation"></asp:RequiredFieldValidator>
                                </span>
                                <!-- register confirm password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="bus_price" class="textField" runat="server" TextMode="Number" placeholder="500"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                        <!-- END THIRD ROW -->

                        <!-- THIRD ROW -->
                        <div class="inner-flex-form">
                            <div class="inner-flex-content">
                                <span>First Class Price :
                                    <asp:RequiredFieldValidator ID="fclass_price_required" runat="server" ErrorMessage="First Class price is required" Text="*" ForeColor="Red" ControlToValidate="fclass_price" ValidationGroup="add_flight_validation"></asp:RequiredFieldValidator>
                                </span>
                                <!-- register confirm password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="fclass_price" class="textField" runat="server" TextMode="Number" placeholder="700"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                        <!-- END THIRD ROW -->

                    </div>

                    <div class="inputField">
                        <asp:Button ID="add_flight_submit" class="register_submit" runat="server" Text="Add" OnClick="add_flight_submit_Click" ValidationGroup="add_flight_validation" />
                    </div>
                </div>

                <br />
                <h2 class="section">Existing Flight</h2>



                <!-- SEARCH FUNCTION -->
                <div class="search-section">
                    <asp:TextBox ID="search_flight" runat="server" class="search_user_field" placeholder="Enter a flight ID..." TextMode="Number" ></asp:TextBox>
                    <asp:Button ID="search_flight_btn" runat="server" class="search_user_button fa" Text="&#xf002;" OnClick="search_flight_btn_Click" />
                </div>
                <!-- END SEARCH FUNCTION -->



                <br />

                <table>
                    <!-- HEAD -->
                    <tr class="data_header">
                        <th>ID</th>
                        <th>Airplane ID</th>
                        <th>Departure Date Time</th>
                        <th>Departure City</th>
                        <th>Destination City</th>
                        <th>Duration</th>
                        <th>Economy Price</th>
                        <th>Premium Economy Price</th>
                        <th>Business Price</th>
                        <th>First Class Price</th>
                        <th>Action</th>
                    </tr>
                    <!-- END HEAD -->
                    <%
                        if (Session["searchFlightAvailable"] != null && (bool)Session["searchFlightAvailable"]) // If searched record is avaibale
                        {
                            %>
                                <asp:Repeater ID="search_flight_repeater" runat="server">
                                    <ItemTemplate>
                                        <tr class="data_row">
                                            <td><asp:Label ID="flight_id_value" runat="server" Text='<%# Eval("flight_id") %>'></asp:Label></td>
                                            <td><asp:Label ID="airplane_id_value" runat="server" Text='<%# Eval("plane_id") %>'></asp:Label></td>
                                            <td><asp:Label ID="departure_time_value" runat="server" Text='<%# Eval("departure_date_time") %>'></asp:Label></td>
                                            <td><asp:Label ID="departure_city_value" runat="server" Text='<%# Eval("departure_city") %>'></asp:Label></td>
                                            <td><asp:Label ID="destination_city_value" runat="server" Text='<%# Eval("destination_city") %>'></asp:Label></td>
                                            <td><asp:Label ID="duration_value" runat="server" Text='<%# Eval("duration") %>'></asp:Label></td>
                                            <td><asp:Label ID="economy_price_value" runat="server" Text='<%# Eval("economy_price") %>'></asp:Label></td>
                                            <td><asp:Label ID="premium_economy_price_value" runat="server" Text='<%# Eval("premium_economy_price") %>'></asp:Label></td>
                                            <td><asp:Label ID="business_price_value" runat="server" Text='<%# Eval("business_price") %>'></asp:Label></td>
                                            <td><asp:Label ID="first_class_price_value" runat="server" Text='<%# Eval("first_class_price") %>'></asp:Label></td>
                                            <td class="btn_section">
                                                <asp:Button ID="flight_modify_button" class="btn modify fa" runat="server" Text="&#xf013;" CommandArgument='<%# Eval("flight_id") %>' OnClick="flight_modify_button_Click" />
                                                <asp:Button ID="flight_remove_button" class="btn delete fa" runat="server" Text="&#xf014;" CommandArgument='<%# Eval("flight_id") %>' OnClick="flight_remove_button_Click" />

                                                <script>
                                                    function confirmDelete() {
                                                        return confirm("Are you sure you want to delete this flight?");
                                                    }
                                                </script>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            <%
                                Session["searchFlightAvailable"] = null;
                        }
                        else
                        {
                            if (Session["flightAvailable"] != null && (bool)Session["flightAvailable"]) // If there is record available
                            {
                                %>
                                    <asp:Repeater ID="flight_repeater" runat="server">
                                        <ItemTemplate>
                                            <tr class="data_row">
                                                <td><asp:Label ID="flight_id_value" runat="server" Text='<%# Eval("flight_id") %>'></asp:Label></td>
                                                <td><asp:Label ID="airplane_id_value" runat="server" Text='<%# Eval("plane_id") %>'></asp:Label></td>
                                                <td><asp:Label ID="departure_time_value" runat="server" Text='<%# Eval("departure_date_time") %>'></asp:Label></td>
                                                <td><asp:Label ID="departure_city_value" runat="server" Text='<%# Eval("departure_city") %>'></asp:Label></td>
                                                <td><asp:Label ID="destination_city_value" runat="server" Text='<%# Eval("destination_city") %>'></asp:Label></td>
                                                <td><asp:Label ID="duration_value" runat="server" Text='<%# Eval("duration") %>'></asp:Label></td>
                                                <td><asp:Label ID="economy_price_value" runat="server" Text='<%# Eval("economy_price") %>'></asp:Label></td>
                                                <td><asp:Label ID="premium_economy_price_value" runat="server" Text='<%# Eval("premium_economy_price") %>'></asp:Label></td>
                                                <td><asp:Label ID="business_price_value" runat="server" Text='<%# Eval("business_price") %>'></asp:Label></td>
                                                <td><asp:Label ID="first_class_price_value" runat="server" Text='<%# Eval("first_class_price") %>'></asp:Label></td>
                                                <td class="btn_section">
                                                    <asp:Button ID="flight_modify_button" class="btn modify fa" runat="server" Text="&#xf013;" CommandArgument='<%# Eval("flight_id") %>' OnClick="flight_modify_button_Click" />
                                                    <asp:Button ID="flight_remove_button" class="btn delete fa" runat="server" Text="&#xf014;" CommandArgument='<%# Eval("flight_id") %>' OnClick="flight_remove_button_Click" />

                                                    <script>
                                                        function confirmDelete() {
                                                            return confirm("Are you sure you want to delete this flight?");
                                                        }
                                                    </script>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                <%
                            }
                            else // If there is no record available
                            {
                                %>
                                    <tr class="data_row">
                                        <td colspan="12" style="text-align:center;">No Record Available</td>
                                    </tr>
                                <%
                            }
                        }
                    %>
                </table>  
        </div>
    </div>
</asp:Content>