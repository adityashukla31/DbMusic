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
    public partial class SongStatistics : System.Web.UI.Page
    {
        string songTitle;
        List<Song> sng;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void getSongStat(string songName)
        {
            WebRequest req = WebRequest.Create(@"http://developer.echonest.com/api/v4/song/search?api_key=PUXDSVMEA60YYPPWL&format=json&results=1&title=" + songName + "&bucket=audio_summary&bucket=song_currency&bucket=song_hotttnesss");
            req.Method = "GET";
            HttpWebResponse resp = req.GetResponse() as HttpWebResponse;
            if (resp.StatusCode == HttpStatusCode.OK)
            {
                using (Stream respStream = resp.GetResponseStream())
                {
                    StreamReader reader = new StreamReader(respStream, Encoding.UTF8);
                    string stringResponse = reader.ReadToEnd();
                    if (stringResponse != String.Empty)
                    {
                        RootObject ro = JsonConvert.DeserializeObject<RootObject>(stringResponse);
                        sng = ro.response.songs;
                        Label2.Visible = true;
                        Label4.Visible = true;
                        Label6.Visible = true;
                        Label1.Visible = true;
                        Label8.Visible = true;
                        Label10.Visible = true;
                        Label12.Visible = true;
                        Label14.Visible = true;
                        Label16.Visible = true;
                        Label18.Visible = true;
                        Label20.Visible = true;
                        Label24.Visible = true;
                        Label3.Visible = true;
                        string mode="Minor";
                        if (sng[0].audio_summary.mode == 1)
                        {
                            mode = "Major";
                        }
                        Label1.Text = ddlSong.SelectedValue.ToString().Trim();
                        Label2.Text = "Duration (in Secs) : " + sng[0].audio_summary.duration;
                        Label3.Text = "Artist: " + sng[0].artist_name;
                        Label4.Text = "Time Signature : " + sng[0].audio_summary.time_signature;
                        Label6.Text = "This song is a " +mode;
                        Label8.Text = "Loudness : " + sng[0].audio_summary.loudness;
                        Label10.Text = "Energy : " + sng[0].audio_summary.energy;
                        Label12.Text = "Tempo : " + sng[0].audio_summary.tempo;
                        Label14.Text = "Dancebility : " + sng[0].audio_summary.danceability;
                        Label16.Text = "Instrumentalness : " + sng[0].audio_summary.instrumentalness;
                        Label18.Text = "Acousticness : " + sng[0].audio_summary.acousticness;
                        Label20.Text = "Speechiness : " + sng[0].audio_summary.speechiness;
                        Label22.Text = "Hotness Level : " + sng[0].song_hotttnesss;
                        Label24.Text = "Currency  : " + sng[0].song_currency;

                    }
                    else
                    {

                    }
                }
            }
            else
            {
                //return null;
            }

        }

        protected void DSSongs_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnsrch_Click(object sender, EventArgs e)
        {
            songTitle = txtSongName.Text;
            DSSongs.SelectCommand = "select songName from songs where songName like '" + songTitle + "%' limit 20";
            ddlSong.DataSourceID = "DSSongs";
            ddlSong.DataBind();
           
        }


        protected void ddlSong_SelectedIndexChanged(object sender, EventArgs e)
        {
            getSongStat(ddlSong.SelectedValue.ToString().Trim());
        }
    }
}