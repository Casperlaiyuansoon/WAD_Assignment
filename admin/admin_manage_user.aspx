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
    <div class="container">

        <h1 style="color:white;">USER MANAGEMENT</h1>

        <hr class="title" />
        <br />

        <div class="inner-container">
            <form>

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
                                    <span>Name :</span> <!-- register name --> <br />
                                    <div class="inputField">
                                        <asp:TextBox ID="register_name" class="textField" runat="server" placeholder="contain only alphabet"></asp:TextBox><br />
                                    </div>
                                </div>

                                    <br />

                                <div class="inner-flex-content">
                                    <span>Email :</span> <!-- register email --> <br />
                                    <div class="inputField">
                                        <asp:TextBox ID="register_email" class="textField" runat="server" placeholder="e.g. user@hotmail.com"></asp:TextBox><br />
                                    </div>
                                </div>
                            </div>
                            <!-- END FIRST ROW -->

                            <!-- SECOND ROW -->
                            <div class="inner-flex-form">

                                <div class="inner-flex-content">
                                    <span>Phone No. :</span> <!-- register email --> <br />
                                    <div class="inputField">
                                        <asp:TextBox ID="register_phone" class="textField" runat="server" placeholder="e.g. 012-3456789"></asp:TextBox><br />
                                    </div>
                                </div>
    
                                <br />

                                <div class="inner-flex-content">
                                    <span>Password :</span> <!-- register password --> <br />
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
                            <span>Address Line 1 :</span> <!-- address line 1 --> <br />
                            <div class="inputField">
                                <asp:TextBox ID="address1" class="textField" runat="server" placeholder="e.g. No 123, Jalan Bahagia 5"></asp:TextBox><br />
                            </div>

                            <br />

                            <span>Address Line 2 :</span> <!-- address line 2 --> <br />
                            <div class="inputField">
                                <asp:TextBox ID="address2" class="textField" runat="server" placeholder="e.g. Taman Bahagia"></asp:TextBox><br />
                            </div>

                            <br />

                            <span>City :</span> <!-- city --> <br />
                            <div class="inputField">
                                <asp:TextBox ID="city" class="textField" runat="server" placeholder="e.g. Kepong"></asp:TextBox><br />
                            </div>

                            <br />

                            <div class="inner-flex-form">
                                <div class="inner-flex-content">
                                    <span>State :</span> <!-- city --> <br />
                                    <div class="inputField">
                                        <asp:TextBox ID="state" class="textField" runat="server" placeholder="e.g. Kuala Lumpur"></asp:TextBox><br />
                                    </div>
                                </div>
        
                                <br />

                                <div class="inner-flex-content">
                                    <span>Country :</span> <!-- city --> <br />
                                    <div class="inputField">
                                        <asp:TextBox ID="country" class="textField" runat="server" placeholder="e.g. Malaysia"></asp:TextBox><br />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END ADDRESS SECTION -->
                    </div>

                    <div class="inputField">
                        <asp:Button ID="add_user_submit" class="register_submit" runat="server" Text="Add" />
                    </div>
                </div>

                <br />
                <h2 class="section">Existing User</h2>

                    <div class="search-section">
                        <asp:TextBox ID="search_user" runat="server" class="search_user_field" placeholder="Enter a username..."></asp:TextBox>
                        <asp:Button ID="search_user_btn" runat="server" class="search_user_button fa" Text="&#xf002;" />
                    </div>
                <br />

                <table>
                    <!-- HEAD -->
                    <tr class="data_header">
                        <th>ID</th>
                        <th>Username</th>
                        <th>E-mail</th>
                        <th>Phone No.</th>
                        <th>Address</th>
                        <th>Password</th>
                        <th>Action</th>
                    </tr>
                    <!-- END HEAD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="user_id_value" runat="server" Text="1"></asp:Label></td>
                        <td><asp:Label ID="username_value" runat="server" Text="User001"></asp:Label></td>
                        <td><asp:Label ID="user_email_value" runat="server" Text="user001@gmail.com"></asp:Label></td>
                        <td><asp:Label ID="user_phone_value" runat="server" Text="012-3456789"></asp:Label></td>
                        <td><asp:Label ID="user_address_value" runat="server" Text="No 123, Taman Bahagia, 47000 Sungai Buloh, Selangor, Malaysia"></asp:Label></td>
                        <td><asp:Label ID="user_password_value" runat="server" Text="uSeR)0!"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="user_modify1" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="user_delete1" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="Label1" runat="server" Text="2"></asp:Label></td>
                        <td><asp:Label ID="Label2" runat="server" Text="User002"></asp:Label></td>
                        <td><asp:Label ID="Label3" runat="server" Text="user002@gmail.com"></asp:Label></td>
                        <td><asp:Label ID="Label16" runat="server" Text="012-3456789"></asp:Label></td>
                        <td><asp:Label ID="Label4" runat="server" Text="No 123, Taman Bahagia, 47000 Sungai Buloh, Selangor, Malaysia"></asp:Label></td>
                        <td><asp:Label ID="Label5" runat="server" Text="UsEr0)2"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button1" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="Button2" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="Label6" runat="server" Text="3"></asp:Label></td>
                        <td><asp:Label ID="Label7" runat="server" Text="User003"></asp:Label></td>
                        <td><asp:Label ID="Label8" runat="server" Text="user003@gmail.com"></asp:Label></td>
                        <td><asp:Label ID="Label17" runat="server" Text="012-3456789"></asp:Label></td>
                        <td class="address">
                            <asp:Label ID="Label9" runat="server" Text="No 123, Taman Bahagia, 47000 Sungai Buloh, Selangor, Malaysia"></asp:Label>
                        </td>
                        <td><asp:Label ID="Label10" runat="server" Text="uSeR)0#"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button3" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="Button4" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="Label11" runat="server" Text="4"></asp:Label></td>
                        <td><asp:Label ID="Label12" runat="server" Text="Marcus"></asp:Label></td>
                        <td><asp:Label ID="Label13" runat="server" Text="marcus123@gmail.com"></asp:Label></td>
                        <td><asp:Label ID="Label18" runat="server" Text="012-3456789"></asp:Label></td>
                        <td><asp:Label ID="Label14" runat="server" Text="No 123, Taman Bahagia, 47000 Sungai Buloh, Selangor, Malaysia"></asp:Label></td>
                        <td><asp:Label ID="Label15" runat="server" Text="mArCuS!2#"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button5" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="Button6" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="Label19" runat="server" Text="5"></asp:Label></td>
                        <td><asp:Label ID="Label20" runat="server" Text="User004"></asp:Label></td>
                        <td><asp:Label ID="Label21" runat="server" Text="user004@gmail.com"></asp:Label></td>
                        <td><asp:Label ID="Label22" runat="server" Text="012-3456789"></asp:Label></td>
                        <td><asp:Label ID="Label23" runat="server" Text="No 123, Taman Bahagia, 47000 Sungai Buloh, Selangor, Malaysia"></asp:Label></td>
                        <td><asp:Label ID="Label24" runat="server" Text="UsEr0)4"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button7" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="Button8" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="Label25" runat="server" Text="6"></asp:Label></td>
                        <td><asp:Label ID="Label26" runat="server" Text="User005"></asp:Label></td>
                        <td><asp:Label ID="Label27" runat="server" Text="user005@gmail.com"></asp:Label></td>
                        <td><asp:Label ID="Label28" runat="server" Text="012-3456789"></asp:Label></td>
                        <td><asp:Label ID="Label29" runat="server" Text="No 123, Taman Bahagia, 47000 Sungai Buloh, Selangor, Malaysia"></asp:Label></td>
                        <td><asp:Label ID="Label30" runat="server" Text="uSeR)0%"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button9" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="Button10" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->

                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="Label31" runat="server" Text="7"></asp:Label></td>
                        <td><asp:Label ID="Label32" runat="server" Text="User006"></asp:Label></td>
                        <td><asp:Label ID="Label33" runat="server" Text="user006@gmail.com"></asp:Label></td>
                        <td><asp:Label ID="Label34" runat="server" Text="012-3456789"></asp:Label></td>
                        <td><asp:Label ID="Label35" runat="server" Text="No 123, Taman Bahagia, 47000 Sungai Buloh, Selangor, Malaysia"></asp:Label></td>
                        <td><asp:Label ID="Label36" runat="server" Text="UsEr0)6"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button11" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="Button12" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->
                    
                    <!-- DATA FIELD -->
                    <tr class="data_row">
                        <td><asp:Label ID="Label37" runat="server" Text="8"></asp:Label></td>
                        <td><asp:Label ID="Label38" runat="server" Text="User007"></asp:Label></td>
                        <td><asp:Label ID="Label39" runat="server" Text="user007@gmail.com"></asp:Label></td>
                        <td><asp:Label ID="Label40" runat="server" Text="012-3456789"></asp:Label></td>
                        <td><asp:Label ID="Label41" runat="server" Text="No 123, Taman Bahagia, 47000 Sungai Buloh, Selangor, Malaysia"></asp:Label></td>
                        <td><asp:Label ID="Label42" runat="server" Text="uSeR)0&"></asp:Label></td>
                        <td class="btn_section">
                            <asp:Button ID="Button13" class="btn modify fa" runat="server" Text="&#xf013;" />
                            <asp:Button ID="Button14" class="btn delete fa" runat="server" Text="&#xf014;" />
                        </td>
                    </tr>
                    <!-- END DATA FIELD -->
                </table>
            </form>
        </div>
    </div>
</asp:Content>
