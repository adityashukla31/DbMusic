using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DbMusic
{
    public class Status
{
    public string version { get; set; }
    public int code { get; set; }
    public string message { get; set; }
}

public class License
{
    public string type { get; set; }
    public string attribution { get; set; }
    public string invalidnameattributionurl { get; set; }
    public string url { get; set; }
    public string version { get; set; }
}

public class Image
{
    public string url { get; set; }
    public List<object> tags { get; set; }
    public bool verified { get; set; }
    public License license { get; set; }
}

public class Biography
{
    public string text { get; set; }
    public string site { get; set; }
    public string url { get; set; }
    public License license { get; set; }
}

public class AudioSummary
{
    public int key { get; set; }
    public string analysis_url { get; set; }
    public double energy { get; set; }
    public double liveness { get; set; }
    public double tempo { get; set; }
    public double speechiness { get; set; }
    public double acousticness { get; set; }
    public double instrumentalness { get; set; }
    public int mode { get; set; }
    public int time_signature { get; set; }
    public double duration { get; set; }
    public double loudness { get; set; }
    public string audio_md5 { get; set; }
    public double valence { get; set; }
    public double danceability { get; set; }
}

public class Song
{
    public double song_hotttnesss { get; set; }
    public string title { get; set; }
    public string artist_name { get; set; }
    public double song_currency { get; set; }
    public string artist_id { get; set; }
    public string id { get; set; }
    public AudioSummary audio_summary { get; set; }
}

public class Response
{
    public Status status { get; set; }
    public int start { get; set; }
    public int total { get; set; }
    public List<Biography> biographies { get; set; }
    public List<Image> images { get; set; }
    public List<Song> songs { get; set; }
}

public class RootObject
{
    public Response response { get; set; }
}
}