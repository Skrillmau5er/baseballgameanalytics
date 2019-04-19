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
        }

        protected void pitcherButton_Click(object sender, EventArgs e)
        {
            var client = new RestClient("https://ussouthcentral.services.azureml.net/workspaces/a05d78f812b0420c86553fae3834a75d/services/a17779b2187b4b338c4e7f54287f9d65/execute?api-version=2.0&details=true");
            var request = new RestRequest(Method.POST);
            request.AddHeader("Postman-Token", "91f0fa07-9141-4e34-9d14-548556e5c96d");
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Authorization", "Bearer 0ij/DD0eVoXw4yJcy6Wma02uvJNAyAbJkVFIOrzkoI3v6evdVnB8h6iVqc5HK/fvJohX/6w2jgIb5xQs5L8r0g==");
            request.AddParameter("undefined", "{\r\n  \"Inputs\": {\r\n    \"input1\": {\r\n      \"ColumnNames\": [\r\n        \"b_count\",\r\n        \"s_count\",\r\n        \"prev1\",\r\n        \"prev2\",\r\n        \"prev3\",\r\n        \"prev4\",\r\n        \"prev5\",\r\n        \"inning\",\r\n        \"p_throws\",\r\n        \"pitcher_id\"\r\n      ],\r\n      \"Values\": [\r\n        [\r\n          \"1\",\r\n          \"2\",\r\n          \"FF\",\r\n          \"FF\",\r\n          \"FF\",\r\n          \"FF\",\r\n          \"FALSE\",\r\n          \"3\",\r\n          \"L\",\r\n          \""+Players.SelectedItem.Value+"\"\r\n        ]\r\n      ]\r\n    }\r\n  },\r\n  \"GlobalParameters\": {}\r\n}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            Results.Text = response.Content.ToString();
        }
    }
}