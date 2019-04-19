using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaseballGameAnalytics
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var pitches = new Dictionary<string, string>
            {
                {"CH","Changeup"},
                {"CU","Curveball"},
                {"EP","Eephus"},
                {"FC","Cutter"},
                {"FF","Four-seam Fastball"},
                {"FO","Pitchout"},
                {"FS","Splitter"},
                {"FT","Two-seam Fastball"},
                {"IN","Intentional ball"},
                {"KC","Knuckle curve"},
                {"KN","Knuckeball"},
                {"PO","Pitchout"},
                {"SC","Screwball"},
                {"SI","Sinker"},
                {"SL","Slider"},
            };
            ListItem li = null;
            foreach(var x in pitches)
            {
                li = new ListItem(x.Value.ToString(), x.Key.ToString());
                pitchType.Items.Add(li);
            }
                /*li = new ListItem((reader["first_name"].ToString() + ' ' + reader["last_name"].ToString()), reader["id"].ToString());
                //Players.Items.Add(li);

            }
            reader.Close();
            Players.DataBind();
            connection.Close();*/
        }
    }
}