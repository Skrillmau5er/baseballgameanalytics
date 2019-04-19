<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BaseballGameAnalytics.WebForm1" %>
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
                <li class="nav-item">
                    <a class="nav-link" href="#">Baseball Analytics</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="tableau.html">Tableau</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="Pitcher.aspx">Pitcher</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Batter.aspx">Batter</a>
                </li>
            </ul>
        </div>
    </nav>
     <div class="jumbotron" style="text-align: center;"><h1>Add a pitch</h1></div>
        
        <form id="form1" runat="server">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-4 center">
                    <asp:Label ID="Label1" runat="server" Text="Start Speed: "></asp:Label><asp:TextBox ID="startSpeed" runat="server" CssClass="form-control zeroauto"></asp:TextBox>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator1" ControlToValidate="startSpeed" runat="server" ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator Forecolor="Red" ID="RegularExpressionValidator1" runat="server" ControlToValidate="startSpeed" ErrorMessage="Please enter a positive number" ValidationExpression="^[0-9][0-9]*$"></asp:RegularExpressionValidator><br />
            
                    <asp:Label ID="Label2" runat="server" Text="End Speed: "></asp:Label><asp:TextBox ID="endSpeed" runat="server" CssClass="form-control zeroauto"></asp:TextBox>
                                <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator2" ControlToValidate="endSpeed" runat="server" ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator Forecolor="Red" ID="RegularExpressionValidator2" runat="server" ControlToValidate="endSpeed" ErrorMessage="Please enter a positive number" ValidationExpression="^[0-9][0-9]*$"></asp:RegularExpressionValidator><br />
                </div>
                <div class="col-lg-4 center">
                    <asp:Label ID="Label3" runat="server" Text="Spin Rate: "></asp:Label><asp:TextBox ID="spinRate" runat="server" CssClass="form-control zeroauto"></asp:TextBox>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator3" ControlToValidate="spinRate" runat="server" ErrorMessage="Please enter a number"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator Forecolor="Red" ID="RegularExpressionValidator3" runat="server" ControlToValidate="spinRate" ErrorMessage="Please enter a positive number" ValidationExpression="^[0-9][0-9]*$"></asp:RegularExpressionValidator><br />

                    <asp:Label ID="Label4" runat="server" Text="Pitch Type: "></asp:Label><asp:DropDownList ID="pitchType" runat="server" CssClass="form-control zeroauto"></asp:DropDownList>
                    <asp:RequiredFieldValidator Forecolor="Red" ID="RequiredFieldValidator4" ControlToValidate="pitchType" runat="server" ErrorMessage="Please select a pitch Type"></asp:RequiredFieldValidator><br />
                </div>
                <div class="col-lg-2"></div>
                <asp:Button ID="addData" runat="server" Text="Add Pitch!" style="margin:0 auto;" CssClass="btn" OnClick="addData_Click" />
            </div>
        </form>
    <h3 class="center" id="success" runat="server"></h3>
        <footer class="page-footer">
        <div class="footer-copyright text-center py-3">© <%Response.Write(DateTime.Now.Year.ToString()); %> Copyright:
            <a href="https://skrillmau5er.com/">Skrillmau5er</a>
        </div>
    </footer>
</body>
</html>
