<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorViewFYPPanelMembers.aspx.cs" Inherits="SupervisorViewFYPPanelMembers"MasterPageFile="MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <!-- Heading -->
        <h1>FYP Panel Members</h1>
                <br />

        <!-- Button group for submitting requests and making suggestions -->
        <div class="d-flex justify-content-between">
            <!-- Button for submitting requests -->
            <asp:Button ID="btnSubmitRequest" runat="server" Text="Submit Request" OnClick="btnSubmitRequest_Click" CssClass="button-style" />
            <!-- Button for making suggestions -->
            <asp:Button ID="btnMakeSuggestion" runat="server" Text="Make Suggestion" OnClick="btnMakeSuggestion_Click" CssClass="button-style" />
        </div>
        <br />
        <!-- Go Back button -->
        <div class="mt-3" style="padding-left: 30px;">
            <asp:Button ID="btnGoBack" runat="server" Text="Go Back" OnClick="btnGoBack_Click" CssClass="btn btn-secondary" />
        </div>
    </form>
</asp:Content>
