using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;
using Newtonsoft.Json.Linq;
using System.Data.SqlClient;

namespace BaseballGameAnalytics
{
    public partial class Pitcher : System.Web.UI.Page
    {
        static Dictionary<String, String> pitches = new Dictionary<String, String>
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
                {"FALSE", "Not Applicable"}
            };

        protected void Page_Load(object sender, EventArgs e)
        {
            ListItem li = null;

            SqlConnection connection = new SqlConnection("Server=tcp:is415bestserver.database.windows.net,1433;Initial Catalog=BaseballAnalytics;Persist Security Info=False;User ID=bestserver;Password=c@ntfigureitout415;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT id, first_name, last_name FROM player_names PN INNER JOIN atbats AB ON PN.id = AB.pitcher_id ORDER BY PN.first_name", connection);
            SqlDataReader reader = null;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                li = new ListItem((reader["first_name"].ToString() + ' ' + reader["last_name"].ToString()), reader["id"].ToString());
                Players.Items.Add(li);

            }
            reader.Close();
            Players.DataBind();
            connection.Close();

            foreach (KeyValuePair<String, String> pair in pitches)
            {
                li = new ListItem((pair.Value), pair.Key);
                Prev1.Items.Add(li);
                Prev2.Items.Add(li);
                Prev3.Items.Add(li);
                Prev4.Items.Add(li);
                Prev5.Items.Add(li);
            }

            PitchHand.Items.Add(new ListItem(("Left Handed"), "L"));
            PitchHand.Items.Add(new ListItem(("Right Handed"), "R"));
        }

        protected void pitcherButton_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://ussouthcentral.services.azureml.net/workspaces/a05d78f812b0420c86553fae3834a75d/services/a17779b2187b4b338c4e7f54287f9d65/execute?api-version=2.0&details=true");
            var request = new RestRequest(Method.POST);
            request.AddHeader("Postman-Token", "91f0fa07-9141-4e34-9d14-548556e5c96d");
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Authorization", "Bearer 0ij/DD0eVoXw4yJcy6Wma02uvJNAyAbJkVFIOrzkoI3v6evdVnB8h6iVqc5HK/fvJohX/6w2jgIb5xQs5L8r0g==");
            request.AddParameter("undefined", "{\r\n  \"Inputs\": {\r\n    \"input1\": {\r\n      \"ColumnNames\": [\r\n        \"b_count\",\r\n        \"s_count\",\r\n        \"prev1\",\r\n        \"prev2\",\r\n        \"prev3\",\r\n        \"prev4\",\r\n        \"prev5\",\r\n        \"inning\",\r\n        \"p_throws\",\r\n        \"pitcher_id\"\r\n      ],\r\n      \"Values\": [\r\n        [\r\n          \"" + Balls.Text + "\",\r\n          \"" + Strikes.Text + "\",\r\n          \"" + Prev1.SelectedValue + "\",\r\n          \"" + Prev2.SelectedValue + "\",\r\n          \"" + Prev3.SelectedValue + "\",\r\n          \"" + Prev4.SelectedValue + "\",\r\n          \"" + Prev5.SelectedValue + "\",\r\n          \"" + Inning.Text + "\",\r\n          \"" + PitchHand.SelectedValue + "\",\r\n          \"" + Players.SelectedItem.Value + "\"\r\n        ]\r\n      ]\r\n    }\r\n  },\r\n  \"GlobalParameters\": {}\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            
            var resultObject = JObject.Parse(response.Content.ToString());
            List<Pair> resultList = new List<Pair>();
            int size = resultObject["Results"]["output1"]["value"]["ColumnNames"].Count();
            for (int i = 1; i < size; i++)
            {
                String column = resultObject["Results"]["output1"]["value"]["ColumnNames"][i].ToString();
                String pitchType = column.Substring(column.Length - 3, 2);

                String probability = resultObject["Results"]["output1"]["value"]["Values"][0][i].ToString();

                if (pitches.ContainsKey(pitchType))
                {
                    String pitchTypeFull = pitches[pitchType];
                    double value = Convert.ToDouble(probability);
                    Pair pair = new Pair(pitchTypeFull, Math.Round(value, 2));
                    resultList.Add(pair);
                }
            }
            Results.InnerHtml = "";
            foreach (Pair pair in resultList)
            {
                Results.InnerHtml += "<p>" + pair.First + ": " + pair.Second + "%</p>";
            }
        }
    }
}