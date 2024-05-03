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
            <form>

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
                        <asp:Button ID="add_flight_submit" class="register_submit" runat="server" Text="Add" />
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
                        <th>Departure Date Time</th>
                        <th>Airplane ID</th>
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

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="flight_id_value" runat="server" Text="1"></asp:Label></td>
                        <td><asp:Label ID="departure_time_value" runat="server" Text="28/3/2024 18:01:00"></asp:Label></td>
                        <td><asp:Label ID="airplane_id_value" runat="server" Text="1"></asp:Label></td>
                        <td><asp:Label ID="departure_city_value" runat="server" Text="Kuala Lumpur"></asp:Label></td>
                        <td><asp:Label ID="destination_city_value" runat="server" Text="Taipei"></asp:Label></td>
                        <td><asp:Label ID="duration_value" runat="server" Text="0800"></asp:Label></td>
                        <td><asp:Label ID="economy_price_value" runat="server" Text="200"></asp:Label></td>
                        <td><asp:Label ID="premium_economy_price_value" runat="server" Text="300"></asp:Label></td>
                        <td><asp:Label ID="business_price_value" runat="server" Text="500"></asp:Label></td>
                        <td><asp:Label ID="first_class_price_value" runat="server" Text="700"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="user_modify1" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="user_delete1" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="Label1" runat="server" Text="2"></asp:Label></td>
                        <td><asp:Label ID="Label2" runat="server" Text="28/3/2024 19:01:00"></asp:Label></td>
                        <td><asp:Label ID="Label3" runat="server" Text="2"></asp:Label></td>
                        <td><asp:Label ID="Label4" runat="server" Text="Taipei"></asp:Label></td>
                        <td><asp:Label ID="Label5" runat="server" Text="Kuala Lumpur"></asp:Label></td>
                        <td><asp:Label ID="Label6" runat="server" Text="0800"></asp:Label></td>
                        <td><asp:Label ID="Label25" runat="server" Text="200"></asp:Label></td>
                        <td><asp:Label ID="Label29" runat="server" Text="300"></asp:Label></td>
                        <td><asp:Label ID="Label30" runat="server" Text="500"></asp:Label></td>
                        <td><asp:Label ID="Label31" runat="server" Text="700"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button1" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="Button2" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="Label7" runat="server" Text="3"></asp:Label></td>
                        <td><asp:Label ID="Label8" runat="server" Text="29/3/2024 18:01:00"></asp:Label></td>
                        <td><asp:Label ID="Label9" runat="server" Text="3"></asp:Label></td>
                        <td><asp:Label ID="Label10" runat="server" Text="Kuala Lumpur"></asp:Label></td>
                        <td><asp:Label ID="Label11" runat="server" Text="German"></asp:Label></td>
                        <td><asp:Label ID="Label12" runat="server" Text="1200"></asp:Label></td>
                        <td><asp:Label ID="Label26" runat="server" Text="200"></asp:Label></td>
                        <td><asp:Label ID="Label32" runat="server" Text="300"></asp:Label></td>
                        <td><asp:Label ID="Label33" runat="server" Text="500"></asp:Label></td>
                        <td><asp:Label ID="Label34" runat="server" Text="700"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button3" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="Button4" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="Label13" runat="server" Text="4"></asp:Label></td>
                        <td><asp:Label ID="Label14" runat="server" Text="29/3/2024 18:05:00"></asp:Label></td>
                        <td><asp:Label ID="Label15" runat="server" Text="4"></asp:Label></td>
                        <td><asp:Label ID="Label16" runat="server" Text="German"></asp:Label></td>
                        <td><asp:Label ID="Label17" runat="server" Text="Kuala Lumpur"></asp:Label></td>
                        <td><asp:Label ID="Label18" runat="server" Text="1200"></asp:Label></td>
                        <td><asp:Label ID="Label27" runat="server" Text="200"></asp:Label></td>
                        <td><asp:Label ID="Label35" runat="server" Text="300"></asp:Label></td>
                        <td><asp:Label ID="Label36" runat="server" Text="500"></asp:Label></td>
                        <td><asp:Label ID="Label37" runat="server" Text="700"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button5" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="Button6" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->
                </table>
            </form>
        </div>
    </div>
</asp:Content>
