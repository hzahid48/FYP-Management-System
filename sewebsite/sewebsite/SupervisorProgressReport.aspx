<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorProgressReport.aspx.cs" Inherits="SupervisorProgressReport"MasterPageFile="MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body>
        <form id="form1" runat="server">
            <div>
                <h1>Progress Report: <asp:Label ID="lblFYPName" runat="server" Text=""></asp:Label></h1>
                <p><strong>Report Date:</strong> <asp:Label ID="lblReportDate" runat="server" Text=""></asp:Label></p>
                <p><strong>Report Content:</strong></p>
                <asp:Label ID="lblReportContent" runat="server" Text=""></asp:Label>
                <p><strong>Group Members:</strong> <asp:Label ID="lblGroupMembers" runat="server" Text=""></asp:Label></p>
                <asp:Button ID="btnBack" runat="server" Text="Back to FYP Materials" OnClick="btnBack_Click" CssClass="btn btn-secondary"/>
            </div>
        </form>
    </body>
</asp:Content>