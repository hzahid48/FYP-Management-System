<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AssignFYP.aspx.cs" Inherits="AssignFYP" MasterPageFile="~/CommitteeMember.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Back button styling */
        .back-button {
            position: absolute;
            top: 10px;
            left: 10px;
            color: white;
            text-decoration: none;
            background-color: gray;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .back-button:hover {
            background-color: darkgray;
            transform: scale(1.05);
        }

        /* Styles for drop-down height and appearance */
        .form-control {
            height: 45px;
            line-height: 1.6;  /* Adjusted line-height */
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            transition: border-color 0.3s;
        }

        .form-control:hover {
            border-color: #888;  /* Border color on hover */
        }

        .button-style {
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border-radius: 5px;
            border: none;
            transition: background-color 0.3s, transform 0.3s;
        }

        .button-style:hover {
            background-color: #3498db;  /* Change color on hover */
            transform: scale(1.05);  /* Hover scaling */
        }

        .label {
            font-weight: bold;
            margin-bottom: 10px;  /* Spacing for labels */
        }

        /* Main container padding-top for spacing */
        .main-container {
            padding-top: 60px;  /* Added padding for title spacing */
        }
    </style>

    <!-- Main content of the AssignFYP page -->
    <div class="container main-container text-center">
        <h2>Assign FYP to Supervisor</h2>

        <!-- Dropdown for selecting groups -->
        <asp:Label ID="GroupLbl" runat="server" Text="Select Group" CssClass="label"></asp:Label>
        <asp:DropDownList ID="GroupDdl" runat="server" CssClass="form-control" />

        <!-- Dropdown for supervisors -->
        <asp:Label ID="SupervisorLbl" runat="server" Text="Select Supervisor" CssClass="label"></asp:Label>
        <asp:DropDownList ID="SupervisorDdl" runat="server" CssClass="form-control" />

        <!-- Dropdown for co-supervisors -->
        <asp:Label ID="CoSupervisorLbl" runat="server" Text="Select Co-Supervisor" CssClass="label"></asp:Label>
        <asp:DropDownList ID="CoSupervisorDdl" runat="server" CssClass="form-control" />

        <!-- Dropdown for panels -->
        <asp:Label ID="PanelLbl" runat="server" Text="Select Panel" CssClass="label"></asp:Label>
        <asp:DropDownList ID="PanelDdl" runat="server" CssClass="form-control" />

        <!-- Button to assign FYP with hover effect -->
        <asp:Button ID="AssignFYPBtn" runat="server" OnClick="AssignFYPBtn_Click" Text="Assign FYP" CssClass="button-style" />
    </div>
</asp:Content>
