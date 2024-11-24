<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorDeadlines.aspx.cs" Inherits="SupervisorDeadlines" MasterPageFile="MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <title>Supervisor Deadlines</title>
    <body>
        <form id="form1" runat="server">
            <div class="container">
                <asp:Repeater ID="rptDeadlines" runat="server">
                    <ItemTemplate>
                        <div class="card mb-3">
                            <div class="card-body">
                                <h3 class="card-title"><%# Eval("FypName") %></h3>
                                <p class="card-text">Assignment Number: <%# Eval("AssignmentNumber") %></p>
                                <p class="card-text">Deadline: <%# Eval("Deadline", "{0:yyyy-MM-dd}") %></p>
                                <p class="card-text">Status: <%# Eval("Status") %></p>
                                <p class="card-text">Group Members: <%# Eval("GroupMemberNames") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <br />
            <asp:Button ID="btnGoBack" runat="server" Text="Go Back" OnClick="btnGoBack_Click" CssClass="btn btn-secondary" />
        </form>
    </body>
</asp:Content>
