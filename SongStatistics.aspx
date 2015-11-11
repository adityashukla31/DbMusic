<%@ Page Title="Song Stats" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SongStatistics.aspx.cs" Inherits="DbMusic.SongStatistics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #tdid {
            
            vertical-align:text-top;
            width:30%;

        }
         .bgimg {
            background-image:url(Images/Background.png);
            width:100%;
            padding:10px;
        }
        .left {
       
            background:rgba(255,255,255,.5);
        
            color:white;
            width:auto;
            text-align:right;
            padding:10px;
             }
        .right {
            background:rgba(255,255,255,.5);
            color:white;
            padding:10px;
            width:auto;
            text-align:left;
             }
        .right1 {
            
            padding:10px;
            width:auto;
            text-align:left;
             }
        .auto-style2 {
            width: 437px;
        }
        .auto-style3 {
            width: 437px;
            height: 136px;
        }
        .auto-style4 {
            height: 136px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table id="tble1" runat="server" class="bgimg">
    <tr>
        <td></td>
        <td></td>
        <td>
            <div><h2>Song Statistics</h2>
            </div>

        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td><h4><asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label></h4></td>
        <td></td>
        <td></td>
    </tr>
    </table>
    
    <table id="Table2" runat="server" class="bgimg">
    
        <tr>
            
        <td class="auto-style3">
            <div class="right1">
            <asp:TextBox ID="txtSongName" runat="server"></asp:TextBox>
                <br />
                </div>
            <div class="right1">
                <asp:Button ID="btnsrch" runat="server" Text="Search" OnClick="btnsrch_Click" Width="73px" />
                <br />
            </div>
            
            <div class="right1">
                <asp:DropDownList ID="ddlSong" runat="server" Width="97px" AutoPostBack="True" DataSourceID="DSSongs" DataTextField="songName" DataValueField="songName" OnSelectedIndexChanged="ddlSong_SelectedIndexChanged" Height="20px"></asp:DropDownList>
            </div>
            <asp:SqlDataSource ID="DSSongs" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString2 %>" OnSelecting="DSSongs_Selecting" ProviderName="<%$ ConnectionStrings:dbConnectionString2.ProviderName %>"></asp:SqlDataSource>

        </td>
        <td class="auto-style4"></td>
        <td class="auto-style4">
            <div class="right">
                <asp:Label ID="Label3" runat="server" Text="Label" Visible="false"></asp:Label>
            </div></td>
        <td class="auto-style4">
            
        </td>
            </tr>
                  
       <tr>
        <td class="auto-style2"></td>
        <td></td>
        
        <td>
            <div class="right">
                <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
        </td>
        <td></td>
    </tr>

<tr>
        <td class="auto-style2"></td>
        <td></td>
        
        <td>
            <div class="right">
                <asp:Label ID="Label4" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
        </td>
        <td></td>
    </tr>

        <tr>
        <td class="auto-style2"></td>
        <td></td>
        
        <td>
            <div class="right">
                <asp:Label ID="Label6" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
        </td>
        <td></td>
    </tr>

        <tr>
        <td class="auto-style2"></td>
        <td></td>
        
        <td>
            <div class="right">
                <asp:Label ID="Label8" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
        </td>
        <td></td>
    </tr>

        <tr>
        <td class="auto-style2"></td>
        <td></td>
        
        <td>
            <div class="right">
                <asp:Label ID="Label10" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
        </td>
        <td></td>
    </tr>

        <tr>
        <td class="auto-style2"></td>
        <td></td>
        
        <td>
            <div class="right">
                <asp:Label ID="Label12" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
        </td>
        <td></td>
    </tr>

        <tr>
        <td class="auto-style2"></td>
        <td></td>
        
        <td>
            <div class="right">
                <asp:Label ID="Label14" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
        </td>
        <td></td>
    </tr>

        <tr>
        <td class="auto-style2"></td>
        <td></td>
        
        <td>
            <div class="right">
                <asp:Label ID="Label16" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
        </td>
        <td></td>
    </tr>

        <tr>
        <td class="auto-style2"></td>
        <td></td>
        
        <td>
            <div class="right">
                <asp:Label ID="Label18" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
        </td>
        <td></td>
    </tr>

        <tr>
        <td class="auto-style2"></td>
        <td></td>
        
        <td>
            <div class="right">
                <asp:Label ID="Label20" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
        </td>
        <td></td>
    </tr>

        <tr>
        <td class="auto-style2"></td>
        <td></td>
        
        <td>
            <div class="right">
                <asp:Label ID="Label22" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
        </td>
        <td></td>
    </tr>

        <tr>
        <td class="auto-style2"></td>
        <td></td>
        
        <td>
            <div class="right">
                <asp:Label ID="Label24" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
        </td>
        <td></td>
    </tr>

        
    <tr>
        <td class="auto-style2"></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td class="auto-style2"></td>
        <td></td>
        <td></td>
    </tr>
</table>
    
</asp:Content>
