using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DbMusic
{
   
    public partial class WebForm1 : System.Web.UI.Page
    {
        string selectedArtist;
        //List<Song> song;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        //private void AddToTableRow(List<TableCell> itemValues, TableRow tableRow)
        //{
        //    for (int x = 0; x < itemValues.Count; x++)
        //    {
        //        tableRow.Cells.AddAt(x, itemValues[x]);
        //    }
        //}

        //private void Populatetable()
        //{
        //    for (int i = 0; i < song.Count; i++)
        //    {
        //        List<TableCell> list = new List<TableCell>();
        //        //TableCell tCell = new TableCell();
        //        //tCell.Text = drpticker.SelectedValue.ToString().Trim();
        //        TableCell tCell1 = new TableCell();
        //        tCell1.Text = song[i].title.ToString();
        //        TableCell tCell2 = new TableCell();
        //        tCell2.Text = song[i].artist_name.ToString();
        //        list.Add(tCell1);
        //        list.Add(tCell2);
        //        if (i == 0)
        //        {
        //            AddToTableRow(list, TableRow1);
        //        }
        //        if (i == 1)
        //        {
        //            AddToTableRow(list, TableRow2);
        //        }
        //        if (i == 2)
        //        {
        //            AddToTableRow(list, TableRow3);
        //        }
        //        if (i == 3)
        //        {
        //            AddToTableRow(list, TableRow4);
        //        }
        //        if (i == 4)
        //        {
        //            AddToTableRow(list, TableRow5);
        //        }
        //        if (i == 5)
        //        {
        //            AddToTableRow(list, TableRow6);
        //        }
        //        if (i == 6)
        //        {
        //            AddToTableRow(list, TableRow7);
        //        }
        //        if (i == 7)
        //        {
        //            AddToTableRow(list, TableRow8);
        //        }
        //        if (i == 8)
        //        {
        //            AddToTableRow(list, TableRow9);
        //        }
        //        if (i == 9)
        //        {
        //            AddToTableRow(list, TableRow10);
        //        }

        //    }
        //}

        //private void getUserStatus()
        //{
        //    WebRequest req = WebRequest.Create(@"http://developer.echonest.com/api/v4/song/search?api_key=PUXDSVMEA60YYPPWL&artist=" +selectedArtist);
        //    req.Method = "GET";
        //    HttpWebResponse resp = req.GetResponse() as HttpWebResponse;
        //    if (resp.StatusCode == HttpStatusCode.OK)
        //    {
        //        using (Stream respStream = resp.GetResponseStream())
        //        {
        //            StreamReader reader = new StreamReader(respStream, Encoding.UTF8);
        //            string stringResponse = reader.ReadToEnd();
        //            if (stringResponse != String.Empty)
        //            {
        //                RootObject ro = JsonConvert.DeserializeObject<RootObject>(stringResponse);
        //                if (ro.response.status.message.ToString().Trim() == "Success")
        //                {
        //                    //txtArtistSearch.Text = "Success";
        //                    song = ro.response.songs;
        //                    //Server.Transfer("~/Home.aspx",true);

        //                    //Response.Redirect("~/Home.aspx");
        //                }
        //                else
        //                {
        //                    txtArtistSearch.Text = "Fail";
        //                }
        //            }
        //            else
        //            {
                        
        //            }
        //        }
        //    }
        //    else
        //    {
        //        //return null;
        //    }

        //}

       protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvArtistNames.Visible = true;
            string temp = "%"+txtArtistSearch.Text.Replace(" ","%")+"%";
            dsArtists.SelectCommand = @"SELECT DISTINCT artistName,artistId FROM artists WHERE artistName LIKE '" + temp + @"' LIMIT 20";
            gvArtistNames.DataBind();
            
        }

        protected void gvArtistNames_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "ArtistNameClick")
            {
                selectedArtist = e.CommandArgument.ToString();
                Session["abc"] = selectedArtist;
                dsSongsOfArtist.SelectCommand = "Select songName, url from songs where artistId=(Select artistId from artists where artistName='"+selectedArtist+@"' limit 1) ORDER BY viewCount DESC limit 20;";
                gvSongs.DataBind();
                
            }
        }

        protected void txtArtistSearch_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnGetBio_Click(object sender, EventArgs e)
        {
            if (Session["abc"] != null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "redirect", "window.open('ArtistBiography.aspx','_blank');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert(\"Please select an Artist\")", true);
            }
        }

        protected void lbSong_Click(object sender, EventArgs e)
        {
            
        }

        protected void gvSongs_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SongClick")
            {
                string url = e.CommandArgument.ToString();

                ifr.Src = @"https://www.youtube.com/embed/" + url.Substring(31);
                updPnlYoutube.Update();

            }
        }

        protected void dsSongsOfArtist_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 0;
        }


    }
}