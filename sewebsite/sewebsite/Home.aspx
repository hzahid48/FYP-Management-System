<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Home</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Style for the background image */
        .background-image {
            background-image: url('konstantinos-feggoulis-UK62OOxGn0E-unsplash.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            font-size: 24px;
        }

        /* Style for the welcome message */
.welcome-message {
    max-width: 800px;
    padding: 20px;
    font-weight: 1000;
    background-color: rgba(0, 0, 0, 0); /* Semi-transparent background */
    border-radius: 10px;
    font-family: "Century Gothic", sans-serif; /* Set font to Century Gothic */
    transition: transform 0.3s ease; /* Add transition effect */
}

/* Add hover effect */
.welcome-message:hover {
    transform: scale(1.1); /* Enlarge by 10% on hover */
}


/* Style for the sign-in button */
.sign-in-button {
    padding: 10px 20px;
    font-size: 18px;
    border-radius: 5px;
    background-color: #5bc0de; /* Light teal color */
    border: none;
    color: white;
    text-decoration: none;
}
 h1 {
            font-weight: bold;
        }
/* Hover effect for the sign-in button */
.sign-in-button:hover {
    background-color: #2da6bb; /* Darker teal color on hover */
}

    </style>
</head>
<body>
    <div class="background-image">
        <div class="welcome-message">
            <h1>Welcome to the FYP Management System</h1>
            <br />
            <br />
            <a href="SignIn.aspx" class="btn btn-primary sign-in-button">Sign In</a>
        </div>
    </div>
</body>
</html>