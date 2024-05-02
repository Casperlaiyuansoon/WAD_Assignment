<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_register.aspx.cs" Inherits="tarfly.admin_register" EnableViewState="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Tarfly | Admin Register</title>
        <link rel="stylesheet" href="admin_register.css"/>
    </head>

    <body>
        <div class="container">

            <div class="inner-container">

                <!-- REGISTER FORM -->
                <form id="admin_register_form" runat="server">
                    <div>

                        <h2>REGISTER</h2>

                        <hr />
                        <br />

                        <div class="flex-form">

                            <!-- FIRST ROW -->
                            <div class="inner-flex">
                                <span>Name :
                                    <asp:RequiredFieldValidator ID="admin_name_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Name is required" ControlToValidate="admin_register_name"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="admin_name_regex_validate" runat="server" ErrorMessage="Name can't contain numeric value" ForeColor="Red" Text="*" ControlToValidate="admin_register_name" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                                </span> <!-- register name --> <br />
                                <div class="inputField">
                                    <asp:TextBox ID="admin_register_name" class="textField" runat="server" placeholder="contain only alphabet"></asp:TextBox><br />
                                </div>

                                <br />

                                <span>Password :
                                    <asp:RequiredFieldValidator ID="admin_password_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Password is required" ControlToValidate="admin_register_password"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="admin_password_regex_validate" runat="server" ErrorMessage="Password at least 8 characters long and contain an uppercase" ForeColor="Red" Text="*" ControlToValidate="admin_register_password" ValidationExpression="^(?=.*[A-Z]).{8,}$"></asp:RegularExpressionValidator>
                                </span> <!-- register password --> <br />
                                <div class="inputField">
                                    <asp:TextBox ID="admin_register_password" class="textField" runat="server" placeholder="8 characters and an Uppercase"></asp:TextBox><br />
                                </div>
                            </div>
                            <!-- END FIRST ROW -->

                            <br />

                            <!-- SECOND ROW -->
                            <div class="inner-flex">
                                <span>Email :
                                    <asp:RequiredFieldValidator ID="admin_email_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Email is required" ControlToValidate="admin_register_email"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="admin_email_regex_validate" runat="server" ErrorMessage="Invalid email format" ForeColor="Red" Text="*" ControlToValidate="admin_register_email" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b"></asp:RegularExpressionValidator>
                                </span> <!-- register email --> <br />
                                <div class="inputField">
                                    <asp:TextBox ID="admin_register_email" class="textField" runat="server" placeholder="user@hotmail.com"></asp:TextBox><br />
                                </div>

                                <br />

                                <span>Confirm Password :
                                    <asp:RequiredFieldValidator ID="admin_password_c_required" runat="server" ForeColor="Red" Text="*" ErrorMessage="Password confirmation is required" ControlToValidate="admin_register_c_password"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="admin_password_compare" runat="server" ForeColor="Red" Text="*" ErrorMessage="Password do not match" ControlToValidate="admin_register_c_password" ControlToCompare="admin_register_password"></asp:CompareValidator>
                                </span> <!-- register confirm password --> <br />
                                <div class="inputField">
                                    <asp:TextBox ID="admin_register_c_password" class="textField" runat="server" placeholder="enter password again"></asp:TextBox><br />
                                </div>
                            </div>
                            <!-- END SECOND ROW -->
                        </div>

                        <br />
                        <div class="inputField">
                            <asp:Button ID="admin_register_submit" runat="server" Text="Register" OnClick="admin_register_submit_Click" />
                        </div>

                    </div>

                    <div class="redirect"> <!-- redirect to login -->
                        <p>Already have an account? <asp:HyperLink ID="goto_admin_login" runat="server" NavigateUrl="admin_login.aspx">login</asp:HyperLink> here</p>
                    </div>
                </form>
                <!-- END REGISTER FORM -->
            </div>
        </div>

    </body>
</html>
