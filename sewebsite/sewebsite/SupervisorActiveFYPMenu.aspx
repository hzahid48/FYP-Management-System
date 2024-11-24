<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorActiveFYPMenu.aspx.cs" Inherits="SupervisorActiveFYPMenu" MasterPageFile="MasterPage.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <h1 style="text-align: left; margin-top: 50px; margin-bottom: 60px; font-family: 'Roboto', sans-serif; font-weight: bold; padding-left: 35px;">Supervisor Active FYP Menu</h1>
        <div class="center">
            
          
            
            <div class="column" style="text-align: center;">
                <asp:Button ID="btnFYPMaterials" runat="server" Text="FYP Materials" OnClick="btnFYPMaterials_Click" CssClass="button-style" />
                <asp:Button ID="btnDeadlines" runat="server" Text="Deadlines" OnClick="btnDeadlines_Click" CssClass="button-style" />
                <asp:Button ID="btnAlerts" runat="server" Text="Alerts" OnClick="btnAlerts_Click" CssClass="button-style" />
            </div>
            <div class="column" style="text-align: center;">
                <asp:Button ID="btnEvaluations" runat="server" Text="Evaluations" OnClick="btnEvaluations_Click" CssClass="button-style" />
                <asp:Button ID="btnCommunicateWithGroup" runat="server" Text="Communicate with Group" OnClick="btnCommunicateWithGroup_Click" CssClass="button-style" />
                <asp:Button ID="btnSupplementaryMaterial" runat="server" Text="Supplementary Material" OnClick="btnSupplementaryMaterial_Click" CssClass="button-style" />
            </div>
            <asp:Button ID="btnGoBack" runat="server" Text="Go Back" OnClick="btnGoBack_Click" CssClass="small-button-style" />
        </div>
    </form>
</asp:Content>
