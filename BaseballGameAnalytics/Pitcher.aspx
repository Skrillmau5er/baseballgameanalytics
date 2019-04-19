<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pitcher.aspx.cs" Inherits="BaseballGameAnalytics.Pitcher" %>
<%@ Register Src="~/WebUserControl1.ascx" TagName="WebControl" TagPrefix="TWebControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="index.css" />
    <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
    <link rel="icon" href="Images/baseball.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Baseball Analytics</title>
</head>
<body>
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="Index.aspx">
            <img src="Images/baseball.png" width="50" height="auto" class="d-inline-block align-top baseball-img" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="Index.aspx">Baseball Analytics</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="tableau.html">Tableau</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">Pitcher</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Batter.aspx">Batter</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="jumbotron" style="text-align: center;"><h1>Pitch Predicter</h1></div>
    <div style="height: 700px;">
        <form id="form1" runat="server">
        <div>
            <div class="form-container-left">
                <label for="Players">Player</label>
                <asp:DropDownList ID="Players" runat="server" CssClass="form-control"></asp:DropDownList>
                <label for="PitchType">Pitch Type 1</label>
                <asp:DropDownList ID="Prev1" runat="server" CssClass="form-control"></asp:DropDownList>
                <label for="PitchType">Pitch Type 2</label>
                <asp:DropDownList ID="Prev2" runat="server" CssClass="form-control"></asp:DropDownList>
                <label for="PitchType">Pitch Type 3</label>
                <asp:DropDownList ID="Prev3" runat="server" CssClass="form-control"></asp:DropDownList>
                <label for="PitchType">Pitch Type 4</label>
                <asp:DropDownList ID="Prev4" runat="server" CssClass="form-control"></asp:DropDownList>
                <label for="PitchType">Pitch Type 5</label>
                <asp:DropDownList ID="Prev5" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="form-container-right">
                <label for="Balls">Ball Count</label>
                <asp:TextBox ID="Balls" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="Strikes">Strike Count</label>
                <asp:TextBox ID="Strikes" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="PitchHand">Player Pitching Hand</label>
                <asp:DropDownList ID="PitchHand" runat="server" CssClass="form-control"></asp:DropDownList>
                <label for="Inning">Inning</label>
                <asp:TextBox ID="Inning" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <asp:Button ID="pitcherButton" class="btn" runat="server" Text="Run Prediction" OnClick="pitcherButton_Click" />
        </form>
        <div id="Results" runat="server" class="resultsContainer"></div>
    </div>
    <TWebControl:WebControl runat="server" />
</body>
</html>
