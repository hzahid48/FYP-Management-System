<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorSuggestionConfirm.aspx.cs" Inherits="SupervisorSuggestionConfirm"MasterPageFile="MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <title>Suggestion Confirmation</title>
    
    <body>
        <form id="form1" runat="server">
            <div>
                <h1><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></h1>
                <asp:Button ID="btnGoToHome" runat="server" Text="Go to Supervisor Home" OnClick="btnGoToHome_Click" CssClass="small-button-style" />
            </div>
        </form>
    </body>
</asp:Content>
