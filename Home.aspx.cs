using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DbMusic
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlLanguage.SelectedValue = "English";
            }
        }

        protected void dsGenre_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void dsSubGenre_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void ddlLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {
            //SELECT DISTINCT t.songName,t.url, a.artistName FROM (SELECT DISTINCT s.songName AS songName, s.url AS url, s.artistId AS artistId FROM songs s WHERE songLanguage = 'English' ORDER BY viewCount DESC LIMIT 20) t, artists a WHERE a.artistId = t.artistId;
            dsSongsByLang.SelectCommand = @"SELECT DISTINCT t.songName,t.url, a.artistName FROM (SELECT DISTINCT s.songName AS songName, s.url AS url, s.artistId AS artistId FROM songs s WHERE songLanguage = '" + ddlLanguage.SelectedValue + @"' ORDER BY viewCount DESC LIMIT 20) t, artists a WHERE a.artistId = t.artistId;";
            gvSongsByLangTest.DataBind();

            ddlGenre.SelectedIndex = 0;
            gvSongs.DataSourceID = "dsSongsByLang";
            gvSongs.DataBind();
        }

        protected void dsLanguages_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void dsGvSongs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void ddlGenre_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void ddlSubGenre_SelectedIndexChanged(object sender, EventArgs e)
        {
            dsGvSongsGenre.SelectCommand = @"SELECT t.name AS songName,t.url AS url FROM (SELECT DISTINCT s.songName AS name, s.url AS url,s.viewCount AS count FROM songs s,genres g WHERE s.songLanguage = '" + ddlLanguage.SelectedValue.ToString().Trim() + @"' AND s.youtubeId = g.songId AND g.name = '" + ddlSubGenre.SelectedValue.ToString().Trim() + @"') t ORDER BY t.count DESC LIMIT 20;";
            gvSongs.DataSourceID = "dsGvSongsGenre"; 
            gvSongs.DataBind();
        }

        protected void dsSongsByLang_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void lbSongName_Click(object sender, EventArgs e)
        {

        }

        protected void gvSongsByLangTest_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ArtistClick")
            {
                Session["abc"] = e.CommandArgument.ToString();
                ScriptManager.RegisterStartupScript(this, GetType(), "redirect", "window.open('ArtistBiography.aspx','_blank');", true);
            }
            else if (e.CommandName == "SongClick")
            {
                string url = e.CommandArgument.ToString();
                ifr.Src = @"https://www.youtube.com/embed/" + url.Substring(31);
                updPnlYoutube.Update();
            }
        }

        protected void gvSongsByLangTest_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvSongs_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvSongs_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SongGenreClick")
            {
                string url = e.CommandArgument.ToString();
                ifr.Src = @"https://www.youtube.com/embed/" + url.Substring(31);
                updPnlYoutube.Update();
            }
        }
    }
}