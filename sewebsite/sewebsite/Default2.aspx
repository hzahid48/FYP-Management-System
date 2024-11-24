<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">



<head runat="server">
    <title></title>

    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Include Bootstrap JavaScript -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        
        body {
            background-image: url('alexander-grey-eMP4sYPJ9x0-unsplash.jpg');  /* Path to the image */
            background-size: cover;  /* Ensure the image covers the entire background */
            background-position: center;  /* Center the image */
            background-repeat: no-repeat;  /* Prevent the image from repeating */
        }
        
        
        
        /* Custom styles for centering and styling labels and text boxes */
        .center {
            display: flex;
            flex-direction: column;  /* Vertical stacking */
            justify-content: center;
            align-items: center;  /* Horizontal centering */
            height: 100vh;  /* Full height of the viewport */
            text-align: center;  /* Center text alignment */
        }

        .text-box {
         padding: 10px;  /* Padding for comfort */
            border-radius: 5px;  /* Rounded corners */
            border: 1px solid #ccc;  /* Light border */
            width: 250px;  /* Fixed width for consistency */
            margin-bottom: 10px;  /* Space between text boxes */
        }

        .label {
            font-weight: bold;  /* Bold text */
            margin-bottom: 5px;  /* Space between label and text box */
        }

          .button-style {
            padding: 10px 20px;  /* Padding for larger buttons */
            background-color: blue;  /* Button background color */
            color: white;  /* Button text color */
            border-radius: 5px;  /* Rounded corners */
            border: none;  /* No border */
            text-transform: uppercase;  /* Capitalize text */
        }

          .large-label {
            font-size: 24px;  /* Larger font size */
            font-weight: bold;  /* Bold text */
            text-align: center;  /* Center text alignment */
            margin-bottom: 20px;  /* Space between the large label and the rest of the form */
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="center">  <!-- Use Flexbox to center all content -->
           
           <!-- Large label to indicate the purpose of the page -->
            <asp:Label ID="pageTitle" runat="server" Text="FYP Committee Member Login" CssClass="large-label"></asp:Label>

           
           <!-- Centered labels and text boxes -->
            <asp:Label ID="usernameLbl" runat="server" Text="Username" CssClass="label"></asp:Label>
            <asp:TextBox ID="UsernameTxt" runat="server" CssClass="text-box"></asp:TextBox>

            <asp:Label ID="PasswordLbl" runat="server" Text="Password" CssClass="label"></asp:Label>
            <asp:TextBox ID="PasswordTxt" runat="server" TextMode="Password" CssClass="text-box"></asp:TextBox>

            <!-- Styled button -->
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Login" CssClass="button-style" />
        </div>

        <!-- Modals for success and error messages -->
        <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="errorModalLabel">Login Error</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="errorMessage">
                        <!-- Placeholder for error messages -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="successModalLabel">Login Successful</h5>
                        <button type="button" data-dismiss="modal">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="successMessage">
                        <!-- Placeholder for success messages -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
