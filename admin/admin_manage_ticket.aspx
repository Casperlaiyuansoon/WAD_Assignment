<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin_manage_ticket.aspx.cs" Inherits="WAD_Assignment.admin.admin_manage_ticket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="admin_manage_ticket.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <title>Tarfly | Admin Manage Ticket</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <h1 style="color: white;">BOOKED FLIGHT MANAGEMENT</h1>

        <hr />
        <br />

        <div class="inner-container">
            <form>

                <h2 class="section">Search Ticket</h2>

                    <div class="search-section">
                        <asp:TextBox ID="search_user" runat="server" class="search_user_field" placeholder="Enter a username..."></asp:TextBox>
                        <asp:Button ID="search_user_btn" runat="server" class="search_user_button fa" Text="&#xf002;" />
                    </div>

                <h2 class="section">Existing Booking</h2>

                <table>

                    <!-- TITLE -->
                    <tr class="data_section">
                        <th style="visibility: hidden"></th>
                        <th colspan="2">Customer</th>
                        <th colspan="5">Flight</th>
                    </tr>
                    <!-- END TITLE -->

                    <!-- HEAD -->
                    <tr class="data_header">
                        <th>Booking ID</th>
                        <th>Customer ID</th>
                        <th>Customer Name</th>
                        <th>Departure Flight</th>
                        <th>Departure Date Time</th>
                        <th>Departure City</th>
                        <th>Cabin Class Price</th>
                        <th>Return Flight</th>
                        <th>Cabin Class</th>
                        <th>Action</th>
                    </tr>
                    <!-- END HEAD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td>
                            <asp:Label ID="booked_id_value" runat="server" Text="1"></asp:Label></td>
                        <td>
                            <asp:Label ID="user_id_value" runat="server" Text="2"></asp:Label></td>
                        <td>
                            <asp:Label ID="user_name_value" runat="server" Text="Marcus"></asp:Label></td>
                        <td>
                            <asp:Label ID="departure_flight_id_value" runat="server" Text="3"></asp:Label></td>
                        <td>
                            <asp:Label ID="departure_date_time_value" runat="server" Text="3/4/2034 08:00:00"></asp:Label></td>
                        <td>
                            <asp:Label ID="departure_city_value" runat="server" Text="Kuala Lumpur"></asp:Label></td>
                        <td>
                            <asp:Label ID="cabin_class_price_value" runat="server" Text="RM 200.00"></asp:Label></td>
                        <td>
                            <asp:Label ID="return_flight_id_value" runat="server" Text="4"></asp:Label></td>
                        <td>
                            <asp:Label ID="cabin_class_value" runat="server" Text="Business"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="user_delete1" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="2"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="3"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Casper"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="5"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label13" runat="server" Text="5/4/2034 14:00:00"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label14" runat="server" Text="Tokyo"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label15" runat="server" Text="RM 100.00"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label16" runat="server" Text="6"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label17" runat="server" Text="Premium Economy"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button1" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="3"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="5"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Adam"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="7"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label18" runat="server" Text="10/4/2034 09:00:00"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label19" runat="server" Text="Bangkok"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label20" runat="server" Text="RM 70.00"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label21" runat="server" Text="8"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label22" runat="server" Text="Economy"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button2" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="4"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="6"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="Abu"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="9"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label23" runat="server" Text="10/4/2034 09:30:00"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label24" runat="server" Text="Kuala Lumpur"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label25" runat="server" Text="RM 250.00"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label26" runat="server" Text="10"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label27" runat="server" Text="First Class"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button3" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->
                </table>
            </form>
        </div>
    </div>
</asp:Content>
