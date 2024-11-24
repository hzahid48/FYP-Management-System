<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorRequestConfirm.aspx.cs" Inherits="SupervisorRequestConfirm" MasterPageFile="MasterPage.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <title>Request Confirmation</title>
    <body>
        <form id="form1" runat="server">
            <div>
                <h1><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></h1>
                <asp:Button ID="btnGoToHome" runat="server" Text="Go to Supervisor Home" OnClick="btnGoToHome_Click" CssClass="btn btn-secondary"/>
            </div>
        </form>
    </body>
</asp:Content>