<%@ Page Title="Artist Bio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistBiography.aspx.cs" Inherits="DbMusic.ArtistBiography" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bgimg {
            background-image:url(Images/Background.png)
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnl1" class="bgimg" runat="server" Visible="true">
    <asp:Table ID="Table2" align="center" runat="server">
        <asp:TableRow ID="TableRow2" align="center" runat="server" ForeColor="Teal">
            <asp:TableCell><asp:Image ID="imgArtist" runat="server" ImageUrl="#"/></asp:TableCell>
            <asp:TableCell><asp:Label runat="server" ID="lblArtistName"></asp:Label></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow3" align="center" runat="server" ForeColor="Teal">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
        <asp:PlaceHolder ID="plcHolderBio" runat="server"></asp:PlaceHolder>
        <br />
    
   </asp:Panel>

</asp:Content>
