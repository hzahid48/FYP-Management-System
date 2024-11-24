<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorCommunicateWithGroup.aspx.cs" Inherits="SupervisorCommunicateWithGroup" MasterPageFile="MasterPage.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="mt-5 mb-4">Communicate With Your Students</h2>
            <asp:Label ID="lblMessage" runat="server" Visible="false" Text="Message sent successfully!" CssClass="text-success" />
            <hr />
            <div class="form-group">
                <asp:Label ID="lblMessageContent" runat="server" AssociatedControlID="txtMessageContent" Text="Message Content:" CssClass="mb-1" />
                <asp:TextBox ID="txtMessageContent" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" />
            </div>
            <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" OnClick="btnSendMessage_Click" CssClass="btn btn-primary mr-2"/>
            <asp:Button ID="btnGoBack" runat="server" Text="Go Back" OnClick="btnGoBack_Click" CssClass="btn btn-secondary" />
        </div>
    </form>
</asp:Content>
