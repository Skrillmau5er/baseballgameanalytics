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

        }
    }
}