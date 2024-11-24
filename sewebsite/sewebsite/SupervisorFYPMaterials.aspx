<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorFYPMaterials.aspx.cs" Inherits="SupervisorFYPMaterials"MasterPageFile="MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body>
        <form id="form1" runat="server">
            <div class="container">
                <asp:Label ID="lblFYPName" runat="server" Text="" CssClass="h1"></asp:Label>

                
                <h2>Choose From the Following FYP Materials</h2>
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label ID="lblFinalReport" runat="server" Text="" CssClass="mr-2"></asp:Label>
                        <asp:Button ID="btnFinalReport" runat="server" Text="Select" OnClick="btnFinalReport_Click" CssClass="btn btn-primary" />
                                            <br />
                          <br />

                    </div>
                    <br />
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label ID="lblProgressReport" runat="server" Text="" CssClass="mr-2"></asp:Label>
                        <asp:Button ID="btnProgressReport" runat="server" Text="Select" OnClick="btnProgressReport_Click" CssClass="btn btn-primary" />
                                            <br />
                          <br />
                    </div>
                    <br />
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label ID="lblProposals" runat="server" Text="" CssClass="mr-2"></asp:Label>
                        <asp:Button ID="btnProposals" runat="server" Text="Select" OnClick="btnProposals_Click" CssClass="btn btn-primary" />
                    </div>
                </div>
                <br />
                <br />
                <asp:Button ID="btnGoBack" runat="server" Text="Go Back" OnClick="btnGoBack_Click" CssClass="btn btn-secondary" />
            </div>
        </form>
    </body>
</asp:Content>
