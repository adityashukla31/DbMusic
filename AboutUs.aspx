<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="DbMusic.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 448px;
        }
        .auto-style3 {
            width: 621px;
        }
        .bgimg {
            width:100%;
            background-image:url(Images/Background.png);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="bgimg">
        <tr>
            <td>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style3">
                            <asp:Image ID="Image1" runat="server" Height="342px" ImageUrl="~/Images/Viraj.png" Width="384px" />
                        </td>
                        <td style="text-align:right">
                            <asp:Image ID="Image2" runat="server" Height="363px" ImageUrl="~/Images/Aditya.png" style="margin-left: 0px" Width="387px" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2" style="color:white"><h3 style="color:white">VIRAJ LAD</h3></td>
                        <td style="text-align:right;color:white"><h3 style="color:white">ADITYA SHUKLA</h3></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
