<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GenerateReports.aspx.cs" Inherits="GenerateReports" MasterPageFile="~/CommitteeMember.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Back button styling */
        .back-button {
            color: white;
            text-decoration: none;
            background-color: gray;
            padding: 10px 20px;  /* Increased padding for better clickability */
            border-radius: 10px;  /* Rounded corners */
            font-size: 16px;  /* Larger font size */
            transition: background-color 0.3s, color 0.3s;  /* Smooth hover transitions */
            position: absolute;  /* Position absolutely */
            left: 5px;  /* Position at the far left */
            top: 10px;  /* Position at the top */
        }

        .back-button:hover {
            background-color: darkgray;  /* Change background color on hover */
            color: black;  /* Change text color on hover */
            transform: scale(1.05);  /* Hover scale effect */
        }

        /* Content container with extra top space to move it down */
        .content {
            margin-top: 50px;  /* Adjust to move content down */
        }

        /* Style for form controls (e.g., dropdowns) */
        .form-control {
            padding: 10px;  /* Padding for comfort */
            border-radius: 5px;  /* Rounded corners */
            border: 1px solid #ccc;  /* Light border */
            width: 250px;  /* Consistent width */
            height: 45px;  /* Increased height */
            line-height: 1.5;  /* Extra line height */
            margin-bottom: 10px;  /* Spacing */
        }

        /* Style for buttons with hover effects */
        .btn {
            padding: 10px 20px;  /* Padding for buttons */
            border-radius: 5px;  /* Rounded corners */
            transition: background-color 0.3s, transform 0.3s;  /* Hover effects */
        }

        .btn-primary:hover {
            background-color: #3498db;  /* Darker blue on hover */
            transform: scale(1.05);  /* Hover scale effect */
        }

    </style>

    <!-- Back button at the top left -->
 <%--   <asp:HyperLink ID="BackLink" runat="server" NavigateUrl="FYPManagerHome.aspx" CssClass="back-button">
        Back
    </asp:HyperLink>--%>

    <!-- Content container with margin to move it down -->
    <div class="container content">
        <h2>Generate Project Reports</h2>

        <!-- Dropdown to select report type -->
        <asp:Label ID="ReportTypeLabel" runat="server" Text="Select Report Type" CssClass="label"></asp:Label>
        <asp:DropDownList ID="ReportTypeDdl" runat="server" CssClass="form-control">
            <asp:ListItem Text="Missing Evaluations" Value="missing_evaluations" />
            <asp:ListItem Text="FYPs Supervised by Faculty" Value="fyp_by_faculty" />
            <asp:ListItem Text="Grades Report" Value="grades_report" />
        </asp:DropDownList>

        <!-- Button to generate report -->
        <asp:Button ID="GenerateReportBtn" runat="server" OnClick="GenerateReportBtn_Click" Text="Generate Report" CssClass="btn btn-primary" />

        <!-- Label to display report status -->
        <asp:Label ID="ReportStatusLabel" runat="server" CssClass="text-success"></asp:Label>
    </div>
</asp:Content>
