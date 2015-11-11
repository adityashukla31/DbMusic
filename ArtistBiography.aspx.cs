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
    public partial class ArtistBiography : System.Web.UI.Page
    {
        List<Biography> bio;
        string artistName;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["abc"] != null)
            {
                artistName = Session["abc"].ToString();
                getartistBio(artistName);
                getartistImage(artistName);
                Populatetable();
            }
            else
            {
                imgArtist.Visible = false;
            }
        }

        private void AddToTableRow(List<TableCell> itemValues, TableRow tableRow)
        {
            for (int x = 0; x < itemValues.Count; x++)
            {
                tableRow.Cells.AddAt(x, itemValues[x]);
            }
        }

        private void Populatetable()
        {
            
                List<TableCell> list = new List<TableCell>();
                //TableCell tCell = new TableCell();
                //tCell.Text = drpticker.SelectedValue.ToString().Trim();
                TableCell tCell1 = new TableCell();
                tCell1.Text = artistName;  
                TableCell tCell2 = new TableCell();
                tCell2.Text = bio[0].text.ToString();
                TableCell tCell3 = new TableCell();
                tCell3.Text = bio[0].url.ToString();
                list.Add(tCell1);
                list.Add(tCell2);
                list.Add(tCell3);
               
             
        }
        //http://developer.echonest.com/api/v4/artist/images?api_key=PUXDSVMEA60YYPPWL&name=ARH6W4X1187B99274F&format=json&results=1&start=0&license=unknown

        private void getartistImage(string artistName)
        {
            WebRequest req = WebRequest.Create(@"http://developer.echonest.com/api/v4/artist/images?api_key=PUXDSVMEA60YYPPWL&name=" + artistName + "&format=json&results=1&start=0&license=unknown");
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
                        List<Image> imList = ro.response.images;
                        string imUrl = imList[0].url;
                        imgArtist.ImageUrl = imUrl;
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
        
        private void getartistBio(string artistName)
        {
            WebRequest req = WebRequest.Create(@"http://developer.echonest.com/api/v4/artist/biographies?api_key=PUXDSVMEA60YYPPWL&name=" + artistName + "&format=json&results=1&start=0&license=cc-by-sa");
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
                        bio = ro.response.biographies;
                        string tst = bio[0].text;
                        plcHolderBio.Controls.Add(new LiteralControl(@"<div style="+"color:white"+" class="+"bgimg"+"><h5>"+tst+@"</h5></div>"));
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


    }
}