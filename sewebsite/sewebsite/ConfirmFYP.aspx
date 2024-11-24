<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfirmFYP.aspx.cs" Inherits="ConfirmFYP" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supervisor Assignments</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Pending Assignments</h2>

            <asp:Repeater ID="AssignmentsRepeater" runat="server">
                <HeaderTemplate>
                    <div class="row">
                        <div class="col-md-4"><strong>Project Title</strong></div>
                        <div class="col-md-2"><strong>Status</strong></div>
                        <div class="col-md-6"><strong>Actions</strong></div>
                    </div>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="row">
                        <div class="col-md-4"><%# Eval("project_title") %></div>
                        <div class="col-md-2"><%# Eval("status") %></div>
                        <div class="col-md-6">
                            <!-- Link to confirm assignment -->
                            <asp:LinkButton ID="ConfirmButton" runat="server" Text="Confirm" CommandArgument='<%# Eval("assignment_id") %>' OnClick="ConfirmAssignment_Click" CssClass="btn btn-success" />
                            <!-- Link to decline assignment -->
                            <asp:LinkButton ID="DeclineButton" runat="server" Text="Decline" CommandArgument='<%# Eval("assignment_id") %>' OnClick="DeclineAssignment_Click" CssClass="btn btn-danger" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>