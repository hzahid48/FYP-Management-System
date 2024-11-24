<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewStudents.aspx.cs" Inherits="ViewStudents" MasterPageFile="~/CommitteeMember.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Styles for the back button with hover effects */
        .back-button {
            color: white;
            text-decoration: none;
            background-color: gray;
            padding: 10px 20px;
            border-radius: 10px;
            font-size: 16px;
            transition: background-color 0.3s, color 0.3s;
            position: absolute;
            left: 5px;  /* Align to the far left */
            top: 10px;  /* Position at the top */
        }

        .back-button:hover {
            background-color: darkgray;  /* Background color on hover */
            color: black;  /* Text color on hover */
        }

        .container {
            margin-top: 60px;  /* Add space from the top */
        }

        .text-box {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 250px;
            margin-bottom: 10px;
        }

        .button-style {
            padding: 10px 20px;
            background-color: blue;
            color: white;
            border-radius: 5px;
            border: none;
        }

        .button-style:hover {
            background-color: #0056b3;  /* Darker blue on hover */
            transform: scale(1.05);  /* Slightly larger on hover */
        }

        .label {
            font-weight: bold;
            margin-bottom: 5px;
        }
    </style>

   <%-- <!-- Back button for navigation -->
    <asp:HyperLink ID="BackLink" runat="server" NavigateUrl="FYPManagerHome.aspx" CssClass="back-button">
        Back
    </asp:HyperLink>--%>

    <div class="container">
        <h2 class="text-center">Registered Students List</h2>

        <!-- GridView to display registered students -->
        <asp:GridView 
            ID="StudentsGrid" 
            runat="server" 
            AutoGenerateColumns="False" 
            CssClass="table table-striped table-hover table-responsive-sm" 
            HeaderStyle-CssClass="bg-primary text-white" 
            RowStyle-CssClass="align-middle" 
            AlternatingRowStyle-CssClass="table-secondary">
            <Columns>
                <asp:BoundField DataField="user_id" HeaderText="User ID" ReadOnly="True" />
                <asp:BoundField DataField="username" HeaderText="Username" ReadOnly="True" />
                <asp:BoundField DataField="first_name" HeaderText="First Name" ReadOnly="True" />
                <asp:BoundField DataField="last_name" HeaderText="Last Name" ReadOnly="True" />
                <asp:BoundField DataField="group_id" HeaderText="Group Number" ReadOnly="True" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
