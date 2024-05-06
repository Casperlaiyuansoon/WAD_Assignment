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

    <%
        if (Session["planeAdded"] != null && (bool)Session["planeAdded"]) // Added flight
        {
            %>
                <script>alert("New plane added successfully");</script>
            <%
            Session["planeAdded"] = null;
        }

        if (Session["planeDeleted"] != null && (bool)Session["planeDeleted"]) // Deleted flight
        {
            %>
                <script>alert("Plane successfully deleted");</script>
            <%
            Session["planeDeleted"] = null;
        }

        if (Session["planeModified"] != null && (bool)Session["planeModified"]) // Modified flight
        {
            %>
                <script>alert("Plane successfully modified");</script>
            <%
            Session["planeModified"] = null;
        }

        if (Request.QueryString["pId"] != null) // If data if found and appear in the address bar
        {
            %>
                <div class="show-plane-info">
                    <div class="inner-plane-info">

                        <div style="text-align:right;">
                            <button type="button" class="fa fa-close" style="color:red" onClick="window.location.href='admin_manage_plane.aspx'"></button><br />
                        </div>

                        <!-- Plane ID -->
                        <asp:Label ID="Label1" runat="server" Text="Plane ID"></asp:Label>
                        <br />
                        <asp:TextBox runat="server" ID="plane_id_modify" Text="" ReadOnly="true"></asp:TextBox><br><br />

                        <!-- Economy Seat Capacity -->
                        <asp:Label ID="Label3" runat="server" Text="Economy Seat Quantity"></asp:Label>
                        <asp:RequiredFieldValidator ID="eco_seat_qty_required" runat="server" ErrorMessage="Economy Seat Quantity is required" Text="*" ForeColor="Red" ControlToValidate="eco_seat_qty_modify" ValidationGroup="plane_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="eco_seat_qty_modify" TextMode="Number" Text=""></asp:TextBox><br><br />

                        <!-- Premium Economy Seat Capacity -->
                        <asp:Label ID="Label4" runat="server" Text="Premium Economy Seat Quantity"></asp:Label>
                        <asp:RequiredFieldValidator ID="prem_eco_seat_qty_required" runat="server" ErrorMessage="Premium Economy Seat Quantity is required" Text="*" ForeColor="Red" ControlToValidate="prem_eco_seat_qty_modify" ValidationGroup="plane_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="prem_eco_seat_qty_modify" TextMode="Number" Text=""></asp:TextBox><br><br />

                        <!-- Business Seat Capacity -->
                        <asp:Label ID="Label5" runat="server" Text="Business Seat Quantity"></asp:Label>
                        <asp:RequiredFieldValidator ID="bus_seat_qty_required" runat="server" ErrorMessage="Business Seat Quantity is required" Text="*" ForeColor="Red" ControlToValidate="bus_seat_qty_modify" ValidationGroup="plane_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="bus_seat_qty_modify" TextMode="Number" Text=""></asp:TextBox><br><br />

                        <!-- First Class Seat Capacity -->
                        <asp:Label ID="Label6" runat="server" Text="First Class Seat Quantity"></asp:Label>
                        <asp:RequiredFieldValidator ID="fclass_seat_qty_required" runat="server" ErrorMessage="First Class Seat Quantity is required" Text="*" ForeColor="Red" ControlToValidate="fclass_seat_qty_modify" ValidationGroup="plane_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="fclass_seat_qty_modify" TextMode="Number" Text=""></asp:TextBox><br><br />

                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="plane_modify_validation"/>

                        <asp:Button ID="save_modify_btn" class="save_btn" runat="server" Text="Save" OnClick="save_modify_btn_Click" ValidationGroup="plane_modify_validation" />

                    </div>
                </div>
            <%
        }
    %>
    <div class="container">

    <h1 style="color:white;">PLANE MANAGEMENT</h1>

    <hr class="title" />
    <br />

        <div class="inner-container">

                <h2 class="section">Add Plane</h2>

                <button type="button" id="add_flight_btn" class="add_btn" onclick="displayForm()">+ Add New Plane</button>

                <div id="add_flight_form_id" class="add_flight_form">

                    <h3 class="title-pi">Flight Info</h3>

                    <div class="flex-form">

                        <!-- FIRST ROW -->
                        <div class="inner-flex-form">
                            <div class="inner-flex-content">
                                <span>Economy Seat Capacity:
                                    <asp:RequiredFieldValidator ID="add_eco_seat_qty_required" runat="server" ErrorMessage="Economy Seat Capacity is required" Text="*" ForeColor="Red" ControlToValidate="eco_seat_Qty" ValidationGroup="add_plane_validation"></asp:RequiredFieldValidator>
                                </span>
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="eco_seat_qty" class="textField" runat="server" TextMode="Number" placeholder="e.g. 500"></asp:TextBox><br />
                                </div>
                            </div>

                            <br />

                            <div class="inner-flex-content">
                                <span>Premium Economy Seat Capacity:
                                    <asp:RequiredFieldValidator ID="add_prem_eco_seat_qty_required" runat="server" ErrorMessage="Premium Economy Seat Capacity is required" Text="*" ForeColor="Red" ControlToValidate="pre_eco_seat_qty" ValidationGroup="add_plane_validation"></asp:RequiredFieldValidator>
                                </span>
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
                                <span>Business Class Capacity :
                                    <asp:RequiredFieldValidator ID="add_bus_seat_qty_required" runat="server" ErrorMessage="Business Seat Capacity is required" Text="*" ForeColor="Red" ControlToValidate="bus_seat_qty" ValidationGroup="add_plane_validation"></asp:RequiredFieldValidator>
                                </span>
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="bus_seat_qty" class="textField" runat="server" TextMode="Number" placeholder="e.g. 100"></asp:TextBox><br />
                                </div>
                            </div>

                            <br />

                            <div class="inner-flex-content">
                                <span>First Class Capacity :
                                    <asp:RequiredFieldValidator ID="add_fclass_seat_qty_required" runat="server" ErrorMessage="First Class Seat Capacity is required" Text="*" ForeColor="Red" ControlToValidate="fclass_seat_qty" ValidationGroup="add_plane_validation"></asp:RequiredFieldValidator>
                                </span>
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="fclass_seat_qty" class="textField" runat="server" TextMode="Number" placeholder="e.g. 50"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                        <!-- END SECOND ROW -->

                    </div>

                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="add_plane_validation" />

                    <div class="inputField">
                        <asp:Button ID="add_plane_submit" class="register_submit" runat="server" Text="Add" OnClick="add_plane_submit_Click" ValidationGroup="add_plane_validation"/>
                    </div>
                </div>

                <br />
                <h2 class="section">Existing Flight</h2>

                <div class="search-section">
                    <asp:TextBox ID="search_plane" runat="server" class="search_user_field" TextMode="Number" placeholder="Enter a plane ID..."></asp:TextBox>
                    <asp:Button ID="search_plane_btn" runat="server" class="search_user_button fa" Text="&#xf002;" OnClick="search_plane_btn_Click" />
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

                    <%
                        if (Session["searchPlaneAvailable"] != null && (bool)Session["searchPlaneAvailable"]) // If searched record is avaibale
                        {
                            %>
                                <asp:Repeater ID="search_plane_repeater" runat="server">
                                    <ItemTemplate>
                                        <!-- DATA FIELD -->
                                        <tr class="data_row">
                                            <td><asp:Label ID="plane_id_value" runat="server" Text='<%# Eval("plane_id") %>'></asp:Label></td>
                                            <td><asp:Label ID="economy_seat_qty_value" runat="server" Text='<%# Eval("economy_seat_capacity") %>'></asp:Label></td>
                                            <td><asp:Label ID="premium_economy_seat_qty_value" runat="server" Text='<%# Eval("premium_economy_seat_capacity") %>'></asp:Label></td>
                                            <td><asp:Label ID="business_seat_qty_value" runat="server" Text='<%# Eval("business_seat_capacity") %>'></asp:Label></td>
                                            <td><asp:Label ID="first_class_qty_value" runat="server" Text='<%# Eval("first_class_seat_capacity") %>'></asp:Label></td>
                                            <td class="btn_section">
                                                <asp:Button ID="plane_modify_button" class="btn modify fa" runat="server" Text="&#xf013;" CommandArgument='<%# Eval("plane_id") %>' OnClick="plane_modify_button_Click" />
                                                <asp:Button ID="plane_delete_button" class="btn delete fa" runat="server" Text="&#xf014;" CommandArgument='<%# Eval("plane_id") %>' OnClick="plane_remove_button_Click" />
                                            </td>
                                        </tr>
                                        <!-- END DATA FIELD -->
                                    </ItemTemplate>
                                </asp:Repeater>
                            <%
                                Session["searchPlaneAvailable"] = null;
                        }
                        else
                        {
                            if (Session["planeAvailable"] != null && (bool)Session["planeAvailable"]) // If there is record available
                            {
                                %>
                                    <asp:Repeater ID="plane_repeater" runat="server">
                                        <ItemTemplate>
                                            <!-- DATA FIELD -->
                                            <tr class="data_row">
                                                <td><asp:Label ID="plane_id_value" runat="server" Text='<%# Eval("plane_id") %>'></asp:Label></td>
                                                <td><asp:Label ID="economy_seat_qty_value" runat="server" Text='<%# Eval("economy_seat_capacity") %>'></asp:Label></td>
                                                <td><asp:Label ID="premium_economy_seat_qty_value" runat="server" Text='<%# Eval("premium_economy_seat_capacity") %>'></asp:Label></td>
                                                <td><asp:Label ID="business_seat_qty_value" runat="server" Text='<%# Eval("business_seat_capacity") %>'></asp:Label></td>
                                                <td><asp:Label ID="first_class_qty_value" runat="server" Text='<%# Eval("first_class_seat_capacity") %>'></asp:Label></td>
                                                <td class="btn_section">
                                                    <asp:Button ID="plane_modify_button" class="btn modify fa" runat="server" Text="&#xf013;" CommandArgument='<%# Eval("plane_id") %>' OnClick="plane_modify_button_Click" />
                                                    <asp:Button ID="plane_delete_button" class="btn delete fa" runat="server" Text="&#xf014;" CommandArgument='<%# Eval("plane_id") %>' OnClick="plane_remove_button_Click" />
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
                                        <td colspan="6" style="text-align:center;">No Record Available</td>
                                    </tr>
                                <%
                            }
                        }
                    %>
                </table>
        </div>
    </div>
</asp:Content>