<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="tarfly.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Tarfly | Register</title>
        <link rel="stylesheet" href="register.css" />
    </head>

    <body>

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

                                <br />

                                <div class="inner-flex-form">
                                    <div class="inner-flex-content ">
                                        <span>Phone No. :</span> <!-- register email --> <br />
                                        <div class="inputFieldPhone">
                                            <asp:TextBox ID="register_phone" class="textField" runat="server" placeholder="e.g. 012-3456789"></asp:TextBox><br />
                                        </div>
                                    </div>
                                </div>

                                <br />

                                <!-- THIRD ROW -->
                                <div class="inner-flex-form">
                                    
                                    <div class="inner-flex-content">
                                        <span>Password :</span> <!-- register password --> <br />
                                        <div class="inputField">
                                            <asp:TextBox ID="register_password" class="textField" runat="server" placeholder="8 characters and an Uppercase" TextMode="Password"></asp:TextBox><br />
                                        </div>
                                    </div>

                                    <br />

                                    <div class="inner-flex-content">
                                        <span>Confirm Password :</span> <!-- register confirm password --> <br />
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

                        <br />
                        <div class="inputField">
                            <asp:Button ID="register_submit" runat="server" Text="Register" OnClientClick="window.location.href='login.aspx'; return false;"/>
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
