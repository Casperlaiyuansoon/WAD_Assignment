<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin_manage_flight.aspx.cs" Inherits="WAD_Assignment.admin.admin_manage_flight" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Tarfly | Admin Flight Management</title>
    <link rel="stylesheet" href="admin_manage_flight.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

    <script>
        function displayForm() {
            var btn = document.getElementById("add_flight_btn");
            var form = document.getElementById("add_flight_form_id");

            if (form.style.display === "none" || form.style.display === "") {
                form.style.display = "block";
            }
            else {
                form.style.display = "none";
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                                <span>Departure Date Time:</span>
                                <!-- register name -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="departure_date" class="textField" runat="server" TextMode="DateTimeLocal"></asp:TextBox><br />
                                </div>
                            </div>

                            <br />

                            <div class="inner-flex-content">
                                <span>Airplane ID:</span>
                                <!-- register name -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="airplane_id" class="textField" runat="server" placeholder="e.g. 2"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                        <!-- END FIRST ROW -->

                        <br />

                        <!-- SECOND ROW -->
                        <div class="inner-flex-form">
                            <div class="inner-flex-content">
                                <span>Departure City :</span>
                                <!-- register password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="departure_city" class="textField" runat="server" placeholder="e.g. Kuala Lumpur"></asp:TextBox><br />
                                </div>
                            </div>

                            <br />

                            <div class="inner-flex-content">
                                <span>Destination City :</span>
                                <!-- register confirm password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="route" class="textField" runat="server" placeholder="e.g. Tokyo"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                        <!-- END SECOND ROW -->

                        <br />

                        <!-- THIRD ROW -->
                        <div class="inner-flex-form">
                            <div class="inner-flex-content">
                                <span>Duration :</span>
                                <!-- register confirm password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="duration" class="textField" runat="server" TextMode="Number" placeholder="e.g. 0800"></asp:TextBox><br />
                                </div>
                            </div>

                            <br />

                            <div class="inner-flex-content">
                                <span>Economy Price :</span>
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
                                <span>Premium Economy Price :</span>
                                <!-- register confirm password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="pre_eco_price" class="textField" runat="server" TextMode="Number" placeholder="300"></asp:TextBox><br />
                                </div>
                            </div>

                            <br />

                            <div class="inner-flex-content">
                                <span>Business Price :</span>
                                <!-- register confirm password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="buss_price" class="textField" runat="server" TextMode="Number" placeholder="500"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                        <!-- END THIRD ROW -->

                        <!-- THIRD ROW -->
                        <div class="inner-flex-form">
                            <div class="inner-flex-content">
                                <span>First Class Price :</span>
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
                        <asp:Button ID="add_flight_submit" class="register_submit" runat="server" Text="Add" OnClick="add_flight_submit_Click" />
                    </div>
                </div>

                <br />
                <h2 class="section">Existing Flight</h2>

                <div class="search-section">
                    <asp:TextBox ID="search_flight" runat="server" class="search_user_field" placeholder="Enter a flight..."></asp:TextBox>
                    <asp:Button ID="search_flight_btn" runat="server" class="search_user_button fa" Text="&#xf002;" />
                </div>

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
                        if (Session["flightAvailable"] != null && (bool)Session["flightAvailable"])
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
                                                <asp:Button ID="flight_modify_button" class="btn modify fa" runat="server" Text="&#xf013;" />
                                                <asp:Button ID="flight_remove_button" class="btn delete fa" runat="server" Text="&#xf014;" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            <%
                        }
                        else
                        {
                            %>
                                <tr class="data_row">
                                    <td colspan="12" style="text-align:center;">No Record Available</td>
                                </tr>
                            <%
                        }
                    %>
                </table>  
        </div>
    </div>
</asp:Content>