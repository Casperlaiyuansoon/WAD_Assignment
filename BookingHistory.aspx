<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookingHistory.aspx.cs" Inherits="WAD_Assignment.BookingHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <head>
        <title>Booking History</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="BookingHistory.css" />
    </head>


    <style>
        .gridview{
            margin-left:auto;
            margin-right: auto;
        }
        .auto-style1 {
            margin-left: 71;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <form id="form2" class="auto-style1">
        <body>
            <div class="table-box">
                <h2 class="booking_history">Booking History</h2>
                <hr>
                <br>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="flight_id" DataSourceID="SqlDataSource1" Height="352px" Width="1460px" CssClass="gridview">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="flight_id" HeaderText="Flight No" InsertVisible="False" ReadOnly="True" SortExpression="flight_id" />
                        <asp:BoundField DataField="departure_date_time" HeaderText="Date And Time" SortExpression="departure_date_time" />
                        <asp:BoundField DataField="departure_city" HeaderText="Departure City" SortExpression="departure_city" />
                        <asp:BoundField DataField="destination_city" HeaderText="Destination City" SortExpression="destination_city" />
                        <asp:BoundField DataField="duration" HeaderText="Duration" SortExpression="duration" />
                    </Columns>

                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>



            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TarFly_Database %>" SelectCommand="SELECT * FROM [Flight]"></asp:SqlDataSource> 
</body>
    </form>
     <br>
     <br>
     <br> 
     <br>
     <br>


   
</asp:Content>
