<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="tarfly.register" EnableViewState="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Tarfly | Register</title>
        <link rel="stylesheet" href="register.css" />
    </head>

    <body>
        <%
            if (Session["registerStatus"] != null && (bool)Session["registerStatus"]) // If this session contain value
            {
                %>
                    <script>
                        alert("Account Registered Successfully");
                        <%
                            Session["registerStatus"] = null;
                        %>
                        window.location.href = "login.aspx";
                    </script>
                <%
            }    
        %>

        <div class="container">
            <div class="inner-container">

                <!-- REGISTER FORM -->
                <form id="register_form" runat="server">
                    <div>

                        <h2>REGISTER</h2>

                        <br />

                        <div class="content">

                            <h3 class="title-pi">Personal Info</h3>

                            <!-- PERSONAL INFORMATION SECTION -->
                            <div class="flex-form">

                                <!-- FIRST ROW -->
                                <div class="inner-flex-form">
                                    <div class="inner-flex-content">
                                        <span>Name :
                                            <asp:RequiredFieldValidator ID="name_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Name is required" ControlToValidate="register_name"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="name_regex_validate" runat="server" ErrorMessage="Name can't contain numeric value" ForeColor="Red" Text="*" ControlToValidate="register_name" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                                        </span> <!-- register name --> <br />
                                        <div class="inputField">
                                            <asp:TextBox ID="register_name" class="textField" runat="server" placeholder="contain only alphabet"></asp:TextBox><br />
                                        </div>
                                    </div>

                                        <br />

                                    <div class="inner-flex-content">
                                        <span>Email :
                                            <asp:RequiredFieldValidator ID="email_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Email is required" ControlToValidate="register_email"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="email_regex_validate" runat="server" ErrorMessage="Invalid email format" ForeColor="Red" Text="*" ControlToValidate="register_email" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b"></asp:RegularExpressionValidator>
                                        </span> <!-- register email --> <br />
                                        <div class="inputField">
                                            <asp:TextBox ID="register_email" class="textField" runat="server" placeholder="e.g. user@hotmail.com"></asp:TextBox><br />
                                        </div>
                                    </div>
                                </div>
                                <!-- END FIRST ROW -->

                                <br />

                                <div class="inner-flex-form">
                                    <div class="inner-flex-content ">
                                        <span>Phone No. :
                                            <asp:RequiredFieldValidator ID="phone_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Phone is required" ControlToValidate="register_phone"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="phone_regex_validate" runat="server" ErrorMessage="Invalid phone format" ForeColor="Red" Text="*" ControlToValidate="register_phone" ValidationExpression="^01[0-9]-\d{7}$"></asp:RegularExpressionValidator>
                                        </span> <!-- register email --> <br />
                                        <div class="inputFieldPhone">
                                            <asp:TextBox ID="register_phone" class="textField" runat="server" placeholder="e.g. 012-3456789"></asp:TextBox><br />
                                        </div>
                                    </div>
                                </div>

                                <br />

                                <!-- THIRD ROW -->
                                <div class="inner-flex-form">
                                    
                                    <div class="inner-flex-content">
                                        <span>Password :
                                            <asp:RequiredFieldValidator ID="password_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Password is required" ControlToValidate="register_password"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="password_regex_validate" runat="server" ErrorMessage="Password at least 8 characters long and contain an uppercase" ForeColor="Red" Text="*" ControlToValidate="register_password" ValidationExpression="^(?=.*[A-Z]).{8,}$"></asp:RegularExpressionValidator>
                                        </span> <!-- register password --> <br />
                                        <div class="inputField">
                                            <asp:TextBox ID="register_password" class="textField" runat="server" placeholder="8 characters and an Uppercase" TextMode="Password"></asp:TextBox><br />
                                        </div>
                                    </div>

                                    <br />

                                    <div class="inner-flex-content">
                                        <span>Confirm Password :
                                            <asp:RequiredFieldValidator ID="password_c_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Password confirmation is required" ControlToValidate="register_c_password"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="password_compare" runat="server" ForeColor="Red" Text="*" ErrorMessage="Password do not match" ControlToValidate="register_c_password" ControlToCompare="register_password"></asp:CompareValidator>
                                        </span> <!-- register confirm password --> <br />
                                        <div class="inputField">
                                            <asp:TextBox ID="register_c_password" class="textField" runat="server" placeholder="enter password again" TextMode="Password"></asp:TextBox><br />
                                        </div>
                                    </div>
                                </div>
                                <!-- END THIRD ROW -->

                            </div>
                            <!-- END PERSONAL INFORMATION SECTION -->
                            <br />


                            <h3 class="title-address">Address</h3>

                            <!-- ADDRESS SECTION -->
                            <div class="address">
                                <span>Address Line 1 :
                                    <asp:RequiredFieldValidator ID="address_one_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Address 1 is required" ControlToValidate="register_address1"></asp:RequiredFieldValidator>
                                </span> <!-- address line 1 --> <br />
                                <div class="inputField">
                                    <asp:TextBox ID="register_address1" class="textField" runat="server" placeholder="e.g. No 123, Jalan Bahagia 5"></asp:TextBox><br />
                                </div>

                                <br />

                                <span>Address Line 2 :
                                    <asp:RequiredFieldValidator ID="address_two_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Address 2 is required" ControlToValidate="register_address2"></asp:RequiredFieldValidator>
                                </span> <!-- address line 2 --> <br />
                                <div class="inputField">
                                    <asp:TextBox ID="register_address2" class="textField" runat="server" placeholder="e.g. Taman Bahagia"></asp:TextBox><br />
                                </div>

                                <br />

                                <span>City :
                                    <asp:RequiredFieldValidator ID="city_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="City is required" ControlToValidate="register_city"></asp:RequiredFieldValidator>
                                </span> <!-- city --> <br />
                                <div class="inputField">
                                    <asp:TextBox ID="register_city" class="textField" runat="server" placeholder="e.g. Kepong"></asp:TextBox><br />
                                </div>

                                <br />

                                <div class="inner-flex-form">
                                    <div class="inner-flex-content">
                                        <span>State :
                                            <asp:RequiredFieldValidator ID="state_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="State is required" ControlToValidate="register_state"></asp:RequiredFieldValidator>
                                        </span> <!-- city --> <br />
                                        <div class="inputField">
                                            <asp:TextBox ID="register_state" class="textField" runat="server" placeholder="e.g. Kuala Lumpur"></asp:TextBox><br />
                                        </div>
                                    </div>
        
                                    <br />

                                    <div class="inner-flex-content">
                                        <span>Country :
                                            <asp:RequiredFieldValidator ID="country_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Country is required" ControlToValidate="register_country"></asp:RequiredFieldValidator>
                                        </span> <!-- city --> <br />
                                        <div class="inputField">
                                            <asp:TextBox ID="register_country" class="textField" runat="server" placeholder="e.g. Malaysia"></asp:TextBox><br />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END ADDRESS SECTION -->
                            
                        </div>

                        <br />
                        <div class="inputField">
                            <asp:Button ID="register_submit" runat="server" Text="Register" OnClick="register_submit_Click" />
                        </div>

                    </div>

                    <div class="redirect"> <!-- redirect to login -->
                        <p>Already have an account? <asp:HyperLink ID="goto_login" runat="server" NavigateUrl="login.aspx">login</asp:HyperLink> here</p>
                    </div>
                </form>
                <!-- END REGISTER FORM -->

                <!-- ELEMENT IMAGE -->
                <img id="tower" src="image/tower.png"/>
                <img id="cloud1" src="image/cloud2.png" />
                <img id="cloud2" src="image/cloud1.png" />
                <img id="airplane-air" src="image/airplane.png" />
                <!-- END ELEMENT IMAGE -->
            </div>
        </div>
    
    </body>
</html>
