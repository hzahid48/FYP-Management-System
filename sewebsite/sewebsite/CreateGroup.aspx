<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateGroup.aspx.cs" Inherits="CreateGroup" MasterPageFile="~/CommitteeMember.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .form-label {
            font-weight: bold;
        }

        .form-control {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            height: 40px;
            margin-bottom: 10px;
        }

        .btn-primary {
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border-radius: 5px;
            border: none;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-primary:hover {
            background-color: #3498db;
            transform: scale(1.05);
        }
    </style>

    <!-- Content of CreateGroup page -->
    <div class="container mt-4">
        <h2>Create New Group</h2>

        <!-- Error alert area -->
        <div id="ErrorAlert" runat="server" class="alert alert-danger" style="display: none;">
            <asp:Label ID="ErrorMessage" runat="server" Text="An error occurred." />
        </div>

        <!-- Input for project title -->
        <div class="form-group">
            <asp:Label ID="ProjectTitleLabel" runat="server" Text="Project Title:" CssClass="form-label" />
            <asp:TextBox ID="ProjectTitleTxt" runat="server" CssClass="form-control" Placeholder="Enter project title" />
        </div>

        <!-- GridView for student selection -->
        <asp:GridView ID="StudentsGrid" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover" DataKeyNames="user_id">
            <Columns>
                <asp:BoundField DataField="user_id" HeaderText="User ID" ReadOnly="True" />
                <asp:BoundField DataField="username" HeaderText="Username" ReadOnly="True" />
                <asp:BoundField DataField="first_name" HeaderText="First Name" ReadOnly="True" />
                <asp:BoundField DataField="last_name" HeaderText="Last Name" ReadOnly="True" />
                <asp:TemplateField HeaderText="Select">
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectCheckBox" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <!-- Button to create group -->
        <asp:Button ID="CreateGroupBtn" runat="server" OnClick="CreateGroupBtn_Click" Text="Create Group" CssClass="btn-primary" />
    </div>
</asp:Content>
