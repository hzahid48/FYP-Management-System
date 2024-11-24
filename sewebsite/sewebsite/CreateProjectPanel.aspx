<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateProjectPanel.aspx.cs" Inherits="CreateProjectPanel" MasterPageFile="~/CommitteeMember.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .back-button {
            color: white;
            text-decoration: none;
            background-color: gray;
            padding: 10px 20px;  /* Increased padding */
            border-radius: 10px;  /* Rounded corners */
            font-size: 16px;  /* Slightly larger font size */
            transition: background-color 0.3s, transform 0.3s;  /* Smooth hover transition */
            position: absolute;  /* Position absolutely */
            left: 5px;  /* Move to the far left */
            top: 10px;  /* Keep at the top */
        }

        .back-button:hover {
            background-color: darkgray;  /* Change background color on hover */
            color: black;  /* Change text color */
            transform: scale(1.05);  /* Hover scaling effect */
        }

        .container {
            padding-top: 50px;  /* Spacing for title */
        }

        .form-control {
            padding: 12px;  /* Extra padding */
            border-radius: 8px;  /* Rounded corners */
            border: 1px solid #ccc;  /* Border styling */
            width: 350px;  /* Increased width */
            height: 50px;  /* Increased height */
        }

        .btn-primary {
            padding: 10px 20px;  /* Consistent padding */
            border-radius: 10px;  /* Rounded corners */
            transition: background-color 0.3s, transform 0.3s;  /* Smooth hover transition */
        }

        .btn-primary:hover {
            background-color: #3498db;  /* Darker blue on hover */
            transform: scale(1.05);  /* Slight scale increase on hover */
        }

        .row {
            padding-top: 20px;  /* Space between rows */
        }
    </style>

    <!-- Back button at the top left -->
    <%--<asp:HyperLink ID="BackLink" runat="server" NavigateUrl="FYPManagerHome.aspx" CssClass="back-button">Back</asp:HyperLink>--%>

    <div class="container">
        <h2>Create Project Panel</h2>  <!-- Page title -->

        <!-- Panel name and create panel button -->
        <div class="row align-items-center">  
            <div class="col-md-6">  
                <asp:Label ID="PanelNameLabel" runat="server" Text="Panel Name" CssClass="label"></asp:Label>
                <asp:TextBox ID="PanelNameTxt" runat="server" CssClass="form-control" />
            </div>

            <div class="col-md-6">  
                <asp:Button ID="CreatePanelBtn" runat="server" OnClick="CreatePanelBtn_Click" Text="Create Panel" CssClass="btn-primary" />
            </div>
        </div>

        <!-- Faculty members and panel leader selection -->
        <div class="row">
            <div class="col-md-6">  
                <asp:Label ID="FacultyMembersLabel" runat="server" Text="Add Faculty Members" CssClass="label"></asp:Label>
                <asp:CheckBoxList ID="FacultyMembersCbl" runat="server" RepeatDirection="Vertical" CssClass="form-control" />
            </div>

            <div class="col-md-6">  
                <asp:Label ID="PanelLeaderLabel" runat="server" Text="Select Panel Leader" CssClass="label"></asp:Label>
                <asp:DropDownList ID="PanelLeaderDdl" runat="server" CssClass="form-control" />
            </div>
        </div>

        <!-- Modal for success and error messages -->
        <div class="modal fade" id="popupModal" tabindex="-1" role="dialog" aria-labelledby="popupModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="popupModalLabel">Message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="popupMessage"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
