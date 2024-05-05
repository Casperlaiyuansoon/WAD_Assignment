<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin_manage_ticket.aspx.cs" Inherits="WAD_Assignment.admin.admin_manage_ticket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="admin_manage_ticket.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <title>Tarfly | Admin Manage Ticket</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        if (Session["ticketDeleted"] != null && (bool)Session["ticketDeleted"]) // Deleted ticket
        {
            %>
                <script>alert("Ticket successfully deleted");</script>
            <%
            Session["ticketDeleted"] = null;
        }
    %>

    <div class="container">

        <h1 style="color: white;">BOOKED FLIGHT MANAGEMENT</h1>

        <hr />
        <br />

        <div class="inner-container">

                <h2 class="section">Existing Booking</h2>

                <div class="search-section">
                    <asp:TextBox ID="search_ticket" runat="server" class="search_user_field" placeholder="Enter a ticket ID..." TextMode="Number"></asp:TextBox>
                    <asp:Button ID="search_ticket_btn" runat="server" class="search_user_button fa" Text="&#xf002;" OnClick="search_ticket_btn_Click" />
                </div>
                    
                <br />

                <table>

                    <!-- HEAD -->
                    <tr class="data_header">
                        <th>Booking ID</th>
                        <th>Customer ID</th>
                        <th>Departure Flight</th>
                        <th>Return Flight</th>
                        <th>Departure Cabin Class</th>
                        <th>Return Cabin Class</th>
                        <th>Action</th>
                    </tr>
                    <!-- END HEAD -->

                    <%
                        if (Session["searchTicketAvailable"] != null && (bool)Session["searchTicketAvailable"]) // If searched record is avaibale
                        {
                            %>
                                <asp:Repeater ID="search_ticket_repeater" runat="server">
                                    <ItemTemplate>
                                        <!-- DATA FIELD -->
                                        <tr class="data_row">
                                            <td><asp:Label ID="booked_id_value" runat="server" Text='<%# Eval("booking_id") %>'></asp:Label></td>
                                            <td><asp:Label ID="user_id_value" runat="server" Text='<%# Eval("customer_id") %>'></asp:Label></td>
                                            <td><asp:Label ID="departure_flight_value" runat="server" Text='<%# Eval("departure_flight") %>'></asp:Label></td>
                                            <td><asp:Label ID="return_flight_value" runat="server" Text='<%# Eval("return_flight") %>'></asp:Label></td>
                                            <td><asp:Label ID="departure_cabin_class_value" runat="server" Text='<%# Eval("departure_cabin_class") %>'></asp:Label></td>
                                            <td><asp:Label ID="return_cabin_class_value" runat="server" Text='<%# Eval("return_cabin_class") %>'></asp:Label></td>
                                            <td class="btn_section">
                                                <asp:Button ID="ticket_remove_button" class="btn delete fa" runat="server" Text="&#xf014;" CommandArgument='<%# Eval("booking_id") %>' OnClick="ticket_remove_button_Click" />
                                            </td>
                                        </tr>
                                        <!-- END DATA FIELD -->
                                    </ItemTemplate>
                                </asp:Repeater>
                            <%
                                Session["searchTicketAvailable"] = null;
                        }
                        else
                        {
                            if (Session["ticketAvailable"] != null && (bool)Session["ticketAvailable"]) // If there is record available
                            {
                                %>
                                    <asp:Repeater ID="ticket_repeater" runat="server">
                                        <ItemTemplate>
                                            <!-- DATA FIELD -->
                                            <tr class="data_row">
                                                <td><asp:Label ID="booked_id_value" runat="server" Text='<%# Eval("booking_id") %>'></asp:Label></td>
                                                <td><asp:Label ID="user_id_value" runat="server" Text='<%# Eval("customer_id") %>'></asp:Label></td>
                                                <td><asp:Label ID="departure_flight_value" runat="server" Text='<%# Eval("departure_flight") %>'></asp:Label></td>
                                                <td><asp:Label ID="return_flight_value" runat="server" Text='<%# Eval("return_flight") %>'></asp:Label></td>
                                                <td><asp:Label ID="departure_cabin_class_value" runat="server" Text='<%# Eval("departure_cabin_class") %>'></asp:Label></td>
                                                <td><asp:Label ID="return_cabin_class_value" runat="server" Text='<%# Eval("return_cabin_class") %>'></asp:Label></td>
                                                <td class="btn_section">
                                                    <asp:Button ID="ticket_remove_button" class="btn delete fa" runat="server" Text="&#xf014;" CommandArgument='<%# Eval("booking_id") %>' OnClick="ticket_remove_button_Click" />
                                                </td>
                                            </tr>
                                            <!-- END DATA FIELD -->
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
