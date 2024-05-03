<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin_manage_plane.aspx.cs" Inherits="WAD_Assignment.admin.admin_manage_plane" EnableViewState="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Tarfly | Admin Plane Management</title>
    <link rel="stylesheet" href="admin_manage_plane.css" />
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

    <h1 style="color:white;">PLANE MANAGEMENT</h1>

    <hr class="title" />
    <br />

        <div class="inner-container">
            <form>

                <h2 class="section">Add Plane</h2>

                <button type="button" id="add_flight_btn" class="add_btn" onclick="displayForm()">+ Add New Plane</button>

                <div id="add_flight_form_id" class="add_flight_form">

                    <h3 class="title-pi">Flight Info</h3>

                    <div class="flex-form">

                        <!-- FIRST ROW -->
                        <div class="inner-flex-form">
                            <div class="inner-flex-content">
                                <span>Economy Seat Capacity:</span>
                                <!-- register name -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="eco_seat_qty" class="textField" runat="server" TextMode="Number" placeholder="e.g. 500"></asp:TextBox><br />
                                </div>
                            </div>

                            <br />

                            <div class="inner-flex-content">
                                <span>Premium Economy Seat Capacity:</span>
                                <!-- register name -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="pre_eco_seat_qty" class="textField" runat="server" TextMode="Number" placeholder="e.g. 200"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                        <!-- END FIRST ROW -->

                        <br />

                        <!-- SECOND ROW -->
                        <div class="inner-flex-form">
                            <div class="inner-flex-content">
                                <span>Business Class Capacity :</span>
                                <!-- register password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="buss_seat_qty" class="textField" runat="server" TextMode="Number" placeholder="e.g. 100"></asp:TextBox><br />
                                </div>
                            </div>

                            <br />

                            <div class="inner-flex-content">
                                <span>First Class Capacity :</span>
                                <!-- register confirm password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="fclass_seat_qty" class="textField" runat="server" TextMode="Number" placeholder="e.g. 50"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                        <!-- END SECOND ROW -->

                    </div>

                    <div class="inputField">
                        <asp:Button ID="add_plane_submit" class="register_submit" runat="server" Text="Add" />
                    </div>
                </div>

                <br />
                <h2 class="section">Existing Flight</h2>

                <div class="search-section">
                    <asp:TextBox ID="search_plane" runat="server" class="search_user_field" placeholder="Enter a plane ID..."></asp:TextBox>
                    <asp:Button ID="search_plane_btn" runat="server" class="search_user_button fa" Text="&#xf002;" />
                </div>

                <br />

                <table>
                    <!-- HEAD -->
                    <tr class="data_header">
                        <th>ID</th>
                        <th>Economy Capacity</th>
                        <th>Premium Economy Capacity</th>
                        <th>Business Capacity</th>
                        <th>First Class Capacity</th>
                        <th>Action</th>
                    </tr>
                    <!-- END HEAD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="flight_id_value" runat="server" Text="1"></asp:Label></td>
                        <td><asp:Label ID="departure_time_value" runat="server" Text="300"></asp:Label></td>
                        <td><asp:Label ID="airplane_id_value" runat="server" Text="200"></asp:Label></td>
                        <td><asp:Label ID="departure_city_value" runat="server" Text="100"></asp:Label></td>
                        <td><asp:Label ID="destination_city_value" runat="server" Text="50"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="user_modify1" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="user_delete1" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="Label1" runat="server" Text="2"></asp:Label></td>
                        <td><asp:Label ID="Label2" runat="server" Text="300"></asp:Label></td>
                        <td><asp:Label ID="Label3" runat="server" Text="200"></asp:Label></td>
                        <td><asp:Label ID="Label4" runat="server" Text="100"></asp:Label></td>
                        <td><asp:Label ID="Label5" runat="server" Text="50"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button1" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="Button2" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="Label6" runat="server" Text="4"></asp:Label></td>
                        <td><asp:Label ID="Label7" runat="server" Text="300"></asp:Label></td>
                        <td><asp:Label ID="Label8" runat="server" Text="200"></asp:Label></td>
                        <td><asp:Label ID="Label9" runat="server" Text="100"></asp:Label></td>
                        <td><asp:Label ID="Label10" runat="server" Text="50"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button3" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="Button4" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="Label11" runat="server" Text="5"></asp:Label></td>
                        <td><asp:Label ID="Label12" runat="server" Text="300"></asp:Label></td>
                        <td><asp:Label ID="Label13" runat="server" Text="200"></asp:Label></td>
                        <td><asp:Label ID="Label14" runat="server" Text="100"></asp:Label></td>
                        <td><asp:Label ID="Label15" runat="server" Text="50"></asp:Label></td>
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
