<%@ Page Title="Search by Period" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Period.aspx.cs" Inherits="DbMusic.Period" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .bgimg {
            width:100%;
            background-image:url(Images/Background.png);
        }
        .auto-style2 {
            width: 257px;
            vertical-align:central;
            margin:10px;
            background-position-x:center;
            flex-align:center;
        }
        .auto-style3 {
            width: 602px;
            vertical-align:central;
            margin:10px;
            text-align:justify;
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
            width: auto;
            vertical-align: central;
            margin: 10px;
            text-align: justify;
            background-position-x: center;
        }
        
        .auto-style6 {
            width: auto;
            vertical-align: central;
            margin: 10px;
            background-position-x: center;
            flex-align: center;
        }
        .auto-style7 {
            text-align: left;
        }
        
        .auto-style8 {
            width: auto;
            vertical-align:auto;
            margin: 10px;
            background-position-x:left;
            flex-align:start;
        }
        
    .auto-style9 {
        width: 257px;
    }
    .auto-style10 {
        width: 257px;
        vertical-align: central;
        margin: 10px;
        text-align: justify;
        background-position-x: center;
    }
    .auto-style11 {
        width: 618px;
        padding:0px;
    }
    .auto-style12 {
        width: 602px;
    }
    .bgTransparent {
        background-color:transparent; 
    }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <cc1:MultiHandleSliderExtender ID="txtSlider_MultiHandleSliderExtender" runat="server" BehaviorID="txtSlider_MultiHandleSliderExtender" HandleAnimationDuration="0.1" Maximum="2015" Minimum="1900" TargetControlID="txtPeriod">
                    <MultiHandleSliderTargets>
                        <cc1:MultiHandleSliderTarget ControlID ="txtSliderL"/>
                        <cc1:MultiHandleSliderTarget ControlID ="txtSliderR"/>
                    </MultiHandleSliderTargets>
                </cc1:MultiHandleSliderExtender>
    <table class="bgimg">
       <tr>
           <td class="auto-style9"></td>
           <td></td>
           <td class="auto-style12">
               <h2 class="auto-style11">Top Songs By Period</h2>
           </td>
           <td></td>
           <td></td>
       </tr>

         <tr>
    
            <td colspan="3" class="auto-style4">
            <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
            </td>
        </tr>
        <tr>
            
            <td class="auto-style10">
                <div class="auto-style6"><h4 class="auto-style7">Choose Language</h4></div>
                <div>
                <asp:UpdatePanel ID="updPnlLanguage" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddlLanguage" runat="server" DataSourceID="dsLanguages" DataTextField="songLanguage" DataValueField="songLanguage" AutoPostBack="True" OnSelectedIndexChanged="ddlLanguage_SelectedIndexChanged" Height="22px" Width="145px">
                            <asp:ListItem Selected="True">English</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
                    </div>
                
                <asp:Panel ID="sliderpnl" runat="server" VerticalAlign="Top">
                <div class="auto-style5"   >
                 <h4 class="auto-style7">Search By Period</h4>
                 </div>
                    <div class="auto-style8">
                <asp:TextBox ID="txtSliderL" runat="server" AutoPostBack="true" Width="66px" OnTextChanged="txtSliderL_TextChanged"></asp:TextBox>
                <asp:TextBox ID="txtSliderR" runat="server" Text="2015" AutoPostBack="true" Height="16px" Width="62px" OnTextChanged="txtSliderR_TextChanged"></asp:TextBox>
                        
                <br />
                  </div>
                    <div style="background-color:transparent"> 
                <asp:TextBox ID="txtPeriod" CssClass="bgTransparent" BackColor="Transparent" runat="server" Width="161px" Height="16px" OnTextChanged="txtPeriod_TextChanged"></asp:TextBox>
                    </div>               
                    <br />
                                   
                 <br />
                 <asp:Button ID="btnDates" runat="server" OnClick="btnDates_Click" Text="Search" />
                  </div> 
                    </asp:Panel>                
            </td>
            <td></td>
            <td class="auto-style3" rowspan="2">
                <asp:UpdatePanel ID="updPnlYoutube" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <iframe runat="server" id="ifr" frameborder="0" height="315" width="560"></iframe>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
            <td>
                <asp:UpdatePanel ID="updGvSongs" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvSongs" runat="server" AutoGenerateColumns="False" DataSourceID="dsSongs" OnRowCommand="gvSongs_RowCommand" OnSelectedIndexChanged="gvSongs_SelectedIndexChanged" AlternatingRowStyle-BorderColor="#999966" AllowPaging="True" BackColor="White" BorderColor="#3366CC" BorderStyle="None" AlternatingRowStyle-BackColor="#ccccff" BorderWidth="1px" CellPadding="4">
                            <AlternatingRowStyle BorderColor="#999966" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False" HeaderText="Top Songs ">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbSongName" runat="server" CausesValidation="False" CommandArgument='<%# Eval("url") %>' CommandName="SongNameClick" OnClick="lbSongName_Click" Text='<%# Eval("songName") %>'></asp:LinkButton>
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
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr><td colspan="3">
            
    <asp:SqlDataSource ID="dsLanguages" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString2 %>" ProviderName="<%$ ConnectionStrings:dbConnectionString2.ProviderName %>" SelectCommand="SELECT DISTINCT songLanguage FROM songs" OnSelecting="dsLanguages_Selecting"></asp:SqlDataSource>
            
            <asp:SqlDataSource ID="dsSongs" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString2 %>" ProviderName="<%$ ConnectionStrings:dbConnectionString2.ProviderName %>" SelectCommand="SELECT s.songName,s.url FROM songs s WHERE s.songLanguage = @language AND s.releaseDate BETWEEN @minDate AND @maxDate ORDER BY s.viewCount DESC LIMIT 10;" OnSelecting="dsSongs_Selecting">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlLanguage" DefaultValue="English" Name="language" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtSliderL" DefaultValue="1900" Name="minDate" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtSliderR" DefaultValue="2015" Name="maxDate" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            </td>
        </tr>
    </table>
</asp:Content>
