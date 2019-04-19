using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;
using Newtonsoft.Json.Linq;
using System.Data.SqlClient;
using System.Diagnostics;

namespace BaseballGameAnalytics
{
    public partial class Batter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListItem li = null;

            SqlConnection connection = new SqlConnection("Server=tcp:is415bestserver.database.windows.net,1433;Initial Catalog=BaseballAnalytics;Persist Security Info=False;User ID=bestserver;Password=c@ntfigureitout415;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT id, first_name, last_name FROM player_names PN INNER JOIN atbats AB ON PN.id = AB.batter_id ORDER BY PN.first_name", connection);
            SqlDataReader reader = null;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                li = new ListItem((reader["first_name"].ToString() + ' ' + reader["last_name"].ToString()), reader["id"].ToString());
                Players.Items.Add(li);

            }
            reader.Close();
            connection.Close();
        }

        protected void addPitch_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://ussouthcentral.services.azureml.net/workspaces/f6fb483a8e3446368017103a8de3076b/services/25e503f2b07e4dea89dbf4a14a0243de/execute?api-version=2.0&details=true");
            var request = new RestRequest(Method.POST);
            request.AddHeader("Postman-Token", "eb0191bb-6f24-4a82-aaee-fb6be856083a");
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("Authorization", "Bearer HnTJMTsvDSmEZq8KJ6w765kcRw2oqUXl/tHvYqUeGqddw2jQQSzC81QZRf3mXwJEDOQ6hVksfT8y3HXQEpdf0A==");
            request.AddHeader("Content-Type", "application/json");
            request.AddParameter("undefined", "{\n \"Inputs\": {\n   \"input1\": {\n     \"ColumnNames\": [\n       \"b_count\",\n       \"s_count\",\n       \"pitch_num\",\n       \"batter_id\"\n     ],\n     \"Values\": [\n       [\n         \"" + ballNumber.Text.ToString() + "\",\n         \"" + strikeNumber.Text.ToString() + "\",\n         \"" + pitchNumber.Text.ToString() + "\",\n         \"" + Players.SelectedValue.ToString() + "\"\n       ],\n       [\n         \"value\",\n         \"value\",\n         \"value\",\n         \"0\"\n       ]\n     ]\n   }\n },\n \"GlobalParameters\": {}\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            var results = JObject.Parse(response.Content);
            var ball = results["Results"]["output1"]["value"]["Values"][0][6].ToString();
            var strike = Convert.ToDecimal(results["Results"]["output1"]["value"]["Values"][0][7].ToString()) + Convert.ToDecimal(results["Results"]["output1"]["value"]["Values"][0][16].ToString());
            var foul = results["Results"]["output1"]["value"]["Values"][0][10].ToString();
            var hit = Convert.ToDecimal(results["Results"]["output1"]["value"]["Values"][0][9].ToString()) + Convert.ToDecimal(results["Results"]["output1"]["value"]["Values"][0][20].ToString());

            balls.InnerHtml = "Ball: " + Math.Round(Convert.ToDecimal(ball) * 100, 2) + "%";
            strikes.InnerHtml = "Strike: " + Math.Round(Convert.ToDecimal(strike) * 100,2) + "%";
            fouls.InnerHtml = "Foul: " + Math.Round(Convert.ToDecimal(foul) * 100,2) + "%";
            hits.InnerHtml = "Hit: " + Math.Round(Convert.ToDecimal(hit) * 100,2) + "%";
            resultHeader.InnerHtml = "Chances of Occurance";
            
        }

    }
}