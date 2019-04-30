<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pitcher.aspx.cs" Inherits="BaseballGameAnalytics.Pitcher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://public.tableau.com/javascripts/api/tableau-2.0.0.min.js"></script>

    <script type="text/javascript">
    var viz, workbook, activesheet;
    var containerDiv;
    var viz;
    var url;
    function initViz() {
        containerDiv = document.getElementById("vizContainer"),
        url = "https://public.tableau.com/views/ClintBaseball/Pitching?:embed=y&:display_count=yes&publish=yes";
        var options = {
            width: 800,
            height: 800,
            hideTabs: true,
            hideToolbar: true,
            onFirstInteractive: function () {
              workbook = viz.getWorkbook();
                activesheet = workbook.getActiveSheet();
                console.log(activesheet)
            }
        };
        viz = new tableau.Viz(containerDiv, url, options);
    }

        function addValuesToFilter(element) {
            if (element) {
                document.getElementById('pitchBreakDown').innerHTML = "Pitch Breakdown for " + element.options[element.selectedIndex].text;
            }
            else {
                document.getElementById('pitchBreakDown').innerHTML = "Pitch Breakdown for A.J. Burnett";
            }
            var e = document.getElementById("Players");
            var pid = e.value

            activesheet.applyFilterAsync(
            "Pitcher Id",
            pid,
                tableau.FilterUpdateType.REPLACE);
        }  

    </script>
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
     <!--Johnnys Section -->
    <div class="jumbotron" style="text-align: center;"><h1>Pitch Predicter</h1><br /> <h4><a id="addPitch" class="btn btn-primary" href="WebForm1.aspx">Add Pitch</a></h4></div>
        <form id="form2" runat="server">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-4 center">
                    <label for="Players">Player</label>
                    <asp:DropDownList ID="Players" runat="server" CssClass="form-control zeroauto" onchange="addValuesToFilter(this);"></asp:DropDownList>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator1" ControlToValidate="Players" runat="server" ErrorMessage="Please choose a player"></asp:RequiredFieldValidator><br />
                    
                    <label for="Balls">Ball Count</label>
                    <asp:TextBox ID="Balls" runat="server" CssClass="form-control zeroauto"></asp:TextBox>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator2" ControlToValidate="Balls" runat="server" ErrorMessage="Please enter a number"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Forecolor="Red" ID="RegularExpressionValidator2" runat="server" ControlToValidate="Balls" ErrorMessage="Please enter a positive number" ValidationExpression="^[0-9][0-9]*$"></asp:RegularExpressionValidator><br />
                    
                    <label for="Strikes">Strike Count</label>
                    <asp:TextBox ID="Strikes" runat="server" CssClass="form-control zeroauto"></asp:TextBox>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator3" ControlToValidate="Strikes" runat="server" ErrorMessage="Please enter a number"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Forecolor="Red" ID="RegularExpressionValidator3" runat="server" ControlToValidate="Strikes" ErrorMessage="Please enter a positive number" ValidationExpression="^[0-9][0-9]*$"></asp:RegularExpressionValidator><br />
                    
                    <label for="PitchHand">Player Pitching Hand</label>
                    <asp:DropDownList ID="PitchHand" runat="server" CssClass="form-control zeroauto"></asp:DropDownList>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator4" ControlToValidate="PitchHand" runat="server" ErrorMessage="Please select a value"></asp:RequiredFieldValidator><br />
                   
                    <label for="Inning">Inning</label>
                    <asp:TextBox ID="Inning" runat="server" CssClass="form-control zeroauto"></asp:TextBox>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator5" ControlToValidate="Inning" runat="server" ErrorMessage="Please enter a number"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Forecolor="Red" ID="RegularExpressionValidator5" runat="server" ControlToValidate="Inning" ErrorMessage="Please enter a positive number" ValidationExpression="^[0-9][0-9]*$"></asp:RegularExpressionValidator><br />
                </div>
                <div class="col-lg-4 center">
                    <label for="PitchType">Previous Pitch Type 1</label>
                    <asp:DropDownList ID="Prev1" runat="server" CssClass="form-control zeroauto"></asp:DropDownList>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator6" ControlToValidate="Prev1" runat="server" ErrorMessage="Please select a value"></asp:RequiredFieldValidator><br />
                  
                    <label for="PitchType">Previous Pitch Type 2</label>
                    <asp:DropDownList ID="Prev2" runat="server" CssClass="form-control zeroauto"></asp:DropDownList>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator7" ControlToValidate="Prev2" runat="server" ErrorMessage="Please select a value"></asp:RequiredFieldValidator><br />
                  
                    <label for="PitchType">Previous Pitch Type 3</label>
                    <asp:DropDownList ID="Prev3" runat="server" CssClass="form-control zeroauto"></asp:DropDownList>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator8" ControlToValidate="Prev3" runat="server" ErrorMessage="Please select a value"></asp:RequiredFieldValidator><br />
                   
                    <label for="PitchType">Previous Pitch Type 4</label>
                    <asp:DropDownList ID="Prev4" runat="server" CssClass="form-control zeroauto"></asp:DropDownList>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator9" ControlToValidate="Prev4" runat="server" ErrorMessage="Please select a value"></asp:RequiredFieldValidator><br />
                   
                    <label for="PitchType">Previous Pitch Type 5</label>
                    <asp:DropDownList ID="Prev5" runat="server" CssClass="form-control zeroauto"></asp:DropDownList>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator10" ControlToValidate="Prev5" runat="server" ErrorMessage="Please select a value"></asp:RequiredFieldValidator><br />
                </div>
                <div class="col-lg-2"></div>
                <asp:Button ID="Button1" class="btn" runat="server" style="margin: 0 auto;" Text="Predict!" OnClick="pitcherButton_Click" />
            </div>
        </form>
        <div id="Results" runat="server"></div>
       
        <h3 id="pitchBreakDown" class="center" style="margin-top: 40px;"></h3>
        <div class="center">(Select a pitcher from the dropdown and this will update automatically)</div>
        <script>initViz(); addValuesToFilter();</script>

        <footer class="page-footer">
        <div class="footer-copyright text-center py-3">© <%Response.Write(DateTime.Now.Year.ToString()); %> Copyright:
            <a href="https://skrillmau5er.com/">Skrillmau5er</a>
        </div>
    </footer>
</body>
</html>
