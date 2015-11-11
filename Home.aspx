<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DbMusic.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #tdid {
            
            vertical-align:text-top;
            width:30%
        }
         .bgimg {
            background-image:url(Images/Background.png)
        }
        .auto-style1 {
            width: 100%;
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
        }
        .auto-style3 {
            width: 220px;
            vertical-align:bottom;
            margin:10px;
            background-position-x:center;
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
    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
    <table class="bgimg">
        <tr>
            <td class="auto-style9"></td>
            <td class="auto-style9"></td>
            <td class="auto-style9" style="color:white">
                <h2> Top Trending Songs</h2>
            </td>
            <td class="auto-style9"></td>
            <td class="auto-style9"></td>
        </tr>

        <tr>
            <td id="tdid" >
                <asp:UpdatePanel ID="updPnlLanguage" runat="server">
                    <ContentTemplate>
                        <div class="auto-style1">
                            <h4>
                                Search By Language
                            </h4>
                        </div> 
                        <div class="auto-style2">
                         <asp:DropDownList ID="ddlLanguage" runat="server" AutoPostBack="True" DataSourceID="dsLanguages" Width="100" DataTextField="songLanguage" DataValueField="songLanguage" OnSelectedIndexChanged="ddlLanguage_SelectedIndexChanged" CssClass="auto-style4">
                                <asp:ListItem Selected="True">English</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="auto-style3">
                            <asp:GridView ID="gvSongsByLangTest" runat="server" AutoGenerateColumns="False" DataSourceID="dsSongsByLang" OnRowCommand="gvSongsByLangTest_RowCommand" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="gvSongsByLangTest_SelectedIndexChanged" CssClass="auto-style4" CellPadding="4" AllowPaging="True">
                            <Columns>
                                <asp:TemplateField ShowHeader="False" HeaderText="Top Songs">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbSongName" runat="server" CausesValidation="False" CommandArgument='<%# Eval("url") %>' CommandName="SongClick" OnClick="lbSongName_Click" Text='<%# Eval("songName") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                    <ControlStyle Width="125px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Artist">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbArtist" runat="server" CommandArgument='<%# Eval("artistName") %>' CommandName="ArtistClick" Text='<%# Eval("artistName") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                    <ControlStyle Width="125px" />
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
                        </ContentTemplate>
                </asp:UpdatePanel>
                    
            </td>
            <td></td>
            <td id="tdidcntr">
                <div class="auto-style4">
                    <asp:UpdatePanel ID="updPnlYoutube" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <iframe runat="server" id="ifr" frameborder="0" height="415" width="560" allowfullscreen></iframe>
                    </ContentTemplate>
                </asp:UpdatePanel>
                </div>
            </td>
            <td></td>
            <td ID="tdid">
                <asp:UpdatePanel ID="updPnlGenre" runat="server">
                    <ContentTemplate>
                        <div class="auto-style5">
                            <h4>Search By Genre</h4>
                        </div>
                        <div class="auto-style5">
                            <asp:DropDownList ID="ddlGenre" runat="server" AutoPostBack="True" DataSourceID="dsGenre" DataTextField="Category" DataValueField="Category" OnSelectedIndexChanged="ddlGenre_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="updPnlSubGenre" runat="server">
                    <ContentTemplate>
                        <div class="auto-style5">
                            <asp:DropDownList ID="ddlSubGenre" runat="server" AutoPostBack="True" DataSourceID="dsSubGenre" DataTextField="Sub_Genre" DataValueField="Sub_Genre" OnSelectedIndexChanged="ddlSubGenre_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="auto-style3">
                            <asp:GridView ID="gvSongs" runat="server" AllowPaging="True" AlternatingRowStyle-BorderColor="#999966" BorderStyle="None" AutoGenerateColumns="False" BorderColor="#3366CC" BorderWidth="1px" CellPadding="4" DataSourceID="dsSongsByLang" OnSelectedIndexChanged="gvSongs_SelectedIndexChanged" BackColor="White" OnRowCommand="gvSongs_RowCommand">
                                    <AlternatingRowStyle />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Top Songs">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbSongByGenre" runat="server" CommandArgument='<%# Eval("url") %>' CommandName="SongGenreClick" Text='<%# Eval("songName") %>'></asp:LinkButton>
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
                    </ContentTemplate>
                </asp:UpdatePanel>

            </td>
        </tr>
        <tr>
            <td > </td>
               
            <td > </td>
        </tr>
        <tr>
            <td></td>
                            <td>
                                <%--<asp:GridView ID="gvSongsByLang" runat="server" AlternatingRowStyle-BorderColor="#999966" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Ridge" BorderWidth="1px" CellPadding="3" DataSourceID="dsSongsByLang" GridLines="Vertical">
                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                    <Columns>
                                        <asp:HyperLinkField DataNavigateUrlFields="url" DataTextField="songName" Target="_blank" HeaderText="Top Songs" />
                                        <asp:HyperLinkField DataTextField="artistName" HeaderText="Artist" NavigateUrl="~/ArtistBiography.aspx" Target="_blank" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#000065" />
                                </asp:GridView>--%>
                            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td >
                <asp:UpdatePanel ID="updPnlGvSongs" runat="server">
                    <ContentTemplate>
                        <asp:UpdatePanel ID="updPnlSongs" runat="server">
                        </asp:UpdatePanel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>&nbsp;</td>
        </tr>
        </table>
    <asp:SqlDataSource ID="dsLanguages" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString2 %>" ProviderName="<%$ ConnectionStrings:dbConnectionString2.ProviderName %>" SelectCommand="SELECT DISTINCT songLanguage FROM songs" OnSelecting="dsLanguages_Selecting"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsGenre" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString2 %>" OnSelecting="dsGenre_Selecting" ProviderName="<%$ ConnectionStrings:dbConnectionString2.ProviderName %>" SelectCommand="SELECT DISTINCT Category FROM mapping_genres ORDER BY Category"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsSubGenre" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString2 %>" OnSelecting="dsSubGenre_Selecting" ProviderName="<%$ ConnectionStrings:dbConnectionString2.ProviderName %>" SelectCommand="SELECT DISTINCT Sub_Genre FROM mapping_genres WHERE (Category = @genre) ORDER BY Sub_Genre">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlGenre" DefaultValue="Acid" Name="genre" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsGvSongs" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString2 %>" ProviderName="<%$ ConnectionStrings:dbConnectionString2.ProviderName %>" SelectCommand="SELECT songName, url FROM songs WHERE songLanguage = @lang  ORDER BY viewCount desc limit 20" OnSelecting="dsGvSongs_Selecting">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlLanguage" DefaultValue="English" Name="lang" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsGvSongsGenre" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString2 %>" ProviderName="<%$ ConnectionStrings:dbConnectionString2.ProviderName %>" SelectCommand="SELECT t.name AS songName,t.url AS url FROM (SELECT s.songName AS name,s.url AS url,s.viewCount AS count FROM songs s,genres g WHERE s.youtubeId = g.songId AND g.name LIKE '%@genre%' LIMIT 20) t ORDER BY t.count DESC;" OnSelecting="dsGvSongs_Selecting">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlGenre" DbType="String" DefaultValue="Acid" Name="genre" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsSongsByLang" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString2 %>" OnSelecting="dsSongsByLang_Selecting" ProviderName="<%$ ConnectionStrings:dbConnectionString2.ProviderName %>" SelectCommand="SELECT DISTINCT t.songName,t.url, a.artistName FROM (SELECT DISTINCT s.songName AS songName, s.url AS url, s.artistId AS artistId FROM songs s WHERE songLanguage = 'English' ORDER BY viewCount DESC LIMIT 20) t, artists a WHERE a.artistId = t.artistId;"></asp:SqlDataSource>

</asp:Content>
