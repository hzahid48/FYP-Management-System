<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewFYPGroupDetails.aspx.cs" Inherits="ViewFYPGroupDetails" MasterPageFile="~/CommitteeMember.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .back-button {
            color: white;
            text-decoration: none;
            background-color: gray;
            padding: 15px 25px;  /* Larger padding for bigger buttons */
            border-radius: 10px;
            font-size: 18px;  /* Larger font size */
            transition: background-color 0.3s, color 0.3s;
            position: absolute;
            left: 15px;  /* Positioned farther from the edge */
            top: 15px;
        }

        .back-button:hover {
            background-color: darkgray;
            color: black;
        }

        .container {
            margin-top: 80px;  /* Increased space at the top */
        }

        .section-title {
            font-size: 28px;  /* Larger font for section titles */
            font-weight: bold;
            text-align: center;  /* Centered text */
            margin-bottom: 25px;  /* More space below the title */
        }

        .panel {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 25px;  /* Larger padding for a bigger feel */
            margin-bottom: 35px;
            background-color: #f9f9f9;  /* Light background color */
        }

        .panel-content {
            font-size: 20px;  /* Increased font size */
        }

        .form-control {
            padding: 15px;  /* Increased padding */
            border-radius: 5px;
            border: 1px solid #ccc;
            height: 50px;  /* Increased height */
            width: 350px;  /* Wider dropdowns */
            margin-bottom: 15px;  /* Additional space */
             color: black; /* or any other color */
       }

        .btn-primary {
            padding: 15px 25px;  /* Larger buttons */
            background-color: blue;
            color: white;
            border-radius: 5px;
            border: none;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.1);  /* Slightly larger hover scaling */
        }
    </style>

    <!-- Main content for selecting and displaying group details -->
    <div class="container">
        <!-- Back button for navigation -->
      <%--  <a href="PreviousPage.aspx" class="back-button">Back</a>--%>

        <!-- Dropdown to select a group -->
        <div class="row justify-content-center">  <!-- Centered row -->
            <div class="col-md-6">
                <h2 class="text-center">Select FYP Group</h2>
                <asp:DropDownList ID="GroupSelect" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="GroupSelect_SelectedIndexChanged">
                    <asp:ListItem Text="-- Select Group --" Value="" />
                </asp:DropDownList>
            </div>
        </div>

        <!-- Section for project information -->
        <div class="panel">
            <div class="section-title">Project Information</div>
            <div class="panel-content">
                <strong>Project Title:</strong> <asp:Label ID="ProjectTitleLabel" runat="server" Text="" />
            </div>
        </div>

        <!-- Section for supervisor and co-supervisor details -->
        <div class="panel">
            <div class="section-title">Supervisors</div>
            <div class="panel-content">
                <strong>Supervisor:</strong> <asp:Label ID="SupervisorLabel" runat="server" Text="" /><br />
                <strong>Co-Supervisor:</strong> <asp:Label ID="CoSupervisorLabel" runat="server" Text="" />
            </div>
        </div>

        <!-- Section for panel details -->
        <div class="panel">
            <div class="section-title">Panel Details</div>
            <div class="panel-content">
                <strong>Panel Name:</strong> <asp:Label ID="PanelLabel" runat="server" Text="" /><br />
                <strong>Panel Leader:</strong> <asp:Label ID="PanelLeaderLabel" runat="server" Text="" />
            </div>
        </div>

        <!-- Section for group members -->
        <div class="panel">
            <div class="section-title">Group Members</div>
            <div class="panel-content">
                <strong>Members:</strong>
                <ul>
                    <asp:Repeater ID="GroupMembersRepeater" runat="server">
                        <ItemTemplate>
                            <li><%# Eval("first_name") %> <%# Eval("last_name") %></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
