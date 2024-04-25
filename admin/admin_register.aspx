<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_register.aspx.cs" Inherits="tarfly.admin_register" %>

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
                                <span>Name :</span> <!-- register name --> <br />
                                <div class="inputField">
                                    <asp:TextBox ID="admin_register_name" class="textField" runat="server" placeholder="contain only alphabet"></asp:TextBox><br />
                                </div>

                                <br />

                                <span>Password :</span> <!-- register password --> <br />
                                <div class="inputField">
                                    <asp:TextBox ID="admin_register_password" class="textField" runat="server" placeholder="8 characters and an Uppercase"></asp:TextBox><br />
                                </div>
                            </div>
                            <!-- END FIRST ROW -->

                            <br />

                            <!-- SECOND ROW -->
                            <div class="inner-flex">
                                <span>Email :</span> <!-- register email --> <br />
                                <div class="inputField">
                                    <asp:TextBox ID="admin_register_email" class="textField" runat="server" placeholder="user@hotmail.com"></asp:TextBox><br />
                                </div>

                                <br />

                                <span>Confirm Password :</span> <!-- register confirm password --> <br />
                                <div class="inputField">
                                    <asp:TextBox ID="admin_register_c_password" class="textField" runat="server" placeholder="enter password again"></asp:TextBox><br />
                                </div>
                            </div>
                            <!-- END SECOND ROW -->
                        </div>

                        <br />
                        <div class="inputField">
                            <asp:Button ID="admin_register_submit" runat="server" Text="Register" />
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
