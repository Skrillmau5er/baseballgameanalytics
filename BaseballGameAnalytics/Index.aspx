<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="BaseballGameAnalytics.Index" %>
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
        <a class="navbar-brand" href="#">
            <img src="Images/baseball.png" width="50" height="auto" class="d-inline-block align-top baseball-img" alt="" />
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Baseball Analytics</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="tableau.html">Tableau</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Pitcher.aspx">Pitcher</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Batter.aspx">Batter</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="jumbotron" style="text-align: center;"><h1>Welcome to Baseball Analytics</h1></div>
    <div class="row">
        <div class="col-lg-4">
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="Images/baseball-closeup.jpg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Tableau Data Vizualizations</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="tableau.html" class="btn btn-danger">Explore!</a>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="Images/pitcher.jpg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Pitch Predictions</h5>
                    <p class="card-text">What pitch will a pitcher throw next</p>
                    <a href="pitcher.aspx" class="btn btn-danger">Lets Go!</a>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="Images/batter.jpg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Batter Predictions</h5>
                    <p class="card-text">What outcomes will a certain pitch have against a batter</p>
                    <a href="batter.aspx" class="btn btn-danger">Take Me There!</a>
                </div>
            </div>
        </div>
    </div>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
    <TWebControl:WebControl runat="server" />
</body>
</html>
