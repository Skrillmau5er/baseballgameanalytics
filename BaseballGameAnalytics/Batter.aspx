<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Batter.aspx.cs" Inherits="BaseballGameAnalytics.Batter" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="index.css" />
    <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
    <link rel="icon" href="Images/baseball.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Baseball Analytics</title>
</head>
<body id="hello" runat="server">
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="Index.aspx">
            <img src="Images/baseball.png" width="50" height="auto" class="d-inline-block align-top baseball-img" alt="" />
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
                <li class="nav-item">
                    <a class="nav-link" href="Pitcher.aspx">Pitcher</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">Batter</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="jumbotron" style="text-align: center;"><h1>Batter Predicter</h1></div>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-lg-2"></div>
                <div class="col-lg-4 center">
                    <asp:Label ID="Label1" runat="server" Text="Ball Number: "></asp:Label><asp:TextBox ID="ballNumber" runat="server" CssClass="form-control zeroauto"></asp:TextBox>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator1" ControlToValidate="ballNumber" runat="server" ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator Forecolor="Red" ID="RegularExpressionValidator1" runat="server" ControlToValidate="ballNumber" ErrorMessage="Please enter a positive number" ValidationExpression="^[0-9][0-9]*$"></asp:RegularExpressionValidator><br />
            
                    <asp:Label ID="Label2" runat="server" Text="Strike Number: "></asp:Label><asp:TextBox ID="strikeNumber" runat="server" CssClass="form-control zeroauto"></asp:TextBox>
                                <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator2" ControlToValidate="strikeNumber" runat="server" ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator Forecolor="Red" ID="RegularExpressionValidator2" runat="server" ControlToValidate="strikeNumber" ErrorMessage="Please enter a positive number" ValidationExpression="^[0-9][0-9]*$"></asp:RegularExpressionValidator><br />
                </div>
                <div class="col-lg-4 center">
                    <asp:Label ID="Label3" runat="server" Text="Pitch Number: "></asp:Label><asp:TextBox ID="pitchNumber" runat="server" CssClass="form-control zeroauto"></asp:TextBox>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator3" ControlToValidate="pitchNumber" runat="server" ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator Forecolor="Red" ID="RegularExpressionValidator3" runat="server" ControlToValidate="pitchNumber" ErrorMessage="Please enter a positive number" ValidationExpression="^[0-9][0-9]*$"></asp:RegularExpressionValidator><br />

                    <asp:Label ID="Label4" runat="server" Text="Select Player: "></asp:Label><asp:DropDownList ID="Players" runat="server" CssClass="form-control zeroauto"></asp:DropDownList>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator4" ControlToValidate="Players" runat="server" ErrorMessage="Please select a Player"></asp:RequiredFieldValidator><br />
                </div>
            <div class="col-lg-2"></div>
                <asp:Button ID="addPitch" runat="server" Text="Predict!" style="margin:0 auto;" CssClass="btn" OnClick="addPitch_Click"/>
        </div>
    </form>
    

    <h1 id="resultHeader" class="center" style="margin-top: 20px;" runat="server"></h1>
    <h2 id="balls" class="center" runat="server"></h2>
    <h2 id="strikes" class="center" runat="server"></h2>
    <h2 id="fouls" class="center" runat="server"></h2>
    <h2 id="hits" class="center" runat="server"></h2>

       <footer class="page-footer">
        <div class="footer-copyright text-center py-3">© <%Response.Write(DateTime.Now.Year.ToString()); %> Copyright:
            <a href="https://skrillmau5er.com/">Skrillmau5er</a>
        </div>
    </footer>
</body>
</html>
