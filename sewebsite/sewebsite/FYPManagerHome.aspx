<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FYP Manager Home</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Include Bootstrap JavaScript -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        .container {
            margin-top: 100px;  /* More top margin */
        }

        .back-button {
            position: absolute;
            top: 10px;
            left: 5px;
            color: white;
            background-color: gray;
            padding: 10px 20px;
            border-radius: 10px;
            text-decoration: none;
            font-size: 16px;
            transition: all 0.3s;
        }

        .back-button:hover {
            background-color: #3498db;
            color: black;
            transform: scale(1.05);
        }

        .btn-lg {
            font-size: 20px;  /* Larger font */
            padding: 14px 30px;  /* Extra padding for bigger buttons */
            border-radius: 8px;  /* Slightly more rounded corners */
            transition: all 0.3s;
        }

        .btn-lg:hover {
            background-color: #3498db;  /* Hover color */
            transform: scale(1.05);  /* Hover effect */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Back button for navigating to the login page -->
        <asp:HyperLink ID="BackLink" runat="server" NavigateUrl="Login.aspx" CssClass="back-button">Back</asp:HyperLink>

        <div class="container">  <!-- Centered container with more top margin -->
            <h2 class="text-center mb-4">FYP Manager Home</h2>  <!-- Page title -->

            <!-- First row with Assign FYP, Create Panel, Create User -->
            <div class="row mb-4">
                <div class="col-md-4">
                    <asp:HyperLink ID="AssignFYPLink" runat="server" NavigateUrl="AssignFYP.aspx" CssClass="btn btn-primary btn-lg btn-block">
                        Assign FYP
                    </asp:HyperLink>
                </div>
                <div class="col-md-4">
                    <asp:HyperLink ID="CreatePanelLink" runat="server" NavigateUrl="CreateProjectPanel.aspx" CssClass="btn btn-primary btn-lg btn-block">
                        Create Project Panel
                    </asp:HyperLink>
                </div>
                <div class="col-md-4">
                    <asp:HyperLink ID="CreateUserLink" runat="server" NavigateUrl="CreateUser.aspx" CssClass="btn btn-primary btn-lg btn-block">
                        Create User
                    </asp:HyperLink>
                </div>
            </div>

            <!-- Second row with Generate Reports, Set Deadlines, View FYP Group Details -->
            <div class="row mb-4">
                <div class="col-md-4">
                    <asp:HyperLink ID="GenerateReportsLink" runat="server" NavigateUrl="GenerateReports.aspx" CssClass="btn btn-primary btn-lg btn-block">
                        Generate Reports
                    </asp:HyperLink>
                </div>
                <div class="col-md-4">
                    <asp:HyperLink ID="SetDeadlinesLink" runat="server" NavigateUrl="SetProjectDeadlines.aspx" CssClass="btn btn-primary btn-lg btn-block">
                        Set Project Deadlines
                    </asp:HyperLink>
                </div>
                <div class="col-md-4">
                    <asp:HyperLink ID="ViewFYPGroupDetailsLink" runat="server" NavigateUrl="ViewFYPGroupDetails.aspx" CssClass="btn btn-primary btn-lg btn-block">
                        View FYP Group Details
                    </asp:HyperLink>
                </div>
            </div>

            <!-- Third row with Create Group and View Students -->
            <div class="row mb-4">  
                <div class="col-md-4 offset-md-2">  <!-- Centered with offset -->
                    <asp:HyperLink ID="CreateGroupLink" runat="server" NavigateUrl="CreateGroup.aspx" CssClass="btn btn-primary btn-lg btn-block">
                        Create Group
                    </asp:HyperLink>
                </div>
                <div class="col-md-4">  <!-- Symmetric spacing -->
                    <asp:HyperLink ID="ViewStudentsLink" runat="server" NavigateUrl="ViewStudents.aspx" CssClass="btn btn-primary btn-lg btn-block">
                        View Registered Students
                    </asp:HyperLink>
                </div>
            </div>  <!-- End of third row -->
        </div>
    </form>
</body>
</html>
