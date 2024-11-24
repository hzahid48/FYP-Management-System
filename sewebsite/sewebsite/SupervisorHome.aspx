<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorHome.aspx.cs" Inherits="SupervisorHome"MasterPageFile="MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body>
        <form id="form1" runat="server">
            <div class="center"> <!-- Apply the center class here -->
                <asp:Button ID="btnActiveFYPs" runat="server" Text="View Active FYPs" OnClick="btnActiveFYPs_Click" CssClass="button-style" />
                <br />
                <asp:Button ID="btnFYPPanelMembers" runat="server" Text="View FYP Panel Members" OnClick="btnFYPPanelMembers_Click" CssClass="button-style" />
                <br />
                <br />
                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="small-button-style" />
            </div>
        </form>
    </body>
</asp:Content>