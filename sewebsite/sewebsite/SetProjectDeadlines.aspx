<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SetProjectDeadlines.aspx.cs" Inherits="SetProjectDeadlines" MasterPageFile="~/CommitteeMember.master" %>

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
            position: absolute;  /* Position absolutely */
            left: 5px;  /* Place at the far left */
            top: 10px;  /* Position at the top */
        }

        .back-button:hover {
            background-color: darkgray;  /* Change background on hover */
            color: black;  /* Change text color on hover */
            transform: scale(1.05);  /* Hover scale effect */
        }

        .container {
            margin-top: 50px;  /* Add some top margin to move content down */
        }

        .form-control {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            height: 45px;  /* Adjusted height */
            width: 250px;  /* Adjusted width */
            margin-bottom: 10px;
        }

        .btn {
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border-radius: 5px;
            border: none;
            transition: background-color 0.3s, transform 0.3s;  /* Add hover effects */
        }

        .btn-primary:hover {
            background-color: #3498db;  /* Darker blue on hover */
            transform: scale(1.05);  /* Slight increase on hover */
        }
    </style>

    <!-- Content section within the master page -->
    <div class="container">
        <!-- Back button to navigate to FYPManagerHome -->
      <%--  <asp:HyperLink ID="BackLink" runat="server" NavigateUrl="FYPManagerHome.aspx" CssClass="back-button">Back</asp:HyperLink>--%>

        <!-- Title and project deadlines -->
        <h2>Set Project Deadlines</h2>

        <!-- Dropdown to select FYP -->
        <asp:Label ID="FypLabel" runat="server" Text="Select FYP" CssClass="label"></asp:Label>
        <asp:DropDownList ID="FypDdl" runat="server" CssClass="form-control" />

        <!-- Date fields for deadlines -->
        <asp:Label ID="SubmissionDeadlineLabel" runat="server" Text="Submission Deadline" CssClass="label"></asp:Label>
        <asp:TextBox ID="SubmissionDeadlineTxt" runat="server" CssClass="form-control" TextMode="Date" />

        <asp:Label ID="EvaluationDeadlineLabel" runat="server" Text="Evaluation Deadline" CssClass="label"></asp:Label>
        <asp:TextBox ID="EvaluationDeadlineTxt" runat="server" CssClass="form-control" TextMode="Date" />

        <!-- Button to save deadlines -->
        <asp:Button ID="SaveDeadlinesBtn" runat="server" OnClick="SaveDeadlinesBtn_Click" Text="Save Deadlines" CssClass="btn btn-primary" />

        <!-- Label for displaying status -->
        <asp:Label ID="StatusLabel" runat="server" CssClass="text-success"></asp:Label>

        <!-- GridView to display Active FYPs -->
        <asp:GridView ID="ActiveFYPsGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
            <Columns>
                <asp:BoundField DataField="project_title" HeaderText="Project Title" />
                <asp:BoundField DataField="start_date" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="submission_deadline" HeaderText="Submission Deadline" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="evaluation_deadline" HeaderText="Evaluation Deadline" DataFormatString="{0:yyyy-MM-dd}" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
