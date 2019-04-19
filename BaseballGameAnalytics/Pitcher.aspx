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
    <form id="form1" runat="server">
        <div class="col-lg-6">
            <asp:DropDownList ID="Players" runat="server" CssClass="form-control"></asp:DropDownList>
            <asp:Button ID="pitcherButton" class="btn" runat="server" Text="Run Prediction" OnClick="pitcherButton_Click" />
        </div>
    </form>
    <div class='tableauPlaceholder' id='viz1555629925594' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Cl&#47;ClintBaseball&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='ClintBaseball&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Cl&#47;ClintBaseball&#47;Dashboard1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1555629925594');                    var vizElement = divElement.getElementsByTagName('object')[0];                    if ( divElement.offsetWidth > 800 ) { vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';} else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';} else { vizElement.style.width='100%';vizElement.style.height='727px';}                     var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>

    <TWebControl:WebControl runat="server" />

</body>
</html>
