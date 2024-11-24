<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorEvaluations.aspx.cs" Inherits="SupervisorEvaluations"MasterPageFile="MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body >
        <form id="form1" runat="server">
            <div>
                <h2 >Evaluation Details</h2>
                
                <hr />
                <asp:Label ID="lblEvaluationId" runat="server" Text="Evaluation ID:" CssClass="d-block"></asp:Label>
                <asp:Label ID="lblProjectId" runat="server" Text="Project ID:" CssClass="d-block"></asp:Label>
                <asp:Label ID="lblPanelMemberId" runat="server" Text="Panel Member ID:" CssClass="d-block"></asp:Label>
                <asp:Label ID="lblScore" runat="server" Text="Score:" CssClass="d-block"></asp:Label>
                <asp:Label ID="lblComments" runat="server" Text="Comments:" CssClass="d-block"></asp:Label>
                <asp:Label ID="lblFYPDescription" runat="server" Text="FYP Description:" CssClass="d-block"></asp:Label>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="d-block"></asp:Label>
                <br />
                <div class="text-center mt-5">
                    <asp:Button ID="btnGoBack" runat="server" Text="Go Back" OnClick="btnGoBack_Click" CssClass="btn btn-secondary" />
                </div>
            </div>
        </form>
    </body>
</asp:Content>