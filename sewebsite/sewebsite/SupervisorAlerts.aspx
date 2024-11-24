<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorAlerts.aspx.cs" Inherits="SupervisorAlerts"MasterPageFile="MasterPage.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h1>Supervisor Alerts</h1>
        <hr />
        <div runat="server" id="alertContent">
            <!-- Display the missing review details -->
            <asp:Label ID="lblFYPName" runat="server" Text=""></asp:Label>
            <!-- Add other fields as needed -->
        
            <!-- Display the message if there are no missing reviews -->
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>
        <br />
        <br />
        <form id="form1" runat="server" class="container">
            <!-- Other form elements here -->

            <asp:Button ID="btnGoBack" runat="server" Text="Go Back" OnClick="btnGoBack_Click" CssClass="btn btn-secondary" />
        </form>
    </div>
</asp:Content>