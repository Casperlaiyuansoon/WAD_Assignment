<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookingHistory.aspx.cs" Inherits="WAD_Assignment.BookingHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <head>
         <title>Booking History</title>
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" href="BookingHistory.css" />
    </head>

    <style type="text/css">
        .auto-style1 {
            margin-right: 0;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        
    <form id="form2">

        
  <body>
     
<div class="table-box">
    <h2 class="booking_history">Booking History</h2><hr>
    <div class="table-row table-head">
        <div class="table-cell first-cell">
            <p>No.</p>
        </div>
        <div class="table-cell">
            <p>Date</p>
        </div>
        <div class="table-cell">
            <p>Depart</p>
        </div>
        <div class="table-cell">
            <p>Origin</p>
        </div>
        <div class="table-cell">
            <p>Arrive</p>
        </div>
        <div class="table-cell">
            <p>Destination</p>
        </div>
        <div class="table-cell last-cell">
            <p>Booking Number</p>
        </div>
    </div>


    <div class="table-row">
        <div class="table-cell first-cell">
            <p>1.</p>
        </div>
        <div class="table-cell">
            <p>Fri, 24 Mar 2023</p>
        </div>
        <div class="table-cell">
            <p>09.30am</p>
        </div>
        <div class="table-cell">
            <p>Langkawi</p>
        </div>
        <div class="table-cell">
            <p>10.40am</p>
        </div>
        <div class="table-cell">
            <p>China</p>
        </div>
        <div class="table-cell last-cell">
            <p>PSNQHQ01</p>
        </div>
    </div>


    
    <div class="table-row">
        <div class="table-cell first-cell">
            <p>2.</p>
        </div>
        <div class="table-cell">
            <p>Fri, 25 Mar 2024</p>
        </div>
        <div class="table-cell">
            <p>08.30am</p>
        </div>
        <div class="table-cell">
            <p>Langkawi</p>
        </div>
        <div class="table-cell">
            <p>01.20pm</p>
        </div>
        <div class="table-cell">
            <p>Vietnam</p>
        </div>
        <div class="table-cell last-cell">
            <p>PSNQHQ02</p>
       </div>
       
     </div>
    </div>  

            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="flight_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="352px" Width="1241px" CssClass="auto-style1">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="flight_id" HeaderText="flight_id" InsertVisible="False" ReadOnly="True" SortExpression="flight_id" />
                    <asp:BoundField DataField="plane_id" HeaderText="plane_id" SortExpression="plane_id" />
                    <asp:BoundField DataField="departure_date_time" HeaderText="departure_date_time" SortExpression="departure_date_time" />
                    <asp:BoundField DataField="departure_city" HeaderText="departure_city" SortExpression="departure_city" />
                    <asp:BoundField DataField="destination_city" HeaderText="destination_city" SortExpression="destination_city" />
                    <asp:BoundField DataField="duration" HeaderText="duration" SortExpression="duration" />
                    <asp:BoundField DataField="economy_price" HeaderText="economy_price" SortExpression="economy_price" />
                    <asp:BoundField DataField="premium_economy_price" HeaderText="premium_economy_price" SortExpression="premium_economy_price" />
                    <asp:BoundField DataField="business_price" HeaderText="business_price" SortExpression="business_price" />
                    <asp:BoundField DataField="first_class_price" HeaderText="first_class_price" SortExpression="first_class_price" />
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


     
</asp:Content>
