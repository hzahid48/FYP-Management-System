<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser" MasterPageFile="~/CommitteeMember.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Back button styling */
        .back-button {
            color: white;
            text-decoration: none;
            background-color: gray;
            padding: 10px 20px;
            border-radius: 10px;
            font-size: 16px;
            transition: background-color 0.3s, color 0.3s;
            position: absolute;
            left: 5px;  /* Position the back button to the far left */
            top: 10px;  /* Position at the top */
        }

        .back-button:hover {
            background-color: darkgray;  /* Hover effect for the back button */
            color: black;
        }

        /* Flexbox for centering content vertically */
        .center {
            display: flex;
            flex-direction: column;  /* Vertical stacking */
            justify-content: center;  /* Center vertically */
            align-items: center;  /* Center horizontally */
            height: 100vh;  /* Full viewport height */
        }

        .label {
            font-weight: bold;  /* Bold text for labels */
            margin-bottom: 5px;  /* Space between label and input */
        }

        .text-box {
            padding: 10px;  /* Padding for comfort */
            border-radius: 5px;  /* Rounded corners */
            border: 1px solid #ccc;  /* Light border */
            width: 250px;  /* Consistent width */
            height: 40px;  /* Increased height for text boxes */
            margin-bottom: 10px;  /* Spacing */
        }

        .button-style {
            padding: 10px 20px;
            background-color: #3498db;  /* Button background color */
            color: white;  /* Button text color */
            border-radius: 10px;  /* Rounded corners */
            border: none;
            transition: background-color 0.3s, transform 0.3s;  /* Hover effect */
        }

        .button-style:hover {
            background-color: #3498db;  /* Darker blue on hover */
            transform: scale(1.05);  /* Slight zoom effect on hover */
        }

        /* Container padding-top for title spacing */
        .container {
            padding-top: 50px;  /* Space for the title */
        }
    </style>

    <div class="center">  <!-- Use Flexbox to align content at the center of the page -->
        <h2>Create User Account</h2>  <!-- Page title -->

        <!-- Username and password fields -->
        <asp:Label ID="UsernameLbl" runat="server" Text="Username" CssClass="label" />
        <asp:TextBox ID="UsernameTxt" runat="server" CssClass="text-box" />

        <asp:Label ID="PasswordLbl" runat="server" Text="Password" CssClass="label" />
        <asp:TextBox ID="PasswordTxt" runat="server" CssClass="text-box" TextMode="Password" />

        <!-- Role selection -->
        <asp:Label ID="RoleLbl" runat="server" Text="Role" CssClass="label" />
        <asp:DropDownList ID="RoleDdl" runat="server" CssClass="text-box">
            <asp:ListItem Text="Student" Value="Student" />
            <asp:ListItem Text="Supervisor" Value="Supervisor" />
            <asp:ListItem Text="Panel Member" Value="Panel Member" />
        </asp:DropDownList>

        <!-- First and last names -->
        <asp:Label ID="FirstNameLbl" runat="server" Text="First Name" CssClass="label" />
        <asp:TextBox ID="FirstNameTxt" runat="server" CssClass="text-box" />

        <asp:Label ID="LastNameLbl" runat="server" Text="Last Name" CssClass="label" />
        <asp:TextBox ID="LastNameTxt" runat="server" CssClass="text-box" />

        <!-- Create User button -->
        <asp:Button ID="CreateUserBtn" runat="server" OnClick="CreateUserBtn_Click" Text="Create User" CssClass="button-style" />
    </div>
</asp:Content>
