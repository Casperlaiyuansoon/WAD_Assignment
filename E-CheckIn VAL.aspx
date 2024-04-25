<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="E-CheckIn VAL.aspx.cs" Inherits="Assignment.E_CheckIn_VAL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" runat="server" media="all" href="/E-CheckIn VAL.css" />
    <title></title>
        <style type="text/css">
        .auto-style5 {
            width: 20px;
        }
        .auto-style3 {
            width: 282px;
        }
            .auto-style6 {
                width: 282px;
            }
            .auto-style7 {
                width: 230px;
            }
            .auto-style8 {
                width: 20px;
            }
            .auto-style9 {
                width: 100%;
            }
            .auto-style10 {
                width: 230px;
            }
    </style>

</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div id="main">
            <div class="checkin">
            <table class="auto-style9">
                <tr>
                    <td class="auto-style3"><strong>Flight Number</strong></td>
                    <td class="auto-style5">
                        :</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="txtFlightNo" runat="server" Enabled="False">Q31JUS</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>First Name </strong> </td>
                    <td class="auto-style5">:</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="txtFName" runat="server" Enabled="False">FRANCIS</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <strong>Last Name
                    </strong>
                    </td>
                    <td class="auto-style5">
                        :</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="txtLName" runat="server" Enabled="False">LEE JUN FENG</asp:TextBox>
                    </td>
                </tr>
            </table>
                <br />
            <table style="width:100%;">
                <tr>
                    <td class="auto-style6">Identification Type</td>
                    <td class="auto-style8">:</td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem>-- Select Your Identification --</asp:ListItem>
                            <asp:ListItem>Identification No.</asp:ListItem>
                            <asp:ListItem>Passport No.</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        Identification No./Passport No.</td>
                    <td class="auto-style8">:</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtIdentification" runat="server" Enabled="False" OnTextChanged="DropDownList1_SelectedIndexChanged"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style6">Identification Photo/Passpord Photo
                    </td>
                    <td class="auto-style8">:</td>
                    <td class="auto-style7">
                        <asp:FileUpload ID="fileIdentification" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">Personal Photo</td>
                    <td class="auto-style8">:</td>
                    <td class="auto-style7">
                        <asp:FileUpload ID="filePhoto" runat="server" />
                    </td>
                </tr>
            </table>
            </div>
                <asp:LinkButton ID="btncheckin" runat="server" PostBackUrl="~/CheckIn Success.aspx" OnClick="btncheckin_Click">Check In</asp:LinkButton>
        </div>
    </form>
</body>
</html>
