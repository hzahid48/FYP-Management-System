<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Include Bootstrap JavaScript -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        /* Flexbox for centering content vertically and horizontally */
        .center {
            display: flex;
            flex-direction: column;  /* Vertical stacking */
            justify-content: center;  /* Center vertically */
            align-items: center;  /* Center horizontally */
            height: 100vh;  /* Full viewport height */
        }

        .text-box {
            padding: 10px;
            border-radius: 5px;  /* Rounded corners */
            border: 1px solid #ccc;  /* Light border */
            width: 250px;  /* Consistent width */
            margin-bottom: 10px;  /* Spacing */
        }

        .button-style {
            padding: 10px 20px;
            background-color: blue;  /* Button background color */
            color: white;  /* Button text color */
            border-radius: 5px;  /* Rounded corners */
            border: none;  /* No border */
        }

        .label {
            font-weight: bold;  /* Bold text for labels */
            margin-bottom: 5px;  /* Space between label and text box */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center">
            <h2>Login</h2>  <!-- Page title -->

            <!-- Username and password fields -->
            <asp:Label ID="UsernameLbl" runat="server" Text="Username" CssClass="label"></asp:Label>
            <asp:TextBox ID="UsernameTxt" runat="server" CssClass="text-box"></asp:TextBox>

            <asp:Label ID="PasswordLbl" runat="server" Text="Password" CssClass="label"></asp:Label>
            <asp:TextBox ID="PasswordTxt" runat="server" CssClass="text-box" TextMode="Password"></asp:TextBox>

            <!-- Role selection dropdown -->
            <asp:Label ID="RoleLbl" runat="server" Text="Role" CssClass="label"></asp:Label>
            <asp:DropDownList ID="RoleDdl" runat="server" CssClass="text-box">
                <asp:ListItem Text="-- Select Role --" Value="" /> 
                <asp:ListItem Text="Student" Value="Student" />
                <asp:ListItem Text="Supervisor" Value="Supervisor" />
                <asp:ListItem Text="Panel Member" Value="Panel Member" />
                <asp:ListItem Text="Committee Member" Value="Committee Member" />
            </asp:DropDownList>

            <!-- Login button -->
            <asp:Button ID="LoginBtn" runat="server" OnClick="LoginBtn_Click" Text="Login" CssClass="button-style" />
        </div>
    </form>
</body>
</html>
