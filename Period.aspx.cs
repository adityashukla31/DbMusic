using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DbMusic
{
    public partial class Period : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlLanguage.SelectedValue = "English";
            }

           // updPnlYoutube.Visible = false;

        }

        protected void dsLanguages_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void lbSongName_Click(object sender, EventArgs e)
        {
           
        }

        protected void gvSongs_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvSongs_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            updPnlYoutube.Visible = true;
            // https://www.youtube.com/embed/alQlJDRnQkE
            // http://www.youtube.com/watch?v=kffacxfA7G4
                string url = e.CommandArgument.ToString();
              
                ifr.Src = @"https://www.youtube.com/embed/" + url.Substring(31);
                updPnlYoutube.Update();
               
        }

        protected void dsSongs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }

        protected void ddlLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvSongs.DataSourceID = "";
            gvSongs.DataBind();
            gvSongs.DataSource = dsSongs;

            dsSongs.SelectCommand = @"SELECT s.songName,s.url FROM songs s WHERE s.songLanguage = '" + ddlLanguage.SelectedValue + "' AND s.releaseDate BETWEEN " + Int32.Parse(txtSliderL.Text) + " AND " + Int32.Parse(txtSliderR.Text) + " ORDER BY s.viewCount DESC LIMIT 10";
            gvSongs.DataBind();
            
        }

        protected void txtSliderL_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtSliderR_TextChanged(object sender, EventArgs e)
        {
          
            
        }

        protected void txtPeriod_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnDates_Click(object sender, EventArgs e)
        {
            gvSongs.DataSourceID = "";
            gvSongs.DataBind();
            gvSongs.DataSource = dsSongs;

            dsSongs.SelectCommand = @"SELECT s.songName,s.url FROM songs s WHERE s.songLanguage = '" + ddlLanguage.SelectedValue + "' AND s.releaseDate BETWEEN " + Int32.Parse(txtSliderL.Text) + " AND " + Int32.Parse(txtSliderR.Text) + " ORDER BY s.viewCount DESC LIMIT 10";
            gvSongs.DataBind();
        }
    }
}