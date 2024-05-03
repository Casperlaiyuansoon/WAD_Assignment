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
    <div class="container">

        <h1 style="color: white;">FOOD MANAGEMENT</h1>

        <hr class="title" />
        <br />

        <div class="inner-container">
            <form>

                <h2 class="section">Add Food</h2>

                <button type="button" id="add_food_btn" class="add_btn" onclick="displayForm()">+ Add New Food</button>

                <div id="add_food_form_id" class="add_food_form">

                    <h3 class="title-pi">Food Info</h3>

                    <div class="flex-form">

                        <!-- SECOND ROW -->
                        <div class="inner-flex-form">

                            <div class="inner-flex-content">
                                <span>Name :</span>
                                <!-- register password -->
                                <br />
                                <div class="inputField">
                                    <asp:TextBox ID="food_name" class="textField" runat="server" placeholder="e.g. Nasi Lemak" TextMode="Number"></asp:TextBox><br />
                                </div>
                            </div>

                            <br />

                            <div class="inner-flex-content">
                                <span>Price :</span>
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
                        <asp:Button ID="add_food_submit" class="register_submit" runat="server" Text="Add" />
                    </div>
                </div>

                <br />
                <h2 class="section">Existing Food</h2>

                <div class="search-section">
                    <asp:TextBox ID="search_food" runat="server" class="search_user_field" placeholder="Enter a food..."></asp:TextBox>
                    <asp:Button ID="search_food_btn" runat="server" class="search_user_button fa" Text="&#xf002;" />
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

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td>
                            <asp:Label ID="food_id_value" runat="server" Text="1"></asp:Label></td>
                        <td>
                            <asp:Label ID="food_name_value" runat="server" Text="Nasi Lemak"></asp:Label></td>
                        <td>
                            <asp:Label ID="food_price_value" runat="server" Text="RM 8.00"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="food_modify1" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="food_delete1" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="2"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Spaghetti Bolognese"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="RM 15.00"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button1" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="Button2" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="3"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Spaghetti Aglio e Olio"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="RM 16.00"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button3" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="Button4" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                </table>
            </form>
        </div>
    </div>
</asp:Content>
