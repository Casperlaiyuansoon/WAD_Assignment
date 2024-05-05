<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin_dashboard.aspx.cs" Inherits="WAD_Assignment.admin.admin_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Tarfly | Admin</title>
    <link rel="stylesheet" href="admin_dashboard.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <h1 style="color:white;">DASHBOARD</h1>

        <hr class="title" />
        <br />

        <div class="inner-container">

            <div class="card-holder">

                <div class="item-card dash-user">
                    <h2><asp:Label class="card-info" ID="user_number" runat="server" Text='0'></asp:Label></h2>
                    <h4 class="card-des">Total Customer(s)</h4>
                </div>

                <div class="item-card dash-admin">
                    <h2><asp:Label class="card-info" ID="admin_number" runat="server" Text='0'></asp:Label></h2>
                    <h4 class="card-des">Total Admin(s)</h4>
                </div>

                <div class="item-card dash-food">
                    <h2><asp:Label class="card-info" ID="total_food_order" runat="server" Text='0'></asp:Label></h2>
                    <h4 class="card-des">Most Ordered Food</h4>
                </div> <!-- get from food -->

                <div class="item-card dash-pay">
                    <h2>RM<asp:Label class="card-info" ID="total_earning" runat="server" Text=' 0'></asp:Label></h2>
                    <h4 class="card-des">Total Earning</h4>
                </div> <!-- get from payment -->

                <div class="item-card dash-plane">
                    <h2><asp:Label class="card-info" ID="total_plane" runat="server" Text='0'></asp:Label></h2>
                    <h4 class="card-des">Total Airplane(s)</h4>
                </div> <!-- get from plane -->

                <div class="item-card dash-idle-plane">
                    <h2><asp:Label class="card-info" ID="total_idle_plane" runat="server" Text='0'></asp:Label></h2>
                    <h4 class="card-des">Total Idle Airplane(s)</h4>
                </div> <!-- get from flight -->

                <div class="item-card dash-ticket">
                    <h2><asp:Label class="card-info" ID="total_booking" runat="server" Text='0'></asp:Label></h2>
                    <h4 class="card-des">Total Booking(s)</h4>
                </div> <!-- get from booking -->

            </div>

            <div class="graph">
                <!-- NO GRAPH CUZ NEED DATETIME IN DB -->
            </div>
        </div>
    </div>
</asp:Content>
