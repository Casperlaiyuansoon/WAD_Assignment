<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin_manage_food.aspx.cs" Inherits="WAD_Assignment.admin.admin_manage_food" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Tarfly | Admin Food Management</title>
    <link rel="stylesheet" href="admin_manage_food.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script>
        function displayForm() {
            var btn = document.getElementById("add_food_btn");
            var form = document.getElementById("add_food_form_id");

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
            if (Session["foodAdded"] != null && (bool)Session["foodAdded"]) // Added flight
            {
                %>
                    <script>alert("New food added successfully");</script>
                <%
                Session["foodAdded"] = null;
            }

            if (Session["foodDeleted"] != null && (bool)Session["foodDeleted"]) // Deleted flight
            {
                %>
                    <script>alert("Food successfully deleted");</script>
                <%
                Session["foodDeleted"] = null;
            }

            if (Session["foodModified"] != null && (bool)Session["foodModified"]) // Modified flight
            {
                %>
                    <script>alert("Food successfully modified");</script>
                <%
                Session["foodModified"] = null;
            }

            if (Request.QueryString["fId"] != null) // If data if found and appear in the address bar
            {
                %>
                    <div class="show-food-info">
                        <div class="inner-food-info">

                            <div style="text-align:right;">
                                <button type="button" class="fa fa-close" style="color:red" onClick="window.location.href='admin_manage_food.aspx'"></button><br />
                            </div>

                            <!-- Food ID -->
                            <asp:Label ID="Label1" runat="server" Text="Food ID"></asp:Label>
                            <br />
                            <asp:TextBox runat="server" ID="food_id_modify" Text="" ReadOnly="true"></asp:TextBox><br><br />

                            <!-- Food Name -->
                            <asp:Label ID="Label2" runat="server" Text="Food Name"></asp:Label>
                            <asp:RequiredFieldValidator ID="food_name_required" runat="server" ErrorMessage="Food name is required" Text="*" ForeColor="Red" ControlToValidate="food_name_modify" ValidationGroup="food_modify_validation"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox runat="server" ID="food_name_modify" Text=""></asp:TextBox><br><br />

                            <!-- Food Price -->
                            <asp:Label ID="Label3" runat="server" Text="Food Price"></asp:Label>
                            <asp:RequiredFieldValidator ID="food_price_required" runat="server" ErrorMessage="Food price is required" Text="*" ForeColor="Red" ControlToValidate="food_price_modify" ValidationGroup="food_modify_validation"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox runat="server" ID="food_price_modify" Text=""></asp:TextBox><br><br />

                            <asp:Button ID="save_modify_btn" class="save_btn" runat="server" Text="Save" OnClick="save_modify_btn_Click" ValidationGroup="food_modify_validation" />

                        </div>
                    </div>
                <%
            }
        %>
    <div class="container">

        <h1 style="color: white;">FOOD MANAGEMENT</h1>

        <hr class="title" />
        <br />

        <div class="inner-container">

                <h2 class="section">Add Food</h2>

                <button type="button" id="add_food_btn" class="add_btn" onclick="displayForm()">+ Add New Food</button>

                <div id="add_food_form_id" class="add_food_form">

                    <h3 class="title-pi">Food Info</h3>

                    <div class="flex-form">

                        <!-- SECOND ROW -->
                        <div class="inner-flex-form">

                            <div class="inner-flex-content">
                                <span>Name :
                                    <asp:RequiredFieldValidator ID="add_food_name_required" runat="server" ErrorMessage="Food name is required" Text="*" ForeColor="Red" ControlToValidate="food_name" ValidationGroup="add_food_validation"></asp:RequiredFieldValidator>
                                </span>
                                <!-- register password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="food_name" class="textField" runat="server" placeholder="e.g. Nasi Lemak"></asp:TextBox><br />
                                </div>
                            </div>

                            <br />

                            <div class="inner-flex-content">
                                <span>Price :
                                    <asp:RequiredFieldValidator ID="add_food_price_required" runat="server" ErrorMessage="Food price is required" Text="*" ForeColor="Red" ControlToValidate="food_price" ValidationGroup="add_food_validation"></asp:RequiredFieldValidator>
                                </span>
                                <!-- register confirm password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="food_price" class="textField" runat="server" placeholder="e.g. 20" TextMode="Number"></asp:TextBox><br />
                                </div>
                            </div>
                        </div>
                        <!-- END SECOND ROW -->

                    </div>

                    <div class="inputField">
                        <asp:Button ID="add_food_submit" class="register_submit" runat="server" Text="Add"  OnClick="add_food_submit_Click" ValidationGroup="add_food_validation" />
                    </div>
                </div>

                <br />
                <h2 class="section">Existing Food</h2>

                <div class="search-section">
                    <asp:TextBox ID="search_food" runat="server" class="search_user_field" placeholder="Enter a food name..."></asp:TextBox>
                    <asp:Button ID="search_food_btn" runat="server" class="search_user_button fa" Text="&#xf002;" OnClick="search_food_btn_Click" />
                </div>
                <br />

                <table>
                    <!-- HEAD -->
                    <tr class="data_header">
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                    <!-- END HEAD -->

                    <%
                        if (Session["searchFoodAvailable"] != null && (bool)Session["searchFoodAvailable"]) // If searched record is avaibale
                        {
                            %>
                                <asp:Repeater ID="search_food_repeater" runat="server">
                                    <ItemTemplate>
                                        <tr class="data_row">
                                            <td><asp:Label ID="food_id_value" runat="server" Text='<%# Eval("food_id") %>'></asp:Label></td>
                                            <td><asp:Label ID="food_name_value" runat="server" Text='<%# Eval("food_name") %>'></asp:Label></td>
                                            <td><asp:Label ID="food_price_value" runat="server" Text='<%# Eval("price") %>'></asp:Label></td>
                                            <td class="btn_section">
                                                <asp:Button ID="food_modify_button" class="btn modify fa" runat="server" Text="&#xf013;" CommandArgument='<%# Eval("food_id") %>' OnClick="food_modify_button_Click" />
                                                <asp:Button ID="food_remove_button" class="btn delete fa" runat="server" Text="&#xf014;" CommandArgument='<%# Eval("food_id") %>' OnClick="food_remove_button_Click" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            <%
                                Session["searchFoodAvailable"] = null;
                        }
                        else
                        {
                            if (Session["foodAvailable"] != null && (bool)Session["foodAvailable"]) // If there is record available
                            {
                                %>
                                    <asp:Repeater ID="food_repeater" runat="server">
                                        <ItemTemplate>
                                            <tr class="data_row">
                                                <td><asp:Label ID="food_id_value" runat="server" Text='<%# Eval("food_id") %>'></asp:Label></td>
                                                <td><asp:Label ID="food_name_value" runat="server" Text='<%# Eval("food_name") %>'></asp:Label></td>
                                                <td><asp:Label ID="food_price_value" runat="server" Text='<%# Eval("price") %>'></asp:Label></td>
                                                <td class="btn_section">
                                                    <asp:Button ID="food_modify_button" class="btn modify fa" runat="server" Text="&#xf013;" CommandArgument='<%# Eval("food_id") %>' OnClick="food_modify_button_Click" />
                                                    <asp:Button ID="food_remove_button" class="btn delete fa" runat="server" Text="&#xf014;" CommandArgument='<%# Eval("food_id") %>' OnClick="food_remove_button_Click" />
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
                                        <td colspan="4" style="text-align:center;">No Record Available</td>
                                    </tr>
                                <%
                            }
                        }
                    %>

                </table>
        </div>
    </div>
</asp:Content>
