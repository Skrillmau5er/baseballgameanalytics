using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;
using Newtonsoft.Json.Linq;

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
        }

        protected void addData_Click(object sender, EventArgs e)
        {
            string startS = startSpeed.Text.ToString();
            string endS = endSpeed.Text.ToString();
            string spin = spinRate.Text.ToString();
            string pitch = pitchType.Text.ToString();

            SqlConnection connection = new SqlConnection("Server=tcp:is415bestserver.database.windows.net,1433;Initial Catalog=BaseballAnalytics;Persist Security Info=False;User ID=bestserver;Password=c@ntfigureitout415;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT id, first_name, last_name FROM player_names PN INNER JOIN atbats AB ON PN.id = AB.pitcher_id ORDER BY PN.first_name", connection);
            
            connection.Close();
        }
    }
}