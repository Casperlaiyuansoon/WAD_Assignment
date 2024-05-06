<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin_manage_user.aspx.cs" Inherits="WAD_Assignment.admin.admin_manage_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Tarfly | Admin</title>
    <link rel="stylesheet" href="admin_manage_user.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

    <script>
        function displayForm() {
            var btn = document.getElementById("add_user_btn");
            var form = document.getElementById("add_user_form_id");

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
        if (Session["userAdded"] != null && (bool)Session["userAdded"]) // Added user
        {
            %>
                <script>alert("New user added successfully");</script>
            <%
            Session["userAdded"] = null;
        }

        if (Session["userDeleted"] != null && (bool)Session["userDeleted"]) // Deleted user
        {
            %>
                <script>alert("User successfully deleted");</script>
            <%
            Session["userDeleted"] = null;
        }

        if (Session["userModified"] != null && (bool)Session["userModified"]) // Modified user
        {
            %>
                <script>alert("User successfully modified");</script>
            <%
            Session["userModified"] = null;
        }

        if (Request.QueryString["uId"] != null) // If data if found and appear in the address bar
        {
            %>
                <div class="show-user-info">
                    <div class="inner-user-info">

                        <div style="text-align:right;">
                            <button type="button" class="fa fa-close" style="color:red" onClick="window.location.href='admin_manage_user.aspx'"></button><br />
                        </div>

                        <!-- Customer ID -->
                        <asp:Label ID="Label1" runat="server" Text="Customer ID"></asp:Label>
                        <br />
                        <asp:TextBox runat="server" ID="customer_id_modify" Text="" ReadOnly="true"></asp:TextBox><br><br />

                        <!-- Customer Name -->
                        <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
                        <asp:RequiredFieldValidator ID="customer_name_required" runat="server" ErrorMessage="Name is required" Text="*" ForeColor="Red" ControlToValidate="customer_name_modify" ValidationGroup="customer_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="customer_name_modify" Text=""></asp:TextBox><br><br />

                        <!-- Customer Email -->
                        <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
                        <asp:RequiredFieldValidator ID="customer_email_required" runat="server" ErrorMessage="Email is required" Text="*" ForeColor="Red" ControlToValidate="customer_email_modify" ValidationGroup="customer_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="customer_email_modify" Text=""></asp:TextBox><br><br />

                        <!-- Password -->
                        <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
                        <asp:RequiredFieldValidator ID="customer_password_required" runat="server" ErrorMessage="Password is required" Text="*" ForeColor="Red" ControlToValidate="customer_password_modify" ValidationGroup="customer_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="customer_password_modify" Text=""></asp:TextBox><br><br />

                        <!-- Phone -->
                        <asp:Label ID="Label5" runat="server" Text="Phone No"></asp:Label>
                        <asp:RequiredFieldValidator ID="customer_phone_required" runat="server" ErrorMessage="Phone is required" Text="*" ForeColor="Red" ControlToValidate="customer_phone_modify" ValidationGroup="customer_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="customer_phone_modify" Text=""></asp:TextBox><br><br />

                        <!-- Address 1 -->
                        <asp:Label ID="Label6" runat="server" Text="Address 1"></asp:Label>
                        <asp:RequiredFieldValidator ID="customer_address1_required" runat="server" ErrorMessage="Address 1 is required" Text="*" ForeColor="Red" ControlToValidate="customer_address1_modify" ValidationGroup="customer_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="customer_address1_modify" Text=""></asp:TextBox><br><br />

                        <!-- Address 2 -->
                        <asp:Label ID="Label7" runat="server" Text="Adress 2"></asp:Label>
                        <asp:RequiredFieldValidator ID="customer_address2_required" runat="server" ErrorMessage="Address 2 is required" Text="*" ForeColor="Red" ControlToValidate="customer_address2_modify" ValidationGroup="customer_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="customer_address2_modify" Text=""></asp:TextBox><br><br />

                        <!-- City -->
                        <asp:Label ID="Label8" runat="server" Text="City"></asp:Label>
                        <asp:RequiredFieldValidator ID="customer_city_required" runat="server" ErrorMessage="City is required" Text="*" ForeColor="Red" ControlToValidate="customer_city_modify" ValidationGroup="customer_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="customer_city_modify" Text=""></asp:TextBox><br><br />

                        <!-- State -->
                        <asp:Label ID="Label9" runat="server" Text="State"></asp:Label>
                        <asp:RequiredFieldValidator ID="customer_state_required" runat="server" ErrorMessage="State is required" Text="*" ForeColor="Red" ControlToValidate="customer_state_modify" ValidationGroup="customer_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="customer_state_modify" Text=""></asp:TextBox><br><br />

                        <!-- Country -->
                        <asp:Label ID="Label10" runat="server" Text="Country"></asp:Label>
                        <asp:RequiredFieldValidator ID="customer_country_required" runat="server" ErrorMessage="Country is required" Text="*" ForeColor="Red" ControlToValidate="customer_country_modify" ValidationGroup="customer_modify_validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox runat="server" ID="customer_country_modify" Text=""></asp:TextBox><br><br />

                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="customer_modify_validation"/>

                        <asp:Button ID="save_modify_btn" class="save_btn" runat="server" Text="Save" OnClick="save_modify_btn_Click" ValidationGroup="customer_modify_validation" />

                    </div>
                </div>
            <%
        }    
    %>
    <div class="container">

        <h1 style="color:white;">USER MANAGEMENT</h1>

        <hr class="title" />
        <br />

        <div class="inner-container">

                <h2 class="section">Add User</h2>

                <button type="button" id="add_user_btn" class="add_btn" onclick="displayForm()">+ Add New User</button>

                <div id="add_user_form_id" class="add_user_form">

                    <div class="add_user_inner_form">
                        <h3 class="title-pi">Personal Info</h3>

                        <!-- PERSONAL INFORMATION SECTION -->
                        <div class="flex-form">

                            <!-- FIRST ROW -->
                            <div class="inner-flex-form">
                                <div class="inner-flex-content">
                                    <span>Name :
                                        <asp:RequiredFieldValidator ID="name_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Name is required" ControlToValidate="register_name" ValidationGroup="add_user_validation"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="name_regex_validate" runat="server" ErrorMessage="Name can't contain numeric value" ForeColor="Red" Text="*" ControlToValidate="register_name" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="add_user_validation"></asp:RegularExpressionValidator>
                                    </span> <!-- register name --> <br />
                                    <div class="inputField">
                                        <asp:TextBox ID="register_name" class="textField" runat="server" placeholder="contain only alphabet"></asp:TextBox><br />
                                    </div>
                                </div>

                                    <br />

                                <div class="inner-flex-content">
                                    <span>Email :
                                        <asp:RequiredFieldValidator ID="email_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Email is required" ControlToValidate="register_email" ValidationGroup="add_user_validation"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="email_regex_validate" runat="server" ErrorMessage="Invalid email format" ForeColor="Red" Text="*" ControlToValidate="register_email" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" ValidationGroup="add_user_validation"></asp:RegularExpressionValidator>
                                    </span> <!-- register email --> <br />
                                    <div class="inputField">
                                        <asp:TextBox ID="register_email" class="textField" runat="server" placeholder="e.g. user@hotmail.com"></asp:TextBox><br />
                                    </div>
                                </div>
                            </div>
                            <!-- END FIRST ROW -->

                            <!-- SECOND ROW -->
                            <div class="inner-flex-form">

                                <div class="inner-flex-content">
                                    <span>Phone No. :
                                        <asp:RequiredFieldValidator ID="phone_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Phone is required" ControlToValidate="register_phone" ValidationGroup="add_user_validation"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="phone_regex_validate" runat="server" ErrorMessage="Invalid phone format" ForeColor="Red" Text="*" ControlToValidate="register_phone" ValidationExpression="^01[0-9]-\d{7}$" ValidationGroup="add_user_validation"></asp:RegularExpressionValidator>
                                    </span> <!-- register email --> <br />
                                    <div class="inputField">
                                        <asp:TextBox ID="register_phone" class="textField" runat="server" placeholder="e.g. 012-3456789"></asp:TextBox><br />
                                    </div>
                                </div>
    
                                <br />

                                <div class="inner-flex-content">
                                    <span>Password :
                                        <asp:RequiredFieldValidator ID="password_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Password is required" ControlToValidate="register_password" ValidationGroup="add_user_validation"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="password_regex_validate" runat="server" ErrorMessage="Password at least 8 characters long and contain an uppercase" ForeColor="Red" Text="*" ControlToValidate="register_password" ValidationExpression="^(?=.*[A-Z]).{8,}$" ValidationGroup="add_user_validation"></asp:RegularExpressionValidator>
                                    </span> <!-- register password --> <br />
                                    <div class="inputField">
                                        <asp:TextBox ID="register_password" class="textField" runat="server" placeholder="8 characters and an Uppercase" TextMode="Password"></asp:TextBox><br />
                                    </div>
                                </div>
                            </div>
                            <!-- END SECOND ROW -->

                        </div>
                        <!-- END PERSONAL INFORMATION SECTION -->

                        <br />


                        <h3 class="title-address">Address</h3>

                        <!-- ADDRESS SECTION -->
                        <div class="address">
                            <span>Address Line 1 :
                                <asp:RequiredFieldValidator ID="address_one_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Address 1 is required" ControlToValidate="register_address1" ValidationGroup="add_user_validation"></asp:RequiredFieldValidator>
                            </span> <!-- address line 1 --> <br />
                            <div class="inputField">
                                <asp:TextBox ID="register_address1" class="textField" runat="server" placeholder="e.g. No 123, Jalan Bahagia 5"></asp:TextBox><br />
                            </div>

                            <br />

                            <span>Address Line 2 :
                                <asp:RequiredFieldValidator ID="address_two_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Address 2 is required" ControlToValidate="register_address2" ValidationGroup="add_user_validation"></asp:RequiredFieldValidator>
                            </span> <!-- address line 2 --> <br />
                            <div class="inputField">
                                <asp:TextBox ID="register_address2" class="textField" runat="server" placeholder="e.g. Taman Bahagia"></asp:TextBox><br />
                            </div>

                            <br />

                            <span>City :
                                <asp:RequiredFieldValidator ID="city_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="City is required" ControlToValidate="register_city" ValidationGroup="add_user_validation"></asp:RequiredFieldValidator>
                            </span> <!-- city --> <br />
                            <div class="inputField">
                                <asp:TextBox ID="register_city" class="textField" runat="server" placeholder="e.g. Kepong"></asp:TextBox><br />
                            </div>

                            <br />

                            <div class="inner-flex-form">
                                <div class="inner-flex-content">
                                    <span>State :
                                        <asp:RequiredFieldValidator ID="state_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="State is required" ControlToValidate="register_state" ValidationGroup="add_user_validation"></asp:RequiredFieldValidator>
                                    </span> <!-- city --> <br />
                                    <div class="inputField">
                                        <asp:TextBox ID="register_state" class="textField" runat="server" placeholder="e.g. Kuala Lumpur"></asp:TextBox><br />
                                    </div>
                                </div>
        
                                <br />

                                <div class="inner-flex-content">
                                    <span>Country :
                                        <asp:RequiredFieldValidator ID="country_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Country is required" ControlToValidate="register_country" ValidationGroup="add_user_validation"></asp:RequiredFieldValidator>
                                    </span> <!-- city --> <br />
                                    <div class="inputField">
                                        <asp:TextBox ID="register_country" class="textField" runat="server" placeholder="e.g. Malaysia"></asp:TextBox><br />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END ADDRESS SECTION -->
                    </div>

                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="add_user_validation" style="text-align:left"/>

                    <div class="inputField">
                        <asp:Button ID="add_user_submit" class="register_submit" runat="server" Text="Add" OnClick="add_user_submit_Click" ValidationGroup="add_user_validation"/>
                    </div>
                </div>

                <br />
                <h2 class="section">Existing User</h2>

                    <div class="search-section">
                        <asp:TextBox ID="search_user" runat="server" class="search_user_field" placeholder="Enter a username..."></asp:TextBox>
                        <asp:Button ID="search_user_btn" runat="server" class="search_user_button fa" Text="&#xf002;" Onclick="search_user_btn_Click"/>
                    </div>
                <br />

                <table>
                    <!-- HEAD -->
                    <tr class="data_header">
                        <th>ID</th>
                        <th>Username</th>
                        <th>E-mail</th>
                        <th>Password</th>
                        <th>Phone No.</th>
                        <th>Address 1</th>
                        <th>Address 2</th>
                        <th>City</th>
                        <th>State</th>
                        <th>Country</th>
                        <th>Action</th>
                    </tr>
                    <!-- END HEAD -->

                    <%
                        if (Session["searchUserAvailable"] != null && (bool)Session["searchUserAvailable"]) // If searched record is avaibale
                        {
                            %>
                                <asp:Repeater ID="search_user_repeater" runat="server">
                                    <ItemTemplate>
                                        <tr class="data_row">
                                            <td><asp:Label ID="user_id_value" runat="server" Text='<%# Eval("customer_id") %>'></asp:Label></td>
                                            <td><asp:Label ID="username_value" runat="server" Text='<%# Eval("name") %>'></asp:Label></td>
                                            <td><asp:Label ID="user_email_value" runat="server" Text='<%# Eval("email") %>'></asp:Label></td>
                                            <td><asp:Label ID="user_password_value" runat="server" Text='<%# Eval("password") %>'></asp:Label></td>
                                            <td><asp:Label ID="user_phone_value" runat="server" Text='<%# Eval("phone_number") %>'></asp:Label></td>
                                            <td><asp:Label ID="user_address1_value" runat="server" Text='<%# Eval("address_line_1") %>'></asp:Label></td>
                                            <td><asp:Label ID="user_address2_value" runat="server" Text='<%# Eval("address_line_2") %>'></asp:Label></td>
                                            <td><asp:Label ID="user_city_value" runat="server" Text='<%# Eval("city") %>'></asp:Label></td>
                                            <td><asp:Label ID="user_state_value" runat="server" Text='<%# Eval("state") %>'></asp:Label></td>
                                            <td><asp:Label ID="user_country_value" runat="server" Text='<%# Eval("country") %>'></asp:Label></td>
                    
                                            <td class="btn_section">
                                                <asp:Button ID="user_modify_button" class="btn modify fa" runat="server" Text="&#xf013;" CommandArgument='<%# Eval("customer_id") %>' OnClick="user_modify_button_Click" />
                                                <asp:Button ID="user_delete_button" class="btn delete fa" runat="server" Text="&#xf014;" CommandArgument='<%# Eval("customer_id") %>' OnClick="user_remove_button_Click" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            <%
                                Session["searchUserAvailable"] = null;
                        }
                        else
                        {
                            if (Session["userAvailable"] != null && (bool)Session["userAvailable"]) // If there is record available
                            {
                                %>
                                    <asp:Repeater ID="user_repeater" runat="server">
                                        <ItemTemplate>
                                            <tr class="data_row">
                                                <td><asp:Label ID="user_id_value" runat="server" Text='<%# Eval("customer_id") %>'></asp:Label></td>
                                                <td><asp:Label ID="username_value" runat="server" Text='<%# Eval("name") %>'></asp:Label></td>
                                                <td><asp:Label ID="user_email_value" runat="server" Text='<%# Eval("email") %>'></asp:Label></td>
                                                <td><asp:Label ID="user_password_value" runat="server" Text='<%# Eval("password") %>'></asp:Label></td>
                                                <td><asp:Label ID="user_phone_value" runat="server" Text='<%# Eval("phone_number") %>'></asp:Label></td>
                                                <td><asp:Label ID="user_address1_value" runat="server" Text='<%# Eval("address_line_1") %>'></asp:Label></td>
                                                <td><asp:Label ID="user_address2_value" runat="server" Text='<%# Eval("address_line_2") %>'></asp:Label></td>
                                                <td><asp:Label ID="user_city_value" runat="server" Text='<%# Eval("city") %>'></asp:Label></td>
                                                <td><asp:Label ID="user_state_value" runat="server" Text='<%# Eval("state") %>'></asp:Label></td>
                                                <td><asp:Label ID="user_country_value" runat="server" Text='<%# Eval("country") %>'></asp:Label></td>
                    
                                                <td class="btn_section">
                                                    <asp:Button ID="user_modify_button" class="btn modify fa" runat="server" Text="&#xf013;" CommandArgument='<%# Eval("customer_id") %>' OnClick="user_modify_button_Click" />
                                                    <asp:Button ID="user_delete_button" class="btn delete fa" runat="server" Text="&#xf014;" CommandArgument='<%# Eval("customer_id") %>' OnClick="user_remove_button_Click" />
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