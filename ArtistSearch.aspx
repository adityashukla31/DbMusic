<%@ Page Title="Artist Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistSearch.aspx.cs" Inherits="DbMusic.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #tdid {
            
            vertical-align:text-top;
            width:30%
        }
         #tdidcntr {
            vertical-align:top;
            width:20%
        }
         .bgimg {
            background-image:url(Images/Background.png);
            width:100%;
        }
        .auto-style1 {
            width: 94%;
            vertical-align:top;
            background-position-x:left;
            margin:10px;
            text-align:center;
        }
        .auto-style2 {
            width: 220px;
            vertical-align:central;
            margin:10px;
            background-position-x:center;
            flex-align:center;
            text-align:center;
        }
        .auto-style3 {
            width: 220px;
            vertical-align:bottom;
            margin:10px;
            flex-align:center;
            background-position-x:center;
            text-align:center;
        }
        .auto-style4 {
            width: auto;
            vertical-align:top;
            margin:10px;
            background-position-x:center;
            text-align: center;
        }
        .auto-style5 {
            width: 220px;
            vertical-align: text-top;
            margin: 10px;
            
        }
        .auto-style9 {
            height: 74px;
        }
         </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="bgimg" >
        <tr>
            <td colspan="5">
                <h2>Search Songs By Your Favorite Artist</h2>
            </td>
        </tr>
        <tr>
            <td class="tdid">
                <div class="auto-style1">
                    <asp:TextBox ID="txtArtistSearch" runat="server" OnTextChanged="txtArtistSearch_TextChanged"></asp:TextBox>
                </div>
                <div class="auto-style2">
                     <asp:Button ID="btnSearch" runat="server" Height="22px" Text="Search" Width="61px" OnClick="btnSearch_Click" />
                </div>
            

            <div class="auto-style3">
                <asp:GridView ID="gvArtistNames" runat="server" AutoGenerateColumns="False" DataSourceID="dsArtists" OnRowCommand="gvArtistNames_RowCommand" Width="200px" Visible="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowPaging="True">
                    <Columns>
                        <asp:TemplateField HeaderText="Artist" SortExpression="artistName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("artistName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbArtistName" runat="server" CommandArgument='<%# Eval("artistName") %>' CommandName="ArtistNameClick" Text='<%# Eval("artistName") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
            </div>
                <div style="text-align:center">
                <asp:Button ID="btnGetBio" runat="server" Text="Get Artist Biography" OnClick="btnGetBio_Click" />
                </div>
        </td>

            <td class="auto-style3">
                <asp:ScriptManager ID="sm" runat="server">
                </asp:ScriptManager>
            </td>

            <td class="tdid"> 
                <div class="auto-style4">
                <asp:UpdatePanel ID="updPnlYoutube" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <iframe runat="server" id="ifr" frameborder="0" height="315" width="560"></iframe>
                    </ContentTemplate>
                </asp:UpdatePanel>
                </div>
            </td>
            <td></td>
            <td class="tdid">
                <div class="auto-style1">
                <asp:GridView ID="gvSongs" runat="server" AutoGenerateColumns="False" DataSourceID="dsSongsOfArtist" OnRowCommand="gvSongs_RowCommand" CssClass="auto-style3" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                    <Columns>
                        <asp:TemplateField HeaderText="Top Songs">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbSong" runat="server" CommandArgument='<%# Eval("url") %>' OnClick="lbSong_Click" Text='<%# Eval("songName") %>' CommandName="SongClick"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                    </div>
            </td>
        </tr>

        <tr>
           
            
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
    
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                
            </td>
            
            
        </tr>
    </table>
    
    <br />


        <asp:Panel ID="pnl1" runat="server" Visible="true">
    
            <asp:SqlDataSource ID="dsArtists" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString2 %>" ProviderName="<%$ ConnectionStrings:dbConnectionString2.ProviderName %>" SelectCommand="SELECT DISTINCT artistName FROM artists WHERE artistName LIKE '%maroon%5%' LIMIT 20;"></asp:SqlDataSource>
    
            <asp:SqlDataSource ID="dsSongsOfArtist" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString2 %>" ProviderName="<%$ ConnectionStrings:dbConnectionString2.ProviderName %>" OnSelecting="dsSongsOfArtist_Selecting"></asp:SqlDataSource>
    
    
    </asp:Table>
   </asp:Panel>
</asp:Content>
