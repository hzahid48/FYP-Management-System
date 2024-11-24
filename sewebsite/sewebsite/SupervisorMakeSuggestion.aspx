<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorMakeSuggestion.aspx.cs" Inherits="SupervisorMakeSuggestion"MasterPageFile="MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body>
        <form id="form1" runat="server" class="container">
            <div>
                <h1>Make A Suggestion</h1>
                <div class="form-group">
                    <asp:DropDownList ID="ddlPanelMembers" runat="server" AppendDataBoundItems="true" CssClass="form-control">
                        <asp:ListItem Text="-- Select Panel Member --" Value="" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtSuggestion" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Enter your suggestion"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
                </div>
            </div>
            <div class="form-group">
                <asp:Button ID="btnGoBack" runat="server" Text="Go Back" OnClick="btnGoBack_Click" CssClass="btn btn-secondary" />
            </div>
        </form>
    </body>
</asp:Content>
